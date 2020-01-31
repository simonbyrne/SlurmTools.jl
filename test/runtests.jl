using SlurmTools

scriptpath = tempname()*".sh"

open(scriptpath, write=true) do f
    print(f,"#!/bin/sh\n\necho hello world\n")
end

job1 = sbatch(`$scriptpath`, ["--time=00:01:00", "--begin=now+1hour"])
job2 = sbatch(`$scriptpath`, ["--time=00:01:00", "--dependency=afterok:$job1", "--array=1-3", "--kill-on-invalid-dep=yes"])

while true
    sleep(5)
    acc1 = sacct(["--allocations", "--jobs=$job1,$job2"])
    if all(state -> state == "PENDING", acc1.State)
        break
    end
end

scancel(job1)

while true
    sleep(5)
    acc2 = sacct(["--allocations", "--jobs=$job1,$job2"])
    if all(state -> startswith(state, "CANCELLED"), acc2.State)
        break
    end
end

