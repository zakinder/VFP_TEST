@echo off
cd ../run1
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

