<?php
// Script pour créer la base de données via PDO

try {
    // Connexion sans base spécifique
    $pdo = new PDO(
        'mysql:host=127.0.0.1;port=3306',
        'root',
        '',
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );
    
    echo "✅ Connexion MySQL réussie !\n";
    
    // Création de la base
    $pdo->exec("CREATE DATABASE IF NOT EXISTS empirebtp CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci");
    echo "✅ Base de données 'empirebtp' créée avec succès !\n";
    
    // Vérification
    $stmt = $pdo->query("SHOW DATABASES LIKE 'empirebtp'");
    if ($stmt->rowCount() > 0) {
        echo "✅ Vérification : la base existe bien\n";
    }
    
} catch (PDOException $e) {
    echo "❌ Erreur : " . $e->getMessage() . "\n";
    echo "Code erreur : " . $e->getCode() . "\n";
}
