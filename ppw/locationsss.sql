-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Serveur: 127.0.0.1
-- Généré le : Jeu 24 Octobre 2024 à 14:33
-- Version du serveur: 5.5.10
-- Version de PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `location_voiture`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `ncni` int(11) NOT NULL,
  `num_permis` int(11) NOT NULL,
  `nom_prenom` varchar(30) NOT NULL,
  `adresse` varchar(30) NOT NULL,
  `tel` varchar(30) NOT NULL,
  `date_naissance` date NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`ncni`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`ncni`, `num_permis`, `nom_prenom`, `adresse`, `tel`, `date_naissance`, `email`) VALUES
(12, 1000, 'remy', 'paris', '0622', '2005-01-16', 'remy@gmail.com'),
(13, 2000, 'david', 'creteil', '0712', '2003-10-16', 'david@hotmail.fr');

-- --------------------------------------------------------

--
-- Structure de la table `locations`
--

CREATE TABLE IF NOT EXISTS `locations` (
  `id_location` int(11) NOT NULL AUTO_INCREMENT,
  `immatriculation` varchar(20) NOT NULL,
  `ncin` int(11) NOT NULL,
  `duree_location` int(11) NOT NULL,
  `date_location` date NOT NULL,
  `prix_location` int(11) NOT NULL,
  PRIMARY KEY (`id_location`),
  KEY `immatriculation` (`immatriculation`),
  KEY `ncin` (`ncin`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `locations`
--

INSERT INTO `locations` (`id_location`, `immatriculation`, `ncin`, `duree_location`, `date_location`, `prix_location`) VALUES
(1, '77 FR 77', 13, 5, '2024-10-01', 300),
(2, '66 FR 66', 13, 4, '2024-10-16', 200);

-- --------------------------------------------------------

--
-- Structure de la table `voitures`
--

CREATE TABLE IF NOT EXISTS `voitures` (
  `immatriculation` varchar(20) NOT NULL,
  `marque` varchar(20) NOT NULL,
  `modele` varchar(20) NOT NULL,
  `carburant` varchar(20) NOT NULL,
  `kilometrage` int(11) NOT NULL,
  `date_circulation` date NOT NULL,
  `couleur` varchar(20) NOT NULL,
  PRIMARY KEY (`immatriculation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `voitures`
--

INSERT INTO `voitures` (`immatriculation`, `marque`, `modele`, `carburant`, `kilometrage`, `date_circulation`, `couleur`) VALUES
('66 FR 66', 'mercedes', 'gle', 'diesel', 10000, '2024-10-08', 'blanc'),
('77 FR 77', 'peugeot', '308', 'Essence', 20000, '2019-02-05', 'noir');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_2` FOREIGN KEY (`ncin`) REFERENCES `client` (`ncni`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`immatriculation`) REFERENCES `voitures` (`immatriculation`) ON DELETE CASCADE ON UPDATE CASCADE;
