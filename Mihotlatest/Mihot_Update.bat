@echo off
set Mihot_Sys_Location=%cd%
title Mihot Update Wizard
goto boot
:boot
echo Starting Mihot Updater...
ping localhost -n 5 >nul
chcp 65001
echo Witaj, w Mihot update!
cd update
pause
:poczatek
cls
echo ———————————————————————
echo Mihot Update! v2.0    
echo ———————————————–———————
echo.
echo NOTE: Jeśli zainstalujesz moda na starszą wersje np. 10.1 twój system zostanie z downgradowany! Nowsze SDK pobierzesz z githuba!
echo.
echo 1) Zaktualizuj System UWAGA USUWA WSZYSTKIE MODY!
echo 2) Zaktualizuj MBL (MihotBootManager) (Zalecane po upgrade to nowszej wersji systemu!)
echo 3) Zaktualizuj wszystko (zalecane)
echo 4) Zaktualizuj Mihot update (Zalecane kiedy np. ta wersja nie będzie wspierana!)
echo 4) Wróc do Mihot
echo NOTE: Jeśli posiadasz najnowszą wersje ten skrypt ją naprawi.
echo.
set /p opcja=wybierz:
if %opcja%==1 goto opcja1
if %opcja%==2 goto opcja2
if %opcja%==3 goto opcja3
if %opcja%==4 goto opcja4
if %opcja%==5 goto mihot
goto zly_wybor

:opcja1
cls
echo Za chwilę wyświetle nazwę nowej wersji!
call wersja.vbs
type v.txt
echo  Ta wersja jest najnowsza!
echo Czy chcesz pobrać upgrade? Jeśli tak naciśnij dowolny klawisz jeśli nie wyłącz system (alt+f4)
pause
echo Instalacja rozpoczęta!
call system.vbs
echo 10%
call safemode.vbs
echo 20%
copy Mihot_sys.bat %Mihot_Sys_Location%\Mihot_sys.bat
echo 51%
ping localhost -n 5 >nul
copy Mihot_safe.bat %Mihot_Sys_Location%\Mihot_safe.bat
echo 79%
call help.vbs
call safehelp.vbs
echo 90%
copy help.txt %mihot_sys_location%\help.txt
copy safehelp.txt %mihot_sys_location%\safehelp.txt
echo Upgrade przebiegł pomyślnie!
pause
call Mihot_sys.bat

:opcja2
cls
echo wybrano Kasowanie plikow tymczasowych
pause
goto poczatek

:opcja3
cls
echo wybrano Defragmentacje
pause
goto poczatek
:zly_wybor
echo OPCJA NIE ZNANA.. WYBIERZ PONOWNIE!
pause
goto poczatek

:mihot
cd ..
call mihot_sys.bat
echo System uszkodzony!
echo REINSTALACJA POTRZEBNA!
echo naciśnij enter aby uruchomić re instalacje
pause
goto opcja1

