@echo off
SET /P ANSWER=Do you want to restart the system (Y/N)?
echo %ANSWER%
if /i {%ANSWER%}=={y} (goto :yes)
if /i {%ANSWER%}=={yes} (goto :yes)
goto :no
:yes
cd ..
call vagrant-stop.bat
shutdown /r /t 00

:no
exit