@echo NGROK CHacKA0101
@echo My Path
SET mypath=%~dp0
cd %mypath:~0,-1%
@echo 1. ACTIVATE REMOTE DESKTOP
sc config RemoteRegistry start= auto
net start remoteregistry
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
@echo 2. DOWNLOAD NGROK.EXE
curl https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-windows-amd64.zip --output ngrok.zip
powershell Expand-Archive -LiteralPath ngrok.zip
cd ngrok
xcopy ngrok.exe %SystemRoot%\system32
echo ngrok.exe authtoken "TOKEN" > %SystemRoot%\system32\ngrok.bat
echo ngrok.exe tcp 3389 >> %SystemRoot%\system32\ngrok.bat
REG ADD  HKLM\Software\Microsoft\Windows\CurrentVersion\Run /v Ngrok /t REG_MULTI_SZ /d "%SystemRoot%\system32\ngrok.bat" /f
ngrok.bat
@echo FINISH...Bye.
PAUSE
exit
