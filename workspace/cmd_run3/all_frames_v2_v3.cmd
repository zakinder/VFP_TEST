echo %cd%
call all_per_frame_v2.cmd
cd ../workspace/cmd_run3
echo %cd%
@echo ------------------------------------
@echo Done frame_v2
@echo ------------------------------------
call all_per_frame_v3.cmd
echo %cd%
@echo ------------------------------------
@echo Done frame_v2 and frame_v3
@echo ------------------------------------
pause