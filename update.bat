@echo off
:: copies the startup script to the startup folder
xcopy /y  E:\scripts\Ariadne-Observance-Startup\startup.bat "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"