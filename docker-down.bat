@echo off
echo ========================================
echo   EMPIRE BTP - Arret Docker
echo ========================================
echo.

echo Arret des conteneurs...
docker-compose down

echo.
echo Conteneurs arretes !
echo.
pause
