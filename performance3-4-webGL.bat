@echo off

set /a id=1
set /a idStr1=%id%+2
set /a idStr2=%id%+3

set /a waitMins=30
echo ARIADNE OBSERVANCE_00%idStr2% with webGL initialization is waiting for other programs and will continue in %waitMins% seconds. Press S to switch to OBSERVANCE_00%idStr1% .
:: Choices are s and c, default choice is c, timeout = 1800 seconds
choice /c CS /d s /t %waitMins%


set id=%errorlevel%

echo "starting max..."
E:
cd \max\Observance_004_max
git checkout master
echo branch:
git rev-parse --abbrev-ref HEAD
Start "" "C:\Program Files\Cycling '74\Max 7\Max.exe" E:\max\Observance_004_max\Observance_004_max.maxproj

set /a waitMins=30
set /a idStr1=%id%+2
echo ARIADNE OBSERVANCE_00%idStr1% initialization is waiting for other programs and will continue in %waitMins% seconds. Press S to switch.
:: Choices are n and c, default choice is n, timeout = 1800 seconds
choice /c cs /d c /t %waitMins%

:: if id is 2 then set id to opposite of error level
if %id%==2 (
	if  errorlevel 1 set /a id=2 
	if  errorlevel 2 set /a id=1
) else (
	:: if id is 1 then set to error level
	set id=%errorlevel%
)

:: wait in case key pressed early
TIMEOUT 20


::hide all windows
echo "hide all windows...."
nircmd sendkeypress rwin+"d"

TIMEOUT 5

:: start either observance003 or 004
goto Label%id%

:Label1
C:\Display\display.exe /device 1 /rotate 0
timeout 5
echo "start touchdesigner observance003"
Start "" "C:\Program Files\Derivative\TouchDesigner088\bin\touchdesigner088.exe" E:\touchdesigner\observance_003\observance_003.toe

TIMEOUT 60
rem START "" "C:\Users\Performance\Downloads\RestartOnCrash.exe"
TIMEOUT 60
nircmd setcursor 1000 500
nircmd sendmouse left click


exit /b 0

:Label2
C:\Display\display.exe /device 1 /rotate 90
timeout 5
echo "start touchdesigner observance004"
E:
cd \touchdesigner\observance_004
git checkout performance
echo branch:
git rev-parse --abbrev-ref HEAD
Start "" "C:\Program Files\Derivative\TouchDesigner099\bin\touchdesigner099.exe" E:\touchdesigner\observance_004\observance_004.toe

TIMEOUT 60
rem START "" "C:\Users\Performance\Downloads\RestartOnCrash.exe"
TIMEOUT 60
nircmd setcursor 1000 500
nircmd sendmouse left click

exit /b 0



