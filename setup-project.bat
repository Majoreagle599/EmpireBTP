@echo off
title EmpireBTP - Installation Projet
echo =============================================
echo   INSTALLATION PROJET EMPIREBTP
echo =============================================
echo.

cd /d "C:\xampp\htdocs\EmpireBtp"

echo [INFO] Installation des dependances Node.js...
call npm install

echo [INFO] Compilation des assets...
call npm run dev

echo [INFO] Configuration de la base de donnees...
call reset-database.bat

echo [INFO] Activation du hook Git...
if not exist ".git\hooks\pre-commit" (
    copy /y ".git\hooks\pre-commit.sample" ".git\hooks\pre-commit" >nul 2>&1
)

echo [INFO] Verification des migrations...
C:\xampp\php\php.exe check-migrations.php

echo.
echo =============================================
echo   INSTALLATION TERMINEE !
echo =============================================
echo.
echo 📖 IMPORTANT: Lire database-management.md
echo 🚫 INTERDIT: make:migration (utiliser InitialSchema.php)
echo ✅ AUTORISE: Modifier migrations/InitialSchema.php
echo 🔧 RESET DB: reset-database.bat
echo.
echo 🌐 URL Admin: http://localhost:8000/admin
echo 🔑 Identifiants: admin@admin.com / 123456
echo.
pause