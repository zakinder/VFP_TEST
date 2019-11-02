cd ../run
del *.ucdb *.wlf *.log *.htm *.opt *.contrib *.noncontrib *.rank *.vstf
rd work /s /q
rd ..\coverage_reports\questa_html_coverage_reports\d5m_camera_image_file_sharp_cgain_test /s /q
vsim  -c -do d5m_camera_image_file_sharp_cgain_test.tcl