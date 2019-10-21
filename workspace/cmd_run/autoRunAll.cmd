cd ../../tb
%~d1
setlocal enableextensions disabledelayedexpansion
set "textFile=generic_pack.svh"
@echo FRAME SIZE TESTS
@echo 1- Set Image Size to 128 by 128
@echo 2- Set Image Size to 400 by 300
@echo 3- Set Image Size to 1920 by 1080

@set /p frame_size=" FRAME_SIZE: "

@GOTO start_run_from_here
@REM --------------------------------------------
@REM ----------------------- START_RUN_FROM_HERE
@REM --------------------------------------------
:start_run_from_here
@set "replace_to=cgain"
@GOTO cgain
@REM --------------------------------------------
@REM ----------------------- REPLACE_TO
@REM --------------------------------------------
:cgain
@set "this_check_rgb_type=cgain"
@set "next_check_rgb_type=sharp"
@GOTO SEARCH_REPLACE
:sharp
@set "this_check_rgb_type=sharp"
@set "next_check_rgb_type=blur"
@GOTO SEARCH_REPLACE
:blur
@set "this_check_rgb_type=blur"
@set "next_check_rgb_type=hsl"
@GOTO SEARCH_REPLACE
:hsl
@set "this_check_rgb_type=hsl"
@set "next_check_rgb_type=hsv"
@GOTO SEARCH_REPLACE
:hsv
@set "this_check_rgb_type=hsv"
@set "next_check_rgb_type=rgb"
@GOTO SEARCH_REPLACE
:rgb
@set "this_check_rgb_type=rgb"
@set "next_check_rgb_type=sobel"
@GOTO SEARCH_REPLACE
:sobel
@set "this_check_rgb_type=sobel"
@set "next_check_rgb_type=emboss"
@GOTO SEARCH_REPLACE
:emboss
@set "this_check_rgb_type=emboss"
@set "next_check_rgb_type=vsim_run"
@GOTO SEARCH_REPLACE
@REM --------------------------------------------
@REM ----------------------- SEARCH_REPLACE
@REM --------------------------------------------
:SEARCH_REPLACE
@echo off
@set replace="%replace_to%_v%frame_size%"
@set search1="%this_check_rgb_type%_v1"
@set search2="%this_check_rgb_type%_v2"

for /f "delims=" %%i in ('type "%textFile%" ^& break ^> "%textFile%" ') do (
    set "line=%%i"
    setlocal enabledelayedexpansion
    >>"%textFile%" echo(!line:%search1%=%replace%!
    endlocal
)
for /f "delims=" %%i in ('type "%textFile%" ^& break ^> "%textFile%" ') do (
    set "line=%%i"
    setlocal enabledelayedexpansion
    >>"%textFile%" echo(!line:%search2%=%replace%!
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
@if "%next_check_rgb_type%"=="vsim_run" (@GOTO vsim_run)
@REM --------------------------------------------
@REM ----------------------- RUN TEST CASE
@REM --------------------------------------------
:vsim_run
@if "%replace_to%"=="cgain" (@GOTO vsim_run_cgain)
@if "%replace_to%"=="sharp" (@GOTO vsim_run_sharp)
@if "%replace_to%"=="blur" (@GOTO vsim_run_blur)
@if "%replace_to%"=="hsl" (@GOTO vsim_run_hsl)
@if "%replace_to%"=="hsv" (@GOTO vsim_run_hsv)
@if "%replace_to%"=="rgb" (@GOTO vsim_run_rgb)
@if "%replace_to%"=="sobel" (@GOTO vsim_run_sobel)
@if "%replace_to%"=="emboss" (@GOTO vsim_run_emboss)
@REM --------------------------------------------
@REM ----------------------- VSIM_RUN_CGAIN
@REM --------------------------------------------
:vsim_run_cgain
@echo ------------------
@echo running cgain
@echo ------------------
cd ../workspace/run
@echo current type:  %replace_to%
vsim -c -do d5m_camera_image_file_cgain_test.tcl
cd ../../tb
@set "replace_to=sharp"
@GOTO cgain
@REM --------------------------------------------
@REM ----------------------- VSIM_RUN_SHARP
@REM --------------------------------------------
:vsim_run_sharp
@echo ------------------
@echo running sharp
@echo ------------------
cd ../workspace/run
@echo current type:  %replace_to%
vsim -c -do d5m_camera_image_file_sharp_test.tcl
cd ../../tb
@set "replace_to=blur"
@GOTO cgain
@REM --------------------------------------------
@REM ----------------------- VSIM_RUN_BLUR
@REM --------------------------------------------
:vsim_run_blur
@echo ------------------
@echo running blur
@echo ------------------
cd ../workspace/run
@echo current type:  %replace_to%
vsim -c -do d5m_camera_image_file_blur_test.tcl
cd ../../tb
@set "replace_to=hsl"
@GOTO cgain
@REM --------------------------------------------
@REM ----------------------- VSIM_RUN_HSL
@REM --------------------------------------------
:vsim_run_hsl
@echo ------------------
@echo running hsl
@echo ------------------
cd ../workspace/run
@echo current type:  %replace_to%
vsim -c -do d5m_camera_image_file_hsl_test.tcl
cd ../../tb
@set "replace_to=hsv"
@GOTO cgain
@REM --------------------------------------------
@REM ----------------------- VSIM_RUN_HSV
@REM --------------------------------------------
:vsim_run_hsv
@echo ------------------
@echo running hsv
@echo ------------------
cd ../workspace/run
@echo current type:  %replace_to%
vsim -c -do d5m_camera_image_file_hsv_test.tcl
cd ../../tb
@set "replace_to=rgb"
@GOTO cgain
@REM --------------------------------------------
@REM ----------------------- VSIM_RUN_RGB
@REM --------------------------------------------
:vsim_run_rgb
@echo ------------------
@echo running rgb
@echo ------------------
cd ../workspace/run
@echo current type:  %replace_to%
vsim -c -do d5m_camera_image_file_rgb_test.tcl
cd ../../tb
@set "replace_to=sobel"
@GOTO cgain
@REM --------------------------------------------
@REM ----------------------- VSIM_RUN_SOBEL
@REM --------------------------------------------
:vsim_run_sobel
@echo ------------------
@echo running sobel
@echo ------------------
cd ../workspace/run
@echo current type:  %replace_to%
vsim -c -do d5m_camera_image_file_sobel_test.tcl
cd ../../tb
@set "replace_to=emboss"
@GOTO cgain
@REM --------------------------------------------
@REM ----------------------- VSIM_RUN_EMBOSS
@REM --------------------------------------------
:vsim_run_emboss
@echo ------------------
@echo running emboss
@echo ------------------
cd ../workspace/run
@echo current type:  %replace_to%
vsim -c -do d5m_camera_image_file_emboss_test.tcl
cd ../../tb
@echo ------------------------------------
@echo Done
@echo ------------------------------------
@GOTO wait
@REM --------------------------------------------
@REM ----------------------- ABORT
@REM --------------------------------------------

:wait
pause

:abort
:eof
@REM @PAUSE
:GO_UP
cd ..\
@GOTO WHAT