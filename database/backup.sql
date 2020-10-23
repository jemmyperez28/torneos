-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: torneo
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `activacion`
--

DROP TABLE IF EXISTS `activacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activacion` (
  `id_match` int DEFAULT NULL,
  `id_evento` int DEFAULT NULL,
  `activo` varchar(20) DEFAULT NULL,
  KEY `id_match` (`id_match`),
  KEY `id_evento` (`id_evento`),
  CONSTRAINT `activacion_ibfk_1` FOREIGN KEY (`id_match`) REFERENCES `matchs` (`id_match`),
  CONSTRAINT `activacion_ibfk_2` FOREIGN KEY (`id_evento`) REFERENCES `eventos` (`id_evento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activacion`
--

LOCK TABLES `activacion` WRITE;
/*!40000 ALTER TABLE `activacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `activacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos` (
  `id_evento` int NOT NULL AUTO_INCREMENT,
  `nombre_evento` varchar(100) DEFAULT NULL,
  `tipo_evento` varchar(100) DEFAULT NULL,
  `fecha_inicio` varchar(100) DEFAULT NULL,
  `participantes` int DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  `premio` double DEFAULT NULL,
  `owner_evento` int DEFAULT NULL,
  `clave_evento` varchar(100) DEFAULT NULL,
  `paypal` varchar(100) DEFAULT NULL,
  `imagen1` varchar(255) DEFAULT NULL,
  `imagen2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_evento`),
  KEY `owner_evento` (`owner_evento`),
  CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`owner_evento`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (1,'LIGA PRUEBA','LIGA','04/11/2020',16,'INSCRIPCIONES ABIERTAS',2,1,'clavesecreta','www.jemmyperez28.com',NULL,NULL),(2,'LIGA PRUEBA2 ','LIGA','04/11/2020',16,'INSCRIPCIONES ABIERTAS',4,1,'clavesecreta','www.jemmyperez28.com',NULL,NULL);
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos_participantes`
--

DROP TABLE IF EXISTS `eventos_participantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos_participantes` (
  `id_usuario` int DEFAULT NULL,
  `id_evento` int DEFAULT NULL,
  `puntos` int DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  KEY `id_usuario` (`id_usuario`),
  KEY `id_evento` (`id_evento`),
  CONSTRAINT `eventos_participantes_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `eventos_participantes_ibfk_2` FOREIGN KEY (`id_evento`) REFERENCES `eventos` (`id_evento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos_participantes`
--

LOCK TABLES `eventos_participantes` WRITE;
/*!40000 ALTER TABLE `eventos_participantes` DISABLE KEYS */;
INSERT INTO `eventos_participantes` VALUES (1,1,0,'activo'),(1,2,0,'OK');
/*!40000 ALTER TABLE `eventos_participantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_apuestas`
--

DROP TABLE IF EXISTS `historial_apuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_apuestas` (
  `nick` varchar(100) DEFAULT NULL,
  `pronostico` int DEFAULT NULL,
  `match_id` int DEFAULT NULL,
  `evento_id` int DEFAULT NULL,
  KEY `pronostico` (`pronostico`),
  KEY `match_id` (`match_id`),
  KEY `evento_id` (`evento_id`),
  CONSTRAINT `historial_apuestas_ibfk_1` FOREIGN KEY (`pronostico`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `historial_apuestas_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `matchs` (`id_match`),
  CONSTRAINT `historial_apuestas_ibfk_3` FOREIGN KEY (`evento_id`) REFERENCES `eventos` (`id_evento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_apuestas`
--

LOCK TABLES `historial_apuestas` WRITE;
/*!40000 ALTER TABLE `historial_apuestas` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial_apuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matchs`
--

DROP TABLE IF EXISTS `matchs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matchs` (
  `id_match` int NOT NULL AUTO_INCREMENT,
  `jugador1` int DEFAULT NULL,
  `jugador2` int DEFAULT NULL,
  `jugador1_puntos` int DEFAULT NULL,
  `jugador2_puntos` int DEFAULT NULL,
  `id_evento` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_match`),
  KEY `jugador1` (`jugador1`),
  KEY `jugador2` (`jugador2`),
  KEY `id_evento` (`id_evento`),
  CONSTRAINT `matchs_ibfk_1` FOREIGN KEY (`jugador1`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `matchs_ibfk_2` FOREIGN KEY (`jugador2`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `matchs_ibfk_3` FOREIGN KEY (`id_evento`) REFERENCES `eventos` (`id_evento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matchs`
--

LOCK TABLES `matchs` WRITE;
/*!40000 ALTER TABLE `matchs` DISABLE KEYS */;
/*!40000 ALTER TABLE `matchs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matchs_resultados`
--

DROP TABLE IF EXISTS `matchs_resultados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matchs_resultados` (
  `id_match` int DEFAULT NULL,
  `jugador` int DEFAULT NULL,
  `ganador` varchar(10) DEFAULT NULL,
  `perdedor` varchar(10) DEFAULT NULL,
  KEY `id_match` (`id_match`),
  KEY `jugador` (`jugador`),
  CONSTRAINT `matchs_resultados_ibfk_1` FOREIGN KEY (`id_match`) REFERENCES `matchs` (`id_match`),
  CONSTRAINT `matchs_resultados_ibfk_2` FOREIGN KEY (`jugador`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matchs_resultados`
--

LOCK TABLES `matchs_resultados` WRITE;
/*!40000 ALTER TABLE `matchs_resultados` DISABLE KEYS */;
/*!40000 ALTER TABLE `matchs_resultados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puntos`
--

DROP TABLE IF EXISTS `puntos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puntos` (
  `nick` varchar(100) DEFAULT NULL,
  `puntos` int DEFAULT NULL,
  `evento_id` int DEFAULT NULL,
  KEY `evento_id` (`evento_id`),
  CONSTRAINT `puntos_ibfk_1` FOREIGN KEY (`evento_id`) REFERENCES `eventos` (`id_evento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puntos`
--

LOCK TABLES `puntos` WRITE;
/*!40000 ALTER TABLE `puntos` DISABLE KEYS */;
/*!40000 ALTER TABLE `puntos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nick` varchar(100) DEFAULT NULL,
  `psnid` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `clave` varchar(250) DEFAULT NULL,
  `nacionalidad` varchar(100) DEFAULT NULL,
  `confirmado` char(1) DEFAULT NULL,
  `nivel` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'rex28','rex_2828','jemmyperez28@gmail.com','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','Peru',NULL,NULL,'2020-10-22 17:55:29');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-22 20:04:45
