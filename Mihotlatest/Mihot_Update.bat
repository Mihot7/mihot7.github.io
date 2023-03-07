@echo off
set Mihot_Sys_Location=%cd%
title Mihot Update Wizard
goto boot
:boot
echo Starting Mihot Updater...
ping localhost -n 5 >nul
chcp 65001
echo Witaj, w Mihot update!
pause
:poczatek
cls
echo ———————————————————————
echo Mihot Update! v5.3    
echo ———————————————–———————
echo.
echo NOTE: Jeśli zainstalujesz moda na starszą wersje np. 10.1 twój system zostanie z downgradowany! Nowsze SDK pobierzesz z githuba!
echo.
echo 1) Zaktualizuj System UWAGA USUWA WSZYSTKIE MODY!
echo 2) Zaktualizuj MBL (MihotBootManager) (Zalecane po upgrade to nowszej wersji systemu!)
echo 3) Zaktualizuj wszystko (zalecane)
echo 4) Zaktualizuj Mihot update!
echo 5) Exit to mihot
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
echo Za chwilę wyświetle nazwę nowej wersji! i change log
call wersja.vbs
copy vnew.txt v.txt
type v.txt
echo  Ta wersja jest najnowsza!
echo Czy chcesz pobrać upgrade? Jeśli tak naciśnij dowolny klawisz jeśli nie wyłącz system (alt+f4)
pause
echo Instalacja rozpoczęta!
call system.vbs
copy sn.bat Mihot_Sys.bat
echo 10%
call safemode.vbs
copy Mihot_safenew.bat Mihot_safe.bat
echo 20%
echo 51%
ping localhost -n 5 >nul
echo 79%
call help.vbs
copy helpnew.txt help.txt
call safehelp.vbs
copy safehelpnew.txt safehelp.txt
echo 90%
del sn.bat /q
del Mihot_safenew.bat /q
del helpnew.txt /q
del safehelpnew.txt /q
echo Upgrade przebiegł pomyślnie!
pause
goto mihot

:opcja2
echo Update NMBL
echo Pobieranie listy wersji.....
call MBLv.vbs
type mblv.txt
echo  To jest najnowsza wersja!
echo naciśnij coś aby zainstalować!
pause
echo 0%
call MBL.vbs
echo 100%
echo Upgrade przebiegł pomyślnie!
pause
goto MBL


:opcja3
cls
echo Update WSZYSTKIEGO!
echo Za chwilę wyświetle nazwę nowej wersji Mihot!
call wersja.vbs
copy vnew.txt v.txt
type v.txt
echo  Ta wersja jest najnowsza!
echo Za chwilę wyświetle nazwę nowej wersji NMBL!
call MBLv.vbs
type mblv.txt
echo  Ta wersja jest najnowsza!
echo Czy chcesz pobrać upgrade? Jeśli tak naciśnij dowolny klawisz jeśli nie wyłącz system (alt+f4)
pause
echo Instalacja rozpoczęta!
call system.vbs
copy sn.bat Mihot_Sys.bat
echo 10%
call safemode.vbs
copy Mihot_safenew.bat Mihot_safe.bat
echo 20%
echo 51%
ping localhost -n 5 >nul
echo 79%
call help.vbs
copy helpnew.txt help.txt
call safehelp.vbs
copy safehelpnew.txt safehelp.txt
echo 90%
del sn.bat /q
del Mihot_safenew.bat /q
del helpnew.txt /q
del safehelpnew.txt /q
echo 0%
call MBL.vbs
call upgrade.vbs
echo 100%
echo Upgrade przebiegł pomyślnie!
pause
goto MBL



:zly_wybor
echo OPCJA NIE ZNANA.. WYBIERZ PONOWNIE!
pause
goto poczatek

:mihot
call mihot_sys.bat
echo System uszkodzony!
echo REINSTALACJA POTRZEBNA!
echo naciśnij enter aby uruchomić re instalacje
pause
goto opcja1

:MBL
call mihot_launcher.bat

:opcja4
echo Wybrano update upgradera!
call upgrade.vbs
pause
goto poczatek