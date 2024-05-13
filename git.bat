@echo off
set /P commit="Commit: "
git.exe add --all
git.exe commit -m "%commit%"
git.exe push origin main
exit