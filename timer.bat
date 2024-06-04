@echo off
mode 32,10

title Timer
start /min timernote.txt
set time=31
:: time = 30?
:loop
cls

set /a time=%time%-1
if %time%==0 goto timesup

title Counting down...

echo.
echo.

echo.
echo Countdown - [%time%]

ping localhost -n 2 > nul
goto loop

:timesup
echo Time is Up!!
taskkill /F /FI "WindowTitle eq timernote.txt - Notepad" /T
exit

pause
goto start