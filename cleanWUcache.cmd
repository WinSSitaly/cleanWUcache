@ECHO OFF

sc config "wuauserv" start= disabled
net stop wuauserv
net stop bits
net stop trustedinstaller

ping 127.0.0.1 > nul
IF EXIST %windir%\SoftwareDistribution.OLD RD /S /Q %windir%\SoftwareDistribution.OLD

rename "%windir%\SoftwareDistribution" "SoftwareDistribution.OLD"
ping 127.0.0.1 > nul

sc config "wuauserv" start= auto
net start wuauserv
net start bits
net start trustedinstaller

ping 127.0.0.1 > nul
