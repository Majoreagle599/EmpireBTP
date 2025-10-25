<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\RegisterUserType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class RegisterController extends AbstractController
{
    #[Route('/inscription', name: 'app_register')]
    public function index(Request $request, EntityManagerInterface $entityManagerInterface): Response
    {
        $user = new User();
        $form = $this->createForm(RegisterUserType::class, $user);
        
        // Gère la soumission du formulaire
        $form->handleRequest($request);
        
        if ($form->isSubmitted() && $form->isValid()) {
            $user = $form->getData();
            
            // Figer les données (préparer pour l'enregistrement)
            $entityManagerInterface->persist($user);
            
            // Envoyer les données en base de données
            $entityManagerInterface->flush();
            
            // Message de succès
            $this->addFlash('success', 'Votre compte a été créé avec succès ! Vous pouvez maintenant vous connecter.');
            
            // Rediriger après succès
            return $this->redirectToRoute('app_login');
        }
        
        return $this->render('register/index.html.twig', [
            'form' => $form->createView()
        ]);
    }
}