using Pkg

println("""
======================
Initializing package repository
======================
""")

println(Base.VERSION_STRING)

#Pkg.init()

install_or_update(url::String, pkg::String) = try 
    if Pkg.installed(pkg) !== nothing
        println("Updating $pkg...")
        Pkg.update(pkg)
    end
catch err
    println("Installing $pkg...")
    repo = Pkg.Types.GitRepo(url)
    package = Pkg.PackageSpec(pkg, Pkg.UUID(zero(UInt128)))

    Pkg.add(package)
end


println("""
======================
Installing packages
======================
""")

install_or_update("https://github.com/CelestialCartographers/Maple.git", "Maple")
install_or_update("https://github.com/CelestialCartographers/Ahorn.git", "Ahorn")

Pkg.add("HTTP")

println("""
======================
Building packages
======================
""")
Pkg.build()

cp(joinpath(Pkg.dir("Ahorn"), "src", "run_ahorn.jl"), joinpath(ENV["AHORN_HOME"], "ahorn.jl"), remove_destination=true)