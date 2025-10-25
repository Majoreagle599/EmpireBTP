@echo off
title Serveur EmpireBTP - Auto-restart
echo ====================================
echo   SERVEUR EMPIREBTP AUTO-RESTART
echo ====================================
echo.

cd /d "C:\xampp\htdocs\EmpireBtp"

:loop
echo [%date% %time%] Demarrage du serveur...
C:\xampp\php\php.exe -S localhost:8000 -t public

echo.
echo [%date% %time%] Le serveur s'est arrete - Redemarrage dans 3 secondes...
timeout /t 3 > nul
goto loop