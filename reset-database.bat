@echo off
title EmpireBTP - Reset Base de Donnees
echo ========================================
echo   RESET COMPLET BASE DE DONNEES
echo ========================================
echo.

cd /d "C:\xampp\htdocs\EmpireBtp"

echo [INFO] Suppression de l'ancienne base de donnees...
if exist "var\data.db" del "var\data.db"

echo [INFO] Nettoyage du cache...
if exist "var\cache" rmdir /s /q "var\cache"

echo [INFO] Execution de la migration principale...
C:\xampp\php\php.exe bin/console doctrine:migrations:migrate --no-interaction

echo [INFO] Creation de l'utilisateur admin...
C:\xampp\php\php.exe bin/console app:create-admin-user

echo.
echo ========================================
echo   BASE DE DONNEES RESET AVEC SUCCES !
echo ========================================
echo.
echo Admin: admin@admin.com / 123456
echo URL: http://localhost:8000/admin
echo.
pause