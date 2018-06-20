println(Base.DEPOT_PATH)

using Pkg
PackageSpec = Pkg.Types.PackageSpec
GitRepo = Pkg.Types.GitRepo
UUID = Pkg.UUID

println("""
======================
Initializing package repository
======================
""")

println(Base.VERSION_STRING)

#Pkg.init()

function addPkg(pkg::String, uuid::UUID, url::String, revspec::String)
    p = Pkg.Types.PackageSpec(pkg, uuid)
    p.repo = Pkg.Types.GitRepo(url, revspec)
    Pkg.add(p)
end

addPkg(pkg::String, uuid::UUID, url::String) = addPkg(pkg::String, uuid::UUID, url::String, "master")

println("""
======================
Installing packages
======================
""")

addPkg("Maple", UUID("758f2280-739b-11e8-2a5b-4de435b9eb93"), "https://github.com/oddstr13/Maple.git", "julia-0.7.0")
addPkg("Ahorn", UUID("7bc567e0-739b-11e8-07b8-83d6bec444d8"), "https://github.com/oddstr13/Ahorn.git", "julia-0.7.0")

Pkg.add("HTTP")

println("""
======================
Building packages
======================
""")

cp(joinpath(Pkg.dir("Ahorn"), "src", "run_ahorn.jl"), joinpath(ENV["AHORN_HOME"], "ahorn.jl"), remove_destination=true)

Pkg.build()

for pkg in collect(keys(Pkg.installed()))
    if !isdefined(Symbol(pkg)) && pkg != "Compat.jl"
        info("Importing $(pkg)...")
        try (@eval import $(Symbol(pkg))) catch end
    end
end