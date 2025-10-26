<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;

class ChantierController extends AbstractController
{
    #[Route('/chantiers', name: 'app_chantiers')]
    #[IsGranted('ROLE_USER')]
    public function index(): Response
    {
        return $this->render('chantier/index.html.twig');
    }
}
