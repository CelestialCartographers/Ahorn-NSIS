set AHORN_HOME=%~dp0
set JULIA_BINDIR=%AHORN_HOME%julia\bin
set JULIA_DEPOT_PATH=%AHORN_HOME%juliapkg;%AHORN_HOME%julia\local\share\julia;%AHORN_HOME%julia\share\julia

%JULIA_BINDIR%\julia.exe %AHORN_HOME%ahorn.jl %*