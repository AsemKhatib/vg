@echo off
SET /P ANSWER=Do you want to shutdown the system (Y/N)?
echo %ANSWER%
if /i {%ANSWER%}=={y} (goto :yes)
if /i {%ANSWER%}=={yes} (goto :yes)
goto :no
:yes
cd ..
call vagrant-stop.bat
shutdown /s /t 00

:no
exit