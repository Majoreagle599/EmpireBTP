# Configuration Docker Stack EmpireBTP

## 🚀 Services disponibles

Votre projet utilise maintenant **8 services Docker** (ports différents d'AgriCult) :

### Services principaux
- **localhost:8090** - Application principale (via Traefik)
- **localhost:8001** - Application (accès direct Nginx)

### Services de développement
- **localhost:8026** - Interface Mailpit (emails)
- **localhost:3001** - Serveur Mercure (temps réel)
- **localhost:8091** - Dashboard Traefik
- **localhost:5051** - pgAdmin (PostgreSQL)

### Services internes
- **PostgreSQL** - Port 5433
- **Mailpit SMTP** - Port 1026
- **Assets** - Compilation automatique en arrière-plan

---

## ⚙️ Configuration requise

### 1. Modifier le fichier hosts (Windows)

**Chemin** : `C:\Windows\System32\drivers\etc\hosts`

**Ajouter ces lignes** (en tant qu'administrateur) :
```
127.0.0.1 empirebtp.local
127.0.0.1 mail.empirebtp.local
127.0.0.1 mercure.empirebtp.local
```

### 2. Configuration Symfony pour Mercure

Dans `.env.local`, ajouter :
```env
MERCURE_URL=http://mercure:80/.well-known/mercure
MERCURE_PUBLIC_URL=http://mercure.empirebtp.local/.well-known/mercure
MERCURE_JWT_SECRET="!ChangeThisMercureHubJWTSecretKey!"
```

### 3. Configuration emails (Mailpit)

Dans `.env.local`, ajouter :
```env
MAILER_DSN=smtp://mailer:1026
```

**Note** : Le port interne reste 1025, mais on accède via 1026 depuis l'extérieur.

---

## 🎯 Commandes Docker

### Démarrer tous les services
```bash
docker-compose up -d
```

### Voir les logs
```bash
docker-compose logs -f
```

### Arrêter tous les services
```bash
docker-compose down
```

### Rebuild après modification
```bash
docker-compose up -d --build
```

### Accéder au container PHP
```bash
docker-compose exec php bash
```

---

## 📋 Vérification

Après démarrage, vérifier que tous les services tournent :
```bash
docker-compose ps
```

Vous devriez voir **8 services** avec le status `Up` :
- empirebtp_traefik
- empirebtp_php
- empirebtp_nginx
- empirebtp_postgres
- empirebtp_pgadmin
- empirebtp_mercure
- empirebtp_mailpit
- empirebtp_assets

---

## 🔥 Fonctionnalités

### Assets automatiques
Le service `assets` surveille vos fichiers CSS/JS et les recompile automatiquement.
Plus besoin de lancer `npm run build` manuellement !

### Emails de développement
Tous les emails envoyés par l'application sont capturés par Mailpit.
Accédez à l'interface : http://mail.empirebtp.local

### Notifications temps réel
Mercure permet d'envoyer des notifications en temps réel aux utilisateurs connectés.

---

## 🆘 En cas de problème

### Restaurer l'ancienne configuration
```bash
Copy-Item docker-compose.yml.backup docker-compose.yml -Force
docker-compose down
docker-compose up -d
```

### Vider le cache Docker
```bash
docker-compose down -v
docker-compose up -d --build
```

### Ports déjà utilisés
Si un port est déjà pris, modifiez-le dans `docker-compose.yml`

---

**Backup de l'ancienne config** : `docker-compose.yml.backup` ✅
