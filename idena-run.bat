@echo off

Rem Change YOUR_VPS_IP with your VPS IP (with quotes)
Rem Change YOUR_VPS_PASSWORD with your VPS PASSWORD (with quotes)

set VPS_IP="YOUR_VPS_IP"
set VPS_PASSWORD="YOUR_VPS_PASSWORD"

set VPS_USER="root"
set VPS_PORT=22
set VPS_RPC_PORT=9009
set LOCAL_RPC_PORT=9999
set RUN_AS_USER=""

Rem DO NOT EDIT ANYTHING BELOW THIS LINE!

if exist "%ProgramFiles%\PuTTY\putty.exe" (
    start "Putty" /B "%ProgramFiles%\PuTTY\putty.exe" -ssh -L %LOCAL_RPC_PORT%:localhost:%VPS_RPC_PORT% %VPS_USER%@%VPS_IP% %VPS_PORT% -pw %VPS_PASSWORD%
) else (
    start "Putty" /B "%ProgramFiles(x86)%\PuTTY\putty.exe" -ssh -L %LOCAL_RPC_PORT%:localhost:%VPS_RPC_PORT% %VPS_USER%@%VPS_IP% %VPS_PORT% -pw %VPS_PASSWORD%
)

if %RUN_AS_USER% == "" (
    start "Idena" /B "C:\Users\%username%\AppData\Local\Programs\idena-desktop\Idena.exe"
) else (
    start "Idena" /B runas /user:%RUN_AS_USER% "C:\Users\%username%\AppData\Local\Programs\idena-desktop\Idena.exe"
)

@echo on