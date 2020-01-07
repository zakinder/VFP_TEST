@echo off
cd ../run0
del *.ucdb *.wlf *.log *.htm *.opt *.contrib *.noncontrib *.rank *.vstf *.txt
set delete_files_without_extension=*.*
for %%f in (%delete_files_without_extension%) do (
  if not "%%~xf"=="" (
    echo Keeping: %%f
  ) else (
    echo Deleting: %%f
    del "%%f"

  )
)


rd work /s /q
rd msim /s /q
rd ..\coverage_reports\questa_html_coverage_reports\d5m_camera_test /s /q
rd ..\coverage_reports\questa_html_coverage_reports\template_test /s /q
rd ..\coverage_reports\questa_html_coverage_reports\axi_lite_test /s /q
rd ..\coverage_reports\questa_html_coverage_reports\axi4_stream_test /s /q
rd ..\coverage_reports\questa_html_coverage_reports\rgb_test /s /q
rd ..\coverage_reports\questa_html_coverage_reports\rgb_test1 /s /q
rd ..\coverage_reports\questa_html_coverage_reports\rgb_test2 /s /q
rd ..\coverage_reports\questa_html_coverage_reports\SystemCoverage /s /q

pause