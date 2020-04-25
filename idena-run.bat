@echo off

Rem Change YOUR_VPS_IP with your VPS IP (with quotes)
Rem Change YOUR_VPS_PASSWORD with your VPS PASSWORD (with quotes)
Rem If you want to use your private key for login, specify it as VPS_PRIVATEKEY, VPS_PASSWOD will be ignored

set VPS_IP="YOUR_VPS_IP"
set VPS_PASSWORD="YOUR_VPS_PASSWORD"
set VPS_PRIVATEKEY=""

set VPS_USER="root"
set VPS_PORT=22
set VPS_RPC_PORT=9009
set VPS_NODE_HOST="localhost"
set LOCAL_RPC_PORT=9999
set RUN_AS_USER=""

Rem DO NOT EDIT ANYTHING BELOW THIS LINE!

if exist "%ProgramFiles%\PuTTY\putty.exe" (
	set PUTTY_LOCATION="%ProgramFiles%\PuTTY\putty.exe"
) else (
	set PUTTY_LOCATION="%ProgramFiles(x86)%\PuTTY\putty.exe"
)

if %VPS_PRIVATEKEY% == "" (
	start "Putty" /B %PUTTY_LOCATION% -ssh -L %LOCAL_RPC_PORT%:%VPS_NODE_HOST%:%VPS_RPC_PORT% %VPS_USER%@%VPS_IP% %VPS_PORT% -pw %VPS_PASSWORD%
) else (
	start "Putty" /B %PUTTY_LOCATION% -ssh -L %LOCAL_RPC_PORT%:%VPS_NODE_HOST%:%VPS_RPC_PORT% %VPS_USER%@%VPS_IP% %VPS_PORT% -i "%VPS_PRIVATEKEY%"
)

if %RUN_AS_USER% == "" (
    start "Idena" /B "%USERPROFILE%\AppData\Local\Programs\idena-desktop\Idena.exe"
) else (
    start "Idena" /B runas /user:%RUN_AS_USER% "%USERPROFILE%\AppData\Local\Programs\idena-desktop\Idena.exe"
)

@echo on