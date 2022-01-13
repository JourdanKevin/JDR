-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: jdr
-- ------------------------------------------------------
-- Server version	5.5.5-10.3.23-MariaDB-0+deb10u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AtoutHandicap`
--

DROP TABLE IF EXISTS `AtoutHandicap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AtoutHandicap` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_perso` bigint(20) NOT NULL,
  `id_listeAtoutHandicap` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `AtoutHandicap_FK` (`id_perso`),
  KEY `AtoutHandicap_FK_1` (`id_listeAtoutHandicap`),
  CONSTRAINT `AtoutHandicap_FK` FOREIGN KEY (`id_perso`) REFERENCES `personnage` (`id`),
  CONSTRAINT `AtoutHandicap_FK_1` FOREIGN KEY (`id_listeAtoutHandicap`) REFERENCES `listeAtoutHandicap` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AtoutHandicap`
--

LOCK TABLES `AtoutHandicap` WRITE;
/*!40000 ALTER TABLE `AtoutHandicap` DISABLE KEYS */;
/*!40000 ALTER TABLE `AtoutHandicap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribut`
--

DROP TABLE IF EXISTS `attribut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribut` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) COLLATE utf8_bin NOT NULL,
  `coeff` float NOT NULL,
  `maxStatCreation` int(11) NOT NULL,
  `nbUserUP1` int(11) NOT NULL,
  `statBase` int(11) NOT NULL,
  `type` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attribut_FK` (`type`),
  CONSTRAINT `attribut_FK` FOREIGN KEY (`type`) REFERENCES `typeAttribut` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribut`
--

LOCK TABLES `attribut` WRITE;
/*!40000 ALTER TABLE `attribut` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capacite`
--

DROP TABLE IF EXISTS `capacite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `capacite` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) COLLATE utf8_bin NOT NULL,
  `id_typeCapacite` bigint(20) NOT NULL,
  `explication` text COLLATE utf8_bin DEFAULT NULL,
  `maxStatCreation` int(11) NOT NULL,
  `nbUseUp1` int(11) NOT NULL,
  `StatBase` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `capacite_FK` (`id_typeCapacite`),
  CONSTRAINT `capacite_FK` FOREIGN KEY (`id_typeCapacite`) REFERENCES `typeCapacite` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capacite`
--

