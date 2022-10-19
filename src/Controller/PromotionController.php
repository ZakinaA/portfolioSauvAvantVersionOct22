<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Promotion ;

class PromotionController extends AbstractController
{
    /*
     * liste les promotions en cours
     */
    public function list(): Response
    {    
        
        return $this->render('promotion/listPromos.html.twig');
    }

    /*
     * Affiche les résultats des promos
     */
    public function showResultats(): Response
    {    
        $repository = $this->getDoctrine()->getRepository(Promotion::class);
        $promos = $repository->findBy(array(), array('id' => 'DESC'));

        $role = $this->getUser()->getRoles()[0];
        if ($role == 'ROLE_ETUDIANT'){   

            $templateTwigParent = 'baseEtudiant.html.twig';
        }
        if ($role == 'ROLE_ENSEIGNANT'){   

            $templateTwigParent = 'baseEnseignant.html.twig';
        }
        if ($role == 'ROLE_ADMIN'){   

            $templateTwigParent = 'baseAdmin.html.twig';
        }
     

        return $this->render('promotion/syntheseResultats.html.twig', [
            'promos' => $promos, 'templateTwigParent' => $templateTwigParent
        ]);  
    }
       
}
