# Script PowerShell pour serveur EmpireBTP stable
param(
    [string]$Port = "8000",
    [string]$Host = "localhost"
)

$projectPath = "C:\xampp\htdocs\EmpireBtp"
$phpPath = "C:\xampp\php\php.exe"
$logFile = "$projectPath\var\log\server.log"

# Créer le dossier de logs s'il n'existe pas
$logDir = Split-Path $logFile -Parent
if (!(Test-Path $logDir)) {
    New-Item -ItemType Directory -Path $logDir -Force
}

function Write-LogMessage {
    param([string]$Message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "[$timestamp] $Message"
    Write-Host $logEntry -ForegroundColor Green
    Add-Content -Path $logFile -Value $logEntry
}

function Start-EmpireBTPServer {
    Write-LogMessage "Démarrage du serveur EmpireBTP sur ${Host}:${Port}"
    Write-LogMessage "Répertoire: $projectPath"
    
    # Vérifier que PHP existe
    if (!(Test-Path $phpPath)) {
        Write-Host "ERREUR: PHP introuvable à $phpPath" -ForegroundColor Red
        exit 1
    }
    
    # Vérifier que le projet existe
    if (!(Test-Path $projectPath)) {
        Write-Host "ERREUR: Projet introuvable à $projectPath" -ForegroundColor Red
        exit 1
    }
    
    Set-Location $projectPath
    
    # Lancer le serveur avec gestion d'erreurs
    try {
        & $phpPath -c "php-dev.ini" -S "${Host}:${Port}" -t public
    } catch {
        Write-LogMessage "ERREUR lors du démarrage: $_"
    }
}

Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "   SERVEUR EMPIREBTP - PowerShell    " -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""

# Boucle de redémarrage automatique
do {
    Start-EmpireBTPServer
    Write-LogMessage "Le serveur s'est arrêté - Redémarrage dans 5 secondes..."
    Start-Sleep -Seconds 5
} while ($true)