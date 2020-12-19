CREATE DATABASE  IF NOT EXISTS `restaurante` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `restaurante`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: restaurante
-- ------------------------------------------------------
-- Server version	5.7.23

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pessoaId` int(11) DEFAULT NULL,
  `categoria` enum('normal','vip') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pessoaId` (`pessoaId`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,1,'vip'),(2,3,'normal');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listareserva`
--

DROP TABLE IF EXISTS `listareserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listareserva` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reservaId` int(11) DEFAULT NULL,
  `refeicaoId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reservaId` (`reservaId`),
  KEY `refeicaoId` (`refeicaoId`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listareserva`
--

LOCK TABLES `listareserva` WRITE;
/*!40000 ALTER TABLE `listareserva` DISABLE KEYS */;
INSERT INTO `listareserva` VALUES (1,1,3),(2,1,4),(3,1,5),(4,2,4),(5,2,5),(6,2,3),(7,3,3),(8,3,1),(9,4,4),(10,5,4),(11,5,1),(12,5,3),(13,5,5),(14,6,4),(15,6,5),(16,6,3),(17,7,4),(18,7,3),(19,7,5),(20,8,3),(21,8,4),(22,8,5),(23,9,3);
/*!40000 ALTER TABLE `listareserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificacaoreseva`
--

DROP TABLE IF EXISTS `notificacaoreseva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notificacaoreseva` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reservaId` int(11) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reservaId` (`reservaId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacaoreseva`
--

LOCK TABLES `notificacaoreseva` WRITE;
/*!40000 ALTER TABLE `notificacaoreseva` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificacaoreseva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `bi` varchar(100) DEFAULT NULL,
  `estadocivil` enum('Solteiro','Casado','Divorciado','Outro') DEFAULT NULL,
  `foto` text,
  `aniversario` date DEFAULT NULL,
  `endereco` text,
  `sexo` enum('Masculino','Feminino') DEFAULT NULL,
  `telefone1` text,
  `telefone2` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (3,'José N\'donje','008645132LA044','Divorciado','undefined','2020-09-15','Bairro 28 de agosto, Rua 24','Masculino','944666640','948600567'),(4,'José N\'donje','008645132LA044','Casado','2409200638130.jpg','2020-09-18','awe','Feminino','944666640','948600567'),(5,'José N\'donje','008645132LA044','Casado','2409200640090.jpg','2020-09-22','Bairro 28 de agosto, Rua 24','Feminino','944666640','948600567'),(18,'Pedro Mateus','008645132LA044','Solteiro','0310201143530.jpg','2020-10-16','Bairro 28 de agosto, Rua 24','Masculino','944666640','948600567'),(17,'Pedro Mateus','008645132LA044','Solteiro','undefined','2020-10-16','Bairro 28 de agosto, Rua 24','Masculino','944666640','948600567'),(15,'34e5rtyf','wretfyg','Casado','2709201127320.png','2020-09-01','werdtfy','Feminino','944666640','948600567'),(16,'jkgh','008645132LA044','Casado',NULL,'2020-09-01','Rocha paderia','Feminino','','');
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refeicao`
--

DROP TABLE IF EXISTS `refeicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refeicao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `categoria` enum('matabicho','almoço','jantar','lanche') DEFAULT NULL,
  `preco` decimal(10,0) DEFAULT NULL,
  `descricao` text,
  `foto` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refeicao`
--

LOCK TABLES `refeicao` WRITE;
/*!40000 ALTER TABLE `refeicao` DISABLE KEYS */;
INSERT INTO `refeicao` VALUES (1,'test','almoço',1400,'3w4e5try','2509200453130.com (2)'),(3,'Hamburger Onion Ring','lanche',2500,'É uma agência de comunicação de jovens angolanos, especializada em usar tecnólogias e criatividade para promover a inovação na comunicação pública. Actualmente trabalhamos com a criação de identidade visual (logótipo, estacionários), websites e portais, aplicativos de telefone e computador e outros serviços como venda de produtos(papelaria e gadjets).','2609200858190.png'),(4,'Nugget kfc','almoço',4805,'KFC food','2609200901260.png'),(5,'Vegetarian Cuisine','almoço',3000,'food vegetarian cuisine','2609200904470.png');
/*!40000 ALTER TABLE `refeicao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserva` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataReserva` date DEFAULT NULL,
  `usuarioId` int(11) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `anexo` text,
  PRIMARY KEY (`id`),
  KEY `usuarioId` (`usuarioId`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (7,'2020-10-03',1,0,20610,'0310201140380.jpg'),(9,'2020-10-03',2,0,7500,'0310201148440. Informação e Comunicação _ Cinfotec'),(8,'2020-10-03',2,0,22610,'0310201145140.jpg');
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `senha` text,
  `emailRecuperacao` text,
  `pessoaId` int(11) DEFAULT NULL,
  `acesso` enum('cliente','gestor','administrador') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`),
  KEY `pessoaId` (`pessoaId`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Miguel Buca','123456','luikyjtrhgf@gmail.com',5,'administrador'),(2,'Pedro Mateus','123456','pedro@gmail.com',18,'cliente');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visualizacao`
--

DROP TABLE IF EXISTS `visualizacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visualizacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuarioId` int(11) DEFAULT NULL,
  `refeicaoId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuarioId` (`usuarioId`),
  KEY `refeicaoId` (`refeicaoId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visualizacao`
--

LOCK TABLES `visualizacao` WRITE;
/*!40000 ALTER TABLE `visualizacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `visualizacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'restaurante'
--

--
-- Dumping routines for database 'restaurante'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-19  9:39:19
