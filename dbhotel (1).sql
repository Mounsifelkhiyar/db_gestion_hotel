-- phpMyAdmin SQL Dump
-- version 3.4.9
-- http://www.phpmyadmin.net
--
-- Client: 127.0.0.1
-- Généré le : Mar 04 Juin 2019 à 21:42
-- Version du serveur: 5.5.20
-- Version de PHP: 5.3.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `dbhotel`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `IDADMIN` decimal(8,0) NOT NULL,
  `NOMADMIN` text,
  `PRENOMADMIN` text,
  `EMAILADMIN` text,
  `PASSWORDADMIN` longtext,
  `TELADMIN` decimal(8,0) DEFAULT NULL,
  PRIMARY KEY (`IDADMIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `admin`
--

INSERT INTO `admin` (`IDADMIN`, `NOMADMIN`, `PRENOMADMIN`, `EMAILADMIN`, `PASSWORDADMIN`, `TELADMIN`) VALUES
('1', 'el khiyar', 'monsif', 'monsif@gmail.com', '741', '5');

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE IF NOT EXISTS `categorie` (
  `ID_CATEGORIE` decimal(8,0) NOT NULL,
  `TYPE` text,
  PRIMARY KEY (`ID_CATEGORIE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`ID_CATEGORIE`, `TYPE`) VALUES
('1', 'simple'),
('2', 'double'),
('3', 'triple'),
('4', 'quatre');

-- --------------------------------------------------------

--
-- Structure de la table `chambre`
--

