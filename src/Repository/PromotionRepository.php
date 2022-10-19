<?php

namespace App\Repository;

use App\Entity\Promotion;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Promotion|null find($id, $lockMode = null, $lockVersion = null)
 * @method Promotion|null findOneBy(array $criteria, array $orderBy = null)
 * @method Promotion[]    findAll()
 * @method Promotion[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class PromotionRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Promotion::class);
    }

    public function getMoyennesEpreuvesParPromoEtSpecialite(int $idPromotion, int $idSpecialite): array
    {
        $conn = $this->getEntityManager()->getConnection();

        $sql = '
        SELECT epreuve_id, avg(note) as note
        FROM epreuve
        LEFT JOIN note_epreuve on epreuve.id=note_epreuve.epreuve_id
        LEFT JOIN etudiant on etudiant.id=note_epreuve.etudiant_id
        where promotion_id= :idPromotion
        and etudiant.specialite_id= :idSpecialite
        group by epreuve_id';

        $stmt = $conn->prepare($sql);
        $resultSet = $stmt->executeQuery(['idPromotion' => $idPromotion, 'idSpecialite' => $idSpecialite]);

        // returns an array of arrays (i.e. a raw data set)
        return $resultSet->fetchAllAssociative();
       
    }

    public function getMoyennesEpreuvesParPromo(int $idPromotion): array
    {
        $conn = $this->getEntityManager()->getConnection();

        $sql = '
        SELECT epreuve_id, avg(note) as note
        FROM epreuve
        LEFT JOIN note_epreuve on epreuve.id=note_epreuve.epreuve_id
        LEFT JOIN etudiant on etudiant.id=note_epreuve.etudiant_id
        where promotion_id= :idPromotion
        group by epreuve_id';

        $stmt = $conn->prepare($sql);
        $resultSet = $stmt->executeQuery(['idPromotion' => $idPromotion]);

        // returns an array of arrays (i.e. a raw data set)
        return $resultSet->fetchAllAssociative();
       
    }
   
    //
    //  * @return Promotion[] Returns an array of Promotion objects
    //  */
    
    public function getAllEtudiantsTriesParSpeEtNom()
    {
           
            $entityManager = $this->getEntityManager();
    
            $query = $entityManager->createQuery(
                'SELECT p, e
                FROM App\Entity\Promotion p
                INNER JOIN p.etudiants e
                INNER JOIN e.specialite s
                ORDER BY p.id desc, s.id, e.nom');
                
            return $query->getResult();
    }


    // /**
    //  * @return Promotion[] Returns an array of Promotion objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('p.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Promotion
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
