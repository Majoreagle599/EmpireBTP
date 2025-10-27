@echo off
cls
echo ========================================
echo   EMPIRE BTP - Installation COMPLETE
echo   PostgreSQL + Migration + Admin
echo ========================================
echo.

echo Etape 1/8 : Construction des images Docker...
echo (Cela peut prendre 3-5 minutes)
echo.
docker-compose build --no-cache php assets

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ERREUR lors de la construction !
    echo Verifiez que Docker Desktop est demarre.
    pause
    exit /b 1
)

echo.
echo Etape 2/8 : Demarrage des services...
docker-compose up -d

echo.
echo Etape 3/8 : Attente PostgreSQL (15 secondes)...
timeout /t 15 /nobreak

echo.
echo Etape 4/8 : Creation de la base de donnees...
docker-compose exec php php bin/console doctrine:database:create --if-not-exists --no-interaction

echo.
echo Etape 5/8 : Execution de la migration principale...
docker-compose exec php php bin/console doctrine:migrations:migrate --no-interaction

echo.
echo Etape 6/8 : Installation dependances PHP...
docker-compose exec php composer install --no-interaction

echo.
echo Etape 7/8 : Installation dependances Node.js...
docker-compose exec php npm install

echo.
echo Etape 8/8 : Compilation des assets...
docker-compose exec php npm run build

echo.
echo ========================================
echo   INSTALLATION TERMINEE !
echo ========================================
echo.
echo Acces aux services :
echo   Site web : http://localhost:8001
echo   pgAdmin  : http://localhost:5051
echo     Email    : admin@empirebtp.com
echo     Password : admin123
echo.
echo PostgreSQL   : localhost:5433
echo   Database   : empirebtp
echo   User       : empirebtp_user
echo   Password   : empirebtp_pass
echo.
echo Base de donnees et migration executees avec succes !
echo.
echo PROCHAINE ETAPE :
echo Creer un utilisateur admin avec :
echo   docker-compose exec php php bin/console app:create-admin-user
echo.
pause
