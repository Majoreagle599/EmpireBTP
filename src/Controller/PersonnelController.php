<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;

class PersonnelController extends AbstractController
{
    #[Route('/personnel', name: 'app_personnel')]
    #[IsGranted('ROLE_USER')]
    public function index(): Response
    {
        return $this->render('personnel/index.html.twig');
    }
}
