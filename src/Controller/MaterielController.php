<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;

class MaterielController extends AbstractController
{
    #[Route('/materiel', name: 'app_materiel')]
    #[IsGranted('ROLE_USER')]
    public function index(): Response
    {
        return $this->render('materiel/index.html.twig');
    }
}
