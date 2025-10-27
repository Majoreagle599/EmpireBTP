@echo off
echo ========================================
echo   EMPIRE BTP - Setup PostgreSQL complet
echo ========================================
echo.

echo [1/6] Attente demarrage PostgreSQL (10 secondes)...
timeout /t 10 /nobreak

echo.
echo [2/6] Creation de la base de donnees...
docker-compose exec php php bin/console doctrine:database:create --if-not-exists --no-interaction

echo.
echo [3/6] Execution de la migration principale...
docker-compose exec php php bin/console doctrine:migrations:migrate --no-interaction

echo.
echo [4/6] Installation des dependances PHP...
docker-compose exec php composer install --no-interaction

echo.
echo [5/6] Installation des dependances Node.js...
docker-compose exec php npm install

echo.
echo [6/6] Compilation des assets...
docker-compose exec php npm run build

echo.
echo ========================================
echo   Setup termine !
echo ========================================
echo.
echo Acces au site :
echo   Site web : http://localhost:8001
echo   pgAdmin  : http://localhost:5051
echo     Email    : admin@empirebtp.com
echo     Password : admin123
echo.
echo Base de donnees PostgreSQL creee !
echo Migration principale executee !
echo.
echo Pour creer un utilisateur admin :
echo   docker-compose exec php php bin/console app:create-admin-user
echo.
pause
