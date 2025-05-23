@echo off
start "" /high GoW.exe
timeout /t 10 >nul
for /f "tokens=2 delims=," %%i in ('tasklist /fi "imagename eq GoW.exe" /fo csv /nh') do set PID=%%~i
PowerShell -Command "Get-Process -Id %PID% | ForEach-Object { $_.ProcessorAffinity = 0x5 }"