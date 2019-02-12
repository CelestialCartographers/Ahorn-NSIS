@echo off
set AHORN_HOME=%~dp0
set JULIA_HOME=%AHORN_HOME%julia\bin
set JULIA_DEPOT_PATH=%AHORN_HOME%juliapkg

echo !!! Running Pkg.build...
"%JULIA_HOME%\julia.exe" -e "using Pkg; Pkg.build()"

echo !!! Precompiling modules...
"%JULIA_HOME%\julia.exe" -e "using Pkg; Pkg.API.precompile()"
