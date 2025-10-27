@echo off
echo ========================================
echo   EMPIRE BTP - Basculer vers XAMPP
echo ========================================
echo.

echo [1/3] Sauvegarde de la configuration Docker...
copy .env .env.docker.backup
echo Configuration Docker sauvegardee dans .env.docker.backup

echo.
echo [2/3] Application de la configuration XAMPP...
echo APP_ENV=dev> .env
echo APP_SECRET=!ChangeMe!XamppSecretKey!>> .env
echo.>> .env
echo # Base de donnees MySQL XAMPP>> .env
echo DATABASE_URL="mysql://root:@127.0.0.1:3306/empirebtp?serverVersion=8.0.32&charset=utf8mb4">> .env
echo Configuration XAMPP appliquee

echo.
echo [3/3] Vider le cache Symfony...
C:\xampp\php\php.exe bin/console cache:clear

echo.
echo ========================================
echo   Basculement termine !
echo ========================================
echo.
echo Le projet utilise maintenant XAMPP.
echo.
echo Demarrer XAMPP (Apache + MySQL)
echo Site web : http://localhost/empirebtp/public/
echo.
echo Pour revenir a Docker :
echo copy .env.docker.backup .env
echo ========================================
echo.
pause
