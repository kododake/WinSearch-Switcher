@echo off
cd /d %~dp0
openfiles > nul
if errorlevel 1 (
    PowerShell.exe -Command Start-Process \"%~f0\" -Verb runas
    exit
)
set /p cfm=Change WindowsSearch status[Enable/Disable](s/d):
if %cfm%==s (
echo Service has been started
sc config "WSearch" start= auto
sc start WSearch
) else if %cfm%==d (
echo Service has been stopped.
sc stop WMPNetworkSvc
sc stop WSearch
sc config "WSearch" start= disabled
) else (
 echo Canceled
  )
pause
