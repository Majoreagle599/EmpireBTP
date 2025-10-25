<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Migration principale EmpireBTP - Schema complet
 * Cette migration contient tout le schéma de base de données.
 * Modifications futures : modifier directement cette migration.
 */
final class InitialSchema extends AbstractMigration
{
    public function getDescription(): string
    {
        return 'Schema principal EmpireBTP - Base SQLite complète';
    }

    public function up(Schema $schema): void
    {
        // ===== SCHEMA PRINCIPAL EMPIREBTP =====
        // Cette migration contient TOUT le schéma de base de données
        // Pour ajouter/modifier : modifier directement ICI, pas de nouvelle migration
        
        // Table utilisateurs - Authentification et rôles
        $this->addSql('CREATE TABLE "user" (
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
            email VARCHAR(180) NOT NULL, 
            name VARCHAR(100) NOT NULL, 
            roles CLOB NOT NULL, 
            password VARCHAR(255) NOT NULL
        )');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_IDENTIFIER_EMAIL ON "user" (email)');
        
        // Table messages Symfony (pour les queues)
        $this->addSql('CREATE TABLE messenger_messages (
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
            body CLOB NOT NULL, 
            headers CLOB NOT NULL, 
            queue_name VARCHAR(190) NOT NULL, 
            created_at DATETIME NOT NULL, 
            available_at DATETIME NOT NULL, 
            delivered_at DATETIME DEFAULT NULL
        )');
        $this->addSql('CREATE INDEX IDX_75EA56E0FB7336F0 ON messenger_messages (queue_name)');
        $this->addSql('CREATE INDEX IDX_75EA56E0E3BD61CE ON messenger_messages (available_at)');
        $this->addSql('CREATE INDEX IDX_75EA56E016BA31DB ON messenger_messages (delivered_at)');
        
        // ===== AJOUTS FUTURS ICI =====
        // Quand vous ajoutez des entités (Entreprise, Chantier, Machine, etc.)
        // Ajoutez les CREATE TABLE directement ici au lieu de créer de nouvelles migrations
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE "user"');
        $this->addSql('DROP TABLE messenger_messages');
    }
}
