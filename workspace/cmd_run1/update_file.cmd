cd ../../tb
setlocal enableextensions disabledelayedexpansion
set "textFile=generic_pack.svh"
@echo ------------------
@echo cgain
@echo sharp
@echo blur
@echo hsl
@echo hsv
@echo rgb
@echo sobel
@echo emboss
@echo ------------------

@set /p rep=" :"
@set replace=%rep%_v1


















@GOTO cgain
:cgain
set "this_check_rgb_type=cgain"
@set next_check_rgb_type=sharp
@GOTO SEARCH_REPLACE

:sharp
set "this_check_rgb_type=sharp"
@set next_check_rgb_type=blur
@GOTO SEARCH_REPLACE

:blur
set "this_check_rgb_type=blur"
@set next_check_rgb_type=hsl
@GOTO SEARCH_REPLACE

:hsl
set "this_check_rgb_type=hsl"
@set next_check_rgb_type=hsv
@GOTO SEARCH_REPLACE

:hsv
set "this_check_rgb_type=hsv"
@set next_check_rgb_type=rgb
@GOTO SEARCH_REPLACE

:rgb
set "this_check_rgb_type=rgb"
@set next_check_rgb_type=sobel
@GOTO SEARCH_REPLACE

:sobel
set "this_check_rgb_type=sobel"
@set next_check_rgb_type=emboss
@GOTO SEARCH_REPLACE

:emboss
set "this_check_rgb_type=emboss"
@set next_check_rgb_type=wait
@GOTO SEARCH_REPLACE


:SEARCH_REPLACE
@set search=%this_check_rgb_type%_v1
for /f "delims=" %%i in ('type "%textFile%" ^& break ^> "%textFile%" ') do (
    set "line=%%i"
    setlocal enabledelayedexpansion
    >>"%textFile%" echo(!line:%search%=%replace%!
    endlocal
)
@if "%next_check_rgb_type%"=="cgain" (@GOTO cgain)
@if "%next_check_rgb_type%"=="sharp" (@GOTO sharp)
@if "%next_check_rgb_type%"=="blur" (@GOTO blur)
@if "%next_check_rgb_type%"=="hsl" (@GOTO hsl)
@if "%next_check_rgb_type%"=="hsv" (@GOTO hsv)
@if "%next_check_rgb_type%"=="rgb" (@GOTO rgb)
@if "%next_check_rgb_type%"=="sobel" (@GOTO sobel)
@if "%next_check_rgb_type%"=="emboss" (@GOTO emboss)
@if "%next_check_rgb_type%"=="wait" (@GOTO wait)

:wait
pause

:abort

:eof
@REM @PAUSE

:GO_UP
cd ..\
@GOTO WHAT