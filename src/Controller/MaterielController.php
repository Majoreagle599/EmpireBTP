<?php

namespace App\Controller;

use App\Entity\Machine;
use App\Repository\MachineRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;

class MaterielController extends AbstractController
{
    #[Route('/materiel', name: 'app_materiel')]
    #[IsGranted('ROLE_USER')]
    public function index(MachineRepository $machineRepository, Request $request): Response
    {
        // Récupérer tous les filtres
        $secteurFilter = $request->query->get('secteur');
        $categorieFilter = $request->query->get('categorie');
        $marqueFilter = $request->query->get('marque');

        // Construire la requête avec les filtres
        $queryBuilder = $machineRepository->createQueryBuilder('m');

        if ($secteurFilter) {
            $queryBuilder->andWhere('m.secteur = :secteur')
                ->setParameter('secteur', $secteurFilter);
        }

        if ($categorieFilter) {
            $queryBuilder->andWhere('m.categorie = :categorie')
                ->setParameter('categorie', $categorieFilter);
        }

        if ($marqueFilter) {
            $queryBuilder->andWhere('m.marque = :marque')
                ->setParameter('marque', $marqueFilter);
        }

        $queryBuilder->orderBy('m.secteur', 'ASC')
            ->addOrderBy('m.categorie', 'ASC')
            ->addOrderBy('m.prixAchat', 'ASC');

        $machines = $queryBuilder->getQuery()->getResult();

        // Récupérer les valeurs uniques pour les filtres
        $secteurs = $machineRepository->createQueryBuilder('m')
            ->select('DISTINCT m.secteur')
            ->orderBy('m.secteur', 'ASC')
            ->getQuery()
            ->getResult();

        $categories = $machineRepository->createQueryBuilder('m')
            ->select('DISTINCT m.categorie')
            ->orderBy('m.categorie', 'ASC')
            ->getQuery()
            ->getResult();

        $marques = $machineRepository->createQueryBuilder('m')
            ->select('DISTINCT m.marque')
            ->orderBy('m.marque', 'ASC')
            ->getQuery()
            ->getResult();

        return $this->render('materiel/index.html.twig', [
            'machines' => $machines,
            'secteurs' => array_column($secteurs, 'secteur'),
            'categories' => array_column($categories, 'categorie'),
            'marques' => array_column($marques, 'marque'),
            'currentSecteur' => $secteurFilter,
            'currentCategorie' => $categorieFilter,
            'currentMarque' => $marqueFilter,
        ]);
    }
}
