@echo off
chcp 65001
title Mihot loader v1.3.1
:poczatek
cls
echo ———————————————–
echo Mihot Bootloader
echo ———————————————–
echo.
echo 1) Uruchom (v10.2 (X))
echo 2) Safe mode (bez modow) (v10.2(X))
echo 3) mod manager (alpha)
echo 4) KONIEC
echo.
set /p opcja=wybierz:
if %opcja%==1 call Mihot_Sys.bat
if %opcja%==2 call Mihot_safe.bat
if %opcja%==3 goto modder
if %opcja%==4 exit


:modder
echo Witaj w modderze!
pause
echo Pamiętaj! możesz mieć tylko 1 mod na raz (wiem to slabe :( )
pause
echo skopiuj plik cl.txt i main.bat do katalogu mihot
copy cl.txt help.txt
copy main.bat Mihot_Sys.bat
echo Mod zainstalowany!
pause
goto poczatek
