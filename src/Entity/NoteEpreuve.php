<?php

namespace App\Entity;

use App\Repository\NoteEpreuveRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=NoteEpreuveRepository::class)
 */
class NoteEpreuve
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="float", nullable=true)
     */
    private $note;

    /**
     * @ORM\ManyToOne(targetEntity=Etudiant::class, inversedBy="noteEpreuves", cascade={"persist"})
     */
    private $etudiant;

    /**
     * @ORM\ManyToOne(targetEntity=Epreuve::class, inversedBy="noteEpreuves", cascade={"persist"})
     */
    private $epreuve;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNote(): ?float
    {
        return $this->note;
    }

    public function setNote(?float $note): self
    {
        $this->note = $note;

        return $this;
    }

    public function getEtudiant(): ?Etudiant
    {
        return $this->etudiant;
    }

    public function setEtudiant(?Etudiant $etudiant): self
    {
        $this->etudiant = $etudiant;

        return $this;
    }

    public function getEpreuve(): ?Epreuve
    {
        return $this->epreuve;
    }

    public function setEpreuve(?Epreuve $epreuve): self
    {
        $this->epreuve = $epreuve;

        return $this;
    }
}
