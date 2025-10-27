<?php

namespace App\Controller;

use App\Repository\MachineRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;

class SecteurController extends AbstractController
{
    #[Route('/secteur/voirie', name: 'app_secteur_voirie')]
    #[IsGranted('ROLE_USER')]
    public function voirie(MachineRepository $machineRepository): Response
    {
        $machines = $machineRepository->findBy(['secteur' => 'Voirie']);
        
        return $this->render('secteur/voirie.html.twig', [
            'machines' => $machines,
            'secteur' => 'Voirie',
        ]);
    }

    #[Route('/secteur/carriere', name: 'app_secteur_carriere')]
    #[IsGranted('ROLE_USER')]
    public function carriere(MachineRepository $machineRepository): Response
    {
        $machines = $machineRepository->findBy(['secteur' => 'Carrière']);
        
        return $this->render('secteur/carriere.html.twig', [
            'machines' => $machines,
            'secteur' => 'Carrière',
        ]);
    }

    #[Route('/secteur/carriere/sites', name: 'app_secteur_carriere_sites')]
    #[IsGranted('ROLE_USER')]
    public function sitesExtraction(): Response
    {
        return $this->render('secteur/sites_extraction.html.twig', [
            'secteur' => 'Carrière',
        ]);
    }

    #[Route('/secteur/carriere/petite', name: 'app_secteur_carriere_petite')]
    #[IsGranted('ROLE_USER')]
    public function carrierePetite(MachineRepository $machineRepository): Response
    {
        $machines = $machineRepository->findBy(['secteur' => 'Carrière']);
        
        return $this->render('secteur/carriere_petite.html.twig', [
            'machines' => $machines,
            'secteur' => 'Carrière',
            'taille' => 'Petite',
        ]);
    }

    #[Route('/secteur/carriere/moyenne', name: 'app_secteur_carriere_moyenne')]
    #[IsGranted('ROLE_USER')]
    public function carriereMoyenne(MachineRepository $machineRepository): Response
    {
        $machines = $machineRepository->findBy(['secteur' => 'Carrière']);
        
        return $this->render('secteur/carriere_moyenne.html.twig', [
            'machines' => $machines,
            'secteur' => 'Carrière',
            'taille' => 'Moyenne',
        ]);
    }

    #[Route('/secteur/demolition', name: 'app_secteur_demolition')]
    #[IsGranted('ROLE_USER')]
    public function demolition(MachineRepository $machineRepository): Response
    {
        $machines = $machineRepository->findBy(['secteur' => 'Démolition']);
        
        return $this->render('secteur/demolition.html.twig', [
            'machines' => $machines,
            'secteur' => 'Démolition',
        ]);
    }

    #[Route('/secteur/transport', name: 'app_secteur_transport')]
    #[IsGranted('ROLE_USER')]
    public function transport(MachineRepository $machineRepository): Response
    {
        $machines = $machineRepository->findBy(['secteur' => 'Transport']);
        
        return $this->render('secteur/transport.html.twig', [
            'machines' => $machines,
            'secteur' => 'Transport',
        ]);
    }
}
