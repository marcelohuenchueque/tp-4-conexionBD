CREATE DATABASE  IF NOT EXISTS `ajedrez` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ajedrez`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: ajedrez
-- ------------------------------------------------------
-- Server version	8.0.31

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
  CONSTRAINT `fk_pieza_casillero` FOREIGN KEY (`idCasillero`) REFERENCES `Casillero` (`idCasillero`),
  CONSTRAINT `fk_Pieza_Color` FOREIGN KEY (`idColor`) REFERENCES `color` (`idColor`),
  CONSTRAINT `fk_Pieza_TipoPieza1` FOREIGN KEY (`idTipoPieza`) REFERENCES `tipopieza` (`idTipoPieza`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pieza`
--

LOCK TABLES `pieza` WRITE;
/*!40000 ALTER TABLE `pieza` DISABLE KEYS */;
INSERT INTO `pieza` VALUES (1,'Reina Blanca',1,1,60,'encarnizada','armada','libre',NULL),(2,'Reina Negra',2,1,4,'encarnizada','armada','libre',NULL),(3,'Rey Blanco',1,2,61,'postrero','tenue','libre',NULL),(4,'Rey Negro',2,2,5,'postrero','tenue','libre',NULL),(5,'Alfil Blanco',1,4,59,'oblicuo','sesgo','libre',NULL),(6,'Alfil Blanco',1,4,62,'oblicuo','sesgo','libre',NULL),(7,'Alfil Negro',2,4,3,'oblicuo','sesgo','libre',NULL),(8,'Alfil Negro',2,4,6,'oblicuo','sesgo','libre',NULL),(9,'Torre Blanca',1,3,57,'directa','homerica','libre',NULL),(10,'Torre Blanca',1,3,64,'directa','homerica','libre',NULL),(11,'Torre Negra',2,3,1,'directa','homerica','libre',NULL),(12,'Torre Negra',2,3,8,'directa','homerica','libre',NULL),(13,'Caballo Blanco',1,5,58,'','ligero','libre',NULL),(14,'Caballo Blanco',1,5,63,'','ligero','libre',NULL),(15,'Caballo Negro',2,5,2,'','ligero','libre',NULL),(16,'Caballo Negro',2,5,7,'','ligero','libre',NULL),(17,'Peón Blanco',1,6,49,'ladino','agresor','libre',NULL),(18,'Peón Blanco',1,6,50,'ladino','agresor','libre',NULL),(19,'Peón Blanco',1,6,51,'ladino','agresor','libre',NULL),(20,'Peón Blanco ',1,6,52,'ladino','agresor','libre',NULL),(21,'Peón Blanco',1,6,53,'ladino','agresor','libre',NULL),(22,'Peón Blanco',1,6,54,'ladino','agresor','libre',NULL),(23,'Peón Blanco',1,6,55,'ladino','agresor','libre',NULL),(24,'Peón Blanco',1,6,56,'ladino','agresor','libre',NULL),(25,'Peón negro',2,6,9,'ladino','agresor','libre',NULL),(26,'Peón negro',2,6,10,'ladino','agresor','libre',NULL),(27,'Peón negro',2,6,11,'ladino','agresor','libre',NULL),(28,'Peón negro',2,6,12,'ladino','agresor','libre',NULL),(29,'Peón negro',2,6,13,'ladino','agresor','libre',NULL),(30,'Peón negro',2,6,14,'ladino','agresor','libre',NULL),(31,'Peón negro',2,6,15,'ladino','agresor','libre',NULL),(32,'Peón negro',2,6,16,'ladino','agresor','libre',NULL);
/*!40000 ALTER TABLE `pieza` ENABLE KEYS */;
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
-- tablero
-- Tabla TABLERO (El padre, sin claves foráneas)
CREATE TABLE tablero (
    idTablero INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL
);
-- Insertamos el tablero principal
INSERT INTO tablero (idTablero, nombre) VALUES 
(1, 'Tablero Principal');

-- Tabla CASILLERO 
CREATE TABLE Casillero (
    idCasillero INT PRIMARY KEY AUTO_INCREMENT,
    idTablero INT,
    fila INT NOT NULL,
    columna INT NOT NULL,
    idColor INT,
    FOREIGN KEY (idTablero) REFERENCES tablero(idTablero),
    FOREIGN KEY (idColor) REFERENCES color(idColor)
);

-- Insertamos los 64 casilleros vinculados al tablero 1 y con su color correspondiente
INSERT INTO Casillero (idTablero, fila, columna, idColor) VALUES 
-- fila 0
(1, 0, 0, 1), (1, 0, 1, 2), (1, 0, 2, 1), (1, 0, 3, 2), (1, 0, 4, 1), (1, 0, 5, 2), (1, 0, 6, 1), (1, 0, 7, 2),
-- Fila 1
(1, 1, 0, 2), (1, 1, 1, 1), (1, 1, 2, 2), (1, 1, 3, 1), (1, 1, 4, 2), (1, 1, 5, 1), (1, 1, 6, 2), (1, 1, 7, 1),
-- Fila 2
(1, 2, 0, 1), (1, 2, 1, 2), (1, 2, 2, 1), (1, 2, 3, 2), (1, 2, 4, 1), (1, 2, 5, 2), (1, 2, 6, 1), (1, 2, 7, 2),
-- Fila 3
(1, 3, 0, 2), (1, 3, 1, 1), (1, 3, 2, 2), (1, 3, 3, 1), (1, 3, 4, 2), (1, 3, 5, 1), (1, 3, 6, 2), (1, 3, 7, 1),
-- Fila 4
(1, 4, 0, 1), (1, 4, 1, 2), (1, 4, 2, 1), (1, 4, 3, 2), (1, 4, 4, 1), (1, 4, 5, 2), (1, 4, 6, 1), (1, 4, 7, 2),
-- Fila 5
(1, 5, 0, 2), (1, 5, 1, 1), (1, 5, 2, 2), (1, 5, 3, 1), (1, 5, 4, 2), (1, 5, 5, 1), (1, 5, 6, 2), (1, 5, 7, 1),
-- Fila 6
(1, 6, 0, 1), (1, 6, 1, 2), (1, 6, 2, 1), (1, 6, 3, 2), (1, 6, 4, 1), (1, 6, 5, 2), (1, 6, 6, 1), (1, 6, 7, 2),
-- Fila 7
(1, 7, 0, 2), (1, 7, 1, 1), (1, 7, 2, 2), (1, 7, 3, 1), (1, 7, 4, 2), (1, 7, 5, 1), (1, 7, 6, 2), (1, 7, 7, 1);
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

-- Dump completed on 2026-09-27 13:35:39
