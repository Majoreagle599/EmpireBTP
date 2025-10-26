═══════════════════════════════════════════════════════════════
                    EMPIRE BTP - MÉMO DOCKER
═══════════════════════════════════════════════════════════════

🎮 IDENTIFIANTS
═══════════════════════════════════════════════════════════════

**Admin du site :**
Email    : admin@admin.com
Password : 123456

**pgAdmin (interface base de données) :**
Email    : admin@empirebtp.com
Password : admin123

**PostgreSQL :**
Database : empirebtp
User     : empirebtp_user
Password : empirebtp_pass

⚠️ SÉCURITÉ : Changez ces identifiants en production !

═══════════════════════════════════════════════════════════════
🐳 DÉMARRAGE RAPIDE AVEC DOCKER
═══════════════════════════════════════════════════════════════

**Première installation :**
Double-clic sur : docker-start.bat

**Démarrage quotidien :**
Double-clic sur : docker-up.bat

**Arrêt :**
Double-clic sur : docker-down.bat

═══════════════════════════════════════════════════════════════
🌐 URLS D'ACCÈS
═══════════════════════════════════════════════════════════════

Site web      : http://localhost:8001
pgAdmin       : http://localhost:5051
PostgreSQL    : localhost:5433

📍 Note : Port 8001 pour ne pas conflit avec Agri-Cult (port 80)

═══════════════════════════════════════════════════════════════
🗄️ BASE DE DONNÉES
═══════════════════════════════════════════════════════════════

**Type** : PostgreSQL 15 (même technologie qu'Agri-Cult)
**Host** : postgres (dans Docker) / localhost:5433 (depuis votre PC)
**Migration unique** : Version99999999999999.php

⚠️ RÈGLE STRICTE : NE JAMAIS CRÉER DE NOUVELLES MIGRATIONS !

═══════════════════════════════════════════════════════════════
🔧 COMMANDES SYMFONY DANS DOCKER
═══════════════════════════════════════════════════════════════

# Créer un admin
docker-compose exec php php bin/console app:create-admin

# Nettoyer le cache
docker-compose exec php php bin/console cache:clear

# Voir les routes
docker-compose exec php php bin/console debug:router

# Lancer les migrations
docker-compose exec php php bin/console doctrine:migrations:migrate

# Accéder au conteneur PHP
docker-compose exec php bash

═══════════════════════════════════════════════════════════════
🎨 COMPILATION DES ASSETS
═══════════════════════════════════════════════════════════════

**Dans Docker :**
docker-compose exec php npm run build

📁 Fichiers générés dans : public/build/

═══════════════════════════════════════════════════════════════
🐳 SERVICES DOCKER
═══════════════════════════════════════════════════════════════

**php** (empirebtp_php)
- PHP 8.2-FPM
- Composer, npm, Node.js
- Extensions : pdo_pgsql, pgsql, zip, intl

**nginx** (empirebtp_nginx)
- Port : 8001
- Serveur web pour Symfony

**postgres** (empirebtp_postgres)
- PostgreSQL 15
- Port : 5433 (externe) / 5432 (interne)

**pgadmin** (empirebtp_pgadmin)
- Interface graphique PostgreSQL
- Port : 5051

═══════════════════════════════════════════════════════════════
🔧 COMMANDES DOCKER UTILES
═══════════════════════════════════════════════════════════════

# Voir les logs
docker-compose logs -f

# Redémarrer un service
docker-compose restart nginx
docker-compose restart php

# Reconstruire les images
docker-compose down
docker-compose build --no-cache
docker-compose up -d

# Voir les conteneurs actifs
docker ps

═══════════════════════════════════════════════════════════════
