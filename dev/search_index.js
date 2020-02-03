var documenterSearchIndex = {"docs":
[{"location":"#SlurmTools.jl-1","page":"SlurmTools.jl","title":"SlurmTools.jl","text":"","category":"section"},{"location":"#","page":"SlurmTools.jl","title":"SlurmTools.jl","text":"SlurmTools.jl is a very basic Julia interface to the Slurm cluster manager.","category":"page"},{"location":"#Core-functions-1","page":"SlurmTools.jl","title":"Core functions","text":"","category":"section"},{"location":"#","page":"SlurmTools.jl","title":"SlurmTools.jl","text":"sacct\nsbatch\nscancel","category":"page"},{"location":"#SlurmTools.sacct","page":"SlurmTools.jl","title":"SlurmTools.sacct","text":"sacct([options])\n\nGets accounting data for all jobs and job steps, returning a DataFrame.\n\nDo not use any options that change the formatting of the output of sacct (e.g. --parsable, --helpformat, etc).\n\nExample\n\njulia> sacct([\"--format=JobID,Start,End\", \"--allocations\"])\n340×3 DataFrames.DataFrame\n│ Row │ JobID      │ Start               │ End                 │\n│     │ String     │ DateTime            │ DateTime            │\n├─────┼────────────┼─────────────────────┼─────────────────────┤\n│ 1   │ 8646713    │ 2020-01-30T00:02:13 │ 2020-01-30T00:08:48 │\n│ 2   │ 8646714    │ 2020-01-30T00:08:48 │ 2020-01-30T00:10:07 │\n...\n\nSee also\n\nsacct_formats\n\nExternal links\n\nsacct man page\n\n\n\n\n\n","category":"function"},{"location":"#SlurmTools.sbatch","page":"SlurmTools.jl","title":"SlurmTools.sbatch","text":"sbatch(cmd[, options])\n\nSubmits the script (and any arguments) specified by cmd as a batch job to Slurm, returning the job id. options is a collection of command-line options that might be passed\n\nExample\n\njulia> sbatch(`job.sh arg1`, [\"--time=01:00:00\", \"--nprocs=4\"])\n\"2332883\"\n\nExternal links\n\nsbatch man page\n\n\n\n\n\n","category":"function"},{"location":"#SlurmTools.scancel","page":"SlurmTools.jl","title":"SlurmTools.scancel","text":"scancel(job)\n\nCancel a queued Slurm job.\n\nExternal links\n\nscancel man page\n\n\n\n\n\n","category":"function"},{"location":"#Extra-1","page":"SlurmTools.jl","title":"Extra","text":"","category":"section"},{"location":"#","page":"SlurmTools.jl","title":"SlurmTools.jl","text":"SlurmTools.sacct_formats","category":"page"},{"location":"#SlurmTools.sacct_formats","page":"SlurmTools.jl","title":"SlurmTools.sacct_formats","text":"sacct_formats()\n\nReturns a list of commands that can be passed with the \"--format\" option to sacct.\n\n\n\n\n\n","category":"function"}]
}
