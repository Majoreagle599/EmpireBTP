<?php

namespace App\Controller\Admin;

use App\Entity\User;
use App\Repository\UserRepository;
use EasyCorp\Bundle\EasyAdminBundle\Attribute\AdminDashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use Symfony\Component\HttpFoundation\Response;

#[AdminDashboard(routePath: '/admin', routeName: 'admin')]
class DashboardController extends AbstractDashboardController
{
    public function __construct(
        private UserRepository $userRepository
    ) {}

    public function index(): Response
    {
        // Collecte des statistiques pour le dashboard
        $stats = [
            'totalUsers' => $this->userRepository->count([]),
            'totalChantiers' => 0, // Sera mis à jour quand on aura l'entité Chantier
            'totalMachines' => 0, // Sera mis à jour quand on aura l'entité Machine
            'totalEntreprises' => 0, // Sera mis à jour quand on aura l'entité Entreprise
            'constructionProjects' => 0,
            'demolitionProjects' => 0,
            'quarryProjects' => 0,
            'publicWorksProjects' => 0,
        ];

        // Activités récentes (placeholder pour le moment)
        $recentActivities = [
            [
                'title' => 'Système d\'authentification installé',
                'description' => 'Les utilisateurs peuvent maintenant s\'inscrire et se connecter',
                'createdAt' => new \DateTime('-2 hours')
            ],
            [
                'title' => 'Interface d\'administration configurée',
                'description' => 'Le tableau de bord administrateur est opérationnel',
                'createdAt' => new \DateTime('-1 hour')
            ],
            [
                'title' => 'Base de données SQLite opérationnelle',
                'description' => 'Migration réussie vers SQLite pour éviter les conflits Docker',
                'createdAt' => new \DateTime('-30 minutes')
            ]
        ];

        return $this->render('admin/dashboard.html.twig', [
            'stats' => $stats,
            'recentActivities' => $recentActivities
        ]);
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('EmpireBTP - Administration')
            ->setFaviconPath('favicon.ico')
            ->setTranslationDomain('admin')
            ->setTextDirection('ltr')
            ->renderContentMaximized(false)
            ->renderSidebarMinimized(false)
            ->disableUrlSignatures();
    }

    public function configureMenuItems(): iterable
    {
        yield MenuItem::linkToDashboard('Tableau de Bord', 'fa fa-tachometer-alt');
        
        yield MenuItem::section('GESTION UTILISATEURS');
        yield MenuItem::linkToCrud('Utilisateurs', 'fas fa-users', User::class);
        yield MenuItem::linkToCrud('Créer un Utilisateur', 'fas fa-user-plus', User::class)
            ->setAction('new');
        
        yield MenuItem::section('SECTEUR CONSTRUCTION');
        yield MenuItem::linkToUrl('Chantiers Construction', 'fas fa-hard-hat', '#')
            ->setBadge('En développement', 'secondary');
        yield MenuItem::linkToUrl('Équipes Construction', 'fas fa-users-cog', '#')
            ->setBadge('En développement', 'secondary');
        yield MenuItem::linkToUrl('Matériaux Construction', 'fas fa-cubes', '#')
            ->setBadge('En développement', 'secondary');
            
        yield MenuItem::section('SECTEUR DÉMOLITION');
        yield MenuItem::linkToUrl('Projets Démolition', 'fas fa-bomb', '#')
            ->setBadge('En développement', 'secondary');
        yield MenuItem::linkToUrl('Équipements Démolition', 'fas fa-tools', '#')
            ->setBadge('En développement', 'secondary');
        yield MenuItem::linkToUrl('Sécurité Démolition', 'fas fa-shield-alt', '#')
            ->setBadge('En développement', 'secondary');
            
        yield MenuItem::section('SECTEUR CARRIÈRES');
        yield MenuItem::linkToUrl('Sites d\'Extraction', 'fas fa-mountain', '#')
            ->setBadge('En développement', 'secondary');
        yield MenuItem::linkToUrl('Machines Extraction', 'fas fa-truck-monster', '#')
            ->setBadge('En développement', 'secondary');
        yield MenuItem::linkToUrl('Production Granulats', 'fas fa-industry', '#')
            ->setBadge('En développement', 'secondary');
            
        yield MenuItem::section('TRAVAUX PUBLICS');
        yield MenuItem::linkToUrl('Projets Routiers', 'fas fa-road', '#')
            ->setBadge('En développement', 'secondary');
        yield MenuItem::linkToUrl('Infrastructure Urbaine', 'fas fa-city', '#')
            ->setBadge('En développement', 'secondary');
        yield MenuItem::linkToUrl('Réseaux et VRD', 'fas fa-project-diagram', '#')
            ->setBadge('En développement', 'secondary');
            
        yield MenuItem::section('GESTION ENTREPRISE');
        yield MenuItem::linkToUrl('Mes Entreprises', 'fas fa-building', '#')
            ->setBadge('En développement', 'secondary');
        yield MenuItem::linkToUrl('Parc de Machines', 'fas fa-truck', '#')
            ->setBadge('En développement', 'secondary');
        yield MenuItem::linkToUrl('Gestion Financière', 'fas fa-euro-sign', '#')
            ->setBadge('En développement', 'secondary');
        yield MenuItem::linkToUrl('Ressources Humaines', 'fas fa-user-tie', '#')
            ->setBadge('En développement', 'secondary');
            
        yield MenuItem::section('RAPPORTS ET ANALYTICS');
        yield MenuItem::linkToUrl('Tableau de Bord Financier', 'fas fa-chart-line', '#')
            ->setBadge('En développement', 'secondary');
        yield MenuItem::linkToUrl('Performances Chantiers', 'fas fa-chart-bar', '#')
            ->setBadge('En développement', 'secondary');
        yield MenuItem::linkToUrl('Analyse de Rentabilité', 'fas fa-calculator', '#')
            ->setBadge('En développement', 'secondary');
            
        yield MenuItem::section('ADMINISTRATION SYSTÈME');
        yield MenuItem::linkToUrl('Configuration Générale', 'fas fa-cog', '#')
            ->setBadge('En développement', 'secondary');
        yield MenuItem::linkToUrl('Logs et Monitoring', 'fas fa-file-alt', '#')
            ->setBadge('En développement', 'secondary');
        yield MenuItem::linkToUrl('Sauvegarde Données', 'fas fa-download', '#')
            ->setBadge('En développement', 'secondary');
            
        yield MenuItem::section('INTERFACE PUBLIQUE');
        yield MenuItem::linkToUrl('Retour au Site', 'fas fa-external-link-alt', '/')
            ->setLinkTarget('_blank');
        yield MenuItem::linkToUrl('Page de Connexion', 'fas fa-sign-in-alt', '/connexion')
            ->setLinkTarget('_blank');
        yield MenuItem::linkToUrl('Page d\'Inscription', 'fas fa-user-plus', '/inscription')
            ->setLinkTarget('_blank');
    }
}
