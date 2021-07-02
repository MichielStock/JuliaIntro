go to your target folder
launch a julia terminal
```julia
using DrWatson
initialize_project("DrWatson Example"; authors="Daan", git=true, readme=true)
using Pkg
Pkg.add("Pluto")
using Pluto
Pluto.run()
```