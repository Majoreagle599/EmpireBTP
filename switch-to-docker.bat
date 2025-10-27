@echo off
echo ========================================
echo   EMPIRE BTP - Basculer vers Docker
echo ========================================
echo.

echo [1/3] Sauvegarde de la configuration XAMPP...
copy .env .env.xampp.backup
echo Configuration XAMPP sauvegardee dans .env.xampp.backup

echo.
echo [2/3] Application de la configuration Docker...
copy .env.docker .env
echo Configuration Docker appliquee

echo.
echo [3/3] Vider le cache Symfony...
docker-compose exec php php bin/console cache:clear

echo.
echo ========================================
echo   Basculement termine !
echo ========================================
echo.
echo Le projet utilise maintenant Docker.
echo.
echo Demarrer avec : docker-up.bat
echo Site web : http://localhost:8001
echo.
echo Pour revenir a XAMPP :
echo copy .env.xampp.backup .env
echo ========================================
echo.
pause
