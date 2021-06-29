@echo off
set /p str1= Please enter the name string of the file (folder) to be replaced (interchangeable space)
set /p str2= Please enter a string for the name of the file (folder) to be replaced (enter if deleted)
echo.
echo wait
for /f "delims=" %%a in ('dir /s /b ^|sort /+65535') do (
if "%%~nxa" neq "%~nx0" (
set "file=%%a"
set "name=%%~na"
set "extension=%%~xa"
call set "name=%%name:%str1%=%str2%%%"
setlocal enabledelayedexpansion
ren "!file!" "!name!!extension!" 2>nul
endlocal
)
)
exit