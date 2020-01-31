module SlurmTools

using DataFrames, CSV, Dates


export sbatch, sacct, scancel

"""
    sbatch(cmd[, options])

Submits the script (and any arguments) specified by `cmd` as a batch job to Slurm,
returning the job id. `options` is a collection of command-line options that might be
passed

# Example

```julia
julia> sbatch(`job.sh arg1`, ["--time=01:00:00", "--nprocs=4"])
"2332883"
```

# External links
- [`sbatch` man page](https://slurm.schedmd.com/sbatch.html)
"""
function sbatch(cmd, options=[])        
    sbatch_cmd = `sbatch $options $cmd`
    result_str = String(read(sbatch_cmd))
    m = match(r"Submitted batch job ([0-9]*)\n", result_str)
    if m === nothing
        error("sbatch: $result_str")
    else
        return m.captures[1]
    end
end



"""
    sacct([options])

Gets accounting data for all jobs and job steps, returning a DataFrame. Any additional
keyword arguments are passed to `CSV.read`.

Do not use any options that change the formatting of the output of `sacct`
(e.g. `--parsable`, `--helpformat`, etc).

# Example

```
julia> sacct(["--format=JobID,Start,End", "--allocations"])
340×3 DataFrames.DataFrame
│ Row │ JobID      │ Start               │ End                 │
│     │ String     │ DateTime            │ DateTime            │
├─────┼────────────┼─────────────────────┼─────────────────────┤
│ 1   │ 8646713    │ 2020-01-30T00:02:13 │ 2020-01-30T00:08:48 │
│ 2   │ 8646714    │ 2020-01-30T00:08:48 │ 2020-01-30T00:10:07 │
...
```

# See also
- [`sacct_formats`](@ref)

# External links
- [`sacct` man page](https://slurm.schedmd.com/sacct.html)
"""
function sacct(options=[])    
    sacct_cmd = `sacct --parsable2 $options`
    CSV.read(sacct_cmd;
             delim='|', type=String, types=DEFAULT_TYPES, missingstrings=["","Unknown"])
end

# TODO: add more types here
# need CSV to support custom parsing for e.g. "Elapsed"
const DEFAULT_TYPES = Dict(
    "Submit" => DateTime,
    "Start" => DateTime,
    "Eligible" => DateTime,
    "End" => DateTime,
)

"""
    sacct_formats()

Returns a list of commands that can be passed with the `"--format"` option to [`sacct`](@ref).
"""
function sacct_formats()
    split(String(read(`sacct --helpformat`)))
end


"""
    scancel(job)

Cancel a queued Slurm job.

# External links
- [`scancel` man page](https://slurm.schedmd.com/scancel.html)
"""
function scancel(job)
    run(`scancel $job`)
end

end # module
