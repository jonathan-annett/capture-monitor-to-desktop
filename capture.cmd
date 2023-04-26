@echo off 
if %1.==. goto usage
PowerShell.exe -ExecutionPolicy bypass -file .\capture.ps1 -display %1 -usefile %2
goto end            

:usage
echo Examples: 
echo capture.cmd 1
echo    captures from display 1
echo. 
echo capture.cmd 2
echo    captures from display 2
echo.
echo capture.cmd 0 random
echo    downloads a random picture and sets the wallpaper (doesn't capture)
echo. 
echo capture 0 c:\some-file.jpg
echo    sets the wallpaper to be c:\some-file.jpg (doesn't capture)

:end