<?php

namespace App\Form;

use App\Entity\NoteEpreuve;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;

class NoteEpreuveType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('note', NumberType::class, array('required' => false, 'label' => false))
            ->add('epreuve', EntityType::class, 
                    array(
                        'class' => 'App\Entity\epreuve',      
                         'choice_label' => function ($epreuve) {
                                return $epreuve->getCode() . ' : ' . $epreuve->getLibelle();},         
                        'label' => false,
                        'disabled' => true           
                    )
                );
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => NoteEpreuve::class,
        ]);
    }
}
