@echo off
echo ========================================
echo   EMPIRE BTP - Installation Docker
echo ========================================
echo.

echo [1/7] Construction des conteneurs Docker...
docker-compose build --no-cache

echo.
echo [2/7] Demarrage des services...
docker-compose up -d

echo.
echo [3/7] Attente du demarrage de MySQL...
timeout /t 10 /nobreak

echo.
echo [4/7] Installation des dependances PHP...
docker-compose exec php composer install --no-interaction

echo.
echo [5/7] Creation de la base de donnees...
docker-compose exec php php bin/console doctrine:database:create --if-not-exists --no-interaction

echo.
echo [6/7] Execution des migrations...
docker-compose exec php php bin/console doctrine:migrations:migrate --no-interaction

echo.
echo [7/7] Compilation des assets...
docker-compose exec php npm install
docker-compose exec php npm run build

echo.
echo ========================================
echo   Installation terminee !
echo ========================================
echo.
echo Site web      : http://localhost:8001
echo pgAdmin       : http://localhost:5051
echo   Email       : admin@empirebtp.com
echo   Password    : admin123
echo.
echo PostgreSQL    : localhost:5433
echo   Database    : empirebtp
echo   User        : empirebtp_user
echo   Password    : empirebtp_pass
echo.
echo Admin site    : admin@admin.com / 123456
echo ========================================
echo.
echo Appuyez sur une touche pour fermer...
pause > nul
