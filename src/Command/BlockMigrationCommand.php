<?php

namespace App\Command;

use Symfony\Component\Console\Attribute\AsCommand;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Style\SymfonyStyle;

#[AsCommand(
    name: 'make:migration',
    description: 'BLOQUÉ - Utiliser InitialSchema.php uniquement'
)]
class BlockMigrationCommand extends Command
{
    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        $io = new SymfonyStyle($input, $output);

        $io->error('🚫 CRÉATION DE MIGRATION BLOQUÉE !');
        $io->newLine();
        
        $io->warning([
            '🛡️  RÈGLE PROJET EMPIREBTP:',
            'Seule la migration InitialSchema.php est autorisée !',
            '',
            '📖 Pour ajouter des tables:',
            '1. Ouvrir: migrations/InitialSchema.php',
            '2. Modifier la section "AJOUTS FUTURS ICI"',
            '3. Exécuter: reset-database.bat',
            '',
            '📋 Consultez database-management.md pour plus d\'infos'
        ]);

        $io->note('Cette protection empêche la fragmentation du schéma de base de données.');

        return Command::FAILURE;
    }
}