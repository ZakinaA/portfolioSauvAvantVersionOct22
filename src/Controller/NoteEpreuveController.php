<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use App\Entity\Promotion;
use App\Entity\Etudiant;
use App\Entity\Specialite;
use App\Entity\Epreuve;
use App\Entity\NoteEpreuve;
use App\Form\EtudiantNotesType;

class NoteEpreuveController extends AbstractController
{
    /*
     * #liste les résultats des épreuves des étudiants d'une promo
     */
    public function listerResultatsParPromo(Request $request, $idPromo, $idEtudiant): Response
    {
        $repository = $this->getDoctrine()->getRepository(Promotion::class);
        $promos = $repository->findBy(array(), array('id' => 'DESC'));
        
        $role = $this->getUser()->getRoles()[0];
        if ($role == 'ROLE_ENSEIGNANT'){   

            $templateTwigParent = 'baseEnseignant.html.twig';
        }
        if ($role == 'ROLE_ADMIN'){   

            $templateTwigParent = 'baseAdmin.html.twig';
        }

        
        if ($idPromo > 0)
        {
            $repository = $this->getDoctrine()->getRepository(Etudiant::class);
            $etudiantsSisr = $repository->getEtudiantsParPromoEtSpecialite($idPromo,1);
            $etudiantsSlam = $repository->getEtudiantsParPromoEtSpecialite($idPromo,2);

            $repository = $this->getDoctrine()->getRepository(Promotion::class);
            $moySisr = $repository->getMoyennesEpreuvesParPromoEtSpecialite($idPromo,1);
           
            $moySlam = $repository->getMoyennesEpreuvesParPromoEtSpecialite($idPromo,2);
            $moyPromo = $repository->getMoyennesEpreuvesParPromo($idPromo);

            $repository = $this->getDoctrine()->getRepository(Epreuve::class);
            $epreuves = $repository->findAll();

            if($idEtudiant != null && $idEtudiant != 0){

                $repository = $this->getDoctrine()->getRepository(Etudiant::class);
                $etudiant = $repository->find($idEtudiant);

                // création ou récupération des épreuves de l'étudiant si existe
                foreach ($epreuves as $epreuve) 
                {   
                    $noteExist=0;
                    foreach ($etudiant->getNoteEpreuves() as $noteEtudiant)    
                    {            
                        if ($noteEtudiant->getEpreuve()->getId() == $epreuve->getId())
                        {
                            $noteExist=1;
                        }       
                    
                    }
                    if ($noteExist==0){
                        $noteEpreuve = new NoteEpreuve();
                        $noteEpreuve->setEpreuve($epreuve);
                        $etudiant->addNoteEpreuve($noteEpreuve);
                    }


                }

                $form = $this->createForm(EtudiantNotesType::class, $etudiant);
                $form->handleRequest($request);

                if ($form->isSubmitted() && $form->isValid()) 
                {
                    $entityManager = $this->getDoctrine()->getManager();
                    $entityManager->persist($etudiant);
                    $entityManager->flush();
                    $this->addFlash('success', 'Informations modifiées avec succès !');
                    
                    return $this->redirectToRoute('listerResultatsParPromo',array('idPromo'=> $etudiant->getPromotion()->getId(), 'idEtudiant' => 0));
                }

                return $this->render('note_epreuve/listResultatsParPromo.html.twig', [
                    'epreuves' => $epreuves, 'sisr' => $etudiantsSisr, 'slam' => $etudiantsSlam, 'promos'=>$promos, 'moySisr'=>$moySisr, 'moySlam'=>$moySlam, 'moyPromo'=>$moyPromo, 'templateTwigParent' => $templateTwigParent, 'etudiant' => $etudiant, 'form' => $form->createView(), 'promo' => $idPromo
                ]);       
       
            }

            return $this->render('note_epreuve/listResultatsParPromo.html.twig', [
                'epreuves' => $epreuves, 'sisr' => $etudiantsSisr, 'slam' => $etudiantsSlam, 'promos'=>$promos, 'moySisr'=>$moySisr, 'moySlam'=>$moySlam, 'moyPromo'=>$moyPromo, 'templateTwigParent' => $templateTwigParent, 'promo' => $idPromo
            ]);
        }
        else
        {
        
        return $this->render('note_epreuve/listResultatsParPromo.html.twig', [
            'promos'=>$promos, 'templateTwigParent' => $templateTwigParent
        ]);
        }
    }


    /*
     * Ajoute les notes aux preuves
     */
    public function addNotes(Request $request, $idEtudiant)
    {
        $repository = $this->getDoctrine()->getRepository(Epreuve::class);
        $epreuves = $repository->findAll();

        $repository = $this->getDoctrine()->getRepository(Etudiant::class);
        $etudiant = $repository->find($idEtudiant);

        // création ou récupération des épreuves de l'étudiant si existe
        foreach ($epreuves as $epreuve) 
        {   
            $noteExist=0;
            foreach ($etudiant->getNoteEpreuves() as $noteEtudiant)    
            {            
                if ($noteEtudiant->getEpreuve()->getId() == $epreuve->getId())
                {
                    $noteExist=1;
                }       
               
            }
            if ($noteExist==0){
                $noteEpreuve = new NoteEpreuve();
                $noteEpreuve->setEpreuve($epreuve);
                $etudiant->addNoteEpreuve($noteEpreuve);
            }


        }

        $form = $this->createForm(EtudiantNotesType::class, $etudiant);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) 
        {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($etudiant);
            $entityManager->flush();
            $this->addFlash('success', 'Informations modifiées avec succès !');
            
            return $this->redirectToRoute('listerResultatsParPromo',array('idPromo'=> $etudiant->getPromotion()->getId()));


        }
        return $this->render('note_epreuve/add.html.twig', array('form' => $form->createView(), 'etudiant'=>$etudiant));       
       
    

    }



}
