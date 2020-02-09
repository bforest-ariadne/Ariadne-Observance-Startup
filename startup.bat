@echo off
:: this script goes in the actual startup folder to launch the main script
E:
cd \scripts\Ariadne-Observance-Startup
git checkout master
echo script branch:
git rev-parse --abbrev-ref HEAD

E:\scripts\Ariadne-Observance-Startup/performance3-4-webGL.bat