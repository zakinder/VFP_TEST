@echo off
cd ../../tb

%~d1
setlocal enableextensions disabledelayedexpansion
set "InFile=time1.svh"
set "OutFile=time2.svh"


set  LineToDelete=1

if exist "%OutFile%" del "%OutFile%" 
for /f "tokens=1* delims=:" %%i in ('findstr /n $ "%InFile%"^|findstr /b "%LineToDelete%:"') do findstr /v /b /c:"%%j" "%InFile%">>"%OutFile%"