CREATE TABLE IF NOT EXISTS `chambre` (
  `id_CHAMBRE` int(11) NOT NULL AUTO_INCREMENT,
  `N_HOTEL` int(11) NOT NULL,
  `ID_CATEGORIE` decimal(8,0) NOT NULL,
  `TEL_CHAMBRE` decimal(8,0) DEFAULT NULL,
  `N_CHAMBRE` int(11) NOT NULL,
  PRIMARY KEY (`id_CHAMBRE`),
  KEY `fq_categchambre` (`ID_CATEGORIE`),
  KEY `fk_hotelchambre` (`N_HOTEL`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Contenu de la table `chambre`
--

INSERT INTO `chambre` (`id_CHAMBRE`, `N_HOTEL`, `ID_CATEGORIE`, `TEL_CHAMBRE`, `N_CHAMBRE`) VALUES
(13, 10, '2', '625456', 10),
(14, 11, '1', '75361', 7),
(15, 12, '3', '18742', 11),
(16, 10, '1', '625456', 1),
(17, 11, '1', '18337905', 2),
(18, 12, '1', '123513', 3);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `NOMCLIENT` text,
  `PRENOMCLIENT` text,
  `ADDRESSCLIENT` text,
  `EMAILCLIENT` text,
  `TELCLIENT` decimal(8,0) DEFAULT NULL,
  `ID_CLIENT` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID_CLIENT`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=62 ;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`NOMCLIENT`, `PRENOMCLIENT`, `ADDRESSCLIENT`, `EMAILCLIENT`, `TELCLIENT`, `ID_CLIENT`) VALUES
('hamidi', 'ali', 'agadir ', 'hamid@gmail.com', '6951', 52),
('mohemed', 'rachid', 'ait meloul', 'achraf@gmail.com', '6951', 53),
('hamidi', 'rachid', 'ait meloul', 'hamidi@gmail.com', '6951', 54),
('mohemed', 'ali', 'ait meloul', 'ali@gmail.com', '6951', 56),
('achraf', 'rachid', 'agadir ', 'achraf@gmail.com', '6584', 57),
('mohemed', 'el madani', 'guelmim', 'madani@gmail.com', '123654', 58),
('vol', 'mounsif', 'ait meloul', 'vol@gmail.com', '456212', 59),
('El khiyar', 'toto', 'houda-ait melloul', 'toto@gmail.com', '15302', 60),
('El madani', 'khalid', 'el khalil', 'khalid@gmail.com', '95146', 61);

-- --------------------------------------------------------

--
-- Structure de la table `concerne`
--

CREATE TABLE IF NOT EXISTS `concerne` (
  `N_RESERVATION` int(11) NOT NULL,
  `id_CHAMBRE` int(11) NOT NULL,
  `id_CONCERNE` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_CONCERNE`),
  KEY `concerne_idchambre` (`id_CHAMBRE`),
  KEY `fk_concerneRESERVATION` (`N_RESERVATION`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `concerne`
--

INSERT INTO `concerne` (`N_RESERVATION`, `id_CHAMBRE`, `id_CONCERNE`) VALUES
(1, 16, 1),
(2, 14, 2);

-- --------------------------------------------------------

--
-- Structure de la table `hotel`
--

CREATE TABLE IF NOT EXISTS `hotel` (
  `N_HOTEL` int(11) NOT NULL AUTO_INCREMENT,
  `ID_VILLE` decimal(8,0) NOT NULL,
  `NOM_HOTEL_` text,
  `ADRESSE_HOTEL_` text,
  `TEL_HOTEL_` decimal(8,0) DEFAULT NULL,
  `NBR_ETOILE` decimal(8,0) DEFAULT NULL,
  `photo_hotel` text NOT NULL,
  PRIMARY KEY (`N_HOTEL`),
  KEY `FK_APPARTIENT` (`ID_VILLE`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Contenu de la table `hotel`
--

INSERT INTO `hotel` (`N_HOTEL`, `ID_VILLE`, `NOM_HOTEL_`, `ADRESSE_HOTEL_`, `TEL_HOTEL_`, `NBR_ETOILE`, `photo_hotel`) VALUES
(10, '1', 'hotel agadir', 'houda', '134', '5', 'hotel-2'),
(11, '5', 'hotel raba', 'center-octo', '95146', '3', 'hotel-3'),
(12, '2', 'hotel amogar', 'houda2', '15643', '1', 'blog-3'),
(13, '5', 'hotel prince', 'mall', '951235', '4', 'prince'),
(14, '1', 'hotel royal', 'bits-houda', '148632', '5', 'royal2');

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

CREATE TABLE IF NOT EXISTS `paiement` (
  `ID_PAIEMENT` decimal(8,0) NOT NULL,
  `DATE_PAIEMENT` date DEFAULT NULL,
  `SOMME` decimal(8,0) DEFAULT NULL,
  `n_reservation` int(11) NOT NULL,
  PRIMARY KEY (`ID_PAIEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `paiement`
--

INSERT INTO `paiement` (`ID_PAIEMENT`, `DATE_PAIEMENT`, `SOMME`, `n_reservation`) VALUES
('1', NULL, NULL, 0),
('2', '2019-04-01', '6', 0);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE IF NOT EXISTS `reservation` (
  `N_RESERVATION` int(11) NOT NULL AUTO_INCREMENT,
  `ID_CLIENT` int(11) NOT NULL,
  `DATE_DEBUT` date DEFAULT NULL,
  `DATE_FIN` date DEFAULT NULL,
  PRIMARY KEY (`N_RESERVATION`),
  KEY `fk_clientreserv` (`ID_CLIENT`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `reservation`
--

INSERT INTO `reservation` (`N_RESERVATION`, `ID_CLIENT`, `DATE_DEBUT`, `DATE_FIN`) VALUES
(1, 60, '2019-05-01', '2019-05-18'),
(2, 61, '2019-05-30', '2019-06-19');

-- --------------------------------------------------------

--
-- Structure de la table `valider`
--

CREATE TABLE IF NOT EXISTS `valider` (
  `IDADMIN` decimal(8,0) NOT NULL,
  `N_RESERVATION` decimal(8,0) NOT NULL,
  PRIMARY KEY (`IDADMIN`,`N_RESERVATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

CREATE TABLE IF NOT EXISTS `ville` (
  `ID_VILLE` decimal(8,0) NOT NULL,
  `NOM_VILLE` text,
  PRIMARY KEY (`ID_VILLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `ville`
--

INSERT INTO `ville` (`ID_VILLE`, `NOM_VILLE`) VALUES
('1', 'agadir'),
('2', 'guelmim'),
('5', 'casa');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `chambre`
--
ALTER TABLE `chambre`
  ADD CONSTRAINT `fk_hotelchambre` FOREIGN KEY (`N_HOTEL`) REFERENCES `hotel` (`N_HOTEL`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fq_categchambre` FOREIGN KEY (`ID_CATEGORIE`) REFERENCES `categorie` (`ID_CATEGORIE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `concerne`
--
ALTER TABLE `concerne`
  ADD CONSTRAINT `concerne_idchambre` FOREIGN KEY (`id_CHAMBRE`) REFERENCES `chambre` (`id_CHAMBRE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_concerneRESERVATION` FOREIGN KEY (`N_RESERVATION`) REFERENCES `reservation` (`N_RESERVATION`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `FK_APPARTIENT` FOREIGN KEY (`ID_VILLE`) REFERENCES `ville` (`ID_VILLE`);

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `fk_clientreserv` FOREIGN KEY (`ID_CLIENT`) REFERENCES `client` (`ID_CLIENT`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
