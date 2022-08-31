@echo off
cd /d %~dp0
openfiles > nul
if errorlevel 1 (
    PowerShell.exe -Command Start-Process \"%~f0\" -Verb runas
    exit
)
set /p cfm=Change WindowsSearch status[enable/disable](e/d):
if %cfm%==e (
sc config "WSearch" start= auto
sc start WSearch
echo WindowsSearch service has been started
) else if %cfm%==d (
sc stop WSearch
sc config "WSearch" start= disabled
echo WindowsSearch service has been stopped
) else (
 echo Canceled
  )
pause
