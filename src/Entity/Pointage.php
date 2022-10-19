<?php

namespace App\Entity;

use App\Repository\PointageRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=PointageRepository::class)
 */
class Pointage
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="date", nullable=true)
     */
    private $datePoint;

    /**
     * @ORM\Column(type="time", nullable=true)
     */
    private $heurePoint;

    /**
     * @ORM\Column(type="string", length=16, nullable=true)
     */
    private $ipPoint;

    /**
     * @ORM\ManyToOne(targetEntity=Stage::class, inversedBy="pointages")
     */
    private $stage;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getDatePoint(): ?\DateTimeInterface
    {
        return $this->datePoint;
    }

    public function setDatePoint(?\DateTimeInterface $datePoint): self
    {
        $this->datePoint = $datePoint;

        return $this;
    }

    public function getHeurePoint(): ?\DateTimeInterface
    {
        return $this->heurePoint;
    }

    public function setHeurePoint(?\DateTimeInterface $heurePoint): self
    {
        $this->heurePoint = $heurePoint;

        return $this;
    }

    public function getIpPoint(): ?string
    {
        return $this->ipPoint;
    }

    public function setIpPoint(?string $ipPoint): self
    {
        $this->ipPoint = $ipPoint;

        return $this;
    }

    public function getStage(): ?Stage
    {
        return $this->stage;
    }

    public function setStage(?Stage $stage): self
    {
        $this->stage = $stage;

        return $this;
    }
}
