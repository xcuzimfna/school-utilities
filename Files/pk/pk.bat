@echo off
SETLOCAL
FOR /F "usebackq" %%f IN (`PowerShell -NoProfile -Command "Write-Host([Environment]::GetFolderPath('Desktop'))"`) DO (
  SET "DESKTOP_FOLDER=%%f"
  )

if "%1"=="" ( goto help )
if %1==-? goto help
if %1==? goto help

:processkill
taskkill /im %1 /f
goto processkill


:help
echo.
echo Processkiller - Help - School Utilities
echo processkiller kills a process repeatedly
echo https://github.com/xcuzimfna/school-utilities
echo.
echo pk - shows this
echo    [PROCESSNAME] - defines a process
echo.


:end