set AHORN_HOME=%~dp0
set JULIA_BINDIR=%AHORN_HOME%julia\bin
set JULIA_PKGDIR=%AHORN_HOME%juliapkg
echo %CD%
%JULIA_BINDIR%\julia.exe %*