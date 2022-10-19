<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;
use App\Entity\User;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use App\Form\ChangePasswordFormType;
use App\Form\ResetPasswordRequestFormType;
use Symfony\Component\HttpFoundation\Session\SessionInterface;

class SecurityController extends AbstractController
{
    private $passwordEncoder;

    public function __construct(UserPasswordEncoderInterface $passwordEncoder)
    {
        $this->passwordEncoder = $passwordEncoder;
    }
    
    
    
    public function index(): Response
    {
        return $this->redirectToRoute('app_login');
    }
    
    
    
    /**
     * Méthode d'authentification
     */
    public function login(AuthenticationUtils $authenticationUtils): Response
    {
        // if ($this->getUser()) {
        //     return $this->redirectToRoute('target_path');
        // }

        // get the login error if there is one
        $error = $authenticationUtils->getLastAuthenticationError();
        // last username entered by the user
        $lastUsername = $authenticationUtils->getLastUsername();

        return $this->render('security/login.html.twig', ['last_username' => $lastUsername, 'error' => $error]);
        //return $this->render('security/login.html.twig', ['error' => $error]);
    }

    /**
     * Déconnexion
     */
    public function logout()
    {
        throw new \LogicException('This method can be blank - it will be intercepted by the logout key on your firewall.');
    }

    /**
     * Méthode redirigeant vers la page d'accueil selon rôle user après authentification
     */
    public function home()
    {
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');

        $statut = $this->getUser()->getStatut();

        if ($statut == 'MP')
        {
            return $this->redirectToRoute('changePassword');
        }


        if ($statut == 'AC')
        {
            $role = $this->getUser()->getRoles()[0];
            if ($role == 'ROLE_ENSEIGNANT'){   

                return $this->render('enseignant/home.html.twig', [
                'enseignant' => $this->getUser()->getEnseignant(),
                 ]);
            }
            if ($role == 'ROLE_ETUDIANT'){
           
                return $this->render('etudiant/home.html.twig', [
                'etudiant' => $this->getUser()->getEtudiant(),
                 ]);
            }
            if ($role == 'ROLE_ADMIN'){
                return $this->redirectToRoute('listPromoEtudiants');
                //return $this->render('admin/home.html.twig');  
            }
        }
    else
     {
        return $this->render('register/userNonValide.html.twig', [
            'pEtudiant' =>  $this->getUser()->getEtudiant(),
            ]);
     }
  
    }
    /**
     * Méthode permettant à l'admin de reinitiliser le mot de passe d'un étudiant ou d'un prog avec des valeurs fixées dans la méthode
     * Le statut du user est alors valorisé à 'MP' pour obliger l'utilisateur à changer son mot de passe
     * 
     */
    public function initPassword($idUser, $typeUser, UserPasswordEncoderInterface $passwordEncoder): Response
    {
           
        $repository = $this->getDoctrine()->getRepository(User::class);
        $user = null ;

        if ($typeUser == 'etudiant')
        {
            $user = $repository->findOneBy(
                ['etudiant' => $idUser]); 

            $user->setPassword($passwordEncoder->encodePassword(
                    $user,
                    '1234abcd'
                ));   
    
        }
        if ($typeUser == 'enseignant')
        {
            $user = $repository->findOneBy(
                ['enseignant' => $idUser]); 
                echo($user->getEmail());
                
            $user->setPassword($passwordEncoder->encodePassword(
                    $user,
                    'mpProfSIO'
                ));   
    
        }
      
        if ($user == null) 
        {
                    throw $this->createNotFoundException(
                    'Aucun user trouvé avec le numéro '.$idUser
                    );
        }
        else
        {
            $user->setStatut('MP'); // si le mdp est réinitialisé, on met le statut à MP pour rediriger vers la page de modif de mdp pour obliger lutilisateur à modifier son mdp
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($user);
            $entityManager->flush();
                
            return $this->render('admin/initPassword.html.twig', ['user' => $user]);

        }
         
        

       
    }


    /*
     * Affiche le formulaire de mofi de mot de passe (mot de passe à saisir deux fois)
     * Permet de modifier le mot de passe
     * On remet le statut du user à 'AC' (actif)
     * 
     */
    public function changePassword(Request $request, UserPasswordEncoderInterface $passwordEncoder): Response
    {
        //$token="1234";
        $user = $this->getUser();
   

        // The token is valid; allow the user to change their password.
        $form = $this->createForm(ChangePasswordFormType::class);
        $form->handleRequest($request);
        
        $newMdp = $form->get('plainPassword')->getData();
       
        if ($form->isSubmitted()  && $form->isValid()) {
            
            echo ($newMdp . 'datauser='. $user->getEmail());
            
           $user->setPassword($this->passwordEncoder->encodePassword(
            $user,
            $newMdp ));

            $user->setStatut('AC');
            $this->getDoctrine()->getManager()->flush();
          
            $this->addFlash('success', 'Mot de passe modifié !');

            // ZA : The session is destroyed after the password has been changed.
            $session = $this->getSessionService();
            session_destroy();
           
            return $this->redirectToRoute('app_login');
        }

        return $this->render('reset_password/reset.html.twig', [
            'resetForm' => $form->createView(),
        ]);
    }

    private function getSessionService(): SessionInterface
    {
        /** @var Request $request */
        $request = $this->container->get('request_stack')->getCurrentRequest();

        return $request->getSession();
    }

}