LOCK TABLES `capacite` WRITE;
/*!40000 ALTER TABLE `capacite` DISABLE KEYS */;
/*!40000 ALTER TABLE `capacite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coeffAttribut`
--

DROP TABLE IF EXISTS `coeffAttribut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coeffAttribut` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coeff` float NOT NULL,
  `id_attribut` bigint(20) NOT NULL,
  `id_typeCoeffPvPm` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `coeffAttribut_FK` (`id_attribut`),
  KEY `coeffAttribut_FK_1` (`id_typeCoeffPvPm`),
  CONSTRAINT `coeffAttribut_FK` FOREIGN KEY (`id_attribut`) REFERENCES `attribut` (`id`),
  CONSTRAINT `coeffAttribut_FK_1` FOREIGN KEY (`id_typeCoeffPvPm`) REFERENCES `typePvPm` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coeffAttribut`
--

LOCK TABLES `coeffAttribut` WRITE;
/*!40000 ALTER TABLE `coeffAttribut` DISABLE KEYS */;
/*!40000 ALTER TABLE `coeffAttribut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `constante`
--

DROP TABLE IF EXISTS `constante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `constante` (
  `nom` varchar(100) COLLATE utf8_bin NOT NULL,
  `pt_ini` int(11) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_typeConstante` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `constante_FK` (`id_typeConstante`),
  CONSTRAINT `constante_FK` FOREIGN KEY (`id_typeConstante`) REFERENCES `typeConstante` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constante`
--

LOCK TABLES `constante` WRITE;
/*!40000 ALTER TABLE `constante` DISABLE KEYS */;
/*!40000 ALTER TABLE `constante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `continent`
--

DROP TABLE IF EXISTS `continent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `continent` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) COLLATE utf8_bin NOT NULL,
  `carte` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `continent`
--

LOCK TABLES `continent` WRITE;
/*!40000 ALTER TABLE `continent` DISABLE KEYS */;
/*!40000 ALTER TABLE `continent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historique`
--

DROP TABLE IF EXISTS `historique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historique` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `historiqueSelect` varchar(100) COLLATE utf8_bin NOT NULL,
  `value` bigint(20) NOT NULL,
  `id_perso` bigint(20) NOT NULL,
  `id_listeHistorique` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `historique_FK` (`id_perso`),
  KEY `historique_FK_1` (`id_listeHistorique`),
  CONSTRAINT `historique_FK` FOREIGN KEY (`id_perso`) REFERENCES `personnage` (`id`),
  CONSTRAINT `historique_FK_1` FOREIGN KEY (`id_listeHistorique`) REFERENCES `listeHistorique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historique`
--

LOCK TABLES `historique` WRITE;
/*!40000 ALTER TABLE `historique` DISABLE KEYS */;
/*!40000 ALTER TABLE `historique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lieu`
--

DROP TABLE IF EXISTS `lieu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lieu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) COLLATE utf8_bin NOT NULL,
  `id_typeLieu` bigint(20) NOT NULL,
  `id_continent` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lieu_FK` (`id_typeLieu`),
  KEY `lieu_FK_1` (`id_continent`),
  CONSTRAINT `lieu_FK` FOREIGN KEY (`id_typeLieu`) REFERENCES `typeLieu` (`id`),
  CONSTRAINT `lieu_FK_1` FOREIGN KEY (`id_continent`) REFERENCES `continent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lieu`
--

LOCK TABLES `lieu` WRITE;
/*!40000 ALTER TABLE `lieu` DISABLE KEYS */;
/*!40000 ALTER TABLE `lieu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listeAtoutHandicap`
--

DROP TABLE IF EXISTS `listeAtoutHandicap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listeAtoutHandicap` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) COLLATE utf8_bin NOT NULL,
  `cout` int(11) NOT NULL,
  `type` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listeAtoutHandicap`
--

LOCK TABLES `listeAtoutHandicap` WRITE;
/*!40000 ALTER TABLE `listeAtoutHandicap` DISABLE KEYS */;
/*!40000 ALTER TABLE `listeAtoutHandicap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listeHistorique`
--

DROP TABLE IF EXISTS `listeHistorique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listeHistorique` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listeHistorique`
--

LOCK TABLES `listeHistorique` WRITE;
/*!40000 ALTER TABLE `listeHistorique` DISABLE KEYS */;
/*!40000 ALTER TABLE `listeHistorique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listePvPm`
--

DROP TABLE IF EXISTS `listePvPm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listePvPm` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) COLLATE utf8_bin NOT NULL,
  `coeff` float NOT NULL,
  `id_typePvPm` bigint(20) NOT NULL,
  `nbUp1` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `listePvPm_FK` (`id_typePvPm`),
  CONSTRAINT `listePvPm_FK` FOREIGN KEY (`id_typePvPm`) REFERENCES `typePvPm` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listePvPm`
--

LOCK TABLES `listePvPm` WRITE;
/*!40000 ALTER TABLE `listePvPm` DISABLE KEYS */;
/*!40000 ALTER TABLE `listePvPm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listeRace`
--

DROP TABLE IF EXISTS `listeRace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listeRace` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `race` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listeRace`
--

LOCK TABLES `listeRace` WRITE;
/*!40000 ALTER TABLE `listeRace` DISABLE KEYS */;
/*!40000 ALTER TABLE `listeRace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listeSort`
--

DROP TABLE IF EXISTS `listeSort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listeSort` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cout` int(11) NOT NULL,
  `valeurEffet` int(11) NOT NULL,
  `id_capacite` bigint(20) NOT NULL,
  `niveau` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `listeSort_FK` (`id_capacite`),
  CONSTRAINT `listeSort_FK` FOREIGN KEY (`id_capacite`) REFERENCES `capacite` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listeSort`
--

LOCK TABLES `listeSort` WRITE;
/*!40000 ALTER TABLE `listeSort` DISABLE KEYS */;
/*!40000 ALTER TABLE `listeSort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personnage`
--

DROP TABLE IF EXISTS `personnage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personnage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) COLLATE utf8_bin NOT NULL,
  `cabale` varchar(100) COLLATE utf8_bin NOT NULL,
  `nature` varchar(100) COLLATE utf8_bin NOT NULL,
  `attitude` varchar(100) COLLATE utf8_bin NOT NULL,
  `tradition` varchar(100) COLLATE utf8_bin NOT NULL,
  `histoire` text COLLATE utf8_bin NOT NULL,
  `id_lieu` bigint(20) NOT NULL,
  `id_race` bigint(20) NOT NULL,
  `id_user` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `personnage_FK` (`id_user`),
  KEY `personnage_FK_1` (`id_lieu`),
  KEY `personnage_FK_2` (`id_race`),
  CONSTRAINT `personnage_FK` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`),
  CONSTRAINT `personnage_FK_1` FOREIGN KEY (`id_lieu`) REFERENCES `lieu` (`id`),
  CONSTRAINT `personnage_FK_2` FOREIGN KEY (`id_race`) REFERENCES `listeRace` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personnage`
--

LOCK TABLES `personnage` WRITE;
/*!40000 ALTER TABLE `personnage` DISABLE KEYS */;
/*!40000 ALTER TABLE `personnage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pvpm`
--

DROP TABLE IF EXISTS `pvpm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pvpm` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `actuel` int(11) NOT NULL,
  `max` int(11) NOT NULL,
  `id_listePmPv` bigint(20) NOT NULL,
  `id_perso` bigint(20) NOT NULL,
  `totPerdu` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pvpm_FK` (`id_perso`),
  KEY `pvpm_FK_1` (`id_listePmPv`),
  CONSTRAINT `pvpm_FK` FOREIGN KEY (`id_perso`) REFERENCES `personnage` (`id`),
  CONSTRAINT `pvpm_FK_1` FOREIGN KEY (`id_listePmPv`) REFERENCES `listePvPm` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pvpm`
--

LOCK TABLES `pvpm` WRITE;
/*!40000 ALTER TABLE `pvpm` DISABLE KEYS */;
/*!40000 ALTER TABLE `pvpm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typeAttribut`
--

DROP TABLE IF EXISTS `typeAttribut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typeAttribut` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeAttribut`
--

LOCK TABLES `typeAttribut` WRITE;
/*!40000 ALTER TABLE `typeAttribut` DISABLE KEYS */;
/*!40000 ALTER TABLE `typeAttribut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typeCapacite`
--

DROP TABLE IF EXISTS `typeCapacite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typeCapacite` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeCapacite`
--

LOCK TABLES `typeCapacite` WRITE;
/*!40000 ALTER TABLE `typeCapacite` DISABLE KEYS */;
/*!40000 ALTER TABLE `typeCapacite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typeConstante`
--

DROP TABLE IF EXISTS `typeConstante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typeConstante` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeConstante`
--

LOCK TABLES `typeConstante` WRITE;
/*!40000 ALTER TABLE `typeConstante` DISABLE KEYS */;
/*!40000 ALTER TABLE `typeConstante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typeLieu`
--

DROP TABLE IF EXISTS `typeLieu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typeLieu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeLieu`
--

LOCK TABLES `typeLieu` WRITE;
/*!40000 ALTER TABLE `typeLieu` DISABLE KEYS */;
/*!40000 ALTER TABLE `typeLieu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typePvPm`
--

DROP TABLE IF EXISTS `typePvPm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typePvPm` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typePvPm`
--

LOCK TABLES `typePvPm` WRITE;
/*!40000 ALTER TABLE `typePvPm` DISABLE KEYS */;
/*!40000 ALTER TABLE `typePvPm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typeUser`
--

DROP TABLE IF EXISTS `typeUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typeUser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nomType` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeUser`
--

LOCK TABLES `typeUser` WRITE;
/*!40000 ALTER TABLE `typeUser` DISABLE KEYS */;
INSERT INTO `typeUser` VALUES (1,'admin');
/*!40000 ALTER TABLE `typeUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typeuser`
--

DROP TABLE IF EXISTS `typeuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typeuser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nomType` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeuser`
--

LOCK TABLES `typeuser` WRITE;
/*!40000 ALTER TABLE `typeuser` DISABLE KEYS */;
INSERT INTO `typeuser` VALUES (1,'admin'),(2,'joueur');
/*!40000 ALTER TABLE `typeuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) COLLATE utf8_bin NOT NULL,
  `prenom` varchar(100) COLLATE utf8_bin NOT NULL,
  `pseudo` varchar(100) COLLATE utf8_bin NOT NULL,
  `mail` varchar(100) COLLATE utf8_bin NOT NULL,
  `mdp` varchar(100) COLLATE utf8_bin NOT NULL,
  `id_typeUser` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_FK` (`id_typeUser`),
  CONSTRAINT `user_FK` FOREIGN KEY (`id_typeUser`) REFERENCES `typeuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'jourdan','kevin','kesivi','kesivi.koori@gmail.com','test',1),(3,'faurie','hugo','huttmine','fauriehugo@gmail.com','test2',2),(6,'Audrey','Wagner','DearShion','audreywagner@laposte.net','proptimeworld',2),(7,'Bendaoud','Harketti','hab','hab@cfai63.fr','cfaig04',2),(9,'test','test','test','jourdan.kevin@outlook.fr','test',2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valeurActuel`
--

DROP TABLE IF EXISTS `valeurActuel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valeurActuel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nbPointActuel` int(11) NOT NULL,
  `id_constante` bigint(20) NOT NULL,
  `id_perso` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `valeurActuel_FK` (`id_constante`),
  KEY `valeurActuel_FK_1` (`id_perso`),
  CONSTRAINT `valeurActuel_FK` FOREIGN KEY (`id_constante`) REFERENCES `constante` (`id`),
  CONSTRAINT `valeurActuel_FK_1` FOREIGN KEY (`id_perso`) REFERENCES `personnage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valeurActuel`
--

LOCK TABLES `valeurActuel` WRITE;
/*!40000 ALTER TABLE `valeurActuel` DISABLE KEYS */;
/*!40000 ALTER TABLE `valeurActuel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valeurAttribut`
--

DROP TABLE IF EXISTS `valeurAttribut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valeurAttribut` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stat` int(11) NOT NULL,
  `id_attribut` bigint(20) NOT NULL,
  `id_perso` bigint(20) NOT NULL,
  `nbUse` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `valeurAttribut_FK` (`id_perso`),
  KEY `valeurAttribut_FK_1` (`id_attribut`),
  CONSTRAINT `valeurAttribut_FK` FOREIGN KEY (`id_perso`) REFERENCES `personnage` (`id`),
  CONSTRAINT `valeurAttribut_FK_1` FOREIGN KEY (`id_attribut`) REFERENCES `attribut` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valeurAttribut`
--

LOCK TABLES `valeurAttribut` WRITE;
/*!40000 ALTER TABLE `valeurAttribut` DISABLE KEYS */;
/*!40000 ALTER TABLE `valeurAttribut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valeurCapacite`
--

DROP TABLE IF EXISTS `valeurCapacite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valeurCapacite` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stat` int(11) NOT NULL,
  `nbUse` int(11) NOT NULL,
  `id_capacite` bigint(20) NOT NULL,
  `id_perso` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `valeurCapacite_FK` (`id_perso`),
  KEY `valeurCapacite_FK_1` (`id_capacite`),
  CONSTRAINT `valeurCapacite_FK` FOREIGN KEY (`id_perso`) REFERENCES `personnage` (`id`),
  CONSTRAINT `valeurCapacite_FK_1` FOREIGN KEY (`id_capacite`) REFERENCES `capacite` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valeurCapacite`
--

LOCK TABLES `valeurCapacite` WRITE;
/*!40000 ALTER TABLE `valeurCapacite` DISABLE KEYS */;
/*!40000 ALTER TABLE `valeurCapacite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'jdr'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-19  0:04:38
