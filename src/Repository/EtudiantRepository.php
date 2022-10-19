<?php

namespace App\Repository;

use App\Entity\Etudiant;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Etudiant|null find($id, $lockMode = null, $lockVersion = null)
 * @method Etudiant|null findOneBy(array $criteria, array $orderBy = null)
 * @method Etudiant[]    findAll()
 * @method Etudiant[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class EtudiantRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Etudiant::class);
    }


    /**
    * @return Etudiant[] Returns an array of Etudiant objects
    */
    
    public function listParSpecialiteParNiveau($specialite, $niveau)
    {
       
        $qb = $this->createQueryBuilder('e')
            ->andWhere('e.specialite = :pSpecialite' )
            ->setParameter('pSpecialite', $specialite)
            ->andWhere('e.niveau = :pNiveau' )
            ->setParameter('pNiveau', $niveau)
            ->join('e.promotion', 'p')
            ->andwhere('p.statut = :pStatutPromo')
            ->setParameter('pStatutPromo', 'AC')
            //->orderBy('e.nom', 'ASC')
           ->getQuery();

       return $qb->execute();


        
    }
    
    // 
    //  @return Etudiant[] Returns an array of Etudiant objects
    //   
    public function getEtudiantsParPromoEtSpecialite($idPromo, $idSpecialite)
    {   
        $entityManager = $this->getEntityManager();

        $query = $entityManager->createQuery(
            'SELECT e, p, s
            FROM App\Entity\Etudiant e
            INNER JOIN e.promotion p
            INNER JOIN e.specialite s
            WHERE p.id = :idPromo
            AND s.id = :idSpecialite
            ORDER BY e.nom'
        )->setParameter('idPromo', $idPromo)
        ->setParameter('idSpecialite', $idSpecialite);
            
        return $query->getResult();
               
        /*return $this->createQueryBuilder('e')
            ->join('e.promotion', 'p')   
            ->join('e.specialite', 's')
             ->where('p.id = :1')
            ->andwhere('s.id = :1')
            //->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;*/
    }
    





    // /**
    //  * @return Etudiant[] Returns an array of Etudiant objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('e')
            ->andWhere('e.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('e.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Etudiant
    {
        return $this->createQueryBuilder('e')
            ->andWhere('e.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
