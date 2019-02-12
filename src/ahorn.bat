set AHORN_HOME=%~dp0
set JULIA_HOME=%AHORN_HOME%julia\bin
set JULIA_DEPOT_PATH=%AHORN_HOME%juliapkg

"%JULIA_HOME%\julia.exe" -e "using Ahorn; Ahorn.displayMainWindow()"
