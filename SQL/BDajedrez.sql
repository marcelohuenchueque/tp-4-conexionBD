CREATE DATABASE  IF NOT EXISTS `ajedrez` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ajedrez`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ajedrez
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `casillero`
--

DROP TABLE IF EXISTS `casillero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casillero` (
  `idCasillero` int NOT NULL AUTO_INCREMENT,
  `idTablero` int DEFAULT NULL,
  `fila` int NOT NULL,
  `columna` int NOT NULL,
  `idColor` int DEFAULT NULL,
  PRIMARY KEY (`idCasillero`),
  KEY `idTablero` (`idTablero`),
  KEY `idColor` (`idColor`),
  CONSTRAINT `casillero_ibfk_1` FOREIGN KEY (`idTablero`) REFERENCES `tablero` (`idTablero`),
  CONSTRAINT `casillero_ibfk_2` FOREIGN KEY (`idColor`) REFERENCES `color` (`idColor`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casillero`
--

LOCK TABLES `casillero` WRITE;
/*!40000 ALTER TABLE `casillero` DISABLE KEYS */;
INSERT INTO `casillero` VALUES (1,1,0,0,1),(2,1,0,1,2),(3,1,0,2,1),(4,1,0,3,2),(5,1,0,4,1),(6,1,0,5,2),(7,1,0,6,1),(8,1,0,7,2),(9,1,1,0,2),(10,1,1,1,1),(11,1,1,2,2),(12,1,1,3,1),(13,1,1,4,2),(14,1,1,5,1),(15,1,1,6,2),(16,1,1,7,1),(17,1,2,0,1),(18,1,2,1,2),(19,1,2,2,1),(20,1,2,3,2),(21,1,2,4,1),(22,1,2,5,2),(23,1,2,6,1),(24,1,2,7,2),(25,1,3,0,2),(26,1,3,1,1),(27,1,3,2,2),(28,1,3,3,1),(29,1,3,4,2),(30,1,3,5,1),(31,1,3,6,2),(32,1,3,7,1),(33,1,4,0,1),(34,1,4,1,2),(35,1,4,2,1),(36,1,4,3,2),(37,1,4,4,1),(38,1,4,5,2),(39,1,4,6,1),(40,1,4,7,2),(41,1,5,0,2),(42,1,5,1,1),(43,1,5,2,2),(44,1,5,3,1),(45,1,5,4,2),(46,1,5,5,1),(47,1,5,6,2),(48,1,5,7,1),(49,1,6,0,1),(50,1,6,1,2),(51,1,6,2,1),(52,1,6,3,2),(53,1,6,4,1),(54,1,6,5,2),(55,1,6,6,1),(56,1,6,7,2),(57,1,7,0,2),(58,1,7,1,1),(59,1,7,2,2),(60,1,7,3,1),(61,1,7,4,2),(62,1,7,5,1),(63,1,7,6,2),(64,1,7,7,1);
/*!40000 ALTER TABLE `casillero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color` (
  `idColor` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idColor`),
  UNIQUE KEY `idColor_UNIQUE` (`idColor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'Blanco'),(2,'Negro');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pieza`
--

DROP TABLE IF EXISTS `pieza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pieza` (
  `idPieza` int unsigned NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) DEFAULT NULL,
  `idColor` int NOT NULL,
  `idTipoPieza` int NOT NULL,
  `idCasillero` int NOT NULL,
  `Movimiento` varchar(45) DEFAULT NULL,
  `Comportamiento` varchar(45) DEFAULT NULL,
  `Estado` varchar(45) DEFAULT NULL,
  `Fecha_Creacion` date DEFAULT NULL,
  PRIMARY KEY (`idPieza`,`idColor`,`idTipoPieza`,`idCasillero`),
  KEY `fk_Pieza_Color_idx` (`idColor`),
  KEY `fk_Pieza_TipoPieza1_idx` (`idTipoPieza`),
  KEY `fk_pieza_casillero_idx` (`idCasillero`),
  CONSTRAINT `fk_pieza_casillero` FOREIGN KEY (`idCasillero`) REFERENCES `casillero` (`idCasillero`),
  CONSTRAINT `fk_Pieza_Color` FOREIGN KEY (`idColor`) REFERENCES `color` (`idColor`),
  CONSTRAINT `fk_Pieza_TipoPieza1` FOREIGN KEY (`idTipoPieza`) REFERENCES `tipopieza` (`idTipoPieza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pieza`
--

LOCK TABLES `pieza` WRITE;
/*!40000 ALTER TABLE `pieza` DISABLE KEYS */;
/*!40000 ALTER TABLE `pieza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tablero`
--

DROP TABLE IF EXISTS `tablero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tablero` (
  `idTablero` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idTablero`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablero`
--

LOCK TABLES `tablero` WRITE;
/*!40000 ALTER TABLE `tablero` DISABLE KEYS */;
INSERT INTO `tablero` VALUES (1,'Tablero Principal');
/*!40000 ALTER TABLE `tablero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipopieza`
--

DROP TABLE IF EXISTS `tipopieza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipopieza` (
  `idTipoPieza` int NOT NULL AUTO_INCREMENT,
  `Descripciondepieza` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipoPieza`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipopieza`
--

LOCK TABLES `tipopieza` WRITE;
/*!40000 ALTER TABLE `tipopieza` DISABLE KEYS */;
INSERT INTO `tipopieza` VALUES (1,'Reina'),(2,'Rey'),(3,'Torre'),(4,'Alfil'),(5,'Caballo'),(6,'Peon');
/*!40000 ALTER TABLE `tipopieza` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-19  8:47:29
