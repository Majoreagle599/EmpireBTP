<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;

class MarcheController extends AbstractController
{
    #[Route('/marche', name: 'app_marche')]
    #[IsGranted('ROLE_USER')]
    public function index(): Response
    {
        return $this->render('marche/index.html.twig');
    }
}
