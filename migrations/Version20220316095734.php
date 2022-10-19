<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220316095734 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE promotion DROP admis, CHANGE admis_sisr admis_sisr INT DEFAULT NULL, CHANGE admis_slam admis_slam INT DEFAULT NULL');
        $this->addSql('ALTER TABLE stage CHANGE duree duree INT NOT NULL');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE promotion ADD admis DOUBLE PRECISION DEFAULT NULL, CHANGE admis_sisr admis_sisr DOUBLE PRECISION DEFAULT NULL, CHANGE admis_slam admis_slam DOUBLE PRECISION DEFAULT NULL');
        $this->addSql('ALTER TABLE stage CHANGE duree duree VARCHAR(15) NOT NULL');
    }
}
