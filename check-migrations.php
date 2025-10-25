#!/usr/bin/env php
<?php
/**
 * VERIFICATEUR DE MIGRATIONS EMPIREBTP
 * Empêche la création de nouvelles migrations autres qu'InitialSchema.php
 */

$migrationsDir = __DIR__ . '/migrations';
$allowedFiles = ['.gitignore', 'InitialSchema.php'];

echo "🔍 Vérification des migrations...\n";

$files = scandir($migrationsDir);
$violations = [];

foreach ($files as $file) {
    if ($file === '.' || $file === '..') continue;
    
    if (!in_array($file, $allowedFiles)) {
        $violations[] = $file;
    }
}

if (!empty($violations)) {
    echo "❌ ERREUR: Migrations non autorisées détectées !\n";
    echo "📋 Fichiers interdits:\n";
    foreach ($violations as $file) {
        echo "   - $file\n";
    }
    echo "\n";
    echo "🛡️  SEULE InitialSchema.php est autorisée !\n";
    echo "📖 Consultez database-management.md pour les instructions\n";
    echo "🔧 Utilisez reset-database.bat pour appliquer les changements\n";
    exit(1);
}

echo "✅ Migrations conformes aux règles du projet\n";
exit(0);