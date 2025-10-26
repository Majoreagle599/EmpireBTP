@echo off
echo ========================================
echo   EMPIRE BTP - Demarrage Rapide
echo ========================================
echo.

echo Demarrage des conteneurs...
docker-compose up -d

echo.
echo ========================================
echo   EMPIRE BTP - Pret !
echo ========================================
echo.
echo Site web : http://localhost:8001
echo pgAdmin  : http://localhost:5051
echo.
pause
