<?php

namespace App\Entity;

use App\Repository\MachineRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: MachineRepository::class)]
#[ORM\Table(name: 'machine')]
class Machine
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $nom = null;

    #[ORM\Column(length: 100)]
    private ?string $marque = null;

    #[ORM\Column(length: 100)]
    private ?string $modele = null;

    #[ORM\Column(length: 50)]
    private ?string $secteur = null;

    #[ORM\Column(length: 100)]
    private ?string $categorie = null;

    #[ORM\Column(type: Types::DECIMAL, precision: 12, scale: 2)]
    private ?string $prixAchat = null;

    #[ORM\Column(type: Types::DECIMAL, precision: 10, scale: 2)]
    private ?string $prixLocation = null;

    #[ORM\Column(type: Types::DECIMAL, precision: 8, scale: 2, nullable: true)]
    private ?string $puissance = null;

    #[ORM\Column(length: 100, nullable: true)]
    private ?string $capacite = null;

    #[ORM\Column(length: 100, nullable: true)]
    private ?string $consommation = null;

    #[ORM\Column(type: Types::DECIMAL, precision: 10, scale: 2)]
    private ?string $coutEntretien = null;

    #[ORM\Column]
    private ?int $etat = 100;

    #[ORM\Column(type: Types::DECIMAL, precision: 5, scale: 2)]
    private ?string $usure = '0.00';

    #[ORM\Column]
    private ?int $productivite = 100;

    #[ORM\Column]
    private ?int $niveauRequis = 1;

    #[ORM\Column(type: Types::DATETIME_MUTABLE)]
    private ?\DateTimeInterface $createdAt = null;

    #[ORM\Column(type: Types::DATETIME_MUTABLE)]
    private ?\DateTimeInterface $updatedAt = null;

    public function __construct()
    {
        $this->createdAt = new \DateTime();
        $this->updatedAt = new \DateTime();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNom(): ?string
    {
        return $this->nom;
    }

    public function setNom(string $nom): static
    {
        $this->nom = $nom;
        return $this;
    }

    public function getMarque(): ?string
    {
        return $this->marque;
    }

    public function setMarque(string $marque): static
    {
        $this->marque = $marque;
        return $this;
    }

    public function getModele(): ?string
    {
        return $this->modele;
    }

    public function setModele(string $modele): static
    {
        $this->modele = $modele;
        return $this;
    }

    public function getSecteur(): ?string
    {
        return $this->secteur;
    }

    public function setSecteur(string $secteur): static
    {
        $this->secteur = $secteur;
        return $this;
    }

    public function getCategorie(): ?string
    {
        return $this->categorie;
    }

    public function setCategorie(string $categorie): static
    {
        $this->categorie = $categorie;
        return $this;
    }

    public function getPrixAchat(): ?string
    {
        return $this->prixAchat;
    }

    public function setPrixAchat(string $prixAchat): static
    {
        $this->prixAchat = $prixAchat;
        return $this;
    }

    public function getPrixLocation(): ?string
    {
        return $this->prixLocation;
    }

    public function setPrixLocation(string $prixLocation): static
    {
        $this->prixLocation = $prixLocation;
        return $this;
    }

    public function getPuissance(): ?string
    {
        return $this->puissance;
    }

    public function setPuissance(?string $puissance): static
    {
        $this->puissance = $puissance;
        return $this;
    }

    public function getCapacite(): ?string
    {
        return $this->capacite;
    }

    public function setCapacite(?string $capacite): static
    {
        $this->capacite = $capacite;
        return $this;
    }

    public function getConsommation(): ?string
    {
        return $this->consommation;
    }

    public function setConsommation(?string $consommation): static
    {
        $this->consommation = $consommation;
        return $this;
    }

    public function getCoutEntretien(): ?string
    {
        return $this->coutEntretien;
    }

    public function setCoutEntretien(string $coutEntretien): static
    {
        $this->coutEntretien = $coutEntretien;
        return $this;
    }

    public function getEtat(): ?int
    {
        return $this->etat;
    }

    public function setEtat(int $etat): static
    {
        $this->etat = $etat;
        return $this;
    }

    public function getUsure(): ?string
    {
        return $this->usure;
    }

    public function setUsure(string $usure): static
    {
        $this->usure = $usure;
        return $this;
    }

    public function getProductivite(): ?int
    {
        return $this->productivite;
    }

    public function setProductivite(int $productivite): static
    {
        $this->productivite = $productivite;
        return $this;
    }

    public function getNiveauRequis(): ?int
    {
        return $this->niveauRequis;
    }

    public function setNiveauRequis(int $niveauRequis): static
    {
        $this->niveauRequis = $niveauRequis;
        return $this;
    }

    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->createdAt;
    }

    public function setCreatedAt(\DateTimeInterface $createdAt): static
    {
        $this->createdAt = $createdAt;
        return $this;
    }

    public function getUpdatedAt(): ?\DateTimeInterface
    {
        return $this->updatedAt;
    }

    public function setUpdatedAt(\DateTimeInterface $updatedAt): static
    {
        $this->updatedAt = $updatedAt;
        return $this;
    }
}
