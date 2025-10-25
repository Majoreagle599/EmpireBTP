GESTION BASE DE DONNÉES EMPIREBTP - VERROUILLÉE
===============================================

🛡️ PROTECTION ACTIVE: NOUVELLES MIGRATIONS BLOQUÉES
===================================================

✅ PRINCIPE STRICT :
- UNE SEULE migration autorisée : InitialSchema.php
- TOUTES les modifications se font dans cette migration
- JAMAIS de nouvelles migrations créées
- SYSTÈME VERROUILLÉ contre les violations

🚫 PROTECTIONS INTELLIGENTES :
==============================
✅ Hook Git pre-commit : Bloque SEULEMENT la création de nouvelles migrations
✅ Commande make:migration : Redirige vers InitialSchema.php  
✅ Vérificateur automatique : check-migrations.php
✅ Script de reset : reset-database.bat
✅ Configuration Doctrine : Migrations verrouillées

💪 VOUS POUVEZ TOUJOURS :
========================
✅ Modifier InitialSchema.php
✅ Supprimer d'anciennes migrations  
✅ Committer vos changements normalement
✅ Pusher sur le repository
✅ Travailler en équipe sans problème

🚫 VOUS NE POUVEZ PAS :
======================
❌ Créer de nouvelles migrations (make:migration bloqué)
❌ Committer des nouveaux fichiers Version*.php
❌ Fragmenter le schéma de base de données

⚠️ IMPORTANT POUR VOTRE COLLÈGUE :
=================================

PREMIÈRE INSTALLATION :
1. git clone [repository]
2. Double-clic sur : setup-project.bat
3. Lire ce fichier database-management.md

WORKFLOW QUOTIDIEN :
❌ INTERDIT : php bin/console make:migration
✅ AUTORISÉ : 
   1. Modifier migrations/InitialSchema.php
   2. Double-clic sur reset-database.bat
   3. C'est tout !

🔧 COMMENT AJOUTER UNE NOUVELLE TABLE :
======================================

1. Ouvrir : migrations/InitialSchema.php
2. Ajouter dans la section "AJOUTS FUTURS ICI"
3. Exemple pour table Entreprise :

$this->addSql('CREATE TABLE "entreprise" (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    nom VARCHAR(255) NOT NULL,
    secteur VARCHAR(100) NOT NULL,
    capital DECIMAL(10,2) NOT NULL,
    user_id INTEGER NOT NULL,
    created_at DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES "user" (id)
)');

4. Exécuter : reset-database.bat (double-clic)
5. Terminé !

🚨 SI VIOLATION DÉTECTÉE :
=========================
Le système vous empêchera de :
- Committer de nouvelles migrations
- Utiliser make:migration
- Casser l'architecture du projet

Message d'erreur typique :
"❌ COMMIT BLOQUÉ ! Nouvelles migrations détectées"

SOLUTION : Supprimer les fichiers interdits et utiliser InitialSchema.php

📁 STRUCTURE VERROUILLÉE :
=========================
migrations/
├── .gitignore
└── InitialSchema.php    ← SEUL FICHIER AUTORISÉ

🎯 COMMANDES DISPONIBLES :
=========================
✅ reset-database.bat     - Reset complet de la DB
✅ setup-project.bat      - Installation pour nouveaux dev
✅ check-migrations.php   - Vérification des règles
✅ start-server.bat       - Serveur auto-restart

❌ make:migration         - BLOQUÉ (redirige vers InitialSchema.php)

🛡️ Cette approche garantit :
- Un schéma de DB centralisé et cohérent
- Pas de fragmentation en multiples migrations
- Contrôle total sur l'évolution de la structure
- Protection contre les erreurs d'équipe
- Développement plus rapide et prévisible

✅ RESPECT OBLIGATOIRE PAR TOUTE L'ÉQUIPE !