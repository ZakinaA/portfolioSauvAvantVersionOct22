//16/05/2022
ALTER TABLE rp ADD rp_enseignant_id INT DEFAULT NULL;
ALTER TABLE rp ADD CONSTRAINT FK_CD578B7289FC2AA FOREIGN KEY (rp_enseignant_id) REFERENCES enseignant (id);
CREATE INDEX IDX_CD578B7289FC2AA ON rp (rp_enseignant_id);
    



///DONE

CREATE TABLE pointage (id INT AUTO_INCREMENT NOT NULL, stage_id INT DEFAULT NULL, date_point DATE DEFAULT NULL, heure_point TIME DEFAULT NULL, ip_point VARCHAR(16) DEFAULT NULL, INDEX IDX_7591B202298D193 (stage_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB;
ALTER TABLE pointage ADD CONSTRAINT FK_7591B202298D193 FOREIGN KEY (stage_id) REFERENCES stage (id);



CREATE TABLE epreuve (id INT AUTO_INCREMENT NOT NULL, code VARCHAR(4) NOT NULL, libelle VARCHAR(75) NOT NULL, coef INT NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB;
ALTER TABLE epreuve ADD is_option TINYINT(1) DEFAULT NULL;
CREATE TABLE note_epreuve (id INT AUTO_INCREMENT NOT NULL, etudiant_id INT DEFAULT NULL, epreuve_id INT DEFAULT NULL, note DOUBLE PRECISION DEFAULT NULL, INDEX IDX_570B20E5DDEAB1A3 (etudiant_id), INDEX IDX_570B20E5AB990336 (epreuve_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB;
ALTER TABLE note_epreuve ADD CONSTRAINT FK_570B20E5DDEAB1A3 FOREIGN KEY (etudiant_id) REFERENCES etudiant (id);
ALTER TABLE note_epreuve ADD CONSTRAINT FK_570B20E5AB990336 FOREIGN KEY (epreuve_id) REFERENCES epreuve (id);
ALTER TABLE epreuve ADD libelle_court VARCHAR(20) DEFAULT NULL;


INSERT INTO `epreuve` (`id`, `code`, `libelle`, `coef`, `is_option`, `libelle_court`) VALUES
(1, 'E11', 'Culture générale et expression', 2, NULL, 'Cult.Gé.'),
(2, 'E12a', 'Expression et communication en langue anglaise - Ecrits', 1, NULL, 'Angl. écrit'),
(3, 'E12b', 'Expression et communication en langue anglaise - Oral', 1, NULL, 'Angl oral'),
(4, 'E2a', 'Mathématiques pour l’informatique - pratique', 1, NULL, 'Algo'),
(5, 'E2b', 'Mathématiques pour l’informatique - partie écrite', 2, NULL, 'Math'),
(6, 'E3', 'Culture économique, juridique et managériale pour l’informatique', 3, NULL, 'CEJMA'),
(7, 'E4', 'Support et mise à disposition de services informatiques', 4, NULL, 'Info Comm'),
(8, 'E5', 'Spécifique à l\'option', 4, NULL, 'Info pratique'),
(9, 'E6', 'Cybersécurité des services informatiques', 4, NULL, 'Info écrit'),
(10, 'EF1', 'Langue vivante 2', 1, 1, 'LV2'),
(11, 'EF2', 'Mathématiques approfondies', 1, 1, 'Math appro.'),
(12, 'EF3', 'Parcours de certification complémentaire', 1, 1, 'Certif');
COMMIT;