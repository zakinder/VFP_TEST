echo %cd%
call all_per_frame_v0.cmd
cd ../workspace/cmd_run2
echo %cd%
@echo ------------------------------------
@echo Done frame_v0
@echo ------------------------------------
call all_per_frame_v2.cmd
echo %cd%
@echo ------------------------------------
@echo Done frame_v0 frame_v2
@echo ------------------------------------
pause