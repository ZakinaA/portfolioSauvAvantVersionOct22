-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : lun. 14 mars 2022 à 09:43
-- Version du serveur : 8.0.25
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `portfolio`
--

-- --------------------------------------------------------

--
-- Structure de la table `activite`
--

CREATE TABLE `activite` (
  `id` int NOT NULL,
  `bloc_id` int NOT NULL,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `libelle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `activite`
--

INSERT INTO `activite` (`id`, `bloc_id`, `code`, `libelle`) VALUES
(1, 1, 'B1.1', 'Gestion du patrimoine informatique'),
(2, 1, 'B1.2', 'Réponse aux incidents et aux demandes d\'assistance et d\'évolution'),
(3, 1, 'B1.3', 'Développement de la présence en ligne de l\'organisation'),
(4, 1, 'B1.4', 'Travail en mode projet'),
(5, 1, 'B1.5', 'Mise à disposition des utilisateurs d\'un service informatique'),
(6, 1, 'B1.6', 'Organisation de son développement professionnel'),
(7, 2, 'B2.1SISR', 'Conception d\'une solution d\'infrastructure'),
(8, 2, 'B2.2SISR', 'Installation, test et déploiement d\'une solution d\'infrastructure réseau'),
(9, 2, 'B2.3SISR', 'Exploitation, dépannage et supervision d\'une solution d\'infrastructure réseau'),
(10, 3, 'B2.1SLAM', 'Conception et développement d\'une solution applicative'),
(11, 3, 'B2.2SLAM', 'Maintenance corrective ou évolutive d\'une solution applicative'),
(12, 3, 'B2.3SLAM', 'Gestion des données'),
(13, 4, 'B3.1', 'Protection des données à caractère personnel'),
(14, 4, 'B3.2', 'Préservation de l\'identité numérique de l\'organisation'),
(15, 4, 'B3.3', 'Sécurisation des équipements et des usages des utilisateurs '),
(16, 4, 'B3.4', 'Garantie de la disponibilité, de l\'intégrité et de la confidentialité des services informatiques et des données de l\'organisation face à des cyberattaques'),
(17, 4, 'B3.5SISR', 'Cybersécurisation d\'une infrastructure réseau, d\'un système, d\'un service'),
(18, 4, 'B3.5SLAM', 'Cybersécurisation d\'une solution applicative et de son développement');

-- --------------------------------------------------------

--
-- Structure de la table `bloc`
--

CREATE TABLE `bloc` (
  `id` int NOT NULL,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `libelle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `bloc`
--

INSERT INTO `bloc` (`id`, `code`, `libelle`) VALUES
(1, 'B1', 'Support et mise à disposition de services informatiques'),
(2, 'B2A', 'SISR : Administration des systèmes et des réseaux'),
(3, 'B2B', 'SLAM : Conception et développement d’applications'),
(4, 'B3', 'Cybersécurité des services informatiques');

-- --------------------------------------------------------

--
-- Structure de la table `cadre`
--

CREATE TABLE `cadre` (
  `id` int NOT NULL,
  `libelle` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cadre`
--

INSERT INTO `cadre` (`id`, `libelle`) VALUES
(1, 'Équipe'),
(2, 'Seul');

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE `commentaire` (
  `id` int NOT NULL,
  `enseignant_id` int DEFAULT NULL,
  `rp_id` int NOT NULL,
  `commentaire` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_commentaire` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commentaire`
--

INSERT INTO `commentaire` (`id`, `enseignant_id`, `rp_id`, `commentaire`, `date_commentaire`) VALUES
(13, 7, 19, 'préciser le langage', '2022-02-21'),
(14, 7, 23, 'du français à revoir', '2022-02-28'),
(15, 7, 31, 'inventaire des vlan relève de B1.2', '2022-03-01'),
(16, 12, 69, 'La RP est bien construite, il faut simplement modifier le titre pour faire apparaitre la notion de scripting. Ajouter par exemple : \'à l\'aide d\'un script\'', '2022-03-07'),
(17, 12, 68, 'Le besoin est mal exprimé, tu indiques le libellé d\'une activité, il faut être plus précis sur l\'objectif de ta RP.\r\nTu mentionnes l\'activité B2.2 pour l\'intégration d\'une machine et ce n\'est pas l\'objet de ta réalisation.\r\nLe notion d\'automatisation est du B2.3\r\nTa production est trop succincte, il faut plus rédiger.', '2022-03-07');

-- --------------------------------------------------------

--
-- Structure de la table `competence`
--

CREATE TABLE `competence` (
  `id` int NOT NULL,
  `activite_id` int NOT NULL,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `libelle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `competence`
--

INSERT INTO `competence` (`id`, `activite_id`, `code`, `libelle`) VALUES
(1, 1, 'C1.1.1', 'Recensement et identification des ressources numériques'),
(2, 1, 'C1.1.2', 'Exploitation des référentiels, normes et standards adoptés par le prestataire informatique'),
(3, 1, 'C1.1.3', 'Mise en place et vérification des niveaux d\'habilitation associés à un service'),
(4, 1, 'C1.1.4', 'Vérification des conditions de la continuité d\'un service informatique'),
(5, 1, 'C1.1.5', 'Gestion des sauvegardes'),
(6, 1, 'C1.1.6', 'Vérification du respect des règles d\'utilisation des ressources numériques'),
(7, 2, 'C1.2.1', 'Collecte, suivi et orientation des demandes'),
(8, 2, 'C1.2.2', 'Traitement des demandes concernant les applicatifs, services réseau et système'),
(9, 2, 'C1.2.3', 'Traitement des demandes concernant les applications'),
(10, 3, 'C1.3.1', 'Participation à la valorisation de l\'image de l\'organisation sur les médias numériques en tenant compte du cadre juridique et des enjeux économiques'),
(11, 3, 'C1.3.2', 'Référencement des services en ligne de l\'organisation et mesure de leur visibilité'),
(12, 3, 'C1.3.4', 'Participation à l\'évolution d\'un site Web exploitant les données de l\'organisation'),
(13, 4, 'C1.4.1', 'Analyse des objectifs et des modalités d\'organisation d\'un projet'),
(14, 4, 'C1.4.2', 'Planification des activités'),
(15, 5, 'C1.5.1', 'Test d\'intégration et d\'acceptation d\'un service'),
(16, 5, 'C1.5.2', 'Déploiement d\'un service'),
(17, 5, 'C1.5.3', 'Accompagnement des utilisateurs dansla mise en place d\'un service'),
(18, 6, 'C1.6.1', 'Mise en place de son environnement d\'apprentissage personnel'),
(19, 6, 'C1.6.2', 'Mise en œuvre d\'outils et de stratégie veille informationnelle'),
(20, 6, 'C1.6.3', 'Gestion de son identité professionnelle'),
(21, 7, 'C2.1.1R', 'Analyse d\'un besoin exprimé et de son contexte juridique'),
(22, 7, 'C2.1.2R', 'Étude de l\'impact d\'une évolution d\'un élément d\'infrastructure sur le système informatique'),
(23, 7, 'C2.1.3R', 'Élaboration d\'un dossier de choix d\'une solution d\'infrastructure et rédaction des spécifications techniques'),
(24, 7, 'C2.1.4R', 'Choix des éléments nécessaires pour assurer la qualité et la disponibilité d\'un service'),
(25, 7, 'C2.1.5R', 'Maquettage et prototypage d\'une solution d\'infrastructure permettant d\'atteindre la qualité de service attendue'),
(26, 7, 'C2.1.6R', 'Détermination et préparation des tests nécessaires à la validation de la solution d\'infrastructure retenue'),
(27, 8, 'C2.2.1R', 'Installation et configuration d\'éléments d\'infrastructure'),
(28, 8, 'C2.2.2R', 'Installation et configuration des éléments nécessaires pour assurer la continuité des services'),
(29, 8, 'C2.2.3R', 'Installation et configuration des éléments nécessaires pour assurer la qualité de service(QoS)'),
(30, 8, 'C2.2.4R', 'Rédaction ou mise à jour de la documentation technique et utilisateur d\'une solution d\'infrastructure'),
(31, 8, 'C2.2.5R', 'Test d\'intégration et d\'acceptation d\'une solution d\'infrastructure'),
(32, 8, 'C2.2.6R', 'Déploiement d\'une solution d\'infrastructure'),
(33, 9, 'C2.3.1R', 'Administration sur site et à distance des éléments d\'une infrastructure'),
(34, 9, 'C2.3.2R', 'Automatisation des tâches d\'administration'),
(35, 9, 'C2.3.3R', 'Gestion des indicateurs et des fichiers d\'activité des éléments d\'une infrastructure'),
(36, 9, 'C2.3.4R', 'Identification, qualification, évaluation et réaction face à un incident ou à un problème'),
(37, 9, 'C2.3.5R', 'Évaluation, maintien et amélioration de la qualité d\'un service'),
(38, 10, 'C2.1.1D', 'Analyse d\'un besoin exprimé et de son contexte juridique'),
(39, 10, 'C2.1.2D', 'Participation à la conception de l\'architecture d\'une solution applicative'),
(40, 10, 'C2.1.3D', 'Modélisation d\'une solution applicative'),
(41, 10, 'C2.1.4D', 'Exploitation des ressources du cadre applicatif(framework)'),
(42, 10, 'C2.1.5D', 'Identification, développement, utilisation ou adaptation de composants logiciels'),
(43, 10, 'C2.1.6D', 'Exploitation des technologies Web et mobile pour mettre en œuvre les échanges entre applications'),
(44, 10, 'C2.1.7D', 'Utilisation de composants d\'accès aux données'),
(45, 10, 'C2.1.8D', 'Intégration continue des versions d\'une solution applicative'),
(46, 10, 'C2.1.9D', 'Réalisation des tests nécessaires à la validation ou à la mise en production d\'éléments adaptés ou développés'),
(47, 10, 'C2.1.10D', 'Rédaction des documentations technique et d\'utilisation d\'une solution applicative'),
(48, 10, 'C2.1.11D', 'Exploitation des fonctionnalités d\'un environnement de développement et de tests'),
(49, 11, 'C2.2.1D', 'Évaluation de la qualité d\'une solution applicative'),
(50, 11, 'C2.2.2D', 'Recueil, analyse et mise à jour d\'informations sur une version d\'une solution applicative'),
(51, 11, 'C2.2.3D', 'Analyse et correction d\'un dysfonctionnement'),
(52, 11, 'C2.2.4D', 'Mise à jour de documentations technique et d\'utilisation d\'une solution applicative'),
(53, 11, 'C2.2.5D', 'Élaboration et réalisation de tests des éléments mis à jour'),
(54, 12, 'C2.3.1D', 'Exploitation de données à l\'aide d\'un langage de requêtes'),
(55, 12, 'C2.3.2D', 'Développement de fonctionnalités applicatives au sein d\'un SGBD'),
(56, 12, 'C2.3.3D', 'Conception ou adaptation d\'une base de données'),
(57, 12, 'C2.3.4D', 'Administration et déploiement d\'une base de données'),
(58, 13, 'C3.1.1', 'Recensement des traitements sur les données à caractère personnel au sein de l\'organisation'),
(59, 13, 'C3.1.2', 'Identification des risques liés à la collecte, au traitement, au stockage et à la diffusion des données à caractère personne'),
(60, 13, 'C3.1.3', 'Application de la réglementation en matière de collecte, de traitement et de conservation des données à caractère personnel'),
(61, 13, 'C3.1.4', 'Sensibilisation des utilisateurs à la protection des données à caractère personnel '),
(62, 14, 'C3.2.1', 'Protection de l\'identité numérique d\'une organisation'),
(63, 14, 'C3.2.2', 'Déploiement de moyens appropriés de preuve électronique'),
(64, 15, 'C3.3.1', 'Information des utilisateurs sur les risques associés à l\'utilisation d\'une ressource numérique et promotion des bons usages à adopter'),
(65, 15, 'C3.3.2', 'Identification des menaces et mise en œuvre des défenses appropriées'),
(66, 15, 'C3.3.3', 'Gestion des accès et des privilèges appropriés'),
(67, 15, 'C3.3.4', 'Vérification de l\'efficacité de la protection'),
(68, 16, 'C3.4.1', 'Caractérisation des risques liés à l\'utilisation malveillante d\'un service informatique'),
(69, 16, 'C3.4.2', 'Recensement des conséquences d\'une perte de disponibilité, d\'intégrité ou de confidentialité'),
(70, 16, 'C3.4.3', 'Identification des obligations légales qui s\'imposent en matière d\'archivage et de protection des données de l\'organisation'),
(71, 16, 'C3.4.4', 'Organisation de la collecte et de la conservation de la preuve électronique'),
(72, 16, 'C3.4.5', 'Application des procédures garantissant le respect des obligations légales'),
(73, 17, 'C3.5.1R', 'Vérification des éléments contribuant à la sûreté d\'une infrastructure informatique'),
(74, 17, 'C3.5.2R', 'Prise en compte de la sécurité dans un projet de mise en œuvre d\'une solution dinfrastructure'),
(75, 17, 'C3.5.3R', 'Mise en œuvre et vérification de la conformité d\'une infrastructure à un référentiel, une norme ou un standard participant à la sécurité'),
(76, 17, 'C3.5.4R', 'Prévention des attaques'),
(77, 17, 'C3.5.5R', 'Détection des actions malveillantes'),
(78, 17, 'C3.5.6R', 'Analyse d\'incidents de sécurité, proposition et mise en œuvrede contre-mesures'),
(79, 18, 'C3.5.1D', 'Vérification des éléments contribuant à la qualité d\'un développement informatique'),
(80, 18, 'C3.5.2D', 'Prise en compte de la sécurité dans un projet de développement d\'une solution applicative'),
(81, 18, 'C3.5.3D', 'Mise en œuvre et vérification de la conformité d\'une solution applicative et de son développement à un référentiel, une norme ou un standard de sécurité'),
(82, 18, 'C3.5.4D', 'Prévention des attaques'),
(83, 18, 'C3.5.5D', 'Analyse des connexions (logs)'),
(84, 18, 'C3.5.6D', 'Analyse d\'incidents de sécurité, proposition et mise en œuvre de contre-mesures');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210519150430', '2021-05-19 15:04:52', 465),
('DoctrineMigrations\\Version20210519163823', '2021-05-19 16:38:35', 72),
('DoctrineMigrations\\Version20210520115935', '2021-05-20 11:59:51', 538),
('DoctrineMigrations\\Version20210520130535', '2021-05-20 13:05:40', 73),
('DoctrineMigrations\\Version20210521161236', '2021-05-21 16:12:45', 322),
('DoctrineMigrations\\Version20210521161736', '2021-05-21 16:17:41', 426),
('DoctrineMigrations\\Version20210521163108', '2021-05-21 16:31:16', 399),
('DoctrineMigrations\\Version20210522113230', '2021-05-22 11:32:41', 192),
('DoctrineMigrations\\Version20210522114911', '2021-05-22 11:49:19', 172),
('DoctrineMigrations\\Version20210522130121', '2021-05-22 13:01:26', 145),
('DoctrineMigrations\\Version20210525172058', '2021-05-25 17:21:18', 147),
('DoctrineMigrations\\Version20210525194327', '2021-05-25 19:43:41', 1537),
('DoctrineMigrations\\Version20210525200943', '2021-05-25 20:09:50', 225),
('DoctrineMigrations\\Version20210528133401', '2021-05-28 13:34:43', 296),
('DoctrineMigrations\\Version20210602204005', '2021-06-02 20:40:13', 319),
('DoctrineMigrations\\Version20210602210138', '2021-06-02 21:01:50', 256),
('DoctrineMigrations\\Version20210603112735', '2021-06-03 11:27:40', 225),
('DoctrineMigrations\\Version20210603121008', '2021-06-03 12:10:15', 142),
('DoctrineMigrations\\Version20210603122113', '2021-06-03 12:22:50', 202),
('DoctrineMigrations\\Version20210603122302', '2021-06-03 12:23:12', 138),
('DoctrineMigrations\\Version20210603134647', '2021-06-03 13:46:56', 144),
('DoctrineMigrations\\Version20210909114252', '2021-09-09 11:43:19', 331),
('DoctrineMigrations\\Version20210913121428', '2021-09-13 12:14:38', 204),
('DoctrineMigrations\\Version20210916133814', '2021-09-16 13:40:21', 247),
('DoctrineMigrations\\Version20210916141406', '2021-09-16 14:14:13', 351),
('DoctrineMigrations\\Version20210916144734', '2021-09-16 14:47:45', 148),
('DoctrineMigrations\\Version20210916162816', '2021-09-16 16:28:27', 191),
('DoctrineMigrations\\Version20210922090949', '2021-09-22 09:10:03', 167);

-- --------------------------------------------------------

--
-- Structure de la table `domaine_tache`
--

CREATE TABLE `domaine_tache` (
  `id` int NOT NULL,
  `libelle` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `domaine_tache`
--

INSERT INTO `domaine_tache` (`id`, `libelle`) VALUES
(1, 'Administration'),
(2, 'Analyse du besoin'),
(3, 'Auto-formation, suivre une formation'),
(4, 'Automatisation de t&acirc;che'),
(5, 'Base de données'),
(6, 'Configuration'),
(7, 'Déploiement'),
(8, 'Développement'),
(9, 'Documentation'),
(10, 'Exploitation'),
(11, 'Formation utilisateurs'),
(12, 'Gestion de parc'),
(13, 'Gestion de projet'),
(14, 'Help-Desk / Support'),
(15, 'Installation'),
(16, 'Interface'),
(17, 'Inventaire'),
(18, 'Mise au point'),
(19, 'Matériel'),
(20, 'Migration'),
(21, 'Maintenance'),
(22, 'Modélisation'),
(23, 'Observation'),
(24, 'Planification '),
(25, 'Recherche d\'informations'),
(26, 'Réunion, concertation, conférence'),
(27, 'Sauvegarde, restauration'),
(28, 'Sécurisation'),
(29, 'Tests, démarche de tests'),
(30, 'Gestion des utilisateurs'),
(31, 'Validation');

-- --------------------------------------------------------

--
-- Structure de la table `enseignant`
--

CREATE TABLE `enseignant` (
  `id` int NOT NULL,
  `nom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `matiere_id` int DEFAULT NULL,
  `niveau_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `enseignant`
--

INSERT INTO `enseignant` (`id`, `nom`, `prenom`, `matiere_id`, `niveau_id`) VALUES
(7, 'ANNOUCHE', 'Zakina', 1, 2),
(8, 'GUERINET', 'Serge', 1, 3),
(9, 'CATROS', 'Anne', 2, 3),
(10, 'DUPONT', 'Thomas', 2, 3),
(11, 'BLIMER', 'Marie', 4, 1),
(12, 'MAILHE', 'Patrick', 1, 3),
(13, 'VIGOT', 'Anne-Marie', 1, 3),
(14, 'NGO', 'Paul', 1, 3),
(15, 'GUERINET', 'Serge', 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `epreuve`
--

CREATE TABLE `epreuve` (
  `id` int NOT NULL,
  `code` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `libelle` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coef` int NOT NULL,
  `is_option` tinyint(1) DEFAULT NULL,
  `libelle_court` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `epreuve`
--

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

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `id` int NOT NULL,
  `promotion_id` int DEFAULT NULL,
  `niveau_id` int DEFAULT NULL,
  `specialite_id` int DEFAULT NULL,
  `nom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_naiss` date DEFAULT NULL,
  `mobile` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sexe` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_rue` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rue` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copos` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ville` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chemin_photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`id`, `promotion_id`, `niveau_id`, `specialite_id`, `nom`, `prenom`, `date_naiss`, `mobile`, `sexe`, `num_rue`, `rue`, `copos`, `ville`, `chemin_photo`) VALUES
(53, 1, 2, 2, 'ANNOUCHE', 'Zakina', '1995-07-21', NULL, NULL, NULL, 'rue des lilaspp', '14123', 'IFS', NULL),
(54, 1, 2, 2, 'CAUVIN', 'Nayah', '1992-09-05', NULL, NULL, NULL, 'impasse du Clos Chaumont', '14123', 'IFS', NULL),
(64, 1, 2, 1, 'ROSTAND', 'Zakina', '2021-05-20', NULL, NULL, NULL, 'de rostand', NULL, NULL, NULL),
(68, 1, 2, 1, 'GUERINET', 'Serge', '1968-06-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(89, 2, 1, 2, 'ETUSIO1', 'Matteo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(90, 2, 1, 1, 'UNSISR', 'Xigam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(91, 2, 1, 1, 'TASSERIT', 'Nicolas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(92, 2, 1, 1, 'PONGANNE', 'Valentin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(93, 2, 1, 1, 'BICHEREL', 'Hugo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(94, 2, 1, 1, 'ANSRI', 'Hicham', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(95, 2, 1, 1, 'TRSEK', 'edouard', '1980-01-01', NULL, NULL, NULL, 'aa', '13445', 'kjhjk', NULL),
(96, 2, 1, 1, 'BALTA', 'Rafet-Eren', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(97, 2, 1, 1, 'MUKENGESHAYI', 'Seth', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(98, 2, 1, 1, 'MARATON', 'Loïs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(99, 2, 1, 1, 'CADIC', 'julien', '2002-12-21', NULL, NULL, NULL, '88 rue du centre', '14840', 'Démouville', NULL),
(100, 2, 1, 1, 'THELLIER', 'Enzo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(101, 2, 1, 1, 'LOYER', 'Théo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(102, 2, 1, 1, 'LECHEMINANT', 'Joffrey', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(103, 2, 1, 1, 'MAUDUIT', 'Nathan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(104, 2, 1, 1, 'RAMBAUD', 'Lucas', '1998-07-03', NULL, NULL, NULL, '8A Rue Calmette', '14120', 'Mondeville', NULL),
(105, 2, 1, 1, 'LEVIAUTRE', 'Bastien', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(106, 2, 1, 1, 'ROSEL', 'Rémi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(108, 2, 1, 1, 'TEST', 'test', '2000-12-10', NULL, NULL, NULL, '2', '14000', 'Caen', NULL),
(109, 2, 1, 1, 'DEAL', 'Alexandre', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(110, 2, 1, 2, 'GUILBERT', 'Thomas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(111, 2, 1, 2, 'THOMAS', 'VER EECKE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(112, 2, 1, 2, 'CAHAIGNE', 'Nathan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(113, 2, 1, 2, 'LEM.', 'Julien', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(114, 2, 1, 2, 'LAURENT', 'Charlotte', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(115, 2, 1, 2, 'LELIèVRE', 'Théo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(116, 2, 1, 2, 'EL MUSAUI', 'Ouael', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(117, 2, 1, 2, 'HANG', 'Thomas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(118, 2, 1, 2, 'HERMAN', 'Louis', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(119, 2, 1, 2, 'DJAE', 'Ardelaide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(120, 2, 1, 2, 'MARTIN', 'guillaume', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(121, 2, 1, 2, 'LEMARIE', 'Valentin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(122, 2, 1, 2, 'LOISEAU', 'Benjamin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(123, 2, 1, 2, 'FARIETTI', 'Arthur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(124, 2, 1, 1, 'TRSEK', 'Edouard', '1999-03-12', NULL, NULL, NULL, 'rue', '29000', 'SAINT POL DE LEON', NULL),
(125, 1, 2, 2, 'GARBACIAK', 'Robin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(126, 1, 2, 2, 'BOULIN', 'Loan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(127, 1, 2, 2, 'MALLE', 'Kevin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(128, 1, 2, 2, 'EVRIN', 'Ludovic', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(129, 1, 2, 2, 'CHARON', 'Alexy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(130, 1, 2, 2, 'LAîNé', 'Valentin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(131, 1, 2, 2, 'LETONNELIER', 'Donatien', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(132, 1, 2, 2, 'RENAULT', 'Victor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(133, 1, 2, 2, 'DEPOILLY', 'Antonin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(134, 1, 2, 2, 'EL HANKOURI', 'Amine', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(135, 1, 2, 2, 'AUMOND', 'Dylan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(136, 1, 2, 2, 'ROUSSEAU', 'Florian', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(137, 1, 2, 1, 'LEROY', 'Alexandre', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(138, 1, 2, 1, 'CAYET', 'Néo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(139, 1, 2, 1, 'LEBOUTEILLER', 'Fabien', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(140, 1, 2, 2, 'CHAILLOU', 'Matisse', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(141, 1, 2, 2, 'GORRIS', 'Mattéo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(142, 1, 2, 1, 'CHOUROT', 'Bastian', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(143, 1, 2, 2, 'BELLEGUEILLE', 'Maxime', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(144, 1, 2, 1, 'KOZICK', 'Dorian', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `jour`
--

CREATE TABLE `jour` (
  `id` int NOT NULL,
  `code` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `jour`
--

INSERT INTO `jour` (`id`, `code`, `nom`) VALUES
(1, 'Lu', 'Lundi'),
(2, 'Ma', 'Mardi'),
(3, 'Me', 'Mercredi'),
(4, 'Je', 'Jeudi'),
(5, 'Ve', 'Vendredi'),
(6, 'Sa', 'Samedi');

-- --------------------------------------------------------

--
-- Structure de la table `localisation`
--

CREATE TABLE `localisation` (
  `id` int NOT NULL,
  `libelle` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `localisation`
--

INSERT INTO `localisation` (`id`, `libelle`) VALUES
(1, 'Centre de formation'),
(2, 'Organisation');

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

CREATE TABLE `matiere` (
  `id` int NOT NULL,
  `code` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `libelle` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `matiere`
--

INSERT INTO `matiere` (`id`, `code`, `libelle`) VALUES
(1, 'MTI', 'Méthodes et techniques informatiques'),
(2, 'CEJM', 'Culture économique, juridique et managériale'),
(3, 'JUR', 'Juridique'),
(4, 'ANG', 'Anglais'),
(5, 'MAT', 'Mathématiques'),
(6, 'EFR', 'Culture Générale et expression');

-- --------------------------------------------------------

--
-- Structure de la table `niveau`
--

CREATE TABLE `niveau` (
  `id` int NOT NULL,
  `nom` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_long` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `niveau`
--

INSERT INTO `niveau` (`id`, `nom`, `nom_long`) VALUES
(1, 'SIO1', '1ère année'),
(2, 'SIO2', '2ème année'),
(3, 'NONE', '1ère année et 2ème année');

-- --------------------------------------------------------

--
-- Structure de la table `niveau_rp`
--

CREATE TABLE `niveau_rp` (
  `id` int NOT NULL,
  `libelle` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `niveau_rp`
--

INSERT INTO `niveau_rp` (`id`, `libelle`) VALUES
(1, 'Observé'),
(2, 'Mis en oeuvre'),
(3, 'Pratiqué'),
(4, 'Maîtrisé'),
(5, 'Expert');

-- --------------------------------------------------------

--
-- Structure de la table `note_epreuve`
--

CREATE TABLE `note_epreuve` (
  `id` int NOT NULL,
  `etudiant_id` int DEFAULT NULL,
  `epreuve_id` int DEFAULT NULL,
  `note` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `note_epreuve`
--

INSERT INTO `note_epreuve` (`id`, `etudiant_id`, `epreuve_id`, `note`) VALUES
(1, 90, 1, 10),
(2, 90, 2, 10),
(3, 90, 3, 10),
(4, 90, 4, 10),
(5, 90, 5, 10),
(6, 90, 6, 10),
(7, 90, 7, 10),
(8, 90, 8, 10),
(9, 90, 9, 10),
(10, 90, 10, NULL),
(11, 90, 11, 12),
(12, 90, 12, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `pointage`
--

CREATE TABLE `pointage` (
  `id` int NOT NULL,
  `stage_id` int DEFAULT NULL,
  `date_point` date DEFAULT NULL,
  `heure_point` time DEFAULT NULL,
  `ip_point` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pointage`
--

INSERT INTO `pointage` (`id`, `stage_id`, `date_point`, `heure_point`, `ip_point`) VALUES
(1, 11, '2022-03-13', '17:14:19', '10.12.0.26'),
(2, 11, '2022-03-13', '17:14:22', '10.12.0.26');

-- --------------------------------------------------------

--
-- Structure de la table `production`
--

CREATE TABLE `production` (
  `id` int NOT NULL,
  `rp_id` int DEFAULT NULL,
  `designation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `production`
--

INSERT INTO `production` (`id`, `rp_id`, `designation`, `url`) VALUES
(6, 20, 'schéma du réseau', NULL),
(10, 23, 'Tableau de test', 'NAS/ETUDIANTS/TEST/tableauTestAppli.odt'),
(11, 23, 'arborescence de l\'application', '/NAS'),
(12, 46, 'Tableau disponible sur Trello', 'https://trello.com/invite/b/WiOIpnyt/81e9843c063e6ebd1132c16289bc67e6/cmse4'),
(13, 49, 'Répartition des tâches \"Trello\"', 'https://trello.com/invite/b/unmX9hN9/3d866290ecf2680c95a9aec3f091bd40/btssioadp'),
(14, 46, 'Compte-rendu du projet', 'https://docs.google.com/document/d/1wA3aIbJJuTHsG1gXJBCufkoVKcNNAkboJsw6ZpjmCis/edit?usp=sharing'),
(15, 49, 'Compte rendu du projet', 'https://drive.google.com/file/d/1QAkKTVyk0dKbn35PYl_J18D-u8uoDfd2/view?usp=sharing'),
(16, 67, 'Intégration d\'utilisateur dans un domaine via script PowerShell et un fichier CSV', 'https://docs.google.com/document/d/1YBjnL6vlB5To1G4BbQ9VDWlB9MTu4OrrzmJo1VzygTc/edit'),
(17, 68, 'Intégration d\'utilisateur dans un domaine via script CSV ainsi que sur PowerShell ISE', 'https://docs.google.com/document/d/1YBjnL6vlB5To1G4BbQ9VDWlB9MTu4OrrzmJo1VzygTc/edit'),
(18, 69, 'Script PowerShell - Contexte SIOPUB', 'http://cloud.sio.bts/index.php/s/LeQZTnCLRXwGi7D'),
(19, 82, 'BLOC 2 – SISR TP02 - Déploiement d’une gestion de parc - PONGANNE_VALENTIN ROSEL_RÉMI', 'https://docs.google.com/document/d/1MiOmWR4pV_BWIpqMzqdySdEFRawesCp469BVRJ7wNNk/edit'),
(20, 79, 'B2-SISR-TP02', 'test'),
(21, 97, 'Production réalisé sur l\'installation du serveur DHCP et les différente manipulation réalisé', 'https://docs.google.com/document/d/1dRX2fPSBFECorhFtD2owboy-XgWITgpjeI0UBzr_ZmI/edit'),
(22, 92, 'Installation et configuration d\'un service DHCP', 'https://docs.google.com/document/d/1dRX2fPSBFECorhFtD2owboy-XgWITgpjeI0UBzr_ZmI/edit?usp=sharing'),
(23, 102, 'Google Docs', 'https://docs.google.com/document/d/1F4ah54DAmqEOfl89vBsN0X39dwRA8ww9HjB06p3p-Fg/edit?usp=sharing'),
(24, 101, 'BLOC 2-1 TP06 - Concevoir une solution d\'infrastructure réseau', 'https://docs.google.com/document/d/13nmEt8rEKSpjyCT2cM6fHg4JbSSGOhfPtzyqM8vAQa4/edit'),
(25, 101, 'SIOPUB compte rendu', 'https://docs.google.com/document/d/1F4ah54DAmqEOfl89vBsN0X39dwRA8ww9HjB06p3p-Fg/edit'),
(26, 95, 'Documentation sur l\'installation du serveur DHCP,', 'https://docs.google.com/document/d/1Q8smTLlB0KHBNu7rTJNR4LlZ08LeHIiq3L8r68w5qhM/edit?usp=sharing'),
(27, 19, 'sq', 'qs');

-- --------------------------------------------------------

--
-- Structure de la table `promotion`
--

CREATE TABLE `promotion` (
  `id` int NOT NULL,
  `annee` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `statut` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `promotion`
--

INSERT INTO `promotion` (`id`, `annee`, `statut`) VALUES
(1, '2020-2022', 'AC'),
(2, '2021-2023', 'AC');

-- --------------------------------------------------------

--
-- Structure de la table `reset_password_request`
--

CREATE TABLE `reset_password_request` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `selector` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reset_password_request`
--

INSERT INTO `reset_password_request` (`id`, `user_id`, `selector`, `hashed_token`, `requested_at`, `expires_at`) VALUES
(9, 98, 'oczrlDM28QwucqxPyRLn', 'WxjC3Rx1yu2DgfcME1af7eCG1OELzMaq1NLn5jKki0U=', '2022-03-09 13:08:51', '2022-03-09 14:08:51');

-- --------------------------------------------------------

--
-- Structure de la table `rp`
--

CREATE TABLE `rp` (
  `id` int NOT NULL,
  `localisation_id` int DEFAULT NULL,
  `statut_id` int DEFAULT NULL,
  `source_id` int NOT NULL,
  `etudiant_id` int DEFAULT NULL,
  `enseignant_id` int DEFAULT NULL,
  `cadre_id` int DEFAULT NULL,
  `niveau_rp_id` int DEFAULT NULL,
  `libcourt` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `besoin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `environnement` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `moyen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modif` date DEFAULT NULL,
  `archivage` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `rp`
--

INSERT INTO `rp` (`id`, `localisation_id`, `statut_id`, `source_id`, `etudiant_id`, `enseignant_id`, `cadre_id`, `niveau_rp_id`, `libcourt`, `besoin`, `date_debut`, `date_fin`, `environnement`, `moyen`, `date_modif`, `archivage`) VALUES
(16, 1, 1, 1, 54, 7, 1, 1, 'etude comparative hébergeurs', 'héberger le site client', '2021-06-16', '2021-06-18', 'windows', 'pc', '2021-06-18', 0),
(19, 1, 2, 1, 53, 7, 1, 1, '[SIO1] création d\'une base de données', 'Entreprise', '2022-01-13', '2022-01-13', 'Mysql', 'cahier des charges', '2022-01-13', 0),
(20, 1, 2, 4, 53, 8, 1, 2, 'ADP réseau', 'Explorer les principes du réseau à partir de matériel pré-paramétré', '2022-11-10', '2022-11-24', 'ios cisco/ati', 'matériel Cisco et ATI', '2022-02-19', 0),
(23, 1, 2, 1, 108, 8, 2, 3, 'test', 'Demande de test sur une application', '2022-02-28', '2022-02-28', 'application PHP', 'application et comptes', '2022-02-28', 0),
(24, 1, 1, 4, 106, NULL, 1, 3, 'ADP Réseau', 'Apprendre les fondamentaux de la configuration d’un réseau', '2021-10-20', '2021-11-04', '2 switches et des câbles\r\nLignes de commandes Cisco et ATI', 'Les comptes nécessaires', '2022-03-01', 0),
(25, 1, 2, 1, 101, 8, 1, 3, 'Prise en main d\'une configuration réseau sur un switch', 'Faire l\'inventaire du matériel et des VLANS.\r\nConfiguration d\'un switch et interconnexion 802.1Q.', '2021-10-20', '2021-11-18', 'Ligne de commande, wiki.', 'Switch, câble console, putty.', '2022-03-01', 0),
(26, 1, 1, 4, 104, NULL, 1, 2, 'Apprendre les fondamentaux de la configuration d\'un réseau', 'Initiation et appropriation des notions réseau', '2021-10-21', '2021-11-18', 'Documentation technique : https://wiki.sio.bts\r\nPutty\r\nWireshark\r\nLigne de commande Cisco et ATI', 'Switch ATI\r\nSwitch CISCO\r\nCisco Packet Tracer\r\nCâbles', '2022-03-01', 0),
(27, 1, 1, 1, 100, NULL, 1, 3, 'Installation et configuration fondamentale d’un réseau', 'Découvrir les bases réseau', '2021-10-20', '2021-11-18', 'Cisco iOS\r\nATI OS', 'Materiels réseau :\r\n-Switch\r\n-Câbles\r\n-Postes', '2022-03-01', 0),
(28, 1, 1, 4, 99, NULL, 1, 3, 'ADP Réseaux', 'Apprendre les fondamentaux de la configuration d\'un réseau', '2021-10-21', '2021-11-18', 'switches Cisco, lignes de commandes Cisco et ATI', 'mise à disposition de matériel (switches et câbles) ainsi que des comptes nécessaires.', '2022-03-01', 0),
(29, 1, 2, 4, 93, 8, 1, 3, 'Configuration de matériels d\'interconnexions', 'Initiation à la configuration d\'un réseau (Vlan, 802 1Q), capture de trames.', '2021-10-20', '2021-11-18', 'Ligne de commande Cisco et ATI', 'Switch ATI, Switch Cisco, Câble réseau, Câble console', '2022-03-01', 0),
(30, 1, 2, 4, 102, 8, 1, 3, 'Configuration d\'une infrastructure réseau', 'Initiation à la configuration d\'un réseau avec des Vlans, l\'encapsulation 802.1q, analyse de trames.', '2021-10-20', '2021-11-18', 'Wiki de la section, ligne de commande,', 'Switch Cisco, switch ATI, câble console, Putty, Cisco Packet Tracet, WireShark', '2022-03-01', 0),
(31, 1, 2, 4, 98, 8, 1, 3, 'Fondamentaux configuration d\'un réseau', 'Appropriation des notions réseau', '2021-10-21', '2021-11-18', 'Ligne de commande Cisco et ATI', 'Switch ATI, Switch Cisco, Câble réseau', '2022-03-01', 0),
(32, 1, 1, 4, 106, NULL, 1, 3, 'ADP CMS Wordpress', 'Créer un site web fonctionnel', '2021-10-07', '2021-11-16', 'WordPress, Trello', 'Un cahier des charges', '2022-03-01', 0),
(33, 1, 2, 4, 91, 8, 1, 3, 'Initiation configuration d\'infrastructure réseau.', 'Comprendre les fondamentaux de la configuration d’un réseau', '2021-10-21', '2021-11-18', '-Putty,  ligne de commande Cisco et ATI\r\n-wireshark\r\n-Documentation wiki', '-compte de connexion des switchs, \r\n-Switch Ati et Cisco, Câbles Ethernet/console', '2022-03-01', 0),
(35, 1, 1, 1, 105, NULL, 1, 3, 'Installation réseaux', 'Fondamentaux de la configuration d’un réseau', '2021-10-20', '2021-11-18', 'Cisco ios\r\nATI ios', '- Switch (Configurations)\r\n- 4 PC', '2022-03-01', 0),
(36, 1, 2, 4, 97, 8, 1, 2, 'manipuler le matériel et configuré un réseau', 'besoin de connecter plusieurs switch entre eux pour établir une communication entre réseaux', '2021-10-20', '2021-11-18', 'un outil de commande', '4 poste,2 switch: Cisco et ATI,1 router et des câbles(RJ45 et croiser).', '2022-03-09', 0),
(39, 1, 1, 1, 105, NULL, 1, 3, 'Installation réseaux', 'Fondamentaux de la configuration d’un réseau', '2021-10-20', '2021-11-18', 'Cisco ios\r\nATI ios', '- Switch (Configurations)\r\n- 4 PC', '2022-03-01', 0),
(40, 1, 1, 4, 96, NULL, 1, 2, '1er contact avec le matériel réseau', 'Compréhension des fondamentaux de la configuration d’un réseau', '2021-10-21', '2021-11-18', '- Les outils Putty & Wireshark\r\n- Travaillez en ligne de commande Cisco & ATI', '2 Switchs & des câbles ainsi que les comptes nécessaires', '2022-03-01', 0),
(41, 1, 1, 4, 92, NULL, 1, 3, 'ADP-Réseaux', 'Apprendre l\'inventaire du matériel réseau, vérifier la configuration des switchs, apprendre plus sur les switchs, leurs protocoles et manipulation sur un switch.', '2021-11-11', '2021-11-18', 'Putty : Pour configurer le switch Cisco et le switch ATI.\r\nWireShark : Pour regarde les protocoles qui circuler sur le réseau.', 'Le switch Cisco et le switch ATI, câble réseau, ordinateurs fixes.', '2022-03-09', 0),
(44, 1, 1, 4, 94, NULL, 1, 2, 'ADP 07 inventaire et configuration réseau par  équipes', 'manipuler les matériels et configurer un réseau', '2021-10-20', '2021-11-18', 'en ligne de commande Cisco et ATI, Putty, Wireshark', '2 switches et des câbles ainsi que les comptes nécessaires,', '2022-03-09', 0),
(45, 1, 1, 4, 109, NULL, 1, 2, 'Premier contact avec du matériel réseau physique et configuration de ce dernier en équipe', 'Configurer un Switch Cisco et un Switch ATI', '2021-10-21', '2021-11-18', '- Putty\r\n- Cisco Packet Tracer\r\n- Ligne de commandes Cisco et ATI\r\n- Wireshark', '- Cisco Packet Tracer \r\n- PuTTY\r\n- Un Switch Cisco\r\n- Un Switch ATI\r\n- Six câbles', '2022-03-10', 0),
(46, 1, 2, 4, 113, 14, 1, 5, 'Mise en place d\'un site pour le BTS', 'Mise en place d\'un site utilisant le CMS Wordpress pour le BTS Services Informatiques aux Organisations.', '2021-11-25', '2021-12-16', '- WAMP64\r\n- Visual Studio Code\r\n- Putty\r\n- Trello\r\n- Serveur Web LAMP\r\n- Wordpress', 'Cahier des charges', '2022-03-01', 0),
(48, 1, 1, 4, 110, NULL, 1, 3, 'Développement', 'Développement d\'un plugin à intégrer sur le CMS Wordpress de la section.', '2021-11-25', '2021-12-09', 'Wordpress, Visual Studo Code', 'cahier des charges', '2022-03-01', 0),
(49, 1, 2, 4, 123, 14, 1, 4, 'Réalisation d\'un site WordPress pour la section', 'Amélioration de la visibilité de la section à l\'extérieur.', '2021-11-25', '2021-12-16', 'PHP(plugins), WordPress, WampServer,', 'Cahier des charges', '2022-03-01', 0),
(50, 1, 1, 4, 117, NULL, 1, 3, 'réalisation site web avec le CMS wordpress', 'Création et mise en ligne d\'un site web dédié à la présentation de la section SIO et du lycée Jean Rostand', '2021-11-25', '2022-12-15', 'Outil de suivi de tâche (trello)\r\nDocumentation/cahier des charges\r\n plugins exemple', 'Wordpress, visual studio code', '2022-03-01', 0),
(51, 1, 1, 4, 117, NULL, 1, 3, 'réalisation site web avec le CMS wordpress', 'Création et mise en ligne d\'un site web dédié à la présentation de la section SIO et du lycée Jean Rostand', '2021-11-25', '2022-12-15', 'Outil de suivi de tâche (trello)\r\nDocumentation/cahier des charges\r\n plugins exemple', 'Wordpress, visual studio code', '2022-03-01', 1),
(52, 1, 2, 4, 112, 14, 1, 3, 'Création de site web pour la section avec wordpress', 'Initiation au CMS et création d\'un site web pour promouvoir le BTS avec le CMS WordPress.', '2021-11-25', '2021-12-15', 'CMS WordPress , Trello', 'Cahier des charges / Sujet', '2022-03-01', 0),
(53, 1, 1, 4, 115, NULL, 1, 3, 'Création d\'un site web pour la section avec Wordpress', 'Création et mise en ligne d\'un site Web qui met en avant la section BTS SIO.', '2021-11-25', '2021-12-16', 'Travail avec l\'environnement Wordpress et Trello pour le travail en équipe.', 'Il y a eu un cahier des charges de fourni.', '2022-03-01', 0),
(54, 1, 1, 1, 111, NULL, 1, 1, 'ADP CMS Wordpress', 'Initiation a un CMS (content management system) ainsi que la création d\'un site web avec WordPress', '2021-11-03', '2021-12-01', 'TD : Les différents travaux a faire ainsi que les aides inscrites dessus.', 'Trello : Différente tache.\r\nWordPress : Logiciel principale.\r\nVisual Studio Code : outille de développement.', '2022-03-01', 0),
(55, 1, 2, 4, 116, 14, 1, 3, 'Développement Wordpress', 'Mise en avant de la formation BTS SIO du Lycée Jean-Rostand avec le CMS Wordpress', '2021-11-25', '2021-12-09', 'Visual Studio Code, Trello, Wordpress', 'Méthode Agile', '2022-03-01', 0),
(56, 1, 1, 1, 120, NULL, 1, 1, 'développement de plugin PHP pour WordPress', 'Ajout et modification de plugin PHP WordPress pour le site de la sections BTS Sio', '2021-11-05', '2021-11-06', 'langage PHP et Wordpress', 'Cahier des charges sur les attentes du projet.', '2022-03-01', 0),
(57, 1, 2, 1, 119, 14, 1, 3, 'Développement de plugin', 'Création de sites pour la session du Lycée Jean Rostand', '2021-11-25', '2021-12-20', 'Travail en équipe', 'CMS Wordpress , Trello', '2022-03-01', 0),
(58, 1, 2, 4, 114, 14, 1, 2, 'Création d\'un site pour la section BTS SIO du lycée Jean Rostand', 'Création d\'un site pour promouvoir la section BTS SIO du lycée Jean Rostand', '2021-11-25', '2021-12-09', 'WordPress', 'Cahier des charges', '2022-03-01', 1),
(59, 1, 1, 4, 118, NULL, 1, 4, 'Développement du site web de la section avec wordpress', 'Développer un site web avec l\'outil Wordpress afin de mettre en avant la section BTS.', '2021-11-25', '2021-12-02', 'Cahier des charges', 'Wordpress', '2022-03-01', 0),
(62, 1, 1, 1, 121, NULL, 1, 3, 'Développer un site Web de la section SIO via CMS Wordpress', 'Avoir un site présentant la section et permettant aux étudiants de gérer les fiches de stages', '2021-11-25', '2021-12-02', 'WordPress, PHP, Trello, Sublime text, VirtualBox', 'Cahier des charges, Documentation en ligne (Wordpress, PHP)', '2022-03-01', 0),
(64, 1, 1, 1, 122, NULL, 1, 3, 'ADP CMS - Dévelopement WordPress', 'Production d\'un site web avec l\'environnement Wordpress', '2022-11-25', '2022-12-09', 'Sublime texte, Word Press', 'Cahier des charges', '2022-03-01', 0),
(66, 1, 1, 4, 117, NULL, 1, 1, 'Découverte des fondamentaux de réseau', 'Apprentissage des fondamentaux du matériel et du réseau', '2021-10-14', '2021-10-20', 'Matériel nécessaire à la réalisation de l\'ADP\r\nDocumentation', '.', '2022-03-01', 0),
(67, 1, 2, 2, 93, 12, 1, 3, 'Configuration d\'un Active Directory', 'Concevoir une solution d\'infrastructure réseau', '2022-03-03', '2022-03-03', 'Machine virtuelle', 'VirtualBox', '2022-03-03', 0),
(68, 1, 3, 2, 98, NULL, 1, 4, 'Automatisation création de compte sous Active Directory', 'Concevoir une solution d\'infrastructure réseau', '2022-03-03', '2022-03-03', 'Machine virtuelle', 'Virtualbox', '2022-03-03', 0),
(69, 1, 2, 2, 104, 12, 1, 3, 'Configuration d\'un Active Directory à l\'aide d\'un script', 'Automatisation des créations de comptes utilisateurs sous Active Directory.', '2022-03-03', '2022-03-03', 'Windows Server\r\nDocumentations cours et wiki BTS SIO', 'Windows PowerShell ISE\r\nAnnuaire Active Directory\r\nOracle VM VirtualBox', '2022-03-09', 0),
(70, 1, 1, 1, 100, NULL, 1, 1, 'Automatisation de création d\'utilisateur', 'Automatisé la création des utilisateurs', '2020-03-03', '2020-03-03', 'Serveur Win2016', 'VM', '2022-03-03', 0),
(71, 1, 1, 1, 93, NULL, 2, 3, 'Déploiement d\'un outil de gestion de parc', 'Faire de la gestion de parc depuis l\'extérieur', '2022-01-26', '2022-01-26', 'Docker, Reverse Proxy', 'Putty, compte du Proxmox et Docker', '2022-03-10', 0),
(72, 1, 1, 2, 102, NULL, 2, 3, 'Déploiement d\'un outil de gestion de parc', 'Faire de la gestion de parc et qu\'il soit accessible à l\'extérieur', '2022-01-26', '2022-01-26', 'Docker, Reverse Proxy,', 'Putty, Comptes Proxmox et Docker,', '2022-03-09', 0),
(73, 1, 2, 2, 96, 8, 2, 3, 'Création et ouverture des accés à un gestion de parc', 'Rendre disponible GLPI en interne & en externe pour la gestion de l\'entreprise', '2022-01-26', '2022-02-16', 'Proxmox, Reverse Proxy, Putty, DNS, Docker', 'Compte Proxmox & compte Docker', '2022-03-09', 0),
(74, 1, 1, 2, 99, NULL, 2, 3, 'création et ouverture d\'accès à un outils de gestion de parc', 'Mettre en place un gestionnaire de parc et créer un accès sécurisé interne et externe.', '2022-01-26', '2022-02-16', 'docker, reverse proxy, Putty, DNS, proxmox', 'comptes proxmox, fusion inventory', '2022-03-09', 1),
(75, 1, 2, 2, 99, 8, 2, 3, 'création et ouverture d\'accès à un outils de gestion de parc', 'Mettre en place un gestionnaire de parc et créer un accès sécurisé interne et externe.', '2022-01-26', '2022-02-16', 'docker, reverse proxy, Putty, DNS, proxmox', 'comptes proxmox', '2022-03-09', 0),
(76, 1, 2, 2, 97, 8, 2, 3, 'deploiement d\'un outil de gestion de parc', 'Mettre en place un gestionnaire de parc et permettre un accès en interne et en externe', '2022-01-26', '2022-02-02', 'docker, reverse proxy, PuTTY, conteneurs, DNS serveur, fusion inventory,', 'compte proxmox, compte docker', '2022-03-09', 0),
(77, 1, 2, 2, 104, 8, 2, 3, 'Déploiement d\'un outil de gestion de parc', 'Mettre en place un outil de gestion de parc et le rendre accessible en interne et en externe.', '2022-01-26', '2022-02-02', 'Docker, Putty, Proxmox, Reverse Proxy, DNS,', 'Compte Proxmox et Docker, fichier exemple NGINX, Image de la fonctionnalité diouxx/GLPI,', '2022-03-09', 0),
(78, 1, 1, 2, 105, NULL, 2, 2, 'Mise en place d\'un docker', 'Déploiement d\'un outils de gestion de parc accessible depuis l\'extérieur', '2022-01-26', '2022-02-02', 'Docker, proxmox, centenaires, putty, Wireshark, Tracert/traceroute', 'Compte Proxmox\r\nCompte docker', '2022-03-09', 0),
(79, 1, 1, 2, 100, NULL, 2, 3, 'Déploiement d\'un outil de gestion de parc et de son accès externe', 'Déploiement d\'un outil de gestion de par et de ses service', '2022-01-26', '2022-02-02', 'Docker, Reverse Proxy, Putty , Wireshark', 'Compte docker , proxmox', '2022-03-09', 0),
(80, 1, 2, 2, 98, 8, 2, 3, 'Création/Déploiement d\'une gestion de parc (GLPI)', 'Procéder à l’installation et la mise en accès public d’une gestion de parc GLPI avec l’outil d’inventaire FusionInventory, accessible en externe.', '2022-01-26', '2022-02-09', 'Compte Proxmox et conteneur Docker', 'Compte Proxmox et conteneur Docker', '2022-03-09', 0),
(81, 1, 1, 4, 124, NULL, 1, 2, 'Inventaire/vlan configuration réseau en physique par équipe', 'Configuration d\'un switch cisco et un switch ATI  et appropriation des principes réseaux', '2021-10-21', '2021-11-18', '- Cisco packet tracer\r\n- Putty', '- Switch ATI et CISCO\r\n- Cables', '2022-03-09', 0),
(82, 1, 2, 2, 92, 8, 2, 2, 'B2-SISR-TP02-DeploiementGestionParc', 'Création d\'un serveur docker ou un plugin GLPI à été installer et préparer selon les besoins qui nous a été demandé', '2022-02-27', '2022-03-03', 'Promox, docker, debian,', 'Putty, ordinateur fixe, navigateur chrome,', '2022-03-09', 0),
(83, 1, 1, 2, 101, NULL, 1, 1, 'Déploiement d\'un outil de gestion de parc', 'Faire de la gestion de parc et accès  a l\'extérieur', '2022-01-26', '2022-01-26', 'Docker, reverse proxy', 'putty, comptes promox et docker', '2022-03-09', 0),
(84, 1, 1, 2, 103, NULL, 1, 1, 'Déploiement d\'un outli de gestion de parc', 'gestion de parc et accès extérieur', '2022-01-26', '2022-01-26', 'docker reverse proxy', 'docker proxmox putty', '2022-03-09', 0),
(85, 1, 1, 2, 103, NULL, 1, 1, 'Déploiement d\'un outli de gestion de parc', 'gestion de parc et accès extérieur', '2022-01-26', '2022-01-26', 'docker reverse proxy', 'docker proxmox putty', '2022-03-09', 0),
(86, 1, 1, 2, 109, NULL, 1, 2, 'Déploiement d\'une Gestion de Parc', 'Avoir un serveur GLPI accessible en dehors de la section.', '2022-01-26', '2022-02-02', '- Docker\r\n- Proxmox (Reverse Proxy)\r\n- GLPI\r\n- Apache\r\n- MariaDB', 'Comptes Proxmox et Docker', '2022-03-09', 0),
(87, 1, 1, 4, 94, NULL, 1, 3, 'ADP 09 DÉVELOPPEMENT D’UNE APPLICATION WEB CLIENT /SERVEUR', '-Création de site', '2021-11-25', '2021-11-25', 'uytl', 'CMS, éditeurs de codes, trello', '2022-03-09', 0),
(88, 1, 1, 1, 94, NULL, 1, 1, 'b22 sisr', 'jghv', '2000-05-12', '2001-12-23', 'phgphm', 'fclhg', '2022-03-09', 0),
(89, 1, 1, 4, 109, NULL, 1, 2, 'Développement d\'une application Web Client/Serveur', 'Créer un site Web  pour l\'équipe pédagogique du BTS SIO.', '2021-11-25', '2021-12-26', '- Wordpress\r\n- VM LAMP\r\n- L\'emploi du temps\r\n- Les témoignages tuteur de stage/ancien étudiants\r\n- Les partenaires de la section', '- PHP\r\n- HTML', '2022-03-09', 0),
(90, 1, 1, 2, 99, NULL, 1, 4, 'Déploiement d\'un serveur DHCP', 'automatiser l\'adressage IP des machines clientes au sein d\'un domaine.', '2022-03-10', '2022-03-10', 'Machines virtuelles (VirtualBox)', 'Comptes du domaine, Windows server, active directory', '2022-03-10', 0),
(91, 1, 1, 2, 97, NULL, 1, 3, 'déploiement d\'un serveur DHCP', 'permettre a ce que le serveur DHCP du poste serveur assigne une adresse IP au poste client.', '2022-03-10', '2022-03-10', 'machine virtuelle (Virtual box)', 'compte du domaine, Windows server, active directory', '2022-03-10', 0),
(92, 1, 2, 2, 93, 12, 1, 4, 'Mise en place d\'un serveur DHCP', 'Attribuer automatiquement des adresses IP aux postes clients', '2022-03-10', '2022-03-10', 'Machine virtuelle client et serveur', 'VirtualBox, fichier VDI Windows 10 Base et Windows 10 Server 2016', '2022-03-10', 0),
(93, 1, 1, 2, 98, NULL, 1, 3, 'installation contrôleur de domaine AD', 'Centraliser les authentifications des différents compte et Machine.', '2022-02-24', '2022-02-24', 'Domaine: SIOPUB.local, dossier et compte à créer', 'Active directory, VirtualBox', '2022-03-10', 0),
(94, 1, 1, 2, 101, NULL, 1, 3, 'Installation d\'un contrôleur de domaine Active Directory', 'Serveur d\'authentification afin de gérer de manière centralisé les comptes et les machines.', '2022-03-10', '2022-03-10', 'Wiki, TP', 'VirtualBox, AD Windows server 2016.', '2022-03-10', 0),
(95, 1, 1, 2, 102, NULL, 1, 3, 'Installation d\'un contrôleur de domaine AD (Active Directory)', 'Serveur d\'authentification pour gérer de manière centralisé les comptes et les machines', '2022-03-10', '2022-03-10', 'Wiki, Document du Tp', 'Virtual Box, AD Windows Serveur 2016', '2022-03-10', 0),
(96, 1, 1, 4, 104, NULL, 1, 3, 'Installation d\'un serveur DHCP', 'Attribuer dynamiquement des adresses IP à des postes clients', '2022-03-10', '2022-03-10', 'Machine Virtuelle (Sous VirtualBox)', 'Active Directory, Compte du domaine, Windows Server', '2022-03-10', 0),
(97, 1, 1, 2, 98, NULL, 1, 3, 'Installation rôle de serveur DHCP sur la machine serveur', 'Paramétrage et mise en œuvre des machines clientes et de la machine serveur DHCP via les MV', '2022-03-10', '2022-03-10', 'Compte créer pour chaque service (Administrations, Commercial, ...)', 'Active Directory, Virtual Box', '2022-03-10', 0),
(98, 1, 1, 2, 101, NULL, 1, 3, 'Serveur DHCP', 'Création d\'un serveur DHCP afin d\'obtenir des adresses IP dynamiques', '2022-03-10', '2022-03-10', 'Wiki, TP', 'VirtualBox, AD Windows server 2016.', '2022-03-10', 0),
(99, 1, 1, 2, 96, NULL, 1, 3, 'Mise en oeuvre d\'un serveur DHCP', 'Automatisation de l\'adressage IP des machines clients grâce à l\'outil DHCP', '2022-03-10', '2022-03-10', 'Machine virtuelle (Virtual Box)', 'Windows Server 2016, Compte domaine, Active Directory', '2022-03-10', 0),
(101, 1, 1, 2, 92, NULL, 1, 3, 'B2.2-TD06/SIOPUB-Concevoir une solution d\'infrastructure réseau', 'Création, préparation, mise en fonctionnement d\'un serveur Windows 2016 avec comme rôle : DNS, DHCP et AD DS', '2022-02-23', '2022-03-10', 'VirtualBox, Wireshark et google doc pour le compte rendus.', 'Ordinateur fixe, image ISO virtuelle pour VirtualBox, câbles Ethernets', '2022-03-10', 0),
(102, 1, 1, 2, 106, NULL, 1, 3, 'B2.2-TD06/SIOPUB-Concevoir une solution d\'infrastructure réseau', 'Création, préparation et mise en fonctionnement d\'un serveur Windows 2016 avec comme rôles: DNS, DHCP, AD DS', '2022-02-23', '2022-03-10', 'Virtual Box, Wireshark', 'Ordinateur fixe, image ISO virtuelle ( Virtual Box )', '2022-03-10', 0),
(103, 1, 1, 4, 109, NULL, 1, 2, 'Installation et configuration du DHCP sur Windows Server 2016.', 'Automatiser l\'attributions des adresses ip pour l\'agence de communication SIOPUB.', '2022-03-10', '2022-03-10', '- VM Windows 10 (client)\r\n- VM Windows Server 2016\r\n- AD/DNS\r\n- DHCP', '- Wiki [BTS SIO]\r\n- WireShark', '2022-03-10', 0),
(104, 1, 1, 1, 53, NULL, 1, 1, 'realisation dimanche 13', 'dsqd', '2022-02-28', '2022-03-17', NULL, NULL, '2022-03-13', 0);

-- --------------------------------------------------------

--
-- Structure de la table `rpactivite`
--

CREATE TABLE `rpactivite` (
  `id` int NOT NULL,
  `activite_id` int NOT NULL,
  `rp_id` int NOT NULL,
  `commentaire` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `rpactivite`
--

INSERT INTO `rpactivite` (`id`, `activite_id`, `rp_id`, `commentaire`) VALUES
(35, 4, 16, 'travail avec un binome et post-it'),
(40, 5, 19, 'créer un script sql permettant de créer la base de données avec toutes les instructions create table, alter, etc...'),
(41, 1, 20, 'inventaire des matériels (switch, câbles, etc) nécessaires'),
(42, 2, 20, 'Inventaire des VLAN présents sur le switch initial, configuration des VLAN sur le second switch'),
(43, 4, 20, 'Organisation au sein de l\'équipe pour les tests, le paramétrage, etc'),
(44, 2, 20, 'Étude du principe de trames étiquetées 802.1Q et tests de communication entre les switches dans un même VLAN'),
(45, 6, 20, 'Apprentissage des notions : VLAN, 802.1Q'),
(49, 1, 23, 'vérification des droits selon le profil'),
(50, 2, 23, 'Test des fonctionnalités'),
(51, 4, 23, 'création d\'un tableau de test avec résultats attendus'),
(52, 5, 23, 'Validation de l\'application'),
(55, 1, 28, 'Inventaire du matériel nécessaire (câbles, équipements) ainsi que des VLAN présents dans le switch ATI'),
(56, 1, 26, 'Élaboration d\'un schéma réseau selon le contexte fourni permettant ainsi de répertorier les équipements nécessaires à la mise en place de ce réseau'),
(57, 4, 31, 'travail en équipe : coopération pour l’inventaire, répartition des tâches'),
(58, 1, 30, 'Inventaire du matériel réseau (câbles réseaux, câbles consoles, équipements)'),
(59, 1, 29, 'Inventaire du matériel nécessaire (câbles réseaux, câbles console, équipements)'),
(60, 4, 33, 'travail en équipe : coopération pour l’inventaire, répartition des tâches'),
(61, 1, 31, 'inventaire du matériel nécessaire (câbles, équipements)'),
(62, 2, 29, 'Inventaire des VLAN déjà présents dans le switch ATI'),
(63, 2, 31, 'inventaire des VLAN présents dans le switch ATI'),
(64, 2, 29, 'Configuration du switch Cisco'),
(65, 2, 29, 'Configuration de l’interconnexion 802.1Q'),
(66, 2, 30, 'inventaire des VLAN intégrés dans le switch ATI'),
(67, 2, 30, 'configuration du switch Cisco'),
(68, 4, 29, 'Travail en équipe : coopération pour l’inventaire, répartition des tâches'),
(69, 2, 30, 'configuration de l’interconnexion 802.1Q'),
(70, 2, 31, 'configuration du switch Cisco'),
(71, 2, 31, 'configuration de l’interconnexion 802.1Q'),
(72, 2, 32, 'Développement d\'un plugin pour WordPress'),
(73, 4, 30, 'coopération pour l’inventaire, répartition des tâches'),
(74, 2, 28, 'Configuration du switch Cisco ainsi que de l\'interconnexion 802.1Q'),
(75, 1, 24, '_ inventaire du matériel nécessaire (câbles, équipements)\r\n_ inventaire des VLAN présents dans le switch ATI'),
(76, 8, 25, '• Inventaire du matériel nécessaire (câbles, équipements) Inventaire des VLAN présents dans le switch ATI\r\n• Configuration du switch Cisco\r\n• Configuration de l’interconnexion 802.1Q\r\n• Apprentissage des notions de VLAN et du protocole 802.1Q\r\n• Travail en équipe : coopération pour l’inventaire, répartition des tâches'),
(77, 8, 24, '_ configuration du switch Cisco\r\n_ configuration de l’interconnexion 802.1Q'),
(78, 1, 27, 'Inventaire des câbles, équipements'),
(79, 4, 28, 'Coopération au cours des différentes tâches réalisées, répartition des tâches au sein du groupe.'),
(80, 6, 31, 'apprentissage des notions de VLAN et du protocole 802.1Q'),
(81, 6, 24, '_ apprentissage des notions de VLAN et du protocole 802.1Q'),
(82, 4, 24, '_ travail en équipe : coopération pour l’inventaire, répartition des tâches'),
(83, 5, 39, 'test'),
(84, 1, 33, '-Inventaire du matériel nécessaire (câbles, équipements)'),
(85, 2, 33, '-Inventaire des VLAN présents dans le switch ATI'),
(86, 2, 33, '-Configuration du switch Cisco'),
(87, 6, 29, 'apprentissage des notions de VLAN et du protocole 802.1Q'),
(88, 10, 32, '_ installation et configuration de WordPress'),
(89, 6, 30, 'apprentissage des notions de VLAN et du protocole 802.1Q'),
(90, 2, 33, '-Configuration de l’interconnexion 802.1Q'),
(91, 4, 40, 'travail en équipe : coopération pour l’inventaire, répartition des tâches'),
(92, 6, 33, 'apprentissage des notions de VLAN et du protocole 802.1Q'),
(93, 1, 41, 'Identification et inventaire du matériel pour l\'ADP'),
(94, 2, 28, 'Inventaire des VLAN p'),
(95, 2, 41, 'Compte rendue sur le travail et les avancement du projet.'),
(96, 2, 46, 'Mise en place et développement d\'un plugin Wordpress permettant la gestion des fiches de stage.'),
(97, 5, 46, 'Installation et configuration du CMS Wordpress'),
(98, 3, 46, 'Alimentation du contenu du site de la section.'),
(99, 6, 46, 'Apprentissage du CMS Wordpress.'),
(100, 2, 48, 'Développent d\'un plugin dans le but de l\'intégrer dans un site CMS Wordpress.'),
(101, 4, 46, 'Travail en équipe à l\'aide de la méthode agile.'),
(103, 2, 49, 'Développement des plugins'),
(104, 4, 46, 'Suivi des tâches avec l\'outil web \'Trello\'.'),
(105, 5, 49, 'Installation et configuration de WordPress'),
(106, 4, 52, 'Création d\'un site web en équipe'),
(107, 3, 49, 'Alimentation du contenu du site WordPress'),
(108, 6, 49, 'Apprentissage du CMS WordPress'),
(109, 4, 49, 'Travail en équipe en méthode agile'),
(110, 4, 50, 'Maitrisé: Planification d\'une partie des taches à réaliser'),
(111, 4, 49, 'Suivi de l’ensemble des tâches avec l\'outil \"Trello\"'),
(112, 2, 55, 'Développement d\'un plugin demander par la section, qui permet de gérer les fiches de stage des étudiants'),
(113, 2, 53, 'Développement de plugins Wordpress pour le site web. Différents plugins on été réalisés comme : Un plugin qui permet à un enseignant de créer des utilisateurs étudiant par section et par sessions dans l\'interface de gestion Wordpress. Ensuite, un autre plugin de connexion afin de se connecter au site avec son email et son mot de passe.Et pour finir un plugin qui permet à un utilisateur de changer son mot de passe ou son adresse email.'),
(114, 2, 50, 'Pratiqué: Conception d\'un plugin afin d\'assurer la connexion d\'un utilisateur'),
(115, 5, 55, 'Déploiement & Configuration de Wordpress'),
(116, 5, 50, 'Maitrisé: Installation et mise à disposition du CMD wordpress en local et sur le serveur web'),
(117, 2, 54, 'Développement du plugin pour permettre l\'évolution du site web'),
(118, 3, 50, 'maitrisé: Alimentation du site web (description du BTS, emploi du temps etc...)'),
(119, 5, 54, 'Installation et configuration de WordPress'),
(120, 2, 56, 'Développement de plugins WordPress en PHP pour le site web de la section BTS SIO:\r\n- plugin pour que un étudiant se connecte avec son email et son mot de passe.'),
(121, 4, 53, 'Gestion, planification et répartition des tâches du projet avec l\'outil Trello.'),
(122, 3, 54, 'Alimentation du contenu du site de la section'),
(123, 6, 54, 'Initiation au CMS Wordpress'),
(124, 3, 55, 'Mise en avant de la formation BTS SIO au travers d\'un site web'),
(125, 4, 53, 'Travail en équipe et en mode agile. Mise en place de Daily scrum afin de mieux s\'organiser dans l\'équipe.'),
(126, 4, 54, 'Travail en équipe avec la méthode Agile sur le site web Trello'),
(127, 6, 50, 'Pratiqué: Apprentissage du fonctionnement de wordpress et son utilisation'),
(128, 6, 55, 'Apprentissage de Wordpress'),
(129, 5, 52, 'Installation et configuration de WordPress'),
(130, 4, 55, 'Travail en mode agile'),
(131, 4, 54, 'Répartition des tâches avec le site web Trello'),
(132, 4, 50, 'pratiqué: Réalisation du projet en mode agile'),
(133, 2, 57, 'Installation des nouvelles fonctionnalités'),
(134, 4, 55, 'Planification des tâches grâce à Trello'),
(135, 2, 64, 'Dévelopement d\'un plugin'),
(136, 5, 64, 'Installation et configuration du WordPress'),
(137, 4, 62, 'Analyse du cahier des charges, répartitions des tâches dans Trello, vérification des tâches effectués.'),
(138, 3, 64, 'Alimentation du site de la section'),
(139, 6, 64, 'Apprentissage de WordPress'),
(140, 4, 64, 'Travail en équipe en mode agile'),
(141, 2, 58, 'Développement de plugin pour ajouter des utilisateurs, page de connexion, remplissage de convention de stage pour les étudiants'),
(142, 4, 64, 'Suivi des tâches avec Trello'),
(143, 4, 59, 'Répartitions des tâches avec Trello, travail en mode agile'),
(144, 5, 58, 'Installation et configuration de Wordpress'),
(145, 3, 52, 'Mise en page des informations du BTS sur le site'),
(146, 8, 67, 'Intégration d\'utilisateur dans un domaine via script PowerShell et un fichier CSV'),
(147, 8, 68, 'Intégration d\'utilisateur dans un domaine via script CSV ainsi que sur PowerShell ISE'),
(150, 9, 69, 'Création d\'un script sous PowerShell pour automatiser l\'ajout de nouvel utilisateur dans un annuaire Active Directory dans le contexte de cours SIOPUB.'),
(151, 8, 75, 'création d\'un conteneur docker à partir de l\'image de glpi'),
(152, 8, 80, 'configuration du DNS inforostand14.net pour la gestion des noms de ce domaine extérieur'),
(153, 8, 76, 'création d\'un conteneur docker basé sur l\'image GLPI (déjà téléchargé)'),
(157, 8, 78, 'Installation d\'un docker accessible depuis l\'extérieur'),
(158, 8, 76, 'Configuration de la base de données mariadb'),
(159, 15, 80, 'Sécurisation SSL avec l’outil Let’s Encrypt sur le Reverse Proxy'),
(160, 1, 76, 'Ajout du plugin fusioninventory pour automatiser l\'inventaire'),
(161, 15, 76, 'création des élément des sécurité authentique avec l\'outil  lets encrypt sur le reverse proxy'),
(162, 17, 75, 'Installation / configuration du service SSL et ajout des éléments de sécurité sur apache.'),
(163, 16, 80, 'configuration d’Apache pour la gestion de SSL'),
(164, 8, 80, 'Ajout d’un module FusionInventory à l’outil GLPI'),
(165, 17, 75, 'Création des éléments de sécurité authentiques avec l\'outil certbot sur le reverse Proxy'),
(166, 15, 77, 'Création des certificats X.509 et des clés d\'authenticité avec Let\'s Encrypt et la commande Certbot.'),
(167, 8, 75, 'Configuration de MariaDB'),
(168, 1, 77, 'Ajout du plugin Fusion-Inventory permettant d\'automatiser l\'inventaire du patrimoine informatique.'),
(169, 8, 79, 'Création d\'un conteneur GLPI sur Docker'),
(170, 8, 80, 'Création d’un conteneur directement à partir d’une image pré-installée'),
(171, 8, 77, 'Création d\'un conteneur Docker basé sur une image GLPI (Récupération de l\'image depuis un dépôt).'),
(172, 8, 71, 'Création d’un conteneur GLPI sur Docker'),
(173, 8, 77, 'Configuration d\'une base de données MariaDB'),
(174, 8, 73, 'Configuration du DNS inforostand14.net pour la gestion des noms de ce domaine extérieur'),
(175, 8, 71, 'Configuration de la base de données'),
(176, 7, 82, 'Création d\'un serveur qui contenez le service GLPI'),
(177, 8, 82, 'Essaie des fonctionnalité du service GLPI'),
(178, 8, 71, 'Configuration de GLPI'),
(179, 8, 73, 'L’enregistrement des FQDN sur le service DNS interne'),
(180, 9, 75, 'Configuration de l\'application glpi'),
(181, 8, 72, 'Création d’un conteneur GLPI sur Docker'),
(182, 8, 72, 'Configuration de la base de données'),
(183, 17, 73, 'la sécurisation SSL avec l’outil Let’s Encrypt'),
(184, 1, 80, 'Intégration du serveur du Binôme grâce à Fusion Inventory'),
(185, 1, 75, 'Ajout du plugin Fusion Inventory afin d\'automatiser l\'inventaire'),
(186, 8, 72, 'Configuration de GLPI'),
(187, 5, 82, 'Déploiement du service GLPI à l\'extérieur avec le DNS (inforostand14.net) et le serveur proxy'),
(188, 16, 73, 'La configuration d’Apache pour la gestion de SSL'),
(189, 16, 82, 'Sécuriser l\'accès extérieur du serveur avec SSL et Let\'s Encrypte'),
(190, 9, 77, 'Configuration de l\'application GLPI.'),
(191, 1, 81, 'Inventaire des vlan présents sur le switch ATI'),
(192, 17, 76, 'installation/configuration du service SSL et ajout des éléments de sécurité sur apache.'),
(193, 1, 73, 'Intégration du serveur du binôme via FusionInventory'),
(194, 2, 81, 'Paramétrage des vlan sur le cisco'),
(195, 8, 83, 'Création d’un conteneur GLPI sur Docker'),
(196, 8, 83, 'Configuration de la base de données'),
(197, 8, 83, 'Configuration de GLPI'),
(198, 17, 77, 'Installation et configuration du service SSL avec ajout des éléments de sécurité sur le serveur Apache2.'),
(199, 8, 85, 'installation et configuration GLPI'),
(200, 1, 73, 'Ajout de l\'outil FusionInvetory pour l\'automatisation de l\'inventaire'),
(201, 4, 36, 'travail en équipe: coopération pour l\'inventaire, répartition des taches'),
(202, 1, 36, 'inventaire du matériel nécessaire'),
(203, 9, 79, 'Couplage a l\'AD'),
(204, 8, 90, 'Configuration du rôle DHCP sur un contrôleur de domaine.'),
(205, 8, 90, 'Insertion d\'une machine cliente au sein du domaine'),
(206, 8, 90, 'Configuration de la machine cliente en adressage dynamique'),
(207, 8, 91, 'configuration du rôle DHCP sur un contrôleur de domaine'),
(208, 8, 91, 'insertion d\'une machine cliente au sein du domaine'),
(209, 8, 91, 'configuration de la machine cliente en adressage dynamique.'),
(210, 8, 93, 'Installation Active Directory'),
(211, 8, 96, 'Configuration du rôle DHCP sur un contrôleur de domaine'),
(212, 8, 96, 'Configuration de la machine cliente en adressage dynamique'),
(214, 5, 93, 'Gérer les accès, autorisation et plage horaire pour chaque compte est chaque machine.'),
(215, 7, 97, 'Mise à jour politique d\'adressage selon le contexte'),
(216, 8, 97, 'Installation  et configuration du serveur DHCP'),
(217, 8, 97, 'Paramétrer des différents éléments choisis dans la nouvelle politique d\'adressage'),
(218, 8, 97, 'Paramétrer les différentes machines client en adressage dynamique'),
(219, 8, 97, 'Vérification du fonctionnement des échanges DHCP via Wireshark pour identifier les différentes étapes'),
(220, 8, 92, 'Installation et configuration d\'un service DHCP'),
(221, 8, 94, 'Installation Active Directory'),
(222, 8, 95, 'Installation Active Directory'),
(223, 5, 94, 'Gérer les droits, les horaires d\'accès, les utilisateurs.'),
(224, 5, 95, 'Gérer les droits, les horaires d\'accès et les utilisateurs'),
(225, 8, 96, 'Test de vérification de l\'ajout de la machine cliente au serveur DHCP'),
(226, 8, 98, 'Installer l\'outil DHCP sur l\'AD'),
(227, 7, 98, 'Mise a jour du plan d\'adressage IP'),
(228, 8, 98, 'Configuration des plages d\'adresse IP'),
(229, 1, 101, 'Recensement du matériel pour mettre à bien la demande du TD, configuration et mise en fonctionnement d\'un serveur et habilitation de droit pour chaque utilisateur crée.'),
(230, 2, 101, 'Chaque Jeudi en ADP on avait de nouvelle information sur comment il fallait faire pour crée et gérer le serveur et ordinateur client virtuel.'),
(231, 7, 102, 'Conception d\'un serveur Windows 2016 pour une entreprise. Ce dernier doit effectuer la gestion des utilisateurs ( AD DS ), avoir son nom de domaine pour rejoindre son domaine ( DNS ) et utiliser le service DHCP pour attribuer automatiquement une adresse ip à un utilisateur se connectant dans le domaine.'),
(232, 8, 101, 'Installation et configuration d\'éléments d\'infrastructure nécessaires pour assurer la continuité des services ainsi que la rédaction ou mise à jour de la documentation technique et utilisateur d\'une solution d\'infrastructure'),
(233, 8, 103, 'Mettre en place et assurer le bon fonctionnement d\'un serveur DHCP.'),
(234, 2, 19, 'test nouvelle dimach 13');

-- --------------------------------------------------------

--
-- Structure de la table `semaine_stage`
--

CREATE TABLE `semaine_stage` (
  `id` int NOT NULL,
  `stage_id` int NOT NULL,
  `num_semaine` int NOT NULL,
  `apprentissage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bilan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `semaine_stage`
--

INSERT INTO `semaine_stage` (`id`, `stage_id`, `num_semaine`, `apprentissage`, `bilan`) VALUES
(3, 11, 1, NULL, NULL),
(5, 14, 1, 'rien', 'cool');

-- --------------------------------------------------------

--
-- Structure de la table `source`
--

CREATE TABLE `source` (
  `id` int NOT NULL,
  `libelle` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `source`
--

INSERT INTO `source` (`id`, `libelle`) VALUES
(1, 'B1'),
(2, 'B2'),
(3, 'B3'),
(4, 'ADP'),
(5, 'STAGE1'),
(6, 'STAGE2');

-- --------------------------------------------------------

--
-- Structure de la table `specialite`
--

CREATE TABLE `specialite` (
  `id` int NOT NULL,
  `code` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `specialite`
--

INSERT INTO `specialite` (`id`, `code`, `nom`) VALUES
(1, 'A', 'SISR'),
(2, 'B', 'SLAM'),
(3, 'B', 'NONE');

-- --------------------------------------------------------

--
-- Structure de la table `stage`
--

CREATE TABLE `stage` (
  `id` int NOT NULL,
  `etudiant_id` int NOT NULL,
  `enseignant_id` int DEFAULT NULL,
  `nom_entreprise` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `siret` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_naf` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_rue` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copos` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ville` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_tuteur` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel_tuteur` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_tuteur` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lieu` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sujet` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `service` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `duree` int NOT NULL,
  `hor_lun` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hor_mar` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hor_mer` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hor_jeu` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hor_ven` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hor_sam` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rue` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_directeur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel_directeur` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_directeur` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `stage`
--

INSERT INTO `stage` (`id`, `etudiant_id`, `enseignant_id`, `nom_entreprise`, `siret`, `code_naf`, `num_rue`, `copos`, `ville`, `nom_tuteur`, `tel_tuteur`, `mail_tuteur`, `lieu`, `sujet`, `service`, `date_debut`, `date_fin`, `duree`, `hor_lun`, `hor_mar`, `hor_mer`, `hor_jeu`, `hor_ven`, `hor_sam`, `rue`, `nom_directeur`, `tel_directeur`, `mail_directeur`) VALUES
(11, 53, 7, 'Cardif', '12345678901234', '12345', NULL, '92500', 'Rueil', 'Denis Papin', '1212121212', 'joly@gmail.Com', NULL, 'dev applli web', NULL, '2022-02-07', '2022-02-23', 3, '8H00-12h00 / 14h00-17h00', '8H00-12h00 / 14h00-17h00', '8H00-12h00 / 14h00-17h00', '8H00-12h00 / 14h00-17h00', '8H00-12h00 / 14h00-17h00', NULL, 'du bord de Seine', 'Richard Thibault', '1234567890', 'joly@gmail.com'),
(13, 94, NULL, 'OSINX (Actimac)', '389 497 348 83', '4651Z', NULL, '14200', 'Hérouville Saint Clair', 'DUCLOS Alain', '0231350019', 'rh@actimac.fr', NULL, 'ESN', 'OSINX', '2022-05-16', '2022-06-17', 5, '9H00-12h00 / 14h00-18h00', '9H00-12h00 / 14h00-18h00', '9H00-12h00 / 14h00-18h00', '9H00-12h00 / 14h00-18h00', '9H00-12h00 / 14h00-18h00', NULL, '5 Avenue de Cambridge', 'DESPLANQUES Stéphane', NULL, NULL),
(14, 108, NULL, 'société.com', '1234POELE1211Z', '123R1', NULL, '14000', 'Caen', 'letut paul', '0698979400', 'paul.letut@s.com', NULL, 'application de gestion', NULL, '2022-02-01', '2022-03-12', 6, '8H00-12h00 / 14h00-17h00', '8H00-12h00 / 14h00-17h00', '8H00-12h00 / 14h00-17h00', '8H00-12h00 / 14h00-17h00', '8H00-12h00 / 14h00-17h00', NULL, 'rue borélae', 'LeChef pat', NULL, 'pat.lechef@s.com');

-- --------------------------------------------------------

--
-- Structure de la table `statut`
--

CREATE TABLE `statut` (
  `id` int NOT NULL,
  `libelle` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `statut`
--

INSERT INTO `statut` (`id`, `libelle`) VALUES
(1, 'Création'),
(2, 'En attente'),
(3, 'Commentée'),
(4, 'Validée');

-- --------------------------------------------------------

--
-- Structure de la table `tache_semaine`
--

CREATE TABLE `tache_semaine` (
  `id` int NOT NULL,
  `domaine_tache_id` int NOT NULL,
  `jour_id` int NOT NULL,
  `semaine_stage_id` int NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `duree` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tache_semaine`
--

INSERT INTO `tache_semaine` (`id`, `domaine_tache_id`, `jour_id`, `semaine_stage_id`, `description`, `duree`) VALUES
(14, 14, 1, 3, 'description', NULL),
(16, 2, 1, 5, 'prise en main de l\'application', NULL),
(17, 1, 1, 3, 'SQD', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `etudiant_id` int DEFAULT NULL,
  `enseignant_id` int DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `statut` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `etudiant_id`, `enseignant_id`, `token`, `created_at`, `statut`) VALUES
(42, 'zakina.annouche@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$TmwvaXIuNU1sQ2xRQW50MA$J5op76KZTt6yGe935emLQfyZMKV4KIAq9pmdA7pZ1Uc', 53, NULL, '-XLGgnWrfDJ8j53To1T9a3URkHgpRS4X9MS05ctcX-0', '2021-09-10 00:00:00', 'AC'),
(55, 'portfolio.rostand@gmail.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$bcD9ZDrcr8rnbmrpTJX+JA$fLUFbPInf9WTY9CpNZ/A+nEiu9ZGPwn14orvu/buuVg', NULL, NULL, NULL, NULL, 'AC'),
(57, 'zakina.annouche@ac-normandie.fr', '[\"ROLE_ENSEIGNANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$ODRIc0FzYmRRdm02WFlOLw$9yQFgPIq9ntrUwUNWE4CUujfkEHTg8Sa9EPNCWwYGJs', NULL, 7, NULL, NULL, 'AC'),
(59, 'anne.catros@adresse.com', '[\"ROLE_ENSEIGNANT\"]', '$argon2i$v=19$m=65536,t=4,p=1$bGFCS0pRWGxXb3doRHFsZQ$C4TABUz9FJQGJznOB94HILzwdhyC1gYpcYewqvTodac', NULL, 9, NULL, NULL, 'AC'),
(60, 'tdupontfederici@gmail.com', '[\"ROLE_ENSEIGNANT\"]', '$argon2i$v=19$m=65536,t=4,p=1$STd0amlXeUltODVHWTZjSg$QadRZptnB44ibIWZ1DCRf1fRhYMtKjsVRE2QoxFjoi0', NULL, 10, NULL, NULL, 'AC'),
(67, 'marie.blimer@ac-normandie.fr', '[\"ROLE_ENSEIGNANT\"]', '$argon2i$v=19$m=65536,t=4,p=1$MmV6OWlXZUhiVFRtQ3ZEZw$g/eId2PsAXXrY78DiCNXJ06tsCnl6JIEzoYe6wcbdtk', NULL, 11, NULL, NULL, 'AC'),
(72, 'admin@rostand.fr', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$cWpjcXc1NkVCa29sZGtWTw$sWGMdvzujruwR975yMtIMDRRUQ1d/qUoU4jqdRiq9Gc', NULL, NULL, NULL, NULL, 'AC'),
(77, 'patrick.mailhe@ac-normandie.fr', '[\"ROLE_ENSEIGNANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$M8TWLYaMKul/9Xdco/TFig$TU08OSlF4Ue2zTrIKcuFZbjqweSWfHuDgGOZTzbhpIM', NULL, 12, NULL, NULL, 'AC'),
(78, 'Anne-Marie.Renard@ac-caen.fr', '[\"ROLE_ENSEIGNANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$dmqbX/y9ADxd62YQzrYZXA$sS8tj+MCPZd2Z4HZd0qJTVmLZW1UwbGUhtcGzXXLFSI', NULL, 13, NULL, NULL, 'AC'),
(82, 'Chevalier-Paul.Ngo@ac-caen.fr', '[\"ROLE_ENSEIGNANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$ioLHp2KbXX2gfh9PoCl9Ug$C1EvvekIL5tZ8FDLAkTmuXloy0aqiBaBfB3+b4kocuo', NULL, 14, NULL, NULL, 'AC'),
(93, 'xigam90675@submic.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$jRoZH/WACh5zYyT5e+jkLw$HNqgcV1CpgVtSBeTA/im3pz71PMVW06+fwCL7tHFbx0', 90, NULL, NULL, '2022-02-24 13:20:49', 'AC'),
(94, 'tasserit.nicolas@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$QTuM/HjN14W/rfJKejUw3A$/qqUsIFz0cUcyomeZLoh6i8XX9WYPWDEcNdOpdLJOFg', 91, NULL, NULL, '2022-02-24 14:27:04', 'AC'),
(95, 'v.ponganne50@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$w+GCPEQcBX4Hm5uvW1YvQw$AypV+hR9d7Z6UpoyAxoPEpPgsgmPY3yUyk0Bl2iquMo', 92, NULL, NULL, '2022-02-24 14:27:08', 'AC'),
(96, 'hugo.bicherel5@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$r2cDIB6thnRF3OOtZxV0ZQ$GoYc5+TGfBFeQ1KHKhnRpL4iwdrcXnOkQLCCoFXazmQ', 93, NULL, NULL, '2022-02-24 14:27:22', 'AC'),
(97, 'hichamansriz@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$m1nuHiaiwuXlT2oSjPxxWQ$I/t0V4WE3ae+w26T40aoJDpUVfRFw9I7tc675U6quaM', 94, NULL, NULL, '2022-02-24 14:27:22', 'AC'),
(98, 'edouard.trsek22@gmail.comLLL', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$YkrSw5QtAdeGVyWR/53Zyw$YPG4/R6FZou3Fq3Y45IV71bO/xfXxYV9HE7umjXx/HU', 95, NULL, NULL, '2022-02-24 14:27:46', 'AC'),
(99, 'rafetgs2000@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$0nFbTN5cXYq3rDZVUDb+UA$9hyQynXwF8dh1PBoedTQh4KghkjcZMW08/ZpCKTJeUc', 96, NULL, NULL, '2022-02-24 14:27:54', 'AC'),
(100, 'sethmuken@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$az1HNC+qCT+Qd85uumNsDA$yJf0jb2Z8mcb0eKl9AONvhEPcb2d+8hDRZZ+MoGY7/I', 97, NULL, NULL, '2022-02-24 14:28:16', 'AC'),
(101, 'loismaraton5@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$b1Oy4JhVC5gctQ+jH9DDNQ$qe+j943k0v03Rv3mJw/2CI6QC3QVIBRjogo1Sk82d3Y', 98, NULL, NULL, '2022-02-24 14:28:19', 'AC'),
(102, 'cadicjulien14@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$ro0o4mRDNf80QnjROORMow$coJejRbXYjNoivrsRnWnMzj+/W9UOTAs3tsZY+58ehQ', 99, NULL, NULL, '2022-02-24 14:28:34', 'AC'),
(103, 'enzothellierpro@gmx.fr', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$5QQKwKH1glOPhTypcLr7jQ$JBS54aKEt6fKAPiATQ8rsb9SdFHx108Ga5uWcqmer+Q', 100, NULL, NULL, '2022-02-24 14:35:49', 'AC'),
(104, 'theoloyer50@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$MaWZ0Q5BoInFiuwcH+hy3w$fbh3Vp7pbxkOAQ7EVNk54uXYOgtJgu/uli6ZyLinfEg', 101, NULL, NULL, '2022-02-24 14:37:39', 'AC'),
(105, 'joffrey.lecheminant@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$vpyrz6amPJDmNrKj13JjFg$VJ5QmtefB0B8rnq5O3ajIH/ea/rFcOAm4+u6EOipKfs', 102, NULL, NULL, '2022-02-24 14:38:17', 'AC'),
(106, 'nathan.mauduit14@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$pFVoZhWZTuejlUY70NlHHg$lR+Y/mUO4VqDuHWiBGLXzM+5oPZ51MlUvzqKFYz0jes', 103, NULL, NULL, '2022-02-24 14:38:37', 'AC'),
(107, 'lucasrambaud@protonmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$GAnIw7qXMBl9zPKWKo6G5g$cSBlKtG2kOI1i7p9R8daFsXbeKCygXxn63X37joFhRg', 104, NULL, NULL, '2022-02-24 14:44:43', 'AC'),
(108, 'bastienleviautre@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$sEQjizkr6qi2wS8evwVvQQ$67+i0u4mAvyaJCzkWb3bCV0QN38nxJrop/MQAz2LJjo', 105, NULL, NULL, '2022-02-24 14:46:31', 'AC'),
(109, 'remi.rosel45@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$fflLy1LF/pYqI+pOLxAXHg$T269azTOcErcPqdP+Nh6f2g5TJSeTcoYbg/z+kF+xQo', 106, NULL, NULL, '2022-02-24 14:46:35', 'AC'),
(111, 'test@test.fr', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$Bw6BqawUBrBubzg4p54r2Q$SucBcFX2VSVam4Z20da3hfLQQk/AEdQMc14hcClAyQI', 108, NULL, NULL, '2022-02-28 17:53:19', 'AC'),
(112, 'alexandre.deal12@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$66xbaHGSWdXe7TAxg+a9Zw$JWB5htj1xeAbJHgzO9Q7IzoxgGYKNFIAw1XlaBzf+dw', 109, NULL, NULL, '2022-03-01 09:42:39', 'AC'),
(113, 'guilbertthomas14@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$WIoXe7SEU0qR3c4t/DU0eA$JO6BiwFOZC8gk/0qvpe5EJsdFtO7w8Giov6jhMyV0pg', 110, NULL, NULL, '2022-03-01 10:24:30', 'AC'),
(114, 'thomas.vereecke@mfrtrun.fr', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$bn/7OC+xtuUZSFtR53nYsA$DtSQW/Z9z3/DYtOlvuh1LWjh+WSsR6chyn3JOeG97uw', 111, NULL, NULL, '2022-03-01 10:24:42', 'AC'),
(115, 'nathan14.cahaigne@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$CrDkZMGPzs8zZaN0OykgSA$+cj/iVUnD/K51Y8LhKWyJPyuLtTdeWO9oFzBXIQkk08', 112, NULL, NULL, '2022-03-01 10:25:11', 'AC'),
(116, 'julienlemoine14@live.fr', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$gA8IeKC2NobHVwSZVUXJmQ$q57FAuziW36TlhS44AgJaY3CGCIvtTrkopTR2qgZPRg', 113, NULL, NULL, '2022-03-01 10:25:31', 'AC'),
(117, 'charlottelau50@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$HUOvokU0rcTo1vNn18+qEw$hPPlRAw9AoJSjAcO9D7+KTWLPz2wabil7QlPfleMPj0', 114, NULL, NULL, '2022-03-01 10:26:40', 'AC'),
(118, 'teolelievre2610@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$VwFIy8dtnPMuDSY68PCMKQ$Iq0/ygRmB/UT5ve5QmOx1jbp0qD8Eo19pk3BCvRGvVY', 115, NULL, NULL, '2022-03-01 10:26:50', 'AC'),
(119, 'elmusaui.ouael@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$kkX11aKGBUhNNgSv9v4ZCg$4tHRmwLEdCSf+lXGiORXpws6gqcAfzA1SV/s75o4xyk', 116, NULL, NULL, '2022-03-01 10:26:51', 'AC'),
(120, 'thomasovann@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$dzCiV0m9GwOB35JOXD0/Nw$xoTu5L+tPCF09wcssJ5T/PIL7z1WTpk01rLE+363/Tg', 117, NULL, NULL, '2022-03-01 10:26:56', 'AC'),
(121, 'louisherman@caramail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$trVJeL5zY48xpuw7rQzvwA$6316LjtQ39oUvKax1OfUwVoUWoHjcLW5A71x3P372Wg', 118, NULL, NULL, '2022-03-01 10:26:58', 'AC'),
(122, 'ardelaidedjae@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$cabJKjo/6AmigHv1tQh01A$100ozd2r2xBad6dIHi7mtyIMp5lIHQfXan0ihoE85XE', 119, NULL, NULL, '2022-03-01 10:27:03', 'AC'),
(123, 'martinguillaume509@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$95aHlmlQuPvbtWfAbsA2Cg$3/8dCAgvirVlO8IcYlQya8TvLr2mYjAPgHaoXw7Mz8Q', 120, NULL, NULL, '2022-03-01 10:27:13', 'AC'),
(124, 'valentinlemarie50@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$No9K9/jA0Tyhy11Vj4/NVw$Beo/0aFJFr0fwaQY91K/JcOyU9I6s/t/PX2co/T4ZkA', 121, NULL, NULL, '2022-03-01 10:27:34', 'AC'),
(125, 'benjamin.loiseau62@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$1SJcwWFftdX6JjsLaRr2Tw$CsCodHZuKFTCVT0kN+IdstDtJYtkriiqd9zMNDrtJ8k', 122, NULL, NULL, '2022-03-01 10:27:40', 'AC'),
(126, 'afarietti@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$LjRojNzmKkUHpdoXNW0/Ww$uNU4KVpMuXABZk4d/PLsJyQxM/2me+BkfloqXElbyEk', 123, NULL, NULL, '2022-03-01 10:45:30', 'AC'),
(127, 'edouard.trsek22@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$GNE4AaDoR+dLYG61jAep1A$IkqN7y25eEOOWyl8Zgvd2A3JWzqucBp72n3gxD7bw/8', 124, NULL, NULL, '2022-03-09 13:14:26', 'AC'),
(128, 'serge.guerinet@ac-normandie.fr', '[\"ROLE_ENSEIGNANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$Q8OqL0Px2xZrVDClrDo6lQ$kaleaf7vJ/7+PfUcn2sE2JjjJRwOehdeswnpBSFDQao', NULL, 15, NULL, NULL, 'AC'),
(129, 'robin.garbaciak@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$NjBTA+3TTmYpYt0syjL6Fg$rDarLx0v71mzA/y4Y7aHVvOy6z8J0xHEXJc9zxV4B3w', 125, NULL, NULL, '2022-03-14 08:50:21', 'AC'),
(130, 'loanboulin@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$6VwtHzUuyMBrRY3/k3dPtA$pYDhyGo+XcjOWaZaS2l6ooy2wSZ2EjS4PyC7tOAf+GM', 126, NULL, NULL, '2022-03-14 08:50:31', 'AC'),
(131, 'kevin.malle14000@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$+5IPlm+W3ImclU/Nu2Ln2g$S4a0vZPp0bVehwcjZtGCpBoPCX388qSArbBDiJw8zrU', 127, NULL, NULL, '2022-03-14 08:50:37', 'AC'),
(132, 'ludovicevrin@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$0j2otN+Rkb4zcUILovyuew$AFzVkHJo7mSga/N67j4ATgkTwMh44o3IeFsE9h9GaWw', 128, NULL, NULL, '2022-03-14 08:50:39', 'AC'),
(133, 'alexycharon1909@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$sB+cqLPqwwStsJXDw0JcUw$Cc97Hz0W31MWSGbMM8PRk2o0pT41myVyM42LQ714rYU', 129, NULL, NULL, '2022-03-14 08:50:48', 'AC'),
(134, 'lai2val1@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$MfnLjhMd3RBOF4skFzmklA$HDOyrqjuPSjskod2rThIWWa/WXNozPUjPjJ9fNKYgwc', 130, NULL, NULL, '2022-03-14 08:50:56', 'AC'),
(135, 'donatien.letonnelier@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$C5ibSs4bKW6xHSEtBsgE7Q$aGolv1AjVYb5H1W3DBb9+KnkC5Wz5PvhCne4uGqe5FA', 131, NULL, NULL, '2022-03-14 08:51:00', 'AC'),
(136, 'victorrenault87@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$vKToDrPsQAcYsXNB8cLAfQ$cuEXn9mOtsngG6sGbGQpnpzTVXMz4CbrKHeKVaUZLm0', 132, NULL, NULL, '2022-03-14 08:51:04', 'AC'),
(137, 'antonindpy@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$m3ILE3CiQr8tItEKCuEWIQ$AtbiPSMw1JvD2ibC6QekJB46mxUdcZfRZgnxC16gOQM', 133, NULL, NULL, '2022-03-14 08:51:12', 'AC'),
(138, 'amine.elhankouri@live.fr', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$rq9Yu4O4tDuHUXThVZDgvA$XoqcrFsvSnfrcBZOsgFUx3iCaTn4FNXBykZHf7a8o+I', 134, NULL, NULL, '2022-03-14 08:51:21', 'AC'),
(139, 'dylanaumond@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$zYq9ZaAhaXl44aOh3FPIbw$77PMLS3uP+I1Eg5yzqOayzsGDZlV2OUkf9yRlkSUJj0', 135, NULL, NULL, '2022-03-14 08:53:42', 'AC'),
(140, 'flo.rousseau14210@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$tN8LYoiPGyvn2wM8O2Empg$5Sr7xgn10Iq9IAclHwzkk/Rc57/8G6uw4+Eu6Zh+yAQ', 136, NULL, NULL, '2022-03-14 08:54:46', 'AC'),
(141, 'leroy.alexandre.david@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$0rA25TF+XVhlbnasJ/0g5w$Za7WBVIf6zfGjVvyCTeRzqZoCk+KtSFfiHnqC61jz0Q', 137, NULL, NULL, '2022-03-14 09:04:05', 'AC'),
(142, 'neo.cayet@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$KQtq7GSzfz/DNv4cAxutpQ$wOdWAw2V2uPt3g2VUhnmh3uXtwgOb3POUNqnH/e7CO8', 138, NULL, NULL, '2022-03-14 09:07:25', 'AC'),
(143, 'fabien.lebouteiller@outlook.fr', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$0i+d1/7sMqJfnHI7588lpw$7rYjDMnw4Cn/5WxiwTmRIw4RulyXXlSH94bzqVr6hIo', 139, NULL, NULL, '2022-03-14 09:08:05', 'AC'),
(144, 'matisse.chaillou@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$Y949v0xVwmWV8acVctuzZg$mFucrnmszwR7uidv/1GhD+B6d2KWdmclIHPvWpRg0nY', 140, NULL, NULL, '2022-03-14 09:13:12', 'AC'),
(145, 'matteo.gorris@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$L5PghiVktNIvQSJ21H/sQQ$Av3UqBnD2OQfuoQo+4iwwjx1jCQcHNogkpdtd1qnlh4', 141, NULL, NULL, '2022-03-14 09:13:40', 'AC'),
(146, 'chourot31@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$cejKiGQkiJqif2r5Fd81Vw$tudn6zwu22r4n4MxfeWDuE10o6TokOvN4gfkGEwNURY', 142, NULL, NULL, '2022-03-14 09:13:53', 'AC'),
(147, 'maxime.bellegueille@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$zyxd8PyT3kp2hnwsOBZvuA$agjzqlsOFAUK+yiTNwldLUjgv6s8z0R8Q/7ZYOTSzmc', 143, NULL, NULL, '2022-03-14 09:14:16', 'AC'),
(148, 'dorian.kozick@gmail.com', '[\"ROLE_ETUDIANT\"]', '$argon2id$v=19$m=65536,t=4,p=1$fHB7DhYB1EcyUaVXW+yrUQ$3989S6PomtY3wrNsJum8LYgEuS0VW/kzuonBwOHQmyg', 144, NULL, NULL, '2022-03-14 09:17:58', 'AC');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `activite`
--
ALTER TABLE `activite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B87555155582E9C0` (`bloc_id`);

--
-- Index pour la table `bloc`
--
ALTER TABLE `bloc`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cadre`
--
ALTER TABLE `cadre`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_67F068BCE455FCC0` (`enseignant_id`),
  ADD KEY `IDX_67F068BCB70FF80C` (`rp_id`);

--
-- Index pour la table `competence`
--
ALTER TABLE `competence`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_94D4687F9B0F88B1` (`activite_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `domaine_tache`
--
ALTER TABLE `domaine_tache`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_81A72FA1F46CD258` (`matiere_id`),
  ADD KEY `IDX_81A72FA1B3E9C81` (`niveau_id`);

--
-- Index pour la table `epreuve`
--
ALTER TABLE `epreuve`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_717E22E3139DF194` (`promotion_id`),
  ADD KEY `IDX_717E22E3B3E9C81` (`niveau_id`),
  ADD KEY `IDX_717E22E32195E0F0` (`specialite_id`);

--
-- Index pour la table `jour`
--
ALTER TABLE `jour`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `localisation`
--
ALTER TABLE `localisation`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `niveau`
--
ALTER TABLE `niveau`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `niveau_rp`
--
ALTER TABLE `niveau_rp`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `note_epreuve`
--
ALTER TABLE `note_epreuve`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_570B20E5DDEAB1A3` (`etudiant_id`),
  ADD KEY `IDX_570B20E5AB990336` (`epreuve_id`);

--
-- Index pour la table `pointage`
--
ALTER TABLE `pointage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7591B202298D193` (`stage_id`);

--
-- Index pour la table `production`
--
ALTER TABLE `production`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D3EDB1E0B70FF80C` (`rp_id`);

--
-- Index pour la table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7CE748AA76ED395` (`user_id`);

--
-- Index pour la table `rp`
--
ALTER TABLE `rp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_CD578B7C68BE09C` (`localisation_id`),
  ADD KEY `IDX_CD578B7F6203804` (`statut_id`),
  ADD KEY `IDX_CD578B7953C1C61` (`source_id`),
  ADD KEY `IDX_CD578B7DDEAB1A3` (`etudiant_id`),
  ADD KEY `IDX_CD578B7E455FCC0` (`enseignant_id`),
  ADD KEY `IDX_CD578B79308DA90` (`cadre_id`),
  ADD KEY `IDX_CD578B752680A6A` (`niveau_rp_id`);

--
-- Index pour la table `rpactivite`
--
ALTER TABLE `rpactivite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_3CC2747A9B0F88B1` (`activite_id`),
  ADD KEY `IDX_3CC2747AB70FF80C` (`rp_id`);

--
-- Index pour la table `semaine_stage`
--
ALTER TABLE `semaine_stage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_877C1C32298D193` (`stage_id`);

--
-- Index pour la table `source`
--
ALTER TABLE `source`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `specialite`
--
ALTER TABLE `specialite`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `stage`
--
ALTER TABLE `stage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C27C9369DDEAB1A3` (`etudiant_id`),
  ADD KEY `IDX_C27C9369E455FCC0` (`enseignant_id`);

--
-- Index pour la table `statut`
--
ALTER TABLE `statut`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tache_semaine`
--
ALTER TABLE `tache_semaine`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B11BB55F6542D8E6` (`domaine_tache_id`),
  ADD KEY `IDX_B11BB55F220C6AD0` (`jour_id`),
  ADD KEY `IDX_B11BB55FE928EFB1` (`semaine_stage_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`),
  ADD UNIQUE KEY `UNIQ_8D93D649DDEAB1A3` (`etudiant_id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E455FCC0` (`enseignant_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `activite`
--
ALTER TABLE `activite`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `bloc`
--
ALTER TABLE `bloc`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `cadre`
--
ALTER TABLE `cadre`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `competence`
--
ALTER TABLE `competence`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT pour la table `domaine_tache`
--
ALTER TABLE `domaine_tache`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT pour la table `enseignant`
--
ALTER TABLE `enseignant`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `epreuve`
--
ALTER TABLE `epreuve`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT pour la table `jour`
--
ALTER TABLE `jour`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `localisation`
--
ALTER TABLE `localisation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `matiere`
--
ALTER TABLE `matiere`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `niveau`
--
ALTER TABLE `niveau`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `niveau_rp`
--
ALTER TABLE `niveau_rp`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `note_epreuve`
--
ALTER TABLE `note_epreuve`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `pointage`
--
ALTER TABLE `pointage`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `production`
--
ALTER TABLE `production`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `rp`
--
ALTER TABLE `rp`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT pour la table `rpactivite`
--
ALTER TABLE `rpactivite`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=235;

--
-- AUTO_INCREMENT pour la table `semaine_stage`
--
ALTER TABLE `semaine_stage`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `source`
--
ALTER TABLE `source`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `specialite`
--
ALTER TABLE `specialite`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `stage`
--
ALTER TABLE `stage`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `statut`
--
ALTER TABLE `statut`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `tache_semaine`
--
ALTER TABLE `tache_semaine`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `activite`
--
ALTER TABLE `activite`
  ADD CONSTRAINT `FK_B87555155582E9C0` FOREIGN KEY (`bloc_id`) REFERENCES `bloc` (`id`);

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `FK_67F068BCB70FF80C` FOREIGN KEY (`rp_id`) REFERENCES `rp` (`id`),
  ADD CONSTRAINT `FK_67F068BCE455FCC0` FOREIGN KEY (`enseignant_id`) REFERENCES `enseignant` (`id`);

--
-- Contraintes pour la table `competence`
--
ALTER TABLE `competence`
  ADD CONSTRAINT `FK_94D4687F9B0F88B1` FOREIGN KEY (`activite_id`) REFERENCES `activite` (`id`);

--
-- Contraintes pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD CONSTRAINT `FK_81A72FA1B3E9C81` FOREIGN KEY (`niveau_id`) REFERENCES `niveau` (`id`),
  ADD CONSTRAINT `FK_81A72FA1F46CD258` FOREIGN KEY (`matiere_id`) REFERENCES `matiere` (`id`);

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `FK_717E22E3139DF194` FOREIGN KEY (`promotion_id`) REFERENCES `promotion` (`id`),
  ADD CONSTRAINT `FK_717E22E32195E0F0` FOREIGN KEY (`specialite_id`) REFERENCES `specialite` (`id`),
  ADD CONSTRAINT `FK_717E22E3B3E9C81` FOREIGN KEY (`niveau_id`) REFERENCES `niveau` (`id`);

--
-- Contraintes pour la table `note_epreuve`
--
ALTER TABLE `note_epreuve`
  ADD CONSTRAINT `FK_570B20E5AB990336` FOREIGN KEY (`epreuve_id`) REFERENCES `epreuve` (`id`),
  ADD CONSTRAINT `FK_570B20E5DDEAB1A3` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiant` (`id`);

--
-- Contraintes pour la table `pointage`
--
ALTER TABLE `pointage`
  ADD CONSTRAINT `FK_7591B202298D193` FOREIGN KEY (`stage_id`) REFERENCES `stage` (`id`);

--
-- Contraintes pour la table `production`
--
ALTER TABLE `production`
  ADD CONSTRAINT `FK_D3EDB1E0B70FF80C` FOREIGN KEY (`rp_id`) REFERENCES `rp` (`id`);

--
-- Contraintes pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `rp`
--
ALTER TABLE `rp`
  ADD CONSTRAINT `FK_CD578B752680A6A` FOREIGN KEY (`niveau_rp_id`) REFERENCES `niveau_rp` (`id`),
  ADD CONSTRAINT `FK_CD578B79308DA90` FOREIGN KEY (`cadre_id`) REFERENCES `cadre` (`id`),
  ADD CONSTRAINT `FK_CD578B7953C1C61` FOREIGN KEY (`source_id`) REFERENCES `source` (`id`),
  ADD CONSTRAINT `FK_CD578B7C68BE09C` FOREIGN KEY (`localisation_id`) REFERENCES `localisation` (`id`),
  ADD CONSTRAINT `FK_CD578B7DDEAB1A3` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiant` (`id`),
  ADD CONSTRAINT `FK_CD578B7E455FCC0` FOREIGN KEY (`enseignant_id`) REFERENCES `enseignant` (`id`),
  ADD CONSTRAINT `FK_CD578B7F6203804` FOREIGN KEY (`statut_id`) REFERENCES `statut` (`id`);

--
-- Contraintes pour la table `rpactivite`
--
ALTER TABLE `rpactivite`
  ADD CONSTRAINT `FK_3CC2747A9B0F88B1` FOREIGN KEY (`activite_id`) REFERENCES `activite` (`id`),
  ADD CONSTRAINT `FK_3CC2747AB70FF80C` FOREIGN KEY (`rp_id`) REFERENCES `rp` (`id`);

--
-- Contraintes pour la table `semaine_stage`
--
ALTER TABLE `semaine_stage`
  ADD CONSTRAINT `FK_877C1C32298D193` FOREIGN KEY (`stage_id`) REFERENCES `stage` (`id`);

--
-- Contraintes pour la table `stage`
--
ALTER TABLE `stage`
  ADD CONSTRAINT `FK_C27C9369DDEAB1A3` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiant` (`id`),
  ADD CONSTRAINT `FK_C27C9369E455FCC0` FOREIGN KEY (`enseignant_id`) REFERENCES `enseignant` (`id`);

--
-- Contraintes pour la table `tache_semaine`
--
ALTER TABLE `tache_semaine`
  ADD CONSTRAINT `FK_B11BB55F220C6AD0` FOREIGN KEY (`jour_id`) REFERENCES `jour` (`id`),
  ADD CONSTRAINT `FK_B11BB55F6542D8E6` FOREIGN KEY (`domaine_tache_id`) REFERENCES `domaine_tache` (`id`),
  ADD CONSTRAINT `FK_B11BB55FE928EFB1` FOREIGN KEY (`semaine_stage_id`) REFERENCES `semaine_stage` (`id`);

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_8D93D649DDEAB1A3` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiant` (`id`),
  ADD CONSTRAINT `FK_8D93D649E455FCC0` FOREIGN KEY (`enseignant_id`) REFERENCES `enseignant` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
