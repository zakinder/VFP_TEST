echo %cd%
call all_per_frame_v0.cmd
cd ../workspace/cmd_run3
echo %cd%
@echo ------------------------------------
@echo Done frame_v0
@echo ------------------------------------
call all_per_frame_v1.cmd
cd ../workspace/cmd_run3
echo %cd%
@echo ------------------------------------
@echo Done frame_v0 and frame_v1
@echo ------------------------------------
call all_per_frame_v2.cmd
cd ../workspace/cmd_run3
echo %cd%
@echo ------------------------------------
@echo Done frame_v0 and frame_v1 and frame_v2
@echo ------------------------------------
call all_per_frame_v3.cmd
cd ../workspace/cmd_run3
echo %cd%
@echo ------------------------------------
@echo Done frame_v0 and frame_v1 and frame_v2 and frame_v3
@echo ------------------------------------
pause