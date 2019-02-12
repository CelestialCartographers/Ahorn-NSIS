using Pkg

install_or_update(url::String, pkg::String) = begin
    spec = PackageSpec(name=pkg, url=url)
    Pkg.add(spec)
    Pkg.update(spec)
end


println("""
======================
Installing packages
======================
""")

install_or_update("https://github.com/CelestialCartographers/Maple.git", "Maple")
install_or_update("https://github.com/CelestialCartographers/Ahorn.git", "Ahorn")

Pkg.add("HTTP")
