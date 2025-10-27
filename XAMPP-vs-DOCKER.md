# 🚀 Guide de démarrage - XAMPP vs Docker

## 📋 Deux méthodes d'utilisation

Ce projet peut fonctionner avec **XAMPP** (méthode simple) ou **Docker** (méthode professionnelle).

---

## 🟢 MÉTHODE 1 : XAMPP (Configuration actuelle)

### Avantages
- ✅ Simple et rapide
- ✅ Interface graphique (phpMyAdmin)
- ✅ Pas besoin d'installer Docker

### Prérequis
- XAMPP (Apache + MySQL + PHP 8.2)
- Composer
- Node.js & npm

### Démarrage
1. Démarrer XAMPP (Apache + MySQL)
2. Ouvrir : `http://localhost/empirebtp/public/`

### Configuration
Fichier `.env` :
```env
DATABASE_URL="mysql://root:@127.0.0.1:3306/empirebtp?serverVersion=8.0.32&charset=utf8mb4"
```

Webpack `webpack.config.js` :
```javascript
.setPublicPath("/empirebtp/public/build")
```

---

## 🔵 MÉTHODE 2 : DOCKER (Configuration professionnelle)

### Avantages
- ✅ Environnement isolé et reproductible
- ✅ Même configuration pour toute l'équipe
- ✅ Services additionnels (Mercure, Mailpit, Traefik)
- ✅ Pas de conflit avec d'autres projets

### Prérequis
- Docker Desktop installé et démarré

### Installation initiale (une seule fois)
```bash
# Double-clic sur :
docker-start.bat

# Ou en ligne de commande :
docker-compose build --no-cache
docker-compose up -d
docker-compose exec php composer install
docker-compose exec php php bin/console doctrine:database:create --if-not-exists
docker-compose exec php php bin/console doctrine:migrations:migrate --no-interaction
docker-compose exec php npm install
docker-compose exec php npm run build
```

### Utilisation quotidienne
```bash
# Démarrer
docker-up.bat
# ou : docker-compose up -d

# Arrêter
docker-down.bat
# ou : docker-compose down
```

### Accès aux services
- **Site web** : http://localhost:8001
- **phpMyAdmin** : http://localhost:8082 (root / root)
- **Traefik Dashboard** : http://localhost:8091
- **Mercure** : http://localhost:3001
- **Mailpit** : http://localhost:8026
- **MySQL** : localhost:3307

### Configuration
Utilise automatiquement `.env.docker` avec :
```env
DATABASE_URL="mysql://empirebtp_user:empirebtp_pass@mysql:3306/empirebtp?serverVersion=8.0&charset=utf8mb4"
```

---

## 🔄 Passer de XAMPP à Docker

### 1. Exporter les données XAMPP
```bash
# Dans XAMPP phpMyAdmin, exporter la base "empirebtp"
# Fichier → Exporter → SQL
```

### 2. Démarrer Docker
```bash
docker-start.bat
```

### 3. Importer les données dans Docker
```bash
# Copier le fichier SQL dans le conteneur
docker cp empirebtp.sql empirebtp_mysql:/tmp/

# Importer
docker-compose exec mysql mysql -u root -proot empirebtp < /tmp/empirebtp.sql
```

### 4. Modifier la configuration
Copier `.env.docker` vers `.env` :
```bash
copy .env.docker .env
```

---

## 🔄 Passer de Docker à XAMPP

### 1. Exporter les données Docker
```bash
docker-compose exec mysql mysqldump -u root -proot empirebtp > empirebtp.sql
```

### 2. Arrêter Docker
```bash
docker-down.bat
```

### 3. Importer dans XAMPP
- Ouvrir phpMyAdmin XAMPP
- Créer la base `empirebtp` si nécessaire
- Importer le fichier `empirebtp.sql`

### 4. Restaurer la configuration XAMPP
Fichier `.env` :
```env
DATABASE_URL="mysql://root:@127.0.0.1:3306/empirebtp?serverVersion=8.0.32&charset=utf8mb4"
```

---

## 📊 Comparaison

| Critère | XAMPP | Docker |
|---------|-------|--------|
| Installation | Facile | Moyenne |
| Performance | Rapide | Rapide |
| Isolation | ❌ | ✅ |
| Portabilité | ❌ | ✅ |
| Services additionnels | ❌ | ✅ |
| Interface graphique | ✅ | ✅ |
| Recommandé pour | Développement solo | Équipe / Production |

---

## 🎯 Recommandation

- **Débutant** : Utilisez XAMPP
- **Équipe** : Utilisez Docker
- **Production** : Utilisez Docker

---

## 🆘 Dépannage

### XAMPP : Port déjà utilisé
```bash
# Vérifier les ports
netstat -ano | findstr :80
netstat -ano | findstr :3306

# Modifier les ports dans XAMPP Config
```

### Docker : Conteneurs ne démarrent pas
```bash
# Voir les logs
docker-compose logs

# Tout nettoyer et recommencer
docker-compose down -v
docker-start.bat
```

### Les deux tournent en même temps
⚠️ **ATTENTION** : Ne pas utiliser XAMPP et Docker en même temps !
- Docker utilise les ports 8001, 3307, 8082
- XAMPP utilise les ports 80, 3306

Ils ne sont **PAS** en conflit et peuvent coexister.

---

## ✅ Checklist rapide

### Avec XAMPP
- [ ] XAMPP démarré (Apache vert, MySQL vert)
- [ ] http://localhost/empirebtp/public/ accessible
- [ ] phpMyAdmin sur http://localhost/phpmyadmin

### Avec Docker
- [ ] Docker Desktop démarré (icône baleine verte)
- [ ] `docker ps` montre 6+ conteneurs
- [ ] http://localhost:8001 accessible
- [ ] phpMyAdmin sur http://localhost:8082

---

**Choisissez votre méthode et bon développement ! 🚀**
