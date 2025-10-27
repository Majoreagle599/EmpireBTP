# 🏗️ Empire BTP - Guide d'Installation Docker

## 📋 Table des matières
1. [Qu'est-ce que Docker ?](#quest-ce-que-docker)
2. [Prérequis](#prérequis)
3. [Installation de Docker](#installation-de-docker)
4. [Installation du projet](#installation-du-projet)
5. [Utilisation quotidienne](#utilisation-quotidienne)
6. [Accès aux services](#accès-aux-services)
7. [Commandes utiles](#commandes-utiles)
8. [Dépannage](#dépannage)

---

## 🤔 Qu'est-ce que Docker ?

**Docker**, c'est comme une "boîte magique" qui contient tout ce dont le projet a besoin pour fonctionner :
- Le serveur web (Nginx)
- PHP avec toutes les extensions nécessaires
- La base de données PostgreSQL
- L'interface de gestion de base de données (pgAdmin)

**Avantages :**
- ✅ Même environnement pour toute l'équipe
- ✅ Installation en 1 clic
- ✅ Pas besoin d'installer PHP, PostgreSQL, etc. sur votre PC
- ✅ Pas de conflit avec d'autres projets

---

## 📦 Prérequis

### Windows 10/11 Professionnel
- Windows 10/11 64-bit : Pro, Enterprise, ou Education
- Virtualisation activée dans le BIOS
- WSL 2 (Windows Subsystem for Linux)

### Windows 10/11 Famille
- Même chose mais nécessite d'activer WSL 2

---

## 🔧 Installation de Docker

### Étape 1 : Télécharger Docker Desktop

1. Aller sur : https://www.docker.com/products/docker-desktop/
2. Cliquer sur **"Download for Windows"**
3. Lancer l'installateur `Docker Desktop Installer.exe`

### Étape 2 : Installation

1. **Suivre l'assistant d'installation** :
   - Cocher "Use WSL 2 instead of Hyper-V" (recommandé)
   - Cliquer sur "Ok"
   - Attendre la fin de l'installation (5-10 minutes)

2. **Redémarrer votre PC** quand demandé

3. **Premier lancement** :
   - Lancer "Docker Desktop" depuis le menu Démarrer
   - Accepter les conditions d'utilisation
   - Vous pouvez créer un compte Docker (facultatif)
   - Attendre que Docker soit démarré (icône baleine en bas à droite)

### Étape 3 : Vérifier l'installation

1. Ouvrir **PowerShell** (ou CMD)
2. Taper :
   ```bash
   docker --version
   ```
3. Vous devriez voir : `Docker version 24.x.x`

4. Taper :
   ```bash
   docker-compose --version
   ```
5. Vous devriez voir : `Docker Compose version v2.x.x`

✅ Si vous voyez ces versions, **Docker est installé !**

---

## 🚀 Installation du projet

### Étape 1 : Cloner le projet

```bash
# Aller dans votre dossier de projets
cd C:\xampp\htdocs

# Cloner le repository
git clone https://github.com/Majoreagle599/EmpireBTP.git

# Entrer dans le dossier
cd EmpireBtp
```

### Étape 2 : Première installation (MÉTHODE FACILE)

**Double-cliquez simplement sur le fichier :**
```
docker-start.bat
```

Ce script va automatiquement :
1. ⚙️ Construire les conteneurs Docker
2. 🚀 Démarrer tous les services
3. 📦 Installer les dépendances PHP
4. 🎨 Compiler les assets (CSS/JS)
5. 🗄️ Créer la base de données
6. 📊 Lancer les migrations

**⏱️ Durée : 5-10 minutes** (selon votre connexion internet)

### Étape 3 : Vérification

Une fois le script terminé, vous verrez :

```
========================================
  EMPIRE BTP - Installation terminée !
========================================

Site web      : http://localhost:8001
pgAdmin      : http://localhost:5051
  Email      : admin@empirebtp.com
  Password   : admin123

PostgreSQL   : localhost:5433
  Database   : empirebtp
  User       : empirebtp_user
  Password   : empirebtp_pass

Admin site   : admin@admin.com / 123456
========================================
```

### Étape 4 : Créer un utilisateur admin

```bash
docker-compose exec php php bin/console app:create-admin
```

Ou connectez-vous avec : **admin@admin.com** / **123456**

---

## 💻 Utilisation quotidienne

### Démarrer le projet

**Méthode 1 : Double-clic** (RECOMMANDÉ)
```
Double-cliquez sur : docker-up.bat
```

**Méthode 2 : Ligne de commande**
```bash
cd C:\xampp\htdocs\EmpireBtp
docker-compose up -d
```

⏱️ **Temps : 10-30 secondes**

### Arrêter le projet

**Méthode 1 : Double-clic**
```
Double-cliquez sur : docker-down.bat
```

**Méthode 2 : Ligne de commande**
```bash
cd C:\xampp\htdocs\EmpireBtp
docker-compose down
```

### Workflow quotidien typique

1. **Matin** : Double-clic sur `docker-up.bat`
2. **Travail** : Ouvrir http://localhost:8001 dans votre navigateur
3. **Soir** : Double-clic sur `docker-down.bat`

---

## 🌐 Accès aux services

| Service | URL | Identifiants |
|---------|-----|--------------|
| **Site web** | http://localhost:8001 | admin@admin.com / 123456 |
| **Traefik Dashboard** | http://localhost:8091 | - |
| **Mercure** | http://localhost:3001 | - |
| **Mailpit (Web)** | http://localhost:8026 | - |
| **pgAdmin** | http://localhost:5051 | admin@empirebtp.com / admin123 |
| **PostgreSQL** | localhost:5433 | empirebtp_user / empirebtp_pass |

### Configuration de pgAdmin (première fois)

1. Ouvrir http://localhost:5051
2. Se connecter avec : **admin@empirebtp.com** / **admin123**
3. Clic droit sur "Servers" → "Register" → "Server"
4. Onglet "General" :
   - Name : `EmpireBTP`
5. Onglet "Connection" :
   - Host : `postgres`
   - Port : `5432`
   - Database : `empirebtp`
   - Username : `empirebtp_user`
   - Password : `empirebtp_pass`
6. Cliquer sur "Save"

✅ Vous pouvez maintenant gérer la base de données visuellement !

---

## 🛠️ Commandes utiles

### Voir les logs en temps réel

```bash
docker-compose logs -f
```

### Accéder au conteneur PHP

```bash
docker-compose exec php bash
```

Une fois dedans, vous pouvez lancer des commandes Symfony :
```bash
php bin/console cache:clear
php bin/console doctrine:migrations:migrate
php bin/console app:create-admin
```

### Compiler les assets

```bash
docker-compose exec php npm run build
```

### Voir les conteneurs actifs

```bash
docker ps
```

### Redémarrer un service spécifique

```bash
docker-compose restart nginx
docker-compose restart php
docker-compose restart postgres
```

### Reconstruire les conteneurs (après modification du Dockerfile)

```bash
docker-compose down
docker-compose build --no-cache
docker-compose up -d
```

---

## 🆘 Dépannage

### Problème : "Docker Desktop is not running"

**Solution :**
1. Lancer Docker Desktop depuis le menu Démarrer
2. Attendre que l'icône baleine soit verte en bas à droite
3. Relancer `docker-up.bat`

### Problème : Port 8001 déjà utilisé

**Solution :**
```bash
# Voir ce qui utilise le port
netstat -ano | findstr :8001

# Modifier le port dans docker-compose.yml
# Changer "8001:80" en "8002:80"
```

### Problème : Les conteneurs ne démarrent pas

**Solution 1 : Redémarrer Docker Desktop**
1. Clic droit sur l'icône Docker en bas à droite
2. "Quit Docker Desktop"
3. Relancer Docker Desktop
4. Attendre 1-2 minutes
5. Relancer `docker-up.bat`

**Solution 2 : Tout nettoyer et recommencer**
```bash
docker-compose down -v
docker system prune -a
# Double-clic sur docker-start.bat
```

### Problème : "Cannot connect to the Docker daemon"

**Solution :**
1. Vérifier que Docker Desktop est lancé
2. Vérifier dans Paramètres Windows → Applications → Docker Desktop
3. Réinstaller Docker Desktop si nécessaire

### Problème : Site inaccessible sur localhost:8001

**Vérifications :**
```bash
# Vérifier que les conteneurs tournent
docker ps

# Vous devriez voir :
# - empirebtp_nginx
# - empirebtp_php
# - empirebtp_postgres
# - empirebtp_pgadmin

# Voir les logs
docker-compose logs nginx
docker-compose logs php
```

### Problème : Erreur base de données

**Solution :**
```bash
docker-compose exec php php bin/console doctrine:database:create --if-not-exists
docker-compose exec php php bin/console doctrine:migrations:migrate --no-interaction
```

---

## 📞 Besoin d'aide ?

Si vous rencontrez un problème :

1. **Vérifier les logs :**
   ```bash
   docker-compose logs -f
   ```

2. **Redémarrer Docker Desktop**

3. **Tout nettoyer et recommencer :**
   ```bash
   docker-compose down -v
   docker-start.bat
   ```

4. **Contacter l'équipe** avec :
   - Le message d'erreur complet
   - Les logs de `docker-compose logs`
   - Votre système d'exploitation

---

## ✅ Checklist avant de commencer à travailler

- [ ] Docker Desktop est lancé (icône baleine verte)
- [ ] `docker-up.bat` exécuté (ou `docker-compose up -d`)
- [ ] http://localhost:8001 affiche le site
- [ ] Connexion avec admin@admin.com / 123456 fonctionne
- [ ] (Optionnel) pgAdmin accessible sur http://localhost:5051

**Vous êtes prêt à travailler ! 🚀**

---

## 🎯 Résumé rapide

### Installation (une seule fois)
1. Installer Docker Desktop
2. Cloner le projet
3. Double-clic sur `docker-start.bat`
4. Attendre 5-10 minutes
5. Aller sur http://localhost:8001

### Utilisation quotidienne
1. **Démarrer** : `docker-up.bat`
2. **Travailler** : http://localhost:8001
3. **Arrêter** : `docker-down.bat`

**C'est tout ! 😊**

## 🔐 Identifiants de connexion

**Email :** empirebtp1@gmail.com  
**Mot de passe :** empirebtp1A2A

## 🏗️ VISION PROJET - SECTEURS D'ACTIVITÉ BTP
  ( a voir ensemble )
### 📋 Secteurs d'activité prévus :
- 🏗️ **CONSTRUCTION** - Bâtiments, maisons, immeubles
- 🛣️ **VOIRIE** - Routes, ponts, infrastructure routière  
- 💥 **DÉMOLITION** - Déconstruction, désamiantage
- ⛏️ **CARRIÈRE** - Extraction, granulats, matières premières
- 🏭 **TRAVAUX PUBLICS** - Réseaux, assainissement
- 🌉 **GÉNIE CIVIL** - Ouvrages d'art, tunnels
- 🏢 **RÉNOVATION** - Réhabilitation, restauration

### 🎯 Spécificités par secteur :
Chaque secteur aura :
- Ses **machines spécifiques** (pelleteuses, grues, concasseurs...)
- Ses **matériaux propres** (béton, bitume, granulats...)
- Ses **compétences requises** (maçons, grutiers, mineurs...)
- Ses **réglementations** (permis, normes environnementales...)
- Ses **types de chantiers** (résidentiel, industriel, routier...)
- Sa **rentabilité** et ses défis économiques

### 🏛️ Architecture système :
```
Entreprise → Secteurs d'activité → Chantiers spécialisés → Équipes & Matériel
```

> **📢 IMPORTANT POUR MAJOR : Merci de lire cette section pour comprendre la vision multi-secteurs du projet !**

## 📋 Prérequis

Avant de commencer, assurez-vous d'avoir installé :

- **XAMPP** (avec PHP 8.2+ et MySQL)
- **Composer** (gestionnaire de dépendances PHP)
- **Node.js** et **npm** (pour la compilation des assets)
- **Git** (pour le contrôle de version)

## 🚀 Installation

### 1. Cloner le projet

```bash
git clone https://github.com/Majoreagle599/EmpireBTP.git
cd EmpireBTP
```

### 2. Installer les dépendances PHP

```bash
composer install
```

Ou avec le fichier composer.bat local :
```bash
.\composer.bat install
```

### 3. Installer les dépendances Node.js

```bash
npm install
```

### 4. Configuration de la base de données

1. Démarrez **XAMPP** (Apache + MySQL)
2. Créez la base de données :

```bash
C:\xampp\php\php.exe bin/console doctrine:database:create
```

3. Exécutez les migrations :

```bash
C:\xampp\php\php.exe bin/console doctrine:migrations:migrate
```

### 5. Créer un utilisateur administrateur

```bash
C:\xampp\php\php.exe bin/console app:create-admin
```

**Identifiants par défaut :**
- Email : `admin@admin.com`
- Mot de passe : `123456`

### 6. Compiler les assets

En mode développement :
```bash
npm run dev
```

En mode production :
```bash
npm run build
```

Pour compiler automatiquement à chaque modification :
```bash
npm run watch
```

### 7. Vider le cache Symfony

```bash
C:\xampp\php\php.exe bin/console cache:clear
```

## 🌐 Accéder à l'application

Une fois XAMPP démarré, ouvrez votre navigateur :

- **Page d'accueil** : `http://localhost/empirebtp/public/`
- **Connexion** : `http://localhost/empirebtp/public/login`
- **Administration** : `http://localhost/empirebtp/public/admin`

## 👤 Utilisateurs

### Administrateur
- **Email** : admin@admin.com
- **Mot de passe** : 123456
- **Accès** : Dashboard d'administration EasyAdmin

### Créer un nouvel utilisateur
Utilisez le formulaire d'inscription ou créez-en un via la console.

## 📁 Structure du projet

```
empirebtp/
├── assets/              # Fichiers sources (JS, CSS, images)
│   ├── app.js          # Point d'entrée JavaScript
│   └── styles/         # Fichiers CSS
├── config/             # Configuration Symfony
├── migrations/         # Migrations de base de données
├── public/             # Répertoire public (point d'entrée web)
│   └── build/          # Assets compilés
├── src/
│   ├── Command/        # Commandes console
│   ├── Controller/     # Contrôleurs
│   ├── Entity/         # Entités Doctrine
│   ├── Form/           # Formulaires
│   └── Repository/     # Repositories Doctrine
├── templates/          # Templates Twig
├── var/               # Cache et logs
└── vendor/            # Dépendances PHP
```

## 🛠️ Commandes utiles

### Symfony

```bash
# Lister toutes les routes
C:\xampp\php\php.exe bin/console debug:router

# Créer un nouveau contrôleur
C:\xampp\php\php.exe bin/console make:controller

# Créer une nouvelle entité
C:\xampp\php\php.exe bin/console make:entity

# Créer une migration
C:\xampp\php\php.exe bin/console make:migration

# Vider le cache
C:\xampp\php\php.exe bin/console cache:clear
```

### Assets (Webpack Encore)

```bash
# Compilation en mode développement
npm run dev

# Compilation en mode production
npm run build

# Compilation automatique (watch)
npm run watch
```

### Base de données

```bash
# Créer la base de données
C:\xampp\php\php.exe bin/console doctrine:database:create

# Supprimer la base de données
C:\xampp\php\php.exe bin/console doctrine:database:drop --force

# Exécuter les migrations
C:\xampp\php\php.exe bin/console doctrine:migrations:migrate

# Voir le statut des migrations
C:\xampp\php\php.exe bin/console doctrine:migrations:status
```

## 🔧 Configuration

### Base de données

Fichier `.env` :
```env
DATABASE_URL="mysql://root:@127.0.0.1:3306/empirebtp?serverVersion=8.0.32&charset=utf8mb4"
```

### Webpack Encore

Le chemin public des assets est configuré pour XAMPP dans `webpack.config.js` :
```javascript
.setPublicPath("/empirebtp/public/build")
```

## 🐛 Dépannage

### Le CSS ne s'affiche pas

1. Vérifiez que les assets sont compilés :
```bash
npm run dev
```

2. Videz le cache Symfony :
```bash
C:\xampp\php\php.exe bin/console cache:clear
```

3. Videz le cache du navigateur (Ctrl + F5)

### Erreur de connexion à la base de données

1. Vérifiez que MySQL est démarré dans XAMPP
2. Vérifiez les paramètres dans le fichier `.env`
3. Assurez-vous que la base de données `empirebtp` existe

### Erreur 500

1. Consultez les logs : `var/log/dev.log`
2. Videz le cache : `C:\xampp\php\php.exe bin/console cache:clear`
3. Vérifiez les permissions sur le dossier `var/`

## 📦 Technologies utilisées

- **Symfony 7.x** - Framework PHP
- **Doctrine ORM** - Gestion de base de données
- **Twig** - Moteur de templates
- **Webpack Encore** - Gestion des assets
- **Bootstrap 5** - Framework CSS
- **EasyAdmin** - Interface d'administration
- **Stimulus** - Framework JavaScript léger

## 🔐 Sécurité

- Les mots de passe sont hashés avec l'algorithme bcrypt
- Protection CSRF activée sur tous les formulaires
- Authentification via Symfony Security

## 📝 Fonctionnalités

- ✅ Inscription et connexion des utilisateurs
- ✅ Gestion de profil utilisateur
- ✅ Modification du mot de passe
- ✅ Interface d'administration (EasyAdmin)
- ✅ Gestion des utilisateurs (CRUD)
- ✅ Design responsive avec Bootstrap 5

## 👥 Contributeurs

- Développeur principal : Major & Jeremy

## 📄 Licence

Ce projet est développé à des fins éducatives.

## 🆘 Support

Pour toute question ou problème, consultez :
- Le fichier `memo.txt` pour les commandes rapides
- Les logs dans `var/log/`
- La documentation Symfony : https://symfony.com/doc

---

**Bon développement ! 🚀**
