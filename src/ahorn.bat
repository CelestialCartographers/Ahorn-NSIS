set AHORN_HOME=%~dp0
set JULIA_BINDIR=%AHORN_HOME%julia\bin
set JULIA_PKGDIR=%AHORN_HOME%juliapkg

%JULIA_BINDIR%\julia.exe %AHORN_HOME%ahorn.jl %*