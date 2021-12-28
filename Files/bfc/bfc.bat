@echo off
SETLOCAL
FOR /F "usebackq" %%f IN (`PowerShell -NoProfile -Command "Write-Host([Environment]::GetFolderPath('Desktop'))"`) DO (
  SET "DESKTOP_FOLDER=%%f"
  )

if "%1"=="" ( goto help )
if "%2"=="" ( goto help )
if "%3"=="" ( goto help )
if %1==/? goto help
if %1==-? goto help
if %1==? goto help
if %1==create goto create

:create
if %3==small goto small
if %3==medium goto medium
if %3==big goto big
set bfc-size=%3
goto bfc_creator




:Small
 SET PSScript=%Temp%\~tmpRandom4Digit.ps1
 IF EXIST "%PSScript%" DEL /Q /F "%PSScript%"

 ECHO $fRandom = Get-Random -Maximum 550000 -Minimum 390000>>"%PSScript%"
 ECHO $Random  = "{0:0000}" -f $fRandom>>"%PSScript%"
 ECHO ECHO $Random>>"%PSScript%"

 SET PowerShellDir=C:\Windows\System32\WindowsPowerShell\v1.0 
 CD /D "%PowerShellDir%" 
 FOR /F "DELIMS=" %%A IN ('Powershell -ExecutionPolicy Bypass -Command "& '%PSScript%'"') DO SET "bfc-size=%%A"
 goto bfc_creator
:Medium
 SET PSScript=%Temp%\~tmpRandom4Digit.ps1
 IF EXIST "%PSScript%" DEL /Q /F "%PSScript%"

 ECHO $fRandom = Get-Random -Maximum 3000000 -Minimum 1000000>>"%PSScript%"
 ECHO $Random  = "{0:0000}" -f $fRandom>>"%PSScript%"
 ECHO ECHO $Random>>"%PSScript%"

 SET PowerShellDir=C:\Windows\System32\WindowsPowerShell\v1.0 
 CD /D "%PowerShellDir%" 
 FOR /F "DELIMS=" %%A IN ('Powershell -ExecutionPolicy Bypass -Command "& '%PSScript%'"') DO SET "bfc-size=%%A"
 goto bfc_creator
:Big
 SET PSScript=%Temp%\~tmpRandom4Digit.ps1
 IF EXIST "%PSScript%" DEL /Q /F "%PSScript%"

 ECHO $fRandom = Get-Random -Maximum 60000000 -Minimum 40000000>>"%PSScript%"
 ECHO $Random  = "{0:0000}" -f $fRandom>>"%PSScript%"
 ECHO ECHO $Random>>"%PSScript%"

 SET PowerShellDir=C:\Windows\System32\WindowsPowerShell\v1.0 
 CD /D "%PowerShellDir%" 
 FOR /F "DELIMS=" %%A IN ('Powershell -ExecutionPolicy Bypass -Command "& '%PSScript%'"') DO SET "bfc-size=%%A"
 goto bfc_creator




:bfc_creator
fsutil file createnew %DESKTOP_FOLDER%\%2 %bfc-size%
goto end



:help
echo.
echo Broken File Creator - Help - School Utilities
echo https://github.com/xcuzimfna/school-utilities
echo.
echo bfc /? - shows this
echo    create - creates broken files
echo           [NAME] - defines a name
echo                 [SMALL/MEDIUM/BIG/(CUSTOM SIZE)] - defines the size
echo.

:end