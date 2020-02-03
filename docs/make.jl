using Documenter
using SlurmTools

makedocs(
    sitename = "SlurmTools",
    format = Documenter.HTML(),
    modules = [SlurmTools]
)

deploydocs(
    repo = "github.com/simonbyrne/SlurmTools.jl.git"
)
