<?php

namespace App\Form;

use App\Entity\Etudiant;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;

class EtudiantNotesType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder->add('noteEpreuves', CollectionType::class, [
            'entry_type' => NoteEpreuveType::class,
            'entry_options' => ['label' => false],
        ]);
        
        $builder
            /*->add('nom')
            ->add('prenom')
            ->add('dateNaiss')
            ->add('mobile')
            ->add('sexe')
            ->add('numRue')
            ->add('rue')
            ->add('copos')
            ->add('ville')
            ->add('cheminPhoto')
            ->add('promotion')
            ->add('niveau')
            ->add('specialite')*/
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Etudiant::class,
        ]);
    }
}
