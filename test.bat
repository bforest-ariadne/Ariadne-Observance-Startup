@echo off
echo "test script started"
E:
cd \max\Observance_004_max
git checkout master
echo branch:
git rev-parse --abbrev-ref HEAD
