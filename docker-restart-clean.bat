@echo off
echo ========================================
echo   EMPIRE BTP - Redemarrage propre Docker
echo ========================================
echo.

echo [1/5] Arret de tous les conteneurs...
docker-compose down -v 2>nul
docker stop $(docker ps -aq) 2>nul
docker rm $(docker ps -aq) 2>nul

echo.
echo [2/5] Nettoyage complet Docker...
docker system prune -a -f

echo.
echo [3/5] Suppression des images non utilisees...
docker image prune -a -f

echo.
echo [4/5] Reconstruction complete des conteneurs...
docker-compose build --no-cache

echo.
echo [5/5] Demarrage des services...
docker-compose up -d

echo.
echo ========================================
echo   Redemarrage termine !
echo ========================================
echo.
echo Services actifs :
docker ps --format "  - {{.Names}} ({{.Status}})"
echo.
echo Site web : http://localhost:8001
echo pgAdmin  : http://localhost:5051
echo.
pause
