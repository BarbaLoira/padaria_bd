CREATE DATABASE  IF NOT EXISTS `padaria` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `padaria`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: padaria
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
  `cpf_cl` varchar(14) NOT NULL,
  `nome_cl` varchar(60) NOT NULL,
  `email_cl` varchar(60) NOT NULL,
  `telefone_cl` int(11) NOT NULL,
  PRIMARY KEY (`cpf_cl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_venda`
--

DROP TABLE IF EXISTS `compra_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compra_venda` (
  `cod_cv` smallint(6) NOT NULL AUTO_INCREMENT,
  `quantidade_cv` varchar(30) NOT NULL,
  `cpf_cl` varchar(14) NOT NULL,
  `cpf_fc` varchar(14) NOT NULL,
  `cod_prod` smallint(6) NOT NULL,
  `data_cv` datetime NOT NULL,
  PRIMARY KEY (`cpf_cl`,`cpf_fc`,`cod_prod`),
  KEY `cpf_fc` (`cpf_fc`),
  KEY `cod_prod` (`cod_prod`),
  KEY `cod_cv` (`cod_cv`),
  CONSTRAINT `compra_venda_ibfk_1` FOREIGN KEY (`cpf_cl`) REFERENCES `cliente` (`cpf_cl`),
  CONSTRAINT `compra_venda_ibfk_2` FOREIGN KEY (`cpf_fc`) REFERENCES `funcionario` (`cpf_fc`),
  CONSTRAINT `compra_venda_ibfk_3` FOREIGN KEY (`cod_prod`) REFERENCES `produto` (`cod_prod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_venda`
--

LOCK TABLES `compra_venda` WRITE;
/*!40000 ALTER TABLE `compra_venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fornecedor` (
  `cod_forn` smallint(6) NOT NULL AUTO_INCREMENT,
  `nome_forn` varchar(60) NOT NULL,
  `cnpj_forn` varchar(18) NOT NULL,
  `endereco_forn` varchar(200) NOT NULL,
  PRIMARY KEY (`cod_forn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `cpf_fc` varchar(14) NOT NULL,
  `nome_fc` varchar(60) NOT NULL,
  `carteiratrab_fc` varchar(15) NOT NULL,
  `cargo_fc` varchar(30) NOT NULL,
  `salario_fc` decimal(10,0) NOT NULL,
  PRIMARY KEY (`cpf_fc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `cod_prod` smallint(6) NOT NULL AUTO_INCREMENT,
  `tipo_prod` varchar(30) NOT NULL,
  `nome_prod` varchar(60) NOT NULL,
  `valor_prod` decimal(10,0) NOT NULL,
  PRIMARY KEY (`cod_prod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produziu`
--

DROP TABLE IF EXISTS `produziu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produziu` (
  `mes_prd` date NOT NULL,
  `quantidadde_prd` smallint(6) NOT NULL,
  `cpf_fc` varchar(14) NOT NULL,
  `cod_prod` smallint(6) NOT NULL,
  PRIMARY KEY (`cpf_fc`,`cod_prod`),
  KEY `cod_prod` (`cod_prod`),
  CONSTRAINT `produziu_ibfk_1` FOREIGN KEY (`cpf_fc`) REFERENCES `funcionario` (`cpf_fc`),
  CONSTRAINT `produziu_ibfk_2` FOREIGN KEY (`cod_prod`) REFERENCES `produto` (`cod_prod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produziu`
--

LOCK TABLES `produziu` WRITE;
/*!40000 ALTER TABLE `produziu` DISABLE KEYS */;
/*!40000 ALTER TABLE `produziu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'padaria'
--

--
-- Dumping routines for database 'padaria'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-10 15:03:12
