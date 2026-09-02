@echo off
setlocal

:: Check if running with admin rights; if not, self-elevate this batch script
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
pushd "%CD%"
CD /D "%USERPROFILE%\.config\kanata"

set "KANATA_EXE=kanata_windows_gui_winIOv2_cmd_allowed_x64.exe"
set "KANATA_CFG=kanata.kbd"

powershell.exe -NoProfile -ExecutionPolicy Bypass -Command ^
  "$p = Get-Process -Name 'kanata_windows_gui_winIOv2_cmd_allowed_x64' -ErrorAction SilentlyContinue; if ($p) { $p | Stop-Process -Force } else { Start-Process -FilePath '%KANATA_EXE%' -ArgumentList '--cfg ""%KANATA_CFG%""' -WorkingDirectory '%USERPROFILE%\.config\kanata' }"

endlocal
exit /b