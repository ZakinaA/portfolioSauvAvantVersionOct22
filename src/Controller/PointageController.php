<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use App\Entity\Pointage ;
use App\Entity\Stage ;

class PointageController extends AbstractController
{
    //Pointage avec la récuperation de l'adresse IP 
    public function pointer($idStage, $action){

    $stage = $this->getDoctrine()
    ->getRepository(Stage::class)
    ->find($idStage);

    if ($action ==99) // l'étudiant pointe
    {
        $pointage = new Pointage();
        $pointage->setDatepoint(new \DateTime('now'));
        $pointage->setHeurepoint(new \DateTime("now"));
        $ip = $this->container->get('request_stack')->getCurrentRequest()->getClientIp();
        $pointage->setIpPoint($ip);
        $pointage->setStage($stage);
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($pointage);
        $entityManager->flush();
        return $this->render('stage/pointage.html.twig', array('stage' => $stage,'templateTwigParent' => 'baseEtudiant.html.twig'));
    }
    else // on veut juste afficher les pointages et selon le user on charge le bon template
    {
        $user = $this->getUser(); 
        if ( $user->getEnseignant()!= null)
        {
            $templateTwig= 'baseEnseignant.html.twig';        
        }
        else
        {
            $templateTwig= 'baseEtudiant.html.twig';
        }
        return $this->render('stage/pointage.html.twig', array('stage' => $stage, 'templateTwigParent' => $templateTwig));
    }

   
}


     /*
     * Permet à l'étudiant de supprimer un pointage
     */
    public function pointageRemove($idPointage): Response
    {        
        $user = $this->getUser(); 
        $repository = $this->getDoctrine()->getRepository(Pointage::class);
        $pointage = $repository->find($idPointage);
        $stage=$pointage->getStage();
        if ($pointage->getStage()->getEtudiant()->getid() != $this->getUser()->getEtudiant()->getId()  ){
            throw $this->createAccessDeniedException();
        }

        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->remove($pointage);
        $entityManager->flush();
        return $this->render('stage/pointage.html.twig', array('stage' => $stage, 'templateTwigParent' => 'baseEtudiant.html.twig'));
            

    }
}
