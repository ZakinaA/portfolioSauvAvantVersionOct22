<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220331111334 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE rp ADD rp_enseignant_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE rp ADD CONSTRAINT FK_CD578B7289FC2AA FOREIGN KEY (rp_enseignant_id) REFERENCES enseignant (id)');
        $this->addSql('CREATE INDEX IDX_CD578B7289FC2AA ON rp (rp_enseignant_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE rp DROP FOREIGN KEY FK_CD578B7289FC2AA');
        $this->addSql('DROP INDEX IDX_CD578B7289FC2AA ON rp');
        $this->addSql('ALTER TABLE rp DROP rp_enseignant_id');
    }
}
