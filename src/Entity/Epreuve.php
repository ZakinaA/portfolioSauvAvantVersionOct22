<?php

namespace App\Entity;

use App\Repository\EpreuveRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=EpreuveRepository::class)
 */
class Epreuve
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=4)
     */
    private $code;

    /**
     * @ORM\Column(type="string", length=75)
     */
    private $libelle;

    /**
     * @ORM\Column(type="integer")
     */
    private $coef;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $isOption;

    /**
     * @ORM\OneToMany(targetEntity=NoteEpreuve::class, mappedBy="epreuve")
     */
    private $noteEpreuves;

    /**
     * @ORM\Column(type="string", length=20, nullable=true)
     */
    private $libelleCourt;

    public function __construct()
    {
        $this->noteEpreuves = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getCode(): ?string
    {
        return $this->code;
    }

    public function setCode(string $code): self
    {
        $this->code = $code;

        return $this;
    }

    public function getLibelle(): ?string
    {
        return $this->libelle;
    }

    public function setLibelle(string $libelle): self
    {
        $this->libelle = $libelle;

        return $this;
    }

    public function getCoef(): ?int
    {
        return $this->coef;
    }

    public function setCoef(int $coef): self
    {
        $this->coef = $coef;

        return $this;
    }

    public function getIsOption(): ?bool
    {
        return $this->isOption;
    }

    public function setIsOption(?bool $isOption): self
    {
        $this->isOption = $isOption;

        return $this;
    }

    /**
     * @return Collection<int, NoteEpreuve>
     */
    public function getNoteEpreuves(): Collection
    {
        return $this->noteEpreuves;
    }

    public function addNoteEpreufe(NoteEpreuve $noteEpreufe): self
    {
        if (!$this->noteEpreuves->contains($noteEpreufe)) {
            $this->noteEpreuves[] = $noteEpreufe;
            $noteEpreufe->setEpreuve($this);
        }

        return $this;
    }

    public function removeNoteEpreufe(NoteEpreuve $noteEpreufe): self
    {
        if ($this->noteEpreuves->removeElement($noteEpreufe)) {
            // set the owning side to null (unless already changed)
            if ($noteEpreufe->getEpreuve() === $this) {
                $noteEpreufe->setEpreuve(null);
            }
        }

        return $this;
    }

    public function getLibelleCourt(): ?string
    {
        return $this->libelleCourt;
    }

    public function setLibelleCourt(?string $libelleCourt): self
    {
        $this->libelleCourt = $libelleCourt;

        return $this;
    }
}
