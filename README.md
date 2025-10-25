# 🏗️ Empire BTP - Projet Symfony

Bienvenue dans **Empire BTP**, une application web de gestion d'empire BTP développée avec Symfony.

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
