CREATE DATABASE  IF NOT EXISTS `agros` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `agros`;
-- MySQL dump 10.13  Distrib 5.1.34, for apple-darwin9.5.0 (i386)
--
-- Host: 192.168.5.103    Database: agros
-- ------------------------------------------------------
-- Server version	5.5.24-0ubuntu0.12.04.1

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
-- Table structure for table `estatus`
--

DROP TABLE IF EXISTS `estatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estatus`
--

LOCK TABLES `estatus` WRITE;
/*!40000 ALTER TABLE `estatus` DISABLE KEYS */;
INSERT INTO `estatus` VALUES (1,'Activo'),(2,'Inactivo');
/*!40000 ALTER TABLE `estatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracion`
--

DROP TABLE IF EXISTS `configuracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estatus_did` int(11) NOT NULL,
  `temporada_did` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `configuracion_estatus` (`estatus_did`),
  KEY `configuracion_temporada` (`temporada_did`),
  CONSTRAINT `configuracion_estatus` FOREIGN KEY (`estatus_did`) REFERENCES `estatus` (`id`),
  CONSTRAINT `configuracion_temporada` FOREIGN KEY (`temporada_did`) REFERENCES `temporada` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracion`
--

LOCK TABLES `configuracion` WRITE;
/*!40000 ALTER TABLE `configuracion` DISABLE KEYS */;
INSERT INTO `configuracion` VALUES (1,1,1);
/*!40000 ALTER TABLE `configuracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salida`
--

DROP TABLE IF EXISTS `salida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salida` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigoSalida` varchar(255) NOT NULL,
  `fecha_f` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estatus_did` int(11) NOT NULL,
  `temporada_did` int(11) NOT NULL,
  `cliente_aid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `salida_estatus` (`estatus_did`),
  KEY `salida_temporada` (`temporada_did`),
  KEY `salida_cliente` (`cliente_aid`),
  CONSTRAINT `salida_cliente` FOREIGN KEY (`cliente_aid`) REFERENCES `cliente` (`id`),
  CONSTRAINT `salida_estatus` FOREIGN KEY (`estatus_did`) REFERENCES `estatus` (`id`),
  CONSTRAINT `salida_temporada` FOREIGN KEY (`temporada_did`) REFERENCES `temporada` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salida`
--

LOCK TABLES `salida` WRITE;
/*!40000 ALTER TABLE `salida` DISABLE KEYS */;
/*!40000 ALTER TABLE `salida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beneficio`
--

DROP TABLE IF EXISTS `beneficio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beneficio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_f` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `entrada_aid` int(11) NOT NULL,
  `estatus_did` int(11) NOT NULL,
  `temporada_did` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `beneficio_entrada` (`entrada_aid`),
  KEY `beneficio_estatus` (`estatus_did`),
  KEY `beneficio_temporada` (`temporada_did`),
  CONSTRAINT `beneficio_entrada` FOREIGN KEY (`entrada_aid`) REFERENCES `entrada` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `beneficio_estatus` FOREIGN KEY (`estatus_did`) REFERENCES `estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `beneficio_temporada` FOREIGN KEY (`temporada_did`) REFERENCES `temporada` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beneficio`
--

LOCK TABLES `beneficio` WRITE;
/*!40000 ALTER TABLE `beneficio` DISABLE KEYS */;
/*!40000 ALTER TABLE `beneficio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salidaDirecta`
--

DROP TABLE IF EXISTS `salidaDirecta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salidaDirecta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigoSalida` varchar(254) NOT NULL,
  `fecha_f` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `entrada_aid` int(11) NOT NULL,
  `cantidad` double NOT NULL,
  `estatus_did` int(11) NOT NULL,
  `temporada_did` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `salidaDirecta_entrada` (`entrada_aid`),
  KEY `salidaDirecta_estatus` (`estatus_did`),
  KEY `salidaDirecta_temporada` (`temporada_did`),
  CONSTRAINT `salidaDirecta_entrada` FOREIGN KEY (`entrada_aid`) REFERENCES `entrada` (`id`),
  CONSTRAINT `salidaDirecta_estatus` FOREIGN KEY (`estatus_did`) REFERENCES `estatus` (`id`),
  CONSTRAINT `salidaDirecta_temporada` FOREIGN KEY (`temporada_did`) REFERENCES `temporada` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salidaDirecta`
--

LOCK TABLES `salidaDirecta` WRITE;
/*!40000 ALTER TABLE `salidaDirecta` DISABLE KEYS */;
/*!40000 ALTER TABLE `salidaDirecta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temporada`
--

DROP TABLE IF EXISTS `temporada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temporada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `fechaIncial_f` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fechaFinal_f` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `estatus_did` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_temporada_estatus` (`estatus_did`),
  CONSTRAINT `fk_temporada_estatus` FOREIGN KEY (`estatus_did`) REFERENCES `estatus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temporada`
--

LOCK TABLES `temporada` WRITE;
/*!40000 ALTER TABLE `temporada` DISABLE KEYS */;
INSERT INTO `temporada` VALUES (1,'Temporada 2012','2012-01-01 07:00:00','2012-12-31 07:00:00',1);
/*!40000 ALTER TABLE `temporada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoUsuario`
--

DROP TABLE IF EXISTS `tipoUsuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoUsuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(145) NOT NULL,
  `estatus_did` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tipoUsuario_estatus` (`estatus_did`),
  CONSTRAINT `tipoUsuario_estatus` FOREIGN KEY (`estatus_did`) REFERENCES `estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoUsuario`
--

LOCK TABLES `tipoUsuario` WRITE;
/*!40000 ALTER TABLE `tipoUsuario` DISABLE KEYS */;
INSERT INTO `tipoUsuario` VALUES (1,'Administracion',1);
/*!40000 ALTER TABLE `tipoUsuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `estatus_did` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Estado_Estatus` (`estatus_did`),
  CONSTRAINT `Estado_Estatus` FOREIGN KEY (`estatus_did`) REFERENCES `estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'Sinaloa',1);
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipio`
--

DROP TABLE IF EXISTS `municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `municipio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `estado_did` int(11) NOT NULL,
  `estatus_did` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `municipio_estado` (`estado_did`),
  KEY `municipio_estatus` (`estatus_did`),
  CONSTRAINT `municipio_estado` FOREIGN KEY (`estado_did`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `municipio_estatus` FOREIGN KEY (`estatus_did`) REFERENCES `estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipio`
--

LOCK TABLES `municipio` WRITE;
/*!40000 ALTER TABLE `municipio` DISABLE KEYS */;
INSERT INTO `municipio` VALUES (1,'Culiacán',1,1),(2,'Navolato',1,1),(3,'Ahome',1,1),(4,'Mazatlan',1,1);
/*!40000 ALTER TABLE `municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad`
--

DROP TABLE IF EXISTS `unidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(145) NOT NULL,
  `equivalencia` double NOT NULL,
  `estatus_did` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `unidad_equivalencia` (`estatus_did`),
  CONSTRAINT `unidad_equivalencia` FOREIGN KEY (`estatus_did`) REFERENCES `estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad`
--

LOCK TABLES `unidad` WRITE;
/*!40000 ALTER TABLE `unidad` DISABLE KEYS */;
INSERT INTO `unidad` VALUES (1,'KG',1,1);
/*!40000 ALTER TABLE `unidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `estatus_did` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_servicio_estatus` (`estatus_did`),
  CONSTRAINT `fk_servicio_estatus` FOREIGN KEY (`estatus_did`) REFERENCES `estatus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beneficioDetalle`
--

DROP TABLE IF EXISTS `beneficioDetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beneficioDetalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` double NOT NULL,
  `saldo` double NOT NULL,
  `clasificacion_aid` int(11) DEFAULT NULL,
  `calibre_aid` int(11) DEFAULT NULL,
  `unidad_did` int(11) NOT NULL,
  `beneficio_aid` int(11) NOT NULL,
  `estatus_did` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `beneficiodetalle_calibre` (`calibre_aid`),
  KEY `beneficiodetalle_clasificacion` (`clasificacion_aid`),
  KEY `beneficiodetalle_unidad` (`unidad_did`),
  KEY `beneficiodetalle_beneficio` (`beneficio_aid`),
  KEY `beneficiodetalle_estatus` (`estatus_did`),
  CONSTRAINT `beneficiodetalle_beneficio` FOREIGN KEY (`beneficio_aid`) REFERENCES `beneficio` (`id`),
  CONSTRAINT `beneficiodetalle_calibre` FOREIGN KEY (`calibre_aid`) REFERENCES `calibre` (`id`),
  CONSTRAINT `beneficiodetalle_clasificacion` FOREIGN KEY (`clasificacion_aid`) REFERENCES `clasificacion` (`id`),
  CONSTRAINT `beneficiodetalle_estatus` FOREIGN KEY (`estatus_did`) REFERENCES `estatus` (`id`),
  CONSTRAINT `beneficiodetalle_unidad` FOREIGN KEY (`unidad_did`) REFERENCES `unidad` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beneficioDetalle`
--

LOCK TABLES `beneficioDetalle` WRITE;
/*!40000 ALTER TABLE `beneficioDetalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `beneficioDetalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ejido`
--

DROP TABLE IF EXISTS `ejido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ejido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(145) NOT NULL,
  `municipio_did` int(11) NOT NULL,
  `estatus_did` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ejido_municipio` (`municipio_did`),
  KEY `ejido_estatus` (`estatus_did`),
  CONSTRAINT `ejido_estatus` FOREIGN KEY (`estatus_did`) REFERENCES `estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ejido_municipio` FOREIGN KEY (`municipio_did`) REFERENCES `municipio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ejido`
--

LOCK TABLES `ejido` WRITE;
/*!40000 ALTER TABLE `ejido` DISABLE KEYS */;
INSERT INTO `ejido` VALUES (1,'Buenos Aires',2,1);
/*!40000 ALTER TABLE `ejido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clasificacion`
--

DROP TABLE IF EXISTS `clasificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clasificacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(145) NOT NULL,
  `descripcion` varchar(245) DEFAULT NULL,
  `producto_did` int(11) NOT NULL,
  `variedad_did` int(11) NOT NULL,
  `estatus_did` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clasificacion_estatus` (`estatus_did`),
  KEY `clasificacion_variedad` (`variedad_did`),
  KEY `clasificacion_producto` (`producto_did`),
  CONSTRAINT `clasificacion_estatus` FOREIGN KEY (`estatus_did`) REFERENCES `estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `clasificacion_producto` FOREIGN KEY (`producto_did`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `clasificacion_variedad` FOREIGN KEY (`variedad_did`) REFERENCES `variedad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clasificacion`
--

LOCK TABLES `clasificacion` WRITE;
/*!40000 ALTER TABLE `clasificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `clasificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `precio`
--

DROP TABLE IF EXISTS `precio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `precio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` double NOT NULL,
  `servicio_did` int(11) NOT NULL,
  `estatus_did` int(11) NOT NULL,
  `temporada_did` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `precio_servcio` (`servicio_did`),
  KEY `precio_temporada` (`temporada_did`),
  KEY `precio_estatus` (`estatus_did`),
  CONSTRAINT `precio_estatus` FOREIGN KEY (`estatus_did`) REFERENCES `estatus` (`id`),
  CONSTRAINT `precio_servcio` FOREIGN KEY (`servicio_did`) REFERENCES `servicio` (`id`),
  CONSTRAINT `precio_temporada` FOREIGN KEY (`temporada_did`) REFERENCES `temporada` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `precio`
--

LOCK TABLES `precio` WRITE;
/*!40000 ALTER TABLE `precio` DISABLE KEYS */;
/*!40000 ALTER TABLE `precio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calibre`
--

DROP TABLE IF EXISTS `calibre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calibre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `producto_did` int(11) NOT NULL,
  `variedad_did` int(11) NOT NULL,
  `estatus_did` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `calibre_estatus` (`estatus_did`),
  KEY `calibre_variedad` (`variedad_did`),
  KEY `calibre_producto` (`producto_did`),
  CONSTRAINT `calibre_estatus` FOREIGN KEY (`estatus_did`) REFERENCES `estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `calibre_producto` FOREIGN KEY (`producto_did`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `calibre_variedad` FOREIGN KEY (`variedad_did`) REFERENCES `variedad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calibre`
--

LOCK TABLES `calibre` WRITE;
/*!40000 ALTER TABLE `calibre` DISABLE KEYS */;
/*!40000 ALTER TABLE `calibre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `variedad` tinyint(4) NOT NULL,
  `clasificacion` tinyint(4) NOT NULL,
  `calibre` tinyint(4) NOT NULL,
  `estatus_did` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_estatus` (`estatus_did`),
  CONSTRAINT `producto_estatus` FOREIGN KEY (`estatus_did`) REFERENCES `estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Garbanzo',1,0,1,1),(2,'Frijol',1,1,0,1);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salidaDetalle`
--

DROP TABLE IF EXISTS `salidaDetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salidaDetalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` double NOT NULL,
  `producto_did` int(11) NOT NULL,
  `variedad_did` int(11) NOT NULL,
  `clasificacion_did` int(11) DEFAULT NULL,
  `calibre_did` int(11) DEFAULT NULL,
  `salida_did` int(11) NOT NULL,
  `estatus_did` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `salidaDetalle_estatus` (`estatus_did`),
  KEY `salidaDetalle_salida` (`salida_did`),
  KEY `salidaDetalle_calibre` (`calibre_did`),
  KEY `salidaDetalle_clasificacion` (`clasificacion_did`),
  KEY `salidaDetalle_variedad` (`variedad_did`),
  KEY `salidaDetalle_producto` (`producto_did`),
  CONSTRAINT `salidaDetalle_calibre` FOREIGN KEY (`calibre_did`) REFERENCES `calibre` (`id`),
  CONSTRAINT `salidaDetalle_clasificacion` FOREIGN KEY (`clasificacion_did`) REFERENCES `clasificacion` (`id`),
  CONSTRAINT `salidaDetalle_estatus` FOREIGN KEY (`estatus_did`) REFERENCES `estatus` (`id`),
  CONSTRAINT `salidaDetalle_producto` FOREIGN KEY (`producto_did`) REFERENCES `producto` (`id`),
  CONSTRAINT `salidaDetalle_salida` FOREIGN KEY (`salida_did`) REFERENCES `salida` (`id`),
  CONSTRAINT `salidaDetalle_variedad` FOREIGN KEY (`variedad_did`) REFERENCES `variedad` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salidaDetalle`
--

LOCK TABLES `salidaDetalle` WRITE;
/*!40000 ALTER TABLE `salidaDetalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `salidaDetalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datosFiscales`
--

DROP TABLE IF EXISTS `datosFiscales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datosFiscales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `valor` double NOT NULL,
  `estaus_did` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_datosFiscales_estatus` (`estaus_did`),
  CONSTRAINT `fk_datosFiscales_estatus` FOREIGN KEY (`estaus_did`) REFERENCES `estatus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datosFiscales`
--

LOCK TABLES `datosFiscales` WRITE;
/*!40000 ALTER TABLE `datosFiscales` DISABLE KEYS */;
/*!40000 ALTER TABLE `datosFiscales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `tipousuario_did` int(11) NOT NULL,
  `estatus_did` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_UNIQUE` (`usuario`),
  KEY `usuario_tipousuario` (`tipousuario_did`),
  KEY `usuario_estatus` (`estatus_did`),
  CONSTRAINT `usuario_estatus` FOREIGN KEY (`estatus_did`) REFERENCES `estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usuario_tipousuario` FOREIGN KEY (`tipousuario_did`) REFERENCES `tipoUsuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'francisco','123qwe',1,1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variedad`
--

DROP TABLE IF EXISTS `variedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variedad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(145) NOT NULL,
  `producto_aid` int(11) NOT NULL,
  `estatus_did` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `variedad_producto` (`producto_aid`),
  KEY `variedad_estatus` (`estatus_did`),
  CONSTRAINT `variedad_estatus` FOREIGN KEY (`estatus_did`) REFERENCES `estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `variedad_producto` FOREIGN KEY (`producto_aid`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variedad`
--

LOCK TABLES `variedad` WRITE;
/*!40000 ALTER TABLE `variedad` DISABLE KEYS */;
INSERT INTO `variedad` VALUES (1,'Azul',1,1),(2,'Cafe',2,1);
/*!40000 ALTER TABLE `variedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(145) NOT NULL,
  `apellidos` varchar(145) NOT NULL,
  `fechaNacimiento_f` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rfc` varchar(13) DEFAULT NULL,
  `razonSocial` varchar(145) DEFAULT NULL,
  `codigopostal` varchar(10) DEFAULT NULL,
  `calle` varchar(145) DEFAULT NULL,
  `colonia` varchar(145) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `celular` varchar(145) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `estado_did` int(11) NOT NULL,
  `municipio_aid` int(11) NOT NULL,
  `estatus_did` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_estatus` (`estatus_did`),
  KEY `cliente_estado` (`estado_did`),
  KEY `cliente_municipio` (`municipio_aid`),
  CONSTRAINT `cliente_estado` FOREIGN KEY (`estado_did`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cliente_estatus` FOREIGN KEY (`estatus_did`) REFERENCES `estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cliente_municipio` FOREIGN KEY (`municipio_aid`) REFERENCES `municipio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Francisco','Mendoza','1987-03-19 07:00:00','','','80240','','','526677621979','','',1,1,1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrada`
--

DROP TABLE IF EXISTS `entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` int(11) NOT NULL,
  `fecha_f` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cosecha` varchar(145) DEFAULT NULL,
  `camion` varchar(145) DEFAULT NULL,
  `marca` varchar(145) DEFAULT NULL,
  `modelo` varchar(145) DEFAULT NULL,
  `placas` varchar(145) DEFAULT NULL,
  `conductor` varchar(145) DEFAULT NULL,
  `pesoBruto` double NOT NULL,
  `taraCamion` double NOT NULL,
  `pesoNeto` double NOT NULL,
  `impuresas` double NOT NULL,
  `pesoNetoAnalizado` double NOT NULL,
  `saldo` double NOT NULL,
  `cliente_aid` int(11) NOT NULL,
  `producto_did` int(11) NOT NULL,
  `variedad_aid` int(11) NOT NULL,
  `unidad_did` int(11) NOT NULL,
  `estado_did` int(11) NOT NULL,
  `municipio_aid` int(11) NOT NULL,
  `ejido_did` int(11) NOT NULL,
  `estatus_did` int(11) NOT NULL,
  `temporada_did` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  KEY `entrada_producto` (`producto_did`),
  KEY `entrada_cliente` (`cliente_aid`),
  KEY `entrada_variedad` (`variedad_aid`),
  KEY `entrada_unidad` (`unidad_did`),
  KEY `entrada_estado` (`estado_did`),
  KEY `entrada_municpio` (`municipio_aid`),
  KEY `entrada_ejido` (`ejido_did`),
  KEY `entrada_estatus` (`estatus_did`),
  KEY `entrada_temporada` (`temporada_did`),
  CONSTRAINT `entrada_cliente` FOREIGN KEY (`cliente_aid`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `entrada_ejido` FOREIGN KEY (`ejido_did`) REFERENCES `ejido` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `entrada_estado` FOREIGN KEY (`estado_did`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `entrada_estatus` FOREIGN KEY (`estatus_did`) REFERENCES `estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `entrada_municpio` FOREIGN KEY (`municipio_aid`) REFERENCES `municipio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `entrada_producto` FOREIGN KEY (`producto_did`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `entrada_temporada` FOREIGN KEY (`temporada_did`) REFERENCES `temporada` (`id`),
  CONSTRAINT `entrada_unidad` FOREIGN KEY (`unidad_did`) REFERENCES `unidad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `entrada_variedad` FOREIGN KEY (`variedad_aid`) REFERENCES `variedad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrada`
--

LOCK TABLES `entrada` WRITE;
/*!40000 ALTER TABLE `entrada` DISABLE KEYS */;
INSERT INTO `entrada` VALUES (1,12345,'2012-07-12 06:00:00','no se','no se','no se','nose','nose','nose',100,50,50,0,50,50,1,1,1,1,1,1,1,1,1);
/*!40000 ALTER TABLE `entrada` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-07-19 23:42:20
CREATE DATABASE  IF NOT EXISTS `japdb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `japdb`;
-- MySQL dump 10.13  Distrib 5.1.34, for apple-darwin9.5.0 (i386)
--
-- Host: 192.168.5.103    Database: japdb
-- ------------------------------------------------------
-- Server version	5.5.24-0ubuntu0.12.04.1

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
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '	',
  `usuario` varchar(45) NOT NULL,
  `password` varchar(150) NOT NULL,
  `tipousuario_did` int(11) NOT NULL,
  `institucion_aid` int(11) DEFAULT NULL,
  `estatus_did` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_UNIQUE` (`usuario`),
  KEY `usuario_estatus` (`estatus_did`),
  KEY `usuario_tipousuario` (`tipousuario_did`),
  KEY `usuario_institucion` (`institucion_aid`),
  CONSTRAINT `usuario_estatus` FOREIGN KEY (`estatus_did`) REFERENCES `Estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usuario_institucion` FOREIGN KEY (`institucion_aid`) REFERENCES `Institucion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usuario_tipousuario` FOREIGN KEY (`tipousuario_did`) REFERENCES `TipoUsuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
INSERT INTO `Usuario` VALUES (1,'francisco','pelicano',1,NULL,1),(2,'padres','123qwe',1,NULL,1),(6,'unodos','123qwe',1,NULL,1),(7,'dfsda','123qwe',1,NULL,1),(10,'perro','123qwe',2,21,1),(11,'perrow','123qwe',2,23,1);
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EjercicioFiscal`
--

DROP TABLE IF EXISTS `EjercicioFiscal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EjercicioFiscal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(145) NOT NULL,
  `fechaInicio_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fechaFin_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `estatus_did` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `EjercicioFiscal_estatus` (`estatus_did`),
  CONSTRAINT `EjercicioFiscal_estatus` FOREIGN KEY (`estatus_did`) REFERENCES `Estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EjercicioFiscal`
--

LOCK TABLES `EjercicioFiscal` WRITE;
/*!40000 ALTER TABLE `EjercicioFiscal` DISABLE KEYS */;
INSERT INTO `EjercicioFiscal` VALUES (1,'Ciclo 2012','2012-01-01 07:00:00','2012-12-31 07:00:00',1);
/*!40000 ALTER TABLE `EjercicioFiscal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GastoDeAdministracion`
--

DROP TABLE IF EXISTS `GastoDeAdministracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GastoDeAdministracion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sueldos` double NOT NULL DEFAULT '0',
  `honorarios` double NOT NULL DEFAULT '0',
  `combustibles` double NOT NULL DEFAULT '0',
  `luzTelefono` double NOT NULL DEFAULT '0',
  `papeleria` double NOT NULL DEFAULT '0',
  `impuestosDerechos` double NOT NULL DEFAULT '0',
  `otros` double NOT NULL DEFAULT '0',
  `institucion_aid` int(11) NOT NULL,
  `ejercicioFisca_did` int(11) NOT NULL,
  `estatus_did` int(11) NOT NULL,
  `editable` bit(1) NOT NULL,
  `ultimaModificacion_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `GastoDeAdministracion_estatus` (`estatus_did`),
  KEY `GastoDeAdministracion_ejercicio` (`ejercicioFisca_did`),
  KEY `GastoDeAdministracion_institucion` (`institucion_aid`),
  CONSTRAINT `GastoDeAdministracion_ejercicio` FOREIGN KEY (`ejercicioFisca_did`) REFERENCES `EjercicioFiscal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `GastoDeAdministracion_estatus` FOREIGN KEY (`estatus_did`) REFERENCES `Estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `GastoDeAdministracion_institucion` FOREIGN KEY (`institucion_aid`) REFERENCES `Institucion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GastoDeAdministracion`
--

LOCK TABLES `GastoDeAdministracion` WRITE;
/*!40000 ALTER TABLE `GastoDeAdministracion` DISABLE KEYS */;
/*!40000 ALTER TABLE `GastoDeAdministracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AreaGeografica`
--

DROP TABLE IF EXISTS `AreaGeografica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AreaGeografica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(145) NOT NULL,
  `estatus_did` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `areageografica_estatus` (`estatus_did`),
  CONSTRAINT `areageografica_estatus` FOREIGN KEY (`estatus_did`) REFERENCES `Estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AreaGeografica`
--

LOCK TABLES `AreaGeografica` WRITE;
/*!40000 ALTER TABLE `AreaGeografica` DISABLE KEYS */;
INSERT INTO `AreaGeografica` VALUES (1,'Tampoco Se',1);
/*!40000 ALTER TABLE `AreaGeografica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GastoOperativo`
--

DROP TABLE IF EXISTS `GastoOperativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GastoOperativo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sueldos` double NOT NULL DEFAULT '0',
  `honorarios` double NOT NULL DEFAULT '0',
  `combustibles` double NOT NULL DEFAULT '0',
  `luzTelefono` double NOT NULL DEFAULT '0',
  `papeleria` double NOT NULL DEFAULT '0',
  `renta` double NOT NULL DEFAULT '0',
  `impuestosDerechos` double NOT NULL DEFAULT '0',
  `otros` double NOT NULL DEFAULT '0',
  `institucion_aid` int(11) NOT NULL,
  `ejercicioFiscal_did` int(11) NOT NULL COMMENT '		',
  `estatus_did` int(11) NOT NULL,
  `editable` bit(1) NOT NULL,
  `ultimaModificacion_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `GastoOperativo_estatus` (`estatus_did`),
  KEY `GastoOperativo_ejercicio` (`ejercicioFiscal_did`),
  KEY `GastoOperativo_institucion` (`institucion_aid`),
  CONSTRAINT `GastoOperativo_ejercicio` FOREIGN KEY (`ejercicioFiscal_did`) REFERENCES `EjercicioFiscal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `GastoOperativo_estatus` FOREIGN KEY (`estatus_did`) REFERENCES `Estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `GastoOperativo_institucion` FOREIGN KEY (`institucion_aid`) REFERENCES `Institucion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GastoOperativo`
--

LOCK TABLES `GastoOperativo` WRITE;
/*!40000 ALTER TABLE `GastoOperativo` DISABLE KEYS */;
/*!40000 ALTER TABLE `GastoOperativo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IngresoPorEvento`
--

DROP TABLE IF EXISTS `IngresoPorEvento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IngresoPorEvento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `colectas` double NOT NULL DEFAULT '0',
  `eventos` double NOT NULL DEFAULT '0',
  `rifas` double NOT NULL DEFAULT '0',
  `desayunos` double NOT NULL DEFAULT '0',
  `conferencias` double NOT NULL DEFAULT '0',
  `institucion_aid` int(11) NOT NULL,
  `ejercicioFiscal_did` int(11) NOT NULL,
  `estatus_did` int(11) NOT NULL,
  `editable` bit(1) NOT NULL,
  `ultimaModificacion_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ingresosporevento_institucion` (`institucion_aid`),
  KEY `ingresosporevento_ejercicio` (`ejercicioFiscal_did`),
  KEY `ingresosporevento_estatus` (`estatus_did`),
  CONSTRAINT `ingresosporevento_ejercicio` FOREIGN KEY (`ejercicioFiscal_did`) REFERENCES `EjercicioFiscal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ingresosporevento_estatus` FOREIGN KEY (`estatus_did`) REFERENCES `Estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ingresosporevento_institucion` FOREIGN KEY (`institucion_aid`) REFERENCES `Institucion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IngresoPorEvento`
--

LOCK TABLES `IngresoPorEvento` WRITE;
/*!40000 ALTER TABLE `IngresoPorEvento` DISABLE KEYS */;
/*!40000 ALTER TABLE `IngresoPorEvento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Estatus`
--

DROP TABLE IF EXISTS `Estatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Estatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Estatus`
--

LOCK TABLES `Estatus` WRITE;
/*!40000 ALTER TABLE `Estatus` DISABLE KEYS */;
INSERT INTO `Estatus` VALUES (1,'Activo'),(2,'Inactivo');
/*!40000 ALTER TABLE `Estatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IngresoPorVenta`
--

DROP TABLE IF EXISTS `IngresoPorVenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IngresoPorVenta` (
  `id` int(11) NOT NULL,
  `institucion_aid` int(11) NOT NULL,
  `ejercicio_did` int(11) NOT NULL,
  `estatus_did` int(11) NOT NULL,
  `editable` bit(1) NOT NULL,
  `ultimaModificacion_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `IngresoPorVenta_ejercicio` (`ejercicio_did`),
  KEY `IngresoPorVenta_institucion` (`institucion_aid`),
  KEY `IngresoPorVenta_estatus` (`estatus_did`),
  CONSTRAINT `IngresoPorVenta_ejercicio` FOREIGN KEY (`ejercicio_did`) REFERENCES `EjercicioFiscal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `IngresoPorVenta_estatus` FOREIGN KEY (`estatus_did`) REFERENCES `Estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `IngresoPorVenta_institucion` FOREIGN KEY (`institucion_aid`) REFERENCES `Institucion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IngresoPorVenta`
--

LOCK TABLES `IngresoPorVenta` WRITE;
/*!40000 ALTER TABLE `IngresoPorVenta` DISABLE KEYS */;
/*!40000 ALTER TABLE `IngresoPorVenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Estado`
--

DROP TABLE IF EXISTS `Estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(45) NOT NULL,
  `nombre` varchar(145) NOT NULL,
  `estatus_did` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clave_UNIQUE` (`clave`),
  KEY `estado_estatus` (`estatus_did`),
  CONSTRAINT `estado_estatus` FOREIGN KEY (`estatus_did`) REFERENCES `Estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Estado`
--

LOCK TABLES `Estado` WRITE;
/*!40000 ALTER TABLE `Estado` DISABLE KEYS */;
INSERT INTO `Estado` VALUES (2,'025','Sinaloa',1),(3,'026','Sonora',2),(4,'024','San Luis',1);
/*!40000 ALTER TABLE `Estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IngresoPorCuotasdeRecuperacion`
--

DROP TABLE IF EXISTS `IngresoPorCuotasdeRecuperacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IngresoPorCuotasdeRecuperacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consultas` double NOT NULL DEFAULT '0',
  `despensas` double NOT NULL DEFAULT '0',
  `otro` double NOT NULL DEFAULT '0',
  `institucion_aid` int(11) NOT NULL,
  `ejercicioFiscal_did` int(11) NOT NULL,
  `estatus_did` int(11) NOT NULL,
  `editable` bit(1) NOT NULL,
  `ultimaModificacion_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `IngresoPorCuotasdeRecuperacion_institucion` (`institucion_aid`),
  KEY `IngresoPorCuotasdeRecuperacion_estatus` (`estatus_did`),
  KEY `IngresoPorCuotasdeRecuperacion_ejercicio` (`ejercicioFiscal_did`),
  CONSTRAINT `IngresoPorCuotasdeRecuperacion_ejercicio` FOREIGN KEY (`ejercicioFiscal_did`) REFERENCES `EjercicioFiscal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `IngresoPorCuotasdeRecuperacion_estatus` FOREIGN KEY (`estatus_did`) REFERENCES `Estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `IngresoPorCuotasdeRecuperacion_institucion` FOREIGN KEY (`institucion_aid`) REFERENCES `Institucion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IngresoPorCuotasdeRecuperacion`
--

LOCK TABLES `IngresoPorCuotasdeRecuperacion` WRITE;
/*!40000 ALTER TABLE `IngresoPorCuotasdeRecuperacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `IngresoPorCuotasdeRecuperacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Institucion`
--

DROP TABLE IF EXISTS `Institucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Institucion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(145) NOT NULL,
  `siglas` varchar(45) NOT NULL,
  `mision` text,
  `vision` text,
  `domicioDireccion` varchar(145) NOT NULL,
  `domicilioCP` varchar(45) NOT NULL,
  `municipio_aid` int(11) NOT NULL,
  `contactoTelefono` varchar(45) DEFAULT NULL,
  `contactoFax` varchar(45) DEFAULT NULL,
  `contactoEmail` varchar(145) DEFAULT NULL,
  `fechaConstitucion_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fechaTransformacion_dt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rfc` varchar(13) NOT NULL,
  `donativoDeducible` tinyint(1) NOT NULL,
  `donativoConvenio` tinyint(1) NOT NULL,
  `cluni` varchar(45) DEFAULT NULL,
  `ambito_did` int(11) NOT NULL,
  `areaGeografica_did` int(11) NOT NULL,
  `horasPromedio_trabajador` int(11) DEFAULT NULL,
  `estatus_did` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `institucion_estatus` (`estatus_did`),
  KEY `institucion_ambito` (`ambito_did`),
  KEY `institucion_municipio` (`municipio_aid`),
  KEY `institucion_areageografica` (`areaGeografica_did`),
  CONSTRAINT `institucion_ambito` FOREIGN KEY (`ambito_did`) REFERENCES `Ambito` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `institucion_areageografica` FOREIGN KEY (`areaGeografica_did`) REFERENCES `AreaGeografica` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `institucion_estatus` FOREIGN KEY (`estatus_did`) REFERENCES `Estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `institucion_municipio` FOREIGN KEY (`municipio_aid`) REFERENCES `Municipio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Institucion`
--

LOCK TABLES `Institucion` WRITE;
/*!40000 ALTER TABLE `Institucion` DISABLE KEYS */;
INSERT INTO `Institucion` VALUES (1,'Nose','nose','nose','nose','nose','nose',2,'as','','','0000-00-00 00:00:00','0000-00-00 00:00:00','adsfa',2,1,'fd',1,1,NULL,1),(2,'padres y compadres','pyp','','','no se','80000',1,'526677612612','','soporte@uss.mx','2007-01-10 07:00:00','2007-01-04 07:00:00','nose',1,1,'',1,1,NULL,1),(3,'afsd','dfsf','dfsdfds','dfsqwefq','fefew','dsafds',1,'','','','2002-01-19 07:00:00','2003-01-25 07:00:00','fewwe',1,1,'fsdf',1,1,NULL,1),(21,'wafle','dafsd','fdfda','sfdasd','fds','fdsa',1,'ewqq','sdas','sadas','2012-06-27 17:58:24','0000-00-00 00:00:00','dfsas',1,1,'fdsaf',1,1,NULL,2),(23,'wafle','dafsd','fdfda','sfdasd','fds','fdsa',1,'ewqq','sdas','sadas','2012-06-27 17:57:54','0000-00-00 00:00:00','dfsas',1,1,'fdsaf',1,1,NULL,2);
/*!40000 ALTER TABLE `Institucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IngresoPorVentaDetalle`
--

DROP TABLE IF EXISTS `IngresoPorVentaDetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IngresoPorVentaDetalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `concepto` varchar(150) NOT NULL,
  `cantidad` double NOT NULL DEFAULT '0',
  `ingresoPorVenta_aid` int(11) NOT NULL,
  `estatus_did` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IngresoPorVentaDetalle_IngresoPorVenta` (`ingresoPorVenta_aid`),
  KEY `IngresoPorVentaDetalle_estatus` (`estatus_did`),
  CONSTRAINT `IngresoPorVentaDetalle_estatus` FOREIGN KEY (`estatus_did`) REFERENCES `Estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `IngresoPorVentaDetalle_IngresoPorVenta` FOREIGN KEY (`ingresoPorVenta_aid`) REFERENCES `IngresoPorVenta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IngresoPorVentaDetalle`
--

LOCK TABLES `IngresoPorVentaDetalle` WRITE;
/*!40000 ALTER TABLE `IngresoPorVentaDetalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `IngresoPorVentaDetalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TipoUsuario`
--

DROP TABLE IF EXISTS `TipoUsuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TipoUsuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `estatus_did` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tipousuario_estatus` (`estatus_did`),
  CONSTRAINT `tipousuario_estatus` FOREIGN KEY (`estatus_did`) REFERENCES `Estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TipoUsuario`
--

LOCK TABLES `TipoUsuario` WRITE;
/*!40000 ALTER TABLE `TipoUsuario` DISABLE KEYS */;
INSERT INTO `TipoUsuario` VALUES (1,'Administracion','Administracion',1),(2,'Institucion','Institucion',1);
/*!40000 ALTER TABLE `TipoUsuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IngresoPorDonativo`
--

DROP TABLE IF EXISTS `IngresoPorDonativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IngresoPorDonativo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `personaFisica` double NOT NULL DEFAULT '0',
  `personaMoral` double NOT NULL DEFAULT '0',
  `fundacionesNacionales` double NOT NULL DEFAULT '0',
  `fundacionesExtrajeras` double NOT NULL DEFAULT '0',
  `fondosGubernamentales` double NOT NULL DEFAULT '0',
  `especie` double NOT NULL DEFAULT '0',
  `institucion_aid` int(11) NOT NULL,
  `ejercicioFiscal_did` int(11) NOT NULL,
  `estatus_did` int(11) NOT NULL,
  `editable` bit(1) NOT NULL,
  `ultimaModificacion_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `IngresoPorDonativo_estatus` (`estatus_did`),
  KEY `IngresoPorDonativo_institucion` (`institucion_aid`),
  KEY `IngresoPorDonativo_ejercicio` (`ejercicioFiscal_did`),
  CONSTRAINT `IngresoPorDonativo_ejercicio` FOREIGN KEY (`ejercicioFiscal_did`) REFERENCES `EjercicioFiscal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `IngresoPorDonativo_estatus` FOREIGN KEY (`estatus_did`) REFERENCES `Estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `IngresoPorDonativo_institucion` FOREIGN KEY (`institucion_aid`) REFERENCES `Institucion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IngresoPorDonativo`
--

LOCK TABLES `IngresoPorDonativo` WRITE;
/*!40000 ALTER TABLE `IngresoPorDonativo` DISABLE KEYS */;
/*!40000 ALTER TABLE `IngresoPorDonativo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ambito`
--

DROP TABLE IF EXISTS `Ambito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ambito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(145) NOT NULL,
  `estatus_did` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ambito_estatus` (`estatus_did`),
  CONSTRAINT `ambito_estatus` FOREIGN KEY (`estatus_did`) REFERENCES `Estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ambito`
--

LOCK TABLES `Ambito` WRITE;
/*!40000 ALTER TABLE `Ambito` DISABLE KEYS */;
INSERT INTO `Ambito` VALUES (1,'No Me Acuerdo',1);
/*!40000 ALTER TABLE `Ambito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Municipio`
--

DROP TABLE IF EXISTS `Municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Municipio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(45) NOT NULL,
  `nombre` varchar(145) NOT NULL,
  `estado_did` int(11) NOT NULL,
  `estatus_did` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `municipio_estatus` (`estatus_did`),
  KEY `municipio_estado` (`estado_did`),
  CONSTRAINT `municipio_estado` FOREIGN KEY (`estado_did`) REFERENCES `Estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `municipio_estatus` FOREIGN KEY (`estatus_did`) REFERENCES `Estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Municipio`
--

LOCK TABLES `Municipio` WRITE;
/*!40000 ALTER TABLE `Municipio` DISABLE KEYS */;
INSERT INTO `Municipio` VALUES (1,'006','Culiacán',2,1),(2,'004','Hermosillo',3,2);
/*!40000 ALTER TABLE `Municipio` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-07-19 23:42:23
CREATE DATABASE  IF NOT EXISTS `sidb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `sidb`;
-- MySQL dump 10.13  Distrib 5.1.34, for apple-darwin9.5.0 (i386)
--
-- Host: 192.168.5.103    Database: sidb
-- ------------------------------------------------------
-- Server version	5.5.24-0ubuntu0.12.04.1

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
-- Table structure for table `Servicio`
--

DROP TABLE IF EXISTS `Servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Servicio` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `categoriaServicio_id` int(11) DEFAULT NULL,
  `estatus_id` int(11) DEFAULT NULL,
  `programaPagos_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Servicio`
--

LOCK TABLES `Servicio` WRITE;
/*!40000 ALTER TABLE `Servicio` DISABLE KEYS */;
INSERT INTO `Servicio` VALUES (1,'Sistemas Computacionales',1,1,NULL);
/*!40000 ALTER TABLE `Servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ciclo`
--

DROP TABLE IF EXISTS `Ciclo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ciclo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `fechaInicial` date NOT NULL,
  `fechaFinal` date NOT NULL,
  `estatus_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ciclo_estatus` (`estatus_id`),
  CONSTRAINT `ciclo_estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ciclo`
--

LOCK TABLES `Ciclo` WRITE;
/*!40000 ALTER TABLE `Ciclo` DISABLE KEYS */;
INSERT INTO `Ciclo` VALUES (1,'Ciclo Escolar 2010-2014','2010-08-16','2014-06-16',1),(2,'Ciclo Escolar 2011-2015','2011-01-01','2015-06-15',1);
/*!40000 ALTER TABLE `Ciclo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Promocion`
--

DROP TABLE IF EXISTS `Promocion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Promocion` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `porcentaje` decimal(10,0) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFinal` date NOT NULL,
  `estatus_id` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Promocion`
--

LOCK TABLES `Promocion` WRITE;
/*!40000 ALTER TABLE `Promocion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Promocion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProgramaPagoDetalle`
--

DROP TABLE IF EXISTS `ProgramaPagoDetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProgramaPagoDetalle` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `programaPagos_id` int(11) NOT NULL,
  `partida` int(11) NOT NULL,
  `subcuenta_id` int(11) NOT NULL,
  `fechaVigencia` date NOT NULL,
  `importe` decimal(10,0) NOT NULL,
  `estatus_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProgramaPagoDetalle`
--

LOCK TABLES `ProgramaPagoDetalle` WRITE;
/*!40000 ALTER TABLE `ProgramaPagoDetalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProgramaPagoDetalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Alumno`
--

DROP TABLE IF EXISTS `Alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Alumno` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `apellidoPaterno` varchar(100) NOT NULL DEFAULT '',
  `apellidoMaterno` varchar(100) DEFAULT '',
  `matricula` varchar(10) DEFAULT NULL,
  `preparatoria_id` int(11) unsigned NOT NULL,
  `telefono` varchar(100) DEFAULT '',
  `email` varchar(100) DEFAULT '',
  `referenciaBancaria` int(11) DEFAULT NULL,
  `promedio` decimal(10,0) DEFAULT NULL,
  `direccion` varchar(200) NOT NULL DEFAULT '',
  `ciudad_id` int(11) unsigned NOT NULL,
  `estatus_id` int(11) unsigned NOT NULL,
  `codigoPostal` varchar(5) NOT NULL DEFAULT '',
  `edad` int(11) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `celular` varchar(100) DEFAULT '',
  `sexo` varchar(100) NOT NULL DEFAULT '',
  `nombrePadre` varchar(100) DEFAULT '',
  `nombreMadre` varchar(100) DEFAULT '',
  `telefonoPadre` int(11) DEFAULT NULL,
  `telefonoMadre` int(11) DEFAULT NULL,
  `tipoInstitucion_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `prospecto_preparatoria` (`preparatoria_id`),
  KEY `prospecto_ciudad` (`ciudad_id`),
  KEY `prospecto_estado` (`estatus_id`),
  KEY `prospecto_tipoInstitucion_id` (`tipoInstitucion_id`),
  CONSTRAINT `alumno_ciudad` FOREIGN KEY (`ciudad_id`) REFERENCES `Ciudad` (`id`),
  CONSTRAINT `alumno_estado` FOREIGN KEY (`estatus_id`) REFERENCES `Estado` (`id`),
  CONSTRAINT `alumno_preparatoria` FOREIGN KEY (`preparatoria_id`) REFERENCES `Preparatoria` (`id`),
  CONSTRAINT `alumno_tipoInstitucion_id` FOREIGN KEY (`tipoInstitucion_id`) REFERENCES `TipoInstitucion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alumno`
--

LOCK TABLES `Alumno` WRITE;
/*!40000 ALTER TABLE `Alumno` DISABLE KEYS */;
/*!40000 ALTER TABLE `Alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CategoriaBeca`
--

DROP TABLE IF EXISTS `CategoriaBeca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CategoriaBeca` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `estatus_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoriaBeca_estatus` (`estatus_id`),
  CONSTRAINT `categoriaBeca_estatus` FOREIGN KEY (`estatus_id`) REFERENCES `CategoriaBeca` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CategoriaBeca`
--

LOCK TABLES `CategoriaBeca` WRITE;
/*!40000 ALTER TABLE `CategoriaBeca` DISABLE KEYS */;
INSERT INTO `CategoriaBeca` VALUES (1,'Académica',1),(2,'Deportiva',1),(3,'Crédito',1);
/*!40000 ALTER TABLE `CategoriaBeca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CategoriaServicio`
--

DROP TABLE IF EXISTS `CategoriaServicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CategoriaServicio` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `estatus_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CategoriaServicio`
--

LOCK TABLES `CategoriaServicio` WRITE;
/*!40000 ALTER TABLE `CategoriaServicio` DISABLE KEYS */;
INSERT INTO `CategoriaServicio` VALUES (1,'Licenciatura',1),(2,'Maestría',1),(3,'Diplomados',1);
/*!40000 ALTER TABLE `CategoriaServicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cuenta`
--

DROP TABLE IF EXISTS `Cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cuenta` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `estatus_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cuenta`
--

LOCK TABLES `Cuenta` WRITE;
/*!40000 ALTER TABLE `Cuenta` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tutor`
--

DROP TABLE IF EXISTS `Tutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tutor` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tutor`
--

LOCK TABLES `Tutor` WRITE;
/*!40000 ALTER TABLE `Tutor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tutor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TipoInstitucion`
--

DROP TABLE IF EXISTS `TipoInstitucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TipoInstitucion` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `estatus_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TipoInstitucion`
--

LOCK TABLES `TipoInstitucion` WRITE;
/*!40000 ALTER TABLE `TipoInstitucion` DISABLE KEYS */;
INSERT INTO `TipoInstitucion` VALUES (1,'Pública',1),(2,'Privada',1);
/*!40000 ALTER TABLE `TipoInstitucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DocumentoProspecto`
--

DROP TABLE IF EXISTS `DocumentoProspecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DocumentoProspecto` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `documento_id` int(10) unsigned NOT NULL,
  `prospecto_id` int(10) unsigned NOT NULL,
  `estatus_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `prospecto_documentoprospecto` (`prospecto_id`),
  KEY `documento_documentoprospecto` (`documento_id`),
  KEY `estatus_documentoprosprecto` (`estatus_id`),
  CONSTRAINT `documento_documentoprospecto` FOREIGN KEY (`documento_id`) REFERENCES `Documento` (`id`),
  CONSTRAINT `estatus_documentoprosprecto` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`id`),
  CONSTRAINT `prospecto_documentoprospecto` FOREIGN KEY (`prospecto_id`) REFERENCES `Prospecto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DocumentoProspecto`
--

LOCK TABLES `DocumentoProspecto` WRITE;
/*!40000 ALTER TABLE `DocumentoProspecto` DISABLE KEYS */;
INSERT INTO `DocumentoProspecto` VALUES (5,1,6,3),(6,2,6,3);
/*!40000 ALTER TABLE `DocumentoProspecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prospecto`
--

DROP TABLE IF EXISTS `Prospecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Prospecto` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `apellidoPaterno` varchar(100) NOT NULL DEFAULT '',
  `apellidoMaterno` varchar(100) DEFAULT '',
  `preparatoria_id` int(11) unsigned NOT NULL,
  `telefono` varchar(100) DEFAULT '',
  `email` varchar(100) DEFAULT '',
  `referenciaBancaria` int(11) DEFAULT NULL,
  `promedio` decimal(10,0) DEFAULT NULL,
  `direccion` varchar(200) NOT NULL DEFAULT '',
  `ciudad_id` int(11) unsigned NOT NULL,
  `estatus_id` int(11) unsigned NOT NULL,
  `codigoPostal` varchar(5) NOT NULL DEFAULT '',
  `edad` int(11) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `celular` varchar(100) DEFAULT '',
  `sexo` varchar(100) NOT NULL DEFAULT '',
  `nombrePadre` varchar(100) DEFAULT '',
  `nombreMadre` varchar(100) DEFAULT '',
  `telefonoPadre` int(11) DEFAULT NULL,
  `telefonoMadre` int(11) DEFAULT NULL,
  `tipoInstitucion_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `prospecto_preparatoria` (`preparatoria_id`),
  KEY `prospecto_ciudad` (`ciudad_id`),
  KEY `prospecto_estado` (`estatus_id`),
  KEY `prospecto_tipoInstitucion_id` (`tipoInstitucion_id`),
  CONSTRAINT `prospecto_ciudad` FOREIGN KEY (`ciudad_id`) REFERENCES `Ciudad` (`id`),
  CONSTRAINT `prospecto_estado` FOREIGN KEY (`estatus_id`) REFERENCES `Estado` (`id`),
  CONSTRAINT `prospecto_preparatoria` FOREIGN KEY (`preparatoria_id`) REFERENCES `Preparatoria` (`id`),
  CONSTRAINT `prospecto_tipoInstitucion_id` FOREIGN KEY (`tipoInstitucion_id`) REFERENCES `TipoInstitucion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prospecto`
--

LOCK TABLES `Prospecto` WRITE;
/*!40000 ALTER TABLE `Prospecto` DISABLE KEYS */;
INSERT INTO `Prospecto` VALUES (6,'Roberto','Zamarripa','Villegas',1,'016677519841','rzamarripa@cidesoftware.com',12346890,'85','Angel Martinez #3113',1,1,'80280',28,'0000-00-00','6677519841','Masculino','Rigoberto','Pety',123,123,1);
/*!40000 ALTER TABLE `Prospecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Documento`
--

DROP TABLE IF EXISTS `Documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Documento` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `requerido` tinyint(1) NOT NULL,
  `estatus_id` int(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `documentos_estatus` (`estatus_id`),
  CONSTRAINT `documentos_estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Documento`
--

LOCK TABLES `Documento` WRITE;
/*!40000 ALTER TABLE `Documento` DISABLE KEYS */;
INSERT INTO `Documento` VALUES (1,'Acta Nacimiento',1,1),(2,'Comprobante de Domicilio',1,1);
/*!40000 ALTER TABLE `Documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Estatus`
--

DROP TABLE IF EXISTS `Estatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Estatus` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Estatus`
--

LOCK TABLES `Estatus` WRITE;
/*!40000 ALTER TABLE `Estatus` DISABLE KEYS */;
INSERT INTO `Estatus` VALUES (1,'Activo'),(2,'Inactivo'),(3,'No Entregado');
/*!40000 ALTER TABLE `Estatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProgramaPago`
--

DROP TABLE IF EXISTS `ProgramaPago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProgramaPago` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ciclo_id` int(11) unsigned NOT NULL,
  `categoriaServicio_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `programapago_ciclo` (`ciclo_id`),
  KEY `programapago_categoriaservicio` (`categoriaServicio_id`),
  CONSTRAINT `programapago_categoriaservicio` FOREIGN KEY (`categoriaServicio_id`) REFERENCES `CategoriaServicio` (`id`),
  CONSTRAINT `programapago_ciclo` FOREIGN KEY (`ciclo_id`) REFERENCES `Ciclo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProgramaPago`
--

LOCK TABLES `ProgramaPago` WRITE;
/*!40000 ALTER TABLE `ProgramaPago` DISABLE KEYS */;
INSERT INTO `ProgramaPago` VALUES (1,1,2),(2,1,1);
/*!40000 ALTER TABLE `ProgramaPago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ciudad`
--

DROP TABLE IF EXISTS `Ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ciudad` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `estatus_id` int(11) unsigned NOT NULL,
  `estado_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ciudad_estado` (`estado_id`),
  KEY `ciudad_estatus` (`estatus_id`),
  CONSTRAINT `ciudad_estado` FOREIGN KEY (`estado_id`) REFERENCES `Estado` (`id`),
  CONSTRAINT `ciudad_estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ciudad`
--

LOCK TABLES `Ciudad` WRITE;
/*!40000 ALTER TABLE `Ciudad` DISABLE KEYS */;
INSERT INTO `Ciudad` VALUES (1,'Culiacán',1,1);
/*!40000 ALTER TABLE `Ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Preparatoria`
--

DROP TABLE IF EXISTS `Preparatoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Preparatoria` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `estatus_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `preparatoria_estatus` (`estatus_id`),
  CONSTRAINT `preparatoria_estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Preparatoria`
--

LOCK TABLES `Preparatoria` WRITE;
/*!40000 ALTER TABLE `Preparatoria` DISABLE KEYS */;
INSERT INTO `Preparatoria` VALUES (1,'CBTis224',1),(2,'Conalep',1);
/*!40000 ALTER TABLE `Preparatoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Subcuenta`
--

DROP TABLE IF EXISTS `Subcuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Subcuenta` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `importe` decimal(10,0) DEFAULT NULL,
  `tipo` varchar(1) DEFAULT NULL,
  `estatus_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Subcuenta`
--

LOCK TABLES `Subcuenta` WRITE;
/*!40000 ALTER TABLE `Subcuenta` DISABLE KEYS */;
/*!40000 ALTER TABLE `Subcuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Beca`
--

DROP TABLE IF EXISTS `Beca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Beca` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `porcentaje` decimal(10,0) NOT NULL,
  `categoriabeca_id` int(11) unsigned NOT NULL,
  `promedioInicial` decimal(10,0) NOT NULL,
  `promedioFinal` decimal(10,0) NOT NULL,
  `estatus_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `beca_categoriabeca` (`categoriabeca_id`),
  KEY `beca_estatus` (`estatus_id`),
  CONSTRAINT `beca_categoriabeca` FOREIGN KEY (`categoriabeca_id`) REFERENCES `CategoriaBeca` (`id`),
  CONSTRAINT `beca_estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Beca`
--

LOCK TABLES `Beca` WRITE;
/*!40000 ALTER TABLE `Beca` DISABLE KEYS */;
INSERT INTO `Beca` VALUES (1,'100 - 85','20',1,'80','100',1);
/*!40000 ALTER TABLE `Beca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Estado`
--

DROP TABLE IF EXISTS `Estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Estado` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `estatus_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `estado_estatus` (`estatus_id`),
  CONSTRAINT `estado_estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Estado`
--

LOCK TABLES `Estado` WRITE;
/*!40000 ALTER TABLE `Estado` DISABLE KEYS */;
INSERT INTO `Estado` VALUES (1,'Sinaloa',1),(2,'DF',2);
/*!40000 ALTER TABLE `Estado` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-07-19 23:42:25
CREATE DATABASE  IF NOT EXISTS `siussdb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `siussdb`;
-- MySQL dump 10.13  Distrib 5.1.34, for apple-darwin9.5.0 (i386)
--
-- Host: 192.168.5.103    Database: siussdb
-- ------------------------------------------------------
-- Server version	5.5.24-0ubuntu0.12.04.1

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
-- Table structure for table `Becas_Prospectos`
--

DROP TABLE IF EXISTS `Becas_Prospectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Becas_Prospectos` (
  `beca_id` int(11) unsigned NOT NULL,
  `prospecto_id` int(11) unsigned NOT NULL,
  `estatus_id` int(11) unsigned NOT NULL,
  KEY `FK_BecasProspectos_Prospectos` (`prospecto_id`),
  KEY `FK_BecasProcpectos_Estatus` (`estatus_id`),
  CONSTRAINT `FK_BecasProcpectos_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`),
  CONSTRAINT `FK_BecasProspectos_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`),
  CONSTRAINT `FK_BecasProspectos_Prospectos` FOREIGN KEY (`prospecto_id`) REFERENCES `Prospectos` (`prospecto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Becas_Prospectos`
--

LOCK TABLES `Becas_Prospectos` WRITE;
/*!40000 ALTER TABLE `Becas_Prospectos` DISABLE KEYS */;
INSERT INTO `Becas_Prospectos` VALUES (4,113,1),(4,252,1),(7,266,1),(1,18,1),(4,18,1),(4,6,1),(4,10,1),(39,10,1),(7,19,1),(1,22,1),(4,22,1),(4,24,1),(3,25,1),(5,42,1),(3,46,1),(3,12,1),(39,12,1),(1,53,1),(4,53,1),(4,57,1),(11,58,1),(1,62,1),(4,62,1),(3,64,1),(3,9,1),(4,65,1),(4,69,1),(1,70,1),(4,70,1),(7,71,1),(4,73,1),(1,75,1),(4,75,1),(4,77,1),(2,77,1),(4,78,1),(3,79,1),(3,84,1),(4,89,1),(4,98,1),(3,99,1),(3,100,1),(2,90,1),(5,90,1),(4,101,1),(7,105,1),(3,106,1),(39,106,1),(4,108,1),(4,111,1),(4,116,1),(5,119,1),(1,119,1),(3,91,1),(39,91,1),(11,123,1),(7,127,1),(4,128,1),(4,129,1),(39,129,1),(7,131,1),(7,133,1),(7,134,1),(4,135,1),(7,137,1),(3,139,1),(39,139,1),(7,140,1),(3,143,1),(1,143,1),(2,145,1),(5,145,1),(7,146,1),(7,148,1),(8,149,1),(39,149,1),(1,150,1),(4,150,1),(7,151,1),(3,153,1),(39,153,1),(7,155,1),(8,161,1),(7,162,1),(7,165,1),(1,167,1),(4,167,1),(7,168,1),(6,169,1),(2,169,1),(4,3,1),(7,177,1),(7,178,1),(3,183,1),(5,184,1),(6,186,1),(1,186,1),(3,187,1),(6,191,1),(5,193,1),(8,196,1),(4,197,1),(5,202,1),(7,203,1),(5,206,1),(9,207,1),(7,208,1),(5,210,1),(5,211,1),(6,212,1),(6,217,1),(7,218,1),(2,218,1),(5,221,1),(6,225,1),(4,226,1),(5,228,1),(5,229,1),(7,230,1),(8,232,1),(1,232,1),(8,234,1),(1,234,1),(7,235,1),(7,236,1),(2,236,1),(3,237,1),(5,238,1),(4,239,1),(4,240,1),(8,242,1),(3,245,1),(3,246,1),(4,248,1),(13,256,1),(7,258,1),(7,261,1),(4,250,1),(4,265,1);
/*!40000 ALTER TABLE `Becas_Prospectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Becas`
--

DROP TABLE IF EXISTS `Becas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Becas` (
  `beca_id` int(11) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `porcentaje` decimal(11,0) NOT NULL,
  `estatus_id` int(11) unsigned NOT NULL,
  `tipoBeca_id` int(11) unsigned NOT NULL,
  `promedioInicial` decimal(10,4) NOT NULL,
  `promedioFinal` decimal(10,4) NOT NULL,
  `empresa_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`beca_id`),
  UNIQUE KEY `unique_becas_nombre` (`nombre`),
  KEY `FK_Becas_Estatus` (`estatus_id`),
  KEY `FK_Becas_Empresas` (`empresa_id`),
  KEY `FK_Becas_TiposBecas` (`tipoBeca_id`),
  CONSTRAINT `FK_Becas_Empresas` FOREIGN KEY (`empresa_id`) REFERENCES `Empresas` (`empresa_id`),
  CONSTRAINT `FK_Becas_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`),
  CONSTRAINT `FK_Becas_TiposBecas` FOREIGN KEY (`tipoBeca_id`) REFERENCES `Tipos_Becas` (`tipoBeca_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Becas`
--

LOCK TABLES `Becas` WRITE;
/*!40000 ALTER TABLE `Becas` DISABLE KEYS */;
INSERT INTO `Becas` VALUES (1,'20% CRÉDITO','20',1,5,'80.0000','80.0000',1),(2,'30% CRÉDITO','30',1,5,'80.0000','80.0000',1),(3,'10% ACADÉMICA','10',1,1,'80.0000','80.0000',1),(4,'20% ACADÉMICA','20',1,1,'80.0000','80.0000',1),(5,'30% ACADÉMICA','30',1,1,'80.0000','80.0000',1),(6,'40% ACADÉMICA','40',1,1,'80.0000','80.0000',1),(7,'50% ACADÉMICA','50',1,1,'80.0000','80.0000',1),(8,'60% ACADÉMICA','60',1,1,'80.0000','80.0000',1),(9,'70% ACADÉMICA','70',1,1,'80.0000','80.0000',1),(10,'80% ACADÉMICA','80',1,1,'80.0000','80.0000',1),(11,'90% ACADÉMICA','90',1,1,'80.0000','80.0000',1),(12,'100% ACADÉMICA','100',1,1,'80.0000','80.0000',1),(13,'25% ACADÉMICA','25',1,1,'80.0000','80.0000',1),(14,'15% ACADÉMICA','15',1,1,'80.0000','80.0000',1),(32,'35% ACADÉMICA','35',1,1,'85.0000','85.0000',1),(33,'45% ACADÉMICA','45',1,1,'85.0000','85.0000',1),(34,'55%ACADÉMICA','55',1,1,'85.0000','85.0000',1),(35,'65% ACADÉMICA','65',1,1,'85.0000','85.0000',1),(36,'75% ACADÉMICA','75',1,1,'85.0000','85.0000',1),(37,'85% ACADÉMICA','85',1,1,'85.0000','85.0000',1),(38,'95% ACADÉMICA','95',1,1,'85.0000','85.0000',1),(39,'10% CRÉDITO','10',1,1,'85.0000','85.0000',1),(40,'40% CRÉDITO','40',1,1,'85.0000','85.0000',1),(41,'50% CRÉDITO','50',1,1,'85.0000','85.0000',1),(42,'60% CRÉDITO','60',1,1,'85.0000','85.0000',1),(43,'70% CRÉDITO','70',1,1,'85.0000','85.0000',1),(44,'80% CRÉDITO','80',1,1,'85.0000','85.0000',1),(45,'90% CRÉDITO','90',1,1,'85.0000','85.0000',1),(46,'100% CRÉDITO','100',1,1,'85.0000','85.0000',1),(47,'15% CRÉDITO','15',1,1,'85.0000','85.0000',1),(48,'25% CRÉDITO','25',1,1,'85.0000','85.0000',1),(49,'35% CRÉDITO','35',1,5,'85.0000','85.0000',1),(62,'45% CRÉDITO','45',1,5,'85.0000','85.0000',1),(63,'55% CRÉDITO','55',1,5,'85.0000','85.0000',1),(64,'65% CRÉDITO','65',1,5,'85.0000','85.0000',1),(65,'75% CRÉDITO','75',1,5,'85.0000','85.0000',1),(66,'85% CRÉDITO','85',1,5,'85.0000','85.0000',1),(67,'95% CRÉDITO','95',1,5,'85.0000','85.0000',1),(68,'10% DEPORTIVA','10',1,4,'85.0000','85.0000',1),(69,'15% DEPORTIVA','15',1,4,'85.0000','85.0000',1),(70,'20% DEPORTIVA','20',1,4,'85.0000','8.0000',1),(71,'25% DEPORTIVA','25',1,4,'85.0000','85.0000',1),(72,'30% DEPORTIVA','30',1,4,'85.0000','85.0000',1),(73,'35% DEPORTIVA','35',1,4,'85.0000','85.0000',1),(74,'40% DEPORTIVA','40',1,4,'85.0000','85.0000',1),(75,'45% DEPORTIVA','45',1,4,'85.0000','85.0000',1),(76,'50% DEPORTIVA','50',1,4,'85.0000','85.0000',1),(77,'55% DEPORTIVA','55',1,4,'85.0000','85.0000',1),(78,'60% DEPORTIVA','60',1,4,'85.0000','85.0000',1),(79,'65% DEPORTIVA','65',1,4,'85.0000','85.0000',1),(80,'70% DEPORTIVA','70',1,4,'85.0000','85.0000',1),(81,'75% DEPORTIVA','75',1,4,'85.0000','85.0000',1),(82,'80% DEPORTIVA','80',1,4,'85.0000','85.0000',1),(83,'85% DEPORTIVA','85',1,4,'85.0000','85.0000',1),(84,'90% DEPORTIVA','90',1,4,'85.0000','85.0000',1),(85,'95% DEPORTIVA','95',1,4,'85.0000','85.0000',1),(86,'100% DEPORTIVA','100',1,4,'85.0000','85.0000',1),(87,'10% ARTISTICA','10',1,3,'85.0000','85.0000',1),(88,'15% ARTISTICA','15',1,3,'85.0000','85.0000',1),(89,'20% ARTISTICA','20',1,3,'85.0000','85.0000',1),(90,'25% ARTISTICA','25',1,3,'85.0000','85.0000',1),(91,'30% ARTISTICA','30',1,3,'85.0000','85.0000',1),(92,'35% ARTISTICA','35',1,3,'85.0000','85.0000',1),(93,'40% ARTISTICA','40',1,3,'85.0000','85.0000',1),(94,'45% ARTISTICA','45',1,3,'85.0000','85.0000',1),(95,'50% ARTISTICA','50',1,3,'85.0000','85.0000',1),(96,'55% ARTISTICA','55',1,3,'85.0000','85.0000',1),(97,'60% ARTISTICA','60',1,3,'85.0000','85.0000',1),(98,'65% ARTISTICA','65',1,3,'85.0000','85.0000',1),(99,'70% ARTISTICA','70',1,3,'85.0000','85.0000',1),(100,'75% ARTISTICA','75',1,3,'85.0000','85.0000',1),(101,'80% ARTISTICA','80',1,3,'85.0000','85.0000',1),(102,'85% ARTISTICA','85',1,3,'85.0000','85.0000',1),(103,'90% ARTISTICA','90',1,3,'85.0000','85.0000',1),(104,'95% ARTISTICA','95',1,3,'85.0000','85.0000',1),(105,'100% ARTISTICA','100',1,3,'85.0000','85.0000',1),(106,'10% BAJOS RECURSOS','10',1,2,'85.0000','85.0000',1),(107,'20% BAJOS RECURSOS','20',1,2,'85.0000','85.0000',1),(108,'30% BAJOS RECURSOS','30',1,2,'85.0000','85.0000',1),(109,'15% BAJOS RECURSOS','15',1,2,'85.0000','85.0000',1),(110,'25% BAJOS RECURSOS','25',1,2,'85.0000','85.0000',1),(111,'35% BAJOS RECURSOS','35',1,2,'85.0000','85.0000',1),(112,'40% BAJOS RECURSOS','40',1,2,'85.0000','85.0000',1),(113,'45% BAJOS RECURSOS','45',1,2,'85.0000','85.0000',1),(114,'50% BAJOS RECURSOS','50',1,2,'85.0000','85.0000',1),(115,'55% BAJOS RECURSOS','55',1,2,'85.0000','85.0000',1),(116,'60% BAJOS RECURSOS','60',1,2,'85.0000','85.0000',1),(117,'65% BAJOS RECURSOS','65',1,2,'85.0000','85.0000',1),(118,'70% BAJOS RECURSOS','70',1,2,'85.0000','85.0000',1),(119,'75% BAJOS RECURSOS','75',1,2,'85.0000','85.0000',1),(120,'80% BAJOS RECURSOS','80',1,2,'85.0000','85.0000',1),(121,'85% BAJOS RECURSOS','85',1,2,'85.0000','85.0000',1),(122,'90% BAJOS RECURSOS','90',1,2,'85.0000','85.0000',1),(123,'95% BAJOS RECURSOS','95',1,2,'85.0000','85.0000',1),(124,'100% BAJOS RECURSOS','100',1,2,'85.0000','85.0000',1);
/*!40000 ALTER TABLE `Becas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contratos`
--

DROP TABLE IF EXISTS `Contratos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Contratos` (
  `contrato_id` int(11) unsigned NOT NULL,
  `servicio_id` int(11) unsigned NOT NULL,
  `programaPagos_id` int(11) unsigned NOT NULL,
  `prospecto_id` int(11) unsigned NOT NULL,
  `becaPorcentaje` decimal(10,0) NOT NULL,
  `estatus_id` int(11) unsigned NOT NULL,
  `becaImporte` decimal(10,4) NOT NULL,
  `subTotal` decimal(10,4) NOT NULL,
  `total` decimal(10,4) NOT NULL,
  `empresa_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`contrato_id`),
  KEY `FK_Contratos_Servicios` (`servicio_id`),
  KEY `FK_Contratos_ProgramaPagos` (`programaPagos_id`),
  KEY `FK_Contratos_Prospectos` (`prospecto_id`),
  KEY `FK_Contratos_Estatus` (`estatus_id`),
  KEY `FK_Contratos_Empresas` (`empresa_id`),
  CONSTRAINT `FK_Contratos_Empresas` FOREIGN KEY (`empresa_id`) REFERENCES `Empresas` (`empresa_id`),
  CONSTRAINT `FK_Contratos_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`),
  CONSTRAINT `FK_Contratos_ProgramaPagos` FOREIGN KEY (`programaPagos_id`) REFERENCES `Programa_Pagos` (`programaPagos_id`),
  CONSTRAINT `FK_Contratos_Prospectos` FOREIGN KEY (`prospecto_id`) REFERENCES `Prospectos` (`prospecto_id`),
  CONSTRAINT `FK_Contratos_Servicios` FOREIGN KEY (`servicio_id`) REFERENCES `Servicios` (`servicio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contratos`
--

LOCK TABLES `Contratos` WRITE;
/*!40000 ALTER TABLE `Contratos` DISABLE KEYS */;
INSERT INTO `Contratos` VALUES (1,5,1,182,'0',4,'0.0000','91540.0000','91540.0000',1),(2,5,1,183,'10',4,'9154.0000','91540.0000','82386.0000',1),(3,5,1,184,'30',4,'27462.0000','91540.0000','64078.0000',1),(4,1,1,185,'0',4,'0.0000','91540.0000','91540.0000',1),(5,6,1,186,'60',4,'54924.0000','91540.0000','36616.0000',1),(6,5,1,187,'10',4,'9154.0000','91540.0000','82386.0000',1),(7,1,1,188,'0',4,'0.0000','91540.0000','91540.0000',1),(8,6,1,189,'0',4,'0.0000','91540.0000','91540.0000',1),(9,6,1,16,'0',4,'0.0000','91540.0000','91540.0000',1),(10,5,1,190,'0',4,'0.0000','91540.0000','91540.0000',1),(11,5,1,191,'40',4,'36616.0000','91540.0000','54924.0000',1),(12,5,1,192,'0',4,'0.0000','91540.0000','91540.0000',1),(13,5,1,193,'30',4,'27462.0000','91540.0000','64078.0000',1),(14,5,1,194,'0',4,'0.0000','91540.0000','91540.0000',1),(15,5,1,195,'0',4,'0.0000','91540.0000','91540.0000',1),(16,6,1,196,'60',4,'54924.0000','91540.0000','36616.0000',1),(17,7,1,197,'20',4,'18308.0000','91540.0000','73232.0000',1),(18,1,1,198,'0',4,'0.0000','91540.0000','91540.0000',1),(19,7,1,199,'0',4,'0.0000','91540.0000','91540.0000',1),(20,6,1,200,'0',4,'0.0000','91540.0000','91540.0000',1),(21,7,1,201,'0',4,'0.0000','91540.0000','91540.0000',1),(22,5,1,202,'30',4,'27462.0000','91540.0000','64078.0000',1),(23,5,1,203,'50',4,'45770.0000','91540.0000','45770.0000',1),(24,5,1,204,'0',4,'0.0000','91540.0000','91540.0000',1),(25,5,1,205,'0',4,'0.0000','91540.0000','91540.0000',1),(26,6,1,206,'30',4,'27462.0000','91540.0000','64078.0000',1),(27,5,1,207,'70',4,'64078.0000','91540.0000','27462.0000',1),(28,5,1,208,'50',4,'45770.0000','91540.0000','45770.0000',1),(29,1,1,209,'0',4,'0.0000','91540.0000','91540.0000',1),(30,5,1,210,'30',4,'27462.0000','91540.0000','64078.0000',1),(31,5,1,211,'30',4,'27462.0000','91540.0000','64078.0000',1),(32,6,1,212,'0',4,'0.0000','91540.0000','91540.0000',1),(33,7,1,213,'0',4,'0.0000','91540.0000','91540.0000',1),(34,5,1,214,'0',4,'0.0000','91540.0000','91540.0000',1),(35,6,1,215,'0',4,'0.0000','91540.0000','91540.0000',1),(36,7,1,216,'0',4,'0.0000','91540.0000','91540.0000',1),(37,5,1,217,'40',4,'36616.0000','91540.0000','54924.0000',1),(38,1,1,218,'80',4,'73232.0000','91540.0000','18308.0000',1),(39,7,1,219,'0',4,'0.0000','91540.0000','91540.0000',1),(40,1,1,220,'0',4,'0.0000','91540.0000','91540.0000',1),(41,1,1,221,'30',4,'27462.0000','91540.0000','64078.0000',1),(42,1,1,222,'0',4,'0.0000','91540.0000','91540.0000',1),(43,7,1,223,'0',4,'0.0000','91540.0000','91540.0000',1),(44,6,1,224,'0',4,'0.0000','91540.0000','91540.0000',1),(45,6,1,225,'0',4,'0.0000','91540.0000','91540.0000',1),(46,5,1,226,'0',4,'0.0000','91540.0000','91540.0000',1),(47,1,1,227,'0',4,'0.0000','91540.0000','91540.0000',1),(48,6,1,228,'30',4,'27462.0000','91540.0000','64078.0000',1),(49,1,1,229,'30',4,'27462.0000','91540.0000','64078.0000',1),(50,6,1,230,'50',4,'45770.0000','91540.0000','45770.0000',1),(51,5,1,231,'0',4,'0.0000','91540.0000','91540.0000',1),(52,7,1,232,'80',4,'73232.0000','91540.0000','18308.0000',1),(53,6,1,233,'0',4,'0.0000','91540.0000','91540.0000',1),(54,6,1,234,'80',4,'73232.0000','91540.0000','18308.0000',1),(55,6,1,235,'50',4,'45770.0000','91540.0000','45770.0000',1),(56,5,1,236,'80',4,'73232.0000','91540.0000','18308.0000',1),(57,6,1,237,'10',4,'9154.0000','91540.0000','82386.0000',1),(58,6,1,238,'30',4,'27462.0000','91540.0000','64078.0000',1),(59,6,1,239,'20',4,'18308.0000','91540.0000','73232.0000',1),(60,6,1,240,'20',4,'18308.0000','91540.0000','73232.0000',1),(61,5,1,241,'0',4,'0.0000','91540.0000','91540.0000',1),(62,6,1,242,'60',4,'54924.0000','91540.0000','36616.0000',1),(63,5,1,243,'0',4,'0.0000','91540.0000','91540.0000',1),(64,5,1,244,'0',4,'0.0000','91540.0000','91540.0000',1),(65,1,1,245,'10',4,'9154.0000','91540.0000','82386.0000',1),(66,5,1,246,'10',4,'9154.0000','91540.0000','82386.0000',1),(67,6,1,247,'0',4,'0.0000','91540.0000','91540.0000',1),(68,5,1,248,'20',4,'18308.0000','91540.0000','73232.0000',1),(69,5,1,249,'0',4,'0.0000','91540.0000','91540.0000',1),(70,1,1,250,'20',4,'18308.0000','91540.0000','73232.0000',1),(71,7,1,251,'0',4,'0.0000','91540.0000','91540.0000',1),(72,6,1,252,'0',4,'0.0000','91540.0000','91540.0000',1),(73,5,1,253,'0',4,'0.0000','91540.0000','91540.0000',1),(74,7,1,254,'0',4,'0.0000','91540.0000','91540.0000',1),(75,6,1,255,'0',4,'0.0000','91540.0000','91540.0000',1),(76,1,1,256,'25',4,'22885.0000','91540.0000','68655.0000',1),(77,1,1,257,'0',4,'0.0000','91540.0000','91540.0000',1),(78,7,1,258,'50',4,'45770.0000','91540.0000','45770.0000',1),(79,1,1,259,'0',4,'0.0000','91540.0000','91540.0000',1),(80,6,1,260,'0',4,'0.0000','91540.0000','91540.0000',1),(81,6,1,261,'50',4,'45770.0000','91540.0000','45770.0000',1),(82,7,1,262,'0',4,'0.0000','91540.0000','91540.0000',1),(83,6,1,263,'0',4,'0.0000','91540.0000','91540.0000',1),(84,5,1,264,'0',4,'0.0000','91540.0000','91540.0000',1),(85,5,1,265,'20',4,'18308.0000','91540.0000','73232.0000',1),(86,5,1,266,'50',4,'45770.0000','91540.0000','45770.0000',1),(87,5,3,17,'0',4,'0.0000','95520.0000','95520.0000',1),(88,5,3,18,'40',4,'38208.0000','95520.0000','57312.0000',1),(89,3,3,6,'20',4,'19104.0000','95520.0000','76416.0000',1),(90,9,3,10,'30',4,'28656.0000','95520.0000','66864.0000',1),(91,9,3,19,'50',4,'47760.0000','95520.0000','47760.0000',1),(92,5,3,20,'0',4,'0.0000','95520.0000','95520.0000',1),(93,3,3,11,'0',4,'0.0000','95520.0000','95520.0000',1),(94,8,3,21,'0',4,'0.0000','95520.0000','95520.0000',1),(95,4,3,22,'0',4,'0.0000','95520.0000','95520.0000',1),(96,8,3,14,'0',4,'0.0000','95520.0000','95520.0000',1),(97,6,3,24,'20',4,'19104.0000','95520.0000','76416.0000',1),(98,8,3,25,'10',4,'9552.0000','95520.0000','85968.0000',1),(99,6,3,26,'0',4,'0.0000','95520.0000','95520.0000',1),(100,6,3,38,'0',4,'0.0000','95520.0000','95520.0000',1),(101,5,3,39,'0',4,'0.0000','95520.0000','95520.0000',1),(102,5,3,40,'0',4,'0.0000','95520.0000','95520.0000',1),(103,8,3,41,'0',4,'0.0000','95520.0000','95520.0000',1),(104,5,3,42,'30',4,'28656.0000','95520.0000','66864.0000',1),(105,5,3,43,'0',4,'0.0000','95520.0000','95520.0000',1),(106,8,3,44,'0',4,'0.0000','95520.0000','95520.0000',1),(107,3,3,45,'0',4,'0.0000','95520.0000','95520.0000',1),(108,2,3,46,'10',4,'9552.0000','95520.0000','85968.0000',1),(109,5,3,47,'0',4,'0.0000','95520.0000','95520.0000',1),(110,8,3,48,'0',4,'0.0000','95520.0000','95520.0000',1),(111,1,3,50,'0',4,'0.0000','95520.0000','95520.0000',1),(112,8,3,51,'0',4,'0.0000','95520.0000','95520.0000',1),(113,5,3,156,'0',4,'0.0000','95520.0000','95520.0000',1),(114,8,3,157,'0',4,'0.0000','95520.0000','95520.0000',1),(115,5,3,12,'20',4,'19104.0000','95520.0000','76416.0000',1),(116,8,3,4,'0',4,'0.0000','95520.0000','95520.0000',1),(117,10,3,52,'0',4,'0.0000','95520.0000','95520.0000',1),(118,1,3,53,'40',4,'38208.0000','95520.0000','57312.0000',1),(119,2,3,54,'0',4,'0.0000','95520.0000','95520.0000',1),(120,6,3,55,'0',4,'0.0000','95520.0000','95520.0000',1),(121,7,3,56,'0',4,'0.0000','95520.0000','95520.0000',1),(122,8,3,57,'20',4,'19104.0000','95520.0000','76416.0000',1),(123,5,3,58,'90',4,'85968.0000','95520.0000','9552.0000',1),(124,5,3,59,'0',4,'0.0000','95520.0000','95520.0000',1),(125,1,3,60,'0',4,'0.0000','95520.0000','95520.0000',1),(126,7,3,61,'0',4,'0.0000','95520.0000','95520.0000',1),(127,6,3,62,'40',4,'38208.0000','95520.0000','57312.0000',1),(128,5,3,63,'0',4,'0.0000','95520.0000','95520.0000',1),(129,7,3,64,'10',4,'9552.0000','95520.0000','85968.0000',1),(130,5,3,9,'0',4,'0.0000','95520.0000','95520.0000',1),(131,1,3,65,'20',4,'19104.0000','95520.0000','76416.0000',1),(132,9,3,66,'0',4,'0.0000','95520.0000','95520.0000',1),(133,3,3,67,'0',4,'0.0000','95520.0000','95520.0000',1),(134,1,3,68,'0',4,'0.0000','95520.0000','95520.0000',1),(135,10,3,8,'0',1,'0.0000','95520.0000','95520.0000',1),(136,5,3,69,'20',1,'19104.0000','95520.0000','76416.0000',1),(137,5,3,70,'0',1,'0.0000','95520.0000','95520.0000',1),(138,9,3,71,'50',1,'47760.0000','95520.0000','47760.0000',1),(139,1,3,72,'0',1,'0.0000','95520.0000','95520.0000',1),(140,7,3,73,'20',1,'19104.0000','95520.0000','76416.0000',1),(141,8,3,74,'0',1,'0.0000','95520.0000','95520.0000',1),(142,1,3,75,'40',1,'38208.0000','95520.0000','57312.0000',1),(143,10,3,76,'0',1,'0.0000','95520.0000','95520.0000',1),(144,1,3,15,'0',1,'0.0000','95520.0000','95520.0000',1),(145,5,3,77,'50',1,'47760.0000','95520.0000','47760.0000',1),(146,1,3,78,'20',1,'19104.0000','95520.0000','76416.0000',1),(147,1,3,79,'10',1,'9552.0000','95520.0000','85968.0000',1),(148,8,3,5,'0',1,'0.0000','95520.0000','95520.0000',1),(149,5,3,83,'0',1,'0.0000','95520.0000','95520.0000',1),(150,1,3,84,'10',1,'9552.0000','95520.0000','85968.0000',1),(151,5,3,85,'0',1,'0.0000','95520.0000','95520.0000',1),(152,8,3,86,'0',1,'0.0000','95520.0000','95520.0000',1),(153,9,3,87,'0',1,'0.0000','95520.0000','95520.0000',1),(154,2,3,88,'0',1,'0.0000','95520.0000','95520.0000',1),(155,6,3,95,'0',1,'0.0000','95520.0000','95520.0000',1),(156,1,3,89,'0',1,'0.0000','95520.0000','95520.0000',1),(157,2,3,96,'0',1,'0.0000','95520.0000','95520.0000',1),(158,8,3,97,'0',1,'0.0000','95520.0000','95520.0000',1),(159,8,3,98,'20',1,'19104.0000','95520.0000','76416.0000',1),(160,8,3,99,'10',1,'9552.0000','95520.0000','85968.0000',1),(161,5,3,100,'10',1,'9552.0000','95520.0000','85968.0000',1),(162,8,3,90,'60',1,'57312.0000','95520.0000','38208.0000',1),(163,5,3,101,'20',1,'19104.0000','95520.0000','76416.0000',1),(164,8,3,102,'0',1,'0.0000','95520.0000','95520.0000',1),(165,6,3,103,'0',1,'0.0000','95520.0000','95520.0000',1),(166,6,3,104,'0',1,'0.0000','95520.0000','95520.0000',1),(167,8,3,105,'50',1,'47760.0000','95520.0000','47760.0000',1),(168,2,3,106,'20',1,'19104.0000','95520.0000','76416.0000',1),(169,6,3,107,'0',1,'0.0000','95520.0000','95520.0000',1),(170,1,3,108,'20',1,'19104.0000','95520.0000','76416.0000',1),(171,8,3,109,'0',1,'0.0000','95520.0000','95520.0000',1),(172,4,3,110,'0',1,'0.0000','95520.0000','95520.0000',1),(173,8,3,111,'20',1,'19104.0000','95520.0000','76416.0000',1),(174,8,3,112,'0',1,'0.0000','95520.0000','95520.0000',1),(175,10,3,113,'20',1,'19104.0000','95520.0000','76416.0000',1),(176,6,3,114,'0',1,'0.0000','95520.0000','95520.0000',1),(177,8,3,115,'0',1,'0.0000','95520.0000','95520.0000',1),(178,6,3,116,'20',1,'19104.0000','95520.0000','76416.0000',1),(179,8,3,117,'0',1,'0.0000','95520.0000','95520.0000',1),(180,6,3,118,'0',1,'0.0000','95520.0000','95520.0000',1),(181,10,3,119,'50',1,'47760.0000','95520.0000','47760.0000',1),(182,3,3,91,'20',1,'19104.0000','95520.0000','76416.0000',1),(183,5,3,120,'0',1,'0.0000','95520.0000','95520.0000',1),(184,10,3,159,'0',1,'0.0000','95520.0000','95520.0000',1),(185,10,3,160,'0',1,'0.0000','95520.0000','95520.0000',1),(186,1,3,121,'0',1,'0.0000','95520.0000','95520.0000',1),(187,7,3,122,'0',1,'0.0000','95520.0000','95520.0000',1),(188,1,3,123,'90',1,'85968.0000','95520.0000','9552.0000',1),(189,9,3,124,'0',1,'0.0000','95520.0000','95520.0000',1),(190,8,3,125,'0',1,'0.0000','95520.0000','95520.0000',1),(191,8,3,126,'0',1,'0.0000','95520.0000','95520.0000',1),(192,7,3,92,'0',1,'0.0000','95520.0000','95520.0000',1),(193,2,3,127,'50',1,'47760.0000','95520.0000','47760.0000',1),(194,6,3,128,'20',1,'19104.0000','95520.0000','76416.0000',1),(195,9,3,129,'30',1,'28656.0000','95520.0000','66864.0000',1),(196,5,3,130,'0',1,'0.0000','95520.0000','95520.0000',1),(197,3,3,131,'0',1,'0.0000','95520.0000','95520.0000',1),(198,8,3,132,'0',1,'0.0000','95520.0000','95520.0000',1),(199,3,3,133,'50',1,'47760.0000','95520.0000','47760.0000',1),(200,10,3,134,'50',1,'47760.0000','95520.0000','47760.0000',1),(201,7,3,135,'20',1,'19104.0000','95520.0000','76416.0000',1),(202,6,3,136,'0',1,'0.0000','95520.0000','95520.0000',1),(203,6,3,167,'40',1,'38208.0000','95520.0000','57312.0000',1),(204,6,3,1,'0',1,'0.0000','95520.0000','95520.0000',1),(205,3,3,137,'50',1,'47760.0000','95520.0000','47760.0000',1),(206,8,3,138,'0',1,'0.0000','95520.0000','95520.0000',1),(207,10,3,139,'20',1,'19104.0000','95520.0000','76416.0000',1),(208,2,3,140,'50',1,'47760.0000','95520.0000','47760.0000',1),(209,5,3,141,'0',1,'0.0000','95520.0000','95520.0000',1),(210,8,3,93,'0',1,'0.0000','95520.0000','95520.0000',1),(211,5,3,142,'0',1,'0.0000','95520.0000','95520.0000',1),(212,8,3,143,'30',1,'28656.0000','95520.0000','66864.0000',1),(213,6,3,180,'0',1,'0.0000','95520.0000','95520.0000',1),(214,8,3,145,'60',1,'57312.0000','95520.0000','38208.0000',1),(215,9,3,146,'50',1,'47760.0000','95520.0000','47760.0000',1),(216,6,3,147,'0',1,'0.0000','95520.0000','95520.0000',1),(217,8,3,94,'0',1,'0.0000','95520.0000','95520.0000',1),(218,10,3,148,'50',1,'47760.0000','95520.0000','47760.0000',1),(219,2,3,149,'70',1,'66864.0000','95520.0000','28656.0000',1),(220,8,3,150,'40',1,'38208.0000','95520.0000','57312.0000',1),(221,2,3,151,'50',1,'47760.0000','95520.0000','47760.0000',1),(222,3,3,152,'0',1,'0.0000','95520.0000','95520.0000',1),(223,5,3,153,'20',1,'19104.0000','95520.0000','76416.0000',1),(224,4,3,181,'0',1,'0.0000','95520.0000','95520.0000',1),(225,1,3,154,'0',1,'0.0000','95520.0000','95520.0000',1),(226,4,3,155,'50',1,'47760.0000','95520.0000','47760.0000',1),(227,3,3,161,'60',1,'57312.0000','95520.0000','38208.0000',1),(228,4,3,162,'50',1,'47760.0000','95520.0000','47760.0000',1),(229,4,3,163,'0',1,'0.0000','95520.0000','95520.0000',1),(230,8,3,164,'0',1,'0.0000','95520.0000','95520.0000',1),(231,7,3,165,'50',1,'47760.0000','95520.0000','47760.0000',1),(232,1,3,166,'0',1,'0.0000','95520.0000','95520.0000',1),(233,1,3,168,'50',1,'47760.0000','95520.0000','47760.0000',1),(234,5,3,169,'70',1,'66864.0000','95520.0000','28656.0000',1),(235,4,3,170,'0',1,'0.0000','95520.0000','95520.0000',1),(236,8,3,171,'0',1,'0.0000','95520.0000','95520.0000',1),(237,10,3,172,'0',1,'0.0000','95520.0000','95520.0000',1),(238,1,3,173,'0',1,'0.0000','95520.0000','95520.0000',1),(239,4,3,174,'0',1,'0.0000','95520.0000','95520.0000',1),(240,6,3,175,'0',1,'0.0000','95520.0000','95520.0000',1),(241,6,3,3,'20',1,'19104.0000','95520.0000','76416.0000',1),(242,5,3,82,'0',1,'0.0000','95520.0000','95520.0000',1),(243,6,3,7,'0',1,'0.0000','95520.0000','95520.0000',1),(244,4,3,13,'0',1,'0.0000','95520.0000','95520.0000',1),(245,4,3,177,'50',1,'47760.0000','95520.0000','47760.0000',1),(246,1,3,178,'50',1,'47760.0000','95520.0000','47760.0000',1),(247,6,3,179,'0',1,'0.0000','95520.0000','95520.0000',1);
/*!40000 ALTER TABLE `Contratos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Colonias`
--

DROP TABLE IF EXISTS `Colonias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Colonias` (
  `colonia_id` int(11) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `poblacion_id` int(11) unsigned NOT NULL,
  `estatus_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`colonia_id`),
  KEY `FK_Colonias_Poblaciones` (`poblacion_id`),
  KEY `FK_Colonias_Estatus` (`estatus_id`),
  CONSTRAINT `FK_Colonias_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`),
  CONSTRAINT `FK_Colonias_Poblaciones` FOREIGN KEY (`poblacion_id`) REFERENCES `Poblaciones` (`poblacion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Colonias`
--

LOCK TABLES `Colonias` WRITE;
/*!40000 ALTER TABLE `Colonias` DISABLE KEYS */;
INSERT INTO `Colonias` VALUES (1,'Villas Satélite',1,1),(2,'Bachigualato',1,1),(3,'Díaz Ordaz',1,1),(4,'Villa Universidad',1,1),(5,'Los Olivos',1,1),(6,'Emiliano Zapata',1,1),(7,'Ejido Sánchez Celis',1,1),(8,'Residencial Maralago',1,1),(9,'Aeropuerto',1,1),(10,'4 de Marzo',1,1),(11,'Infonavit Barrancos',1,1),(12,'Fraccionamiento Las Palmas',1,1),(13,'Canaco',1,1),(14,'Fraccionamiento Horizontes',1,1),(15,'Villegas',1,1),(16,'Las Vegas',1,1),(17,'Humaya',1,1),(18,'La Conquista',1,1),(19,'Centro',1,1),(20,'Villa Fontana',1,1),(21,'Infonavit Las Flores',1,1),(23,'Las Palmas',1,1),(24,'Infonavit Humaya',1,1),(25,'21 de Marzo',1,1),(26,'Adolfo López Mateos',1,1),(27,'Infonavit Cañadas',1,1),(28,'Libertad',1,1),(29,'Miguel Hidalgo',1,1),(30,'Colinas del Rey',1,1),(31,'Bugambilias',1,1),(32,'Lázaro Cárdenas',1,1),(33,'Alto de Bachigualato',1,1),(34,'Industrial Bravo',1,1),(35,'Almada',1,1),(36,'Miguel Alemán',1,1),(37,'Villa Verde',1,1),(38,'Parque Alamedas Tres Ríos',1,1),(39,'San Ángel',1,1),(40,'Infonavit Solidaridad',1,1),(41,'Lomas del Boulevard',1,1),(42,'Chulavista',2,1),(43,'Prados de La Conquista',1,1),(44,'Santa Rocío',1,1),(45,'Villa Bonita',1,1),(46,'Veracruz',3,1),(47,'Vicente Guerrero',1,1),(48,'Colonia Centro',1,1),(49,'Rincón del Parque',1,1),(50,'Las Cucas',1,1),(51,'Centro',3,1),(52,'Ejidal',2,1),(53,'Burócrata',1,1),(54,'Industrial Palmito',1,1),(55,'Villa Satélite',1,1),(56,'Salvador Alvarado',1,1),(57,'Jardines del Valle',1,1),(58,'Nuevo Culiacán',1,1),(59,'Melchor Ocampo',1,1),(60,'Las Quintas',1,1),(61,'Felipe Ángeles',1,1),(62,'Centro',4,1),(63,'Loma Linda',1,1),(64,'Lomas del Pedregal',1,1),(65,'Valle Alto',1,1),(66,'Universidad 94',1,1),(67,'Tierra Blanca',1,1),(68,'Nakayama',1,1),(69,'Fuentes del Valle',1,1),(70,'Fovissste Chapultepec',1,1),(71,'Infonavit Barrancos IV',1,1),(72,'Infonavit Barrancos III',1,1),(73,'Providencia',1,1),(74,'Rafael Buelna',1,1),(75,'Morelos',1,1),(76,'Santa Fe Cluster',1,1),(77,'Urbi Quinta Versalles',1,1),(78,'Miravalle',1,1),(79,'Los Álamos',1,1),(80,'Universitarios',1,1),(81,'Residencial Valencia',1,1),(82,'Colinas de San Miguel',1,1),(83,'Fovissste Horizontes',1,1),(84,'Centro',5,1),(85,'Pedregal del Humaya',1,1),(86,'Libertad',1,1),(87,'Constituyentes',1,1),(88,'San Pedro',1,1),(89,'5 De Mayo',3,1),(90,'Los Pinos',1,1),(91,'La Lima',1,1),(92,'Vinorama',1,1),(93,'Montebello',1,1),(94,'Rafael Buelna',1,1),(95,'Horizontes',1,1),(96,'Amistad',1,1),(97,'Villas del Río',1,1),(98,'Lombardo Toledano',1,1),(99,'Recursos Hidráulicos',1,1),(100,'Guadalupe',6,1),(101,'Valles del Sol',1,1),(102,'Lomas del Pedregal',1,1),(103,'Conocido Imala',1,1),(104,'La Campiña',1,1),(105,'Industrial Bravo',1,1),(106,'Benito Juárez',1,1),(107,'Colinas de La Rivera',1,1),(108,'Vallado Nuevo',1,1),(109,'La Higuerita',2,1),(110,'López Mateos',1,1),(111,'Estela Ortiz',1,1),(112,'6 de Enero',1,1),(113,'Plutarco Elías Calles',1,1),(114,'Felipe Ángeles',1,1),(115,'Cañera',1,1),(116,'10 De Mayo',1,1),(117,'16 de Septiembre',1,1),(118,'De Amapa',1,1),(119,'Florida',1,1),(120,'Lomalinda',1,1),(121,'Libertad',1,1),(122,'Juan de Dios Batiz',1,1),(123,'Terranova',1,1),(124,'Guadalupe',1,1),(125,'Villas del Humaya',1,1),(126,'Bellavista',1,1),(127,'Residencial Hacienda',1,1),(128,'Acueducto',1,1),(129,'Pradera Dorada',1,1),(130,'Cañadas',1,1),(131,'Rincón del Valle',1,1),(132,'Prados del Sur',1,1),(133,'Viñedo IV',1,1),(134,'López Mateos',1,1),(135,'Lomas del Sol Quality',1,1),(136,'Guadalupe Victoria',1,1),(137,'Villas Santa Anita',1,1),(138,'Fraccionamiento Danubio',1,1),(139,'Los Laureles',1,1),(140,'Barrancos',1,1),(141,'La Campana',1,1),(142,'Del Cedro',1,1),(143,'Culiacancito',1,1),(144,'Genaro Estrada',1,1),(145,'Los Ángeles',1,1),(146,'Margarita',1,1),(147,'Toledo Corro',1,1),(148,'Fraccionamento Alameda',1,1),(149,'Lomas de Rodriguera',1,1),(150,'Tulipanes',1,1),(151,'Dautillos',1,1),(152,'COBAES 02',1,1);
/*!40000 ALTER TABLE `Colonias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categorias_Servicios`
--

DROP TABLE IF EXISTS `Categorias_Servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Categorias_Servicios` (
  `categoriaServicio_id` int(11) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `estatus_id` int(11) unsigned NOT NULL,
  `esquemaProgramaPagos` tinyint(1) NOT NULL,
  PRIMARY KEY (`categoriaServicio_id`),
  UNIQUE KEY `unique_categoriasservicios_nombre` (`nombre`),
  KEY `FK_CategoriasServicios_Estatus` (`estatus_id`),
  CONSTRAINT `FK_CategoriasServicios_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categorias_Servicios`
--

LOCK TABLES `Categorias_Servicios` WRITE;
/*!40000 ALTER TABLE `Categorias_Servicios` DISABLE KEYS */;
INSERT INTO `Categorias_Servicios` VALUES (1,'LICENCIATURA',1,1),(2,'MAESTRÍA',1,1);
/*!40000 ALTER TABLE `Categorias_Servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_usuario_funcion`
--

DROP TABLE IF EXISTS `menu_usuario_funcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_usuario_funcion` (
  `id_usuario` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_usuario_funcion`
--

LOCK TABLES `menu_usuario_funcion` WRITE;
/*!40000 ALTER TABLE `menu_usuario_funcion` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_usuario_funcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Movimientos`
--

DROP TABLE IF EXISTS `Movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Movimientos` (
  `movimiento_id` int(11) unsigned NOT NULL,
  `partida` int(3) NOT NULL,
  `contratos_Detalle_id` int(11) NOT NULL,
  `subcuenta_id` int(11) NOT NULL,
  `periodoPagado` varchar(100) NOT NULL DEFAULT '',
  `fechaVigencia` date NOT NULL,
  `fechaCreacion` date NOT NULL,
  `tipo` char(1) NOT NULL DEFAULT '',
  `importe` decimal(10,4) NOT NULL,
  `estatus_id` int(11) NOT NULL,
  `empresa_id` int(11) unsigned NOT NULL,
  `version` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`movimiento_id`),
  KEY `FK_Movimientos_Empresas` (`empresa_id`),
  CONSTRAINT `FK_Movimientos_Empresas` FOREIGN KEY (`empresa_id`) REFERENCES `Empresas` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Movimientos`
--

LOCK TABLES `Movimientos` WRITE;
/*!40000 ALTER TABLE `Movimientos` DISABLE KEYS */;
INSERT INTO `Movimientos` VALUES (1,1,11685,2,'Agosto 2011','2011-08-31','2012-05-17','c','1990.0000',1,1,0),(2,2,11685,3,'Agosto 2011','2011-08-31','2012-05-17','c','130.0000',1,1,0),(3,3,11685,8,'Agosto 2011','2011-08-31','2012-05-17','c','240.9827',1,1,0),(4,4,11685,7,'Agosto 2011','2012-05-17','2012-05-17','a','2360.9827',1,1,0),(5,1,11686,2,'Septiembre 2011','2011-09-08','2012-05-17','c','1990.0000',1,1,0),(6,2,11686,3,'Septiembre 2011','2011-09-08','2012-05-17','c','130.0000',1,1,0),(7,3,11686,8,'Septiembre 2011','2011-09-08','2012-05-17','c','233.1745',1,1,0),(8,4,11686,7,'Septiembre 2011','2012-05-17','2012-05-17','a','2353.1745',1,1,0),(9,1,11687,2,'Octubre 2011','2011-10-10','2012-05-17','c','1990.0000',1,1,0),(10,2,11687,3,'Octubre 2011','2011-10-10','2012-05-17','c','130.0000',1,1,0),(11,3,11687,8,'Octubre 2011','2011-10-10','2012-05-17','c','202.1990',1,1,0),(12,4,11688,2,'Noviembre 2011','2011-11-08','2012-05-17','c','1990.0000',1,1,0),(13,5,11688,3,'Noviembre 2011','2011-11-08','2012-05-17','c','130.0000',1,1,0),(14,6,11688,8,'Noviembre 2011','2011-11-08','2012-05-17','c','174.4402',1,1,0),(15,7,11688,7,'Noviembre 2011','2012-05-17','2012-05-17','a','4616.6391',1,1,0),(16,1,11689,2,'Diciembre 2011','2011-12-08','2012-05-17','c','1990.0000',1,1,0),(17,2,11689,3,'Diciembre 2011','2011-12-08','2012-05-17','c','130.0000',1,1,0),(18,3,11689,8,'Diciembre 2011','2011-12-08','2012-05-17','c','146.1137',1,1,0),(19,4,11690,2,'Enero 2012','2012-01-09','2012-05-17','c','1990.0000',1,1,0),(20,5,11690,3,'Enero 2012','2012-01-09','2012-05-17','c','130.0000',1,1,0),(21,6,11690,8,'Enero 2012','2012-01-09','2012-05-17','c','116.2842',1,1,0),(22,7,11691,2,'Febrero 2012','2012-02-08','2012-05-17','c','1990.0000',1,1,0),(23,8,11691,3,'Febrero 2012','2012-02-08','2012-05-17','c','130.0000',1,1,0),(24,9,11691,8,'Febrero 2012','2012-02-08','2012-05-17','c','88.6758',1,1,0),(25,10,11691,7,'Febrero 2012','2012-05-17','2012-05-17','a','6711.0738',1,1,0),(26,1,11692,2,'Marzo 2012','2012-03-08','2012-05-17','c','1990.0000',1,1,0),(27,2,11692,3,'Marzo 2012','2012-03-08','2012-05-17','c','130.0000',1,1,0),(28,3,11692,8,'Marzo 2012','2012-03-08','2012-05-17','c','62.3117',1,1,0),(29,4,11693,2,'Abril 2012','2012-04-11','2012-05-17','c','1990.0000',1,1,0),(30,5,11693,3,'Abril 2012','2012-04-11','2012-05-17','c','130.0000',1,1,0),(31,6,11693,8,'Abril 2012','2012-04-11','2012-05-17','c','31.8396',1,1,0),(32,7,11694,2,'Mayo 2012','2012-05-08','2012-05-17','c','1990.0000',1,1,0),(33,8,11694,3,'Mayo 2012','2012-05-08','2012-05-17','c','130.0000',1,1,0),(34,9,11694,8,'Mayo 2012','2012-05-08','2012-05-17','c','7.9155',1,1,0),(35,10,11694,7,'Mayo 2012','2012-05-17','2012-05-17','a','6462.0668',1,1,0),(36,1,11695,2,'Junio 2012','2012-06-08','2012-05-17','c','1990.0000',1,1,0),(37,2,11696,2,'Julio 2012','2012-07-09','2012-05-17','c','1990.0000',1,1,0),(38,3,11697,2,'Agosto 2012','2012-08-08','2012-05-17','c','1990.0000',1,1,0),(39,4,11698,2,'Septiembre 2012','2012-09-10','2012-05-17','c','1990.0000',1,1,0),(40,5,11699,2,'Octubre 2012','2012-10-08','2012-05-17','c','1990.0000',1,1,0),(41,6,11700,2,'Noviembre 2012','2012-11-08','2012-05-17','c','1990.0000',1,1,0),(42,7,11695,5,'Junio 2012','2012-06-08','2012-05-17','a','159.2000',1,1,0),(43,8,11696,5,'Julio 2012','2012-07-09','2012-05-17','a','159.2000',1,1,0),(44,9,11697,5,'Agosto 2012','2012-08-08','2012-05-17','a','159.2000',1,1,0),(45,10,11698,5,'Septiembre 2012','2012-09-10','2012-05-17','a','159.2000',1,1,0),(46,11,11699,5,'Octubre 2012','2012-10-08','2012-05-17','a','159.2000',1,1,0),(47,12,11700,5,'Noviembre 2012','2012-11-08','2012-05-17','a','159.2000',1,1,0),(48,13,11700,7,'Noviembre 2012','2012-05-17','2012-05-17','a','10984.8000',1,1,0);
/*!40000 ALTER TABLE `Movimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos`
--

DROP TABLE IF EXISTS `grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupos` (
  `grupo_id` int(11) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `codigo` varchar(100) NOT NULL DEFAULT '',
  `nombreCorto` varchar(100) NOT NULL DEFAULT '',
  `estatus_id` int(11) unsigned NOT NULL,
  `empresa_id` int(11) unsigned NOT NULL,
  `version` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`grupo_id`),
  UNIQUE KEY `unique_grupos_nombre` (`nombre`),
  UNIQUE KEY `unique_grupos_nombrecorto` (`nombreCorto`),
  KEY `FK_Grupos_Estatus` (`estatus_id`),
  KEY `FK_Grupos_Empresas` (`empresa_id`),
  CONSTRAINT `FK_Grupos_Empresas` FOREIGN KEY (`empresa_id`) REFERENCES `Empresas` (`empresa_id`),
  CONSTRAINT `FK_Grupos_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos`
--

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
INSERT INTO `grupos` VALUES (1,'UNIVERSIDAD SAN SEBASTIAN','1','USS',0,0,NULL);
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Facturas_Detalle`
--

DROP TABLE IF EXISTS `Facturas_Detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Facturas_Detalle` (
  `facturaDetalle_id` int(11) unsigned NOT NULL,
  `partida` int(10) NOT NULL,
  `factura_id` int(11) unsigned NOT NULL,
  `referencia` varchar(100) DEFAULT '',
  `cantidad` int(10) NOT NULL,
  `precio` decimal(10,4) NOT NULL,
  `importe` decimal(10,4) NOT NULL,
  `becaPorcentaje` decimal(10,4) DEFAULT NULL,
  `becaImporte` decimal(10,4) DEFAULT NULL,
  `promocionPorcentaje` decimal(10,4) DEFAULT NULL,
  `promocionImporte` decimal(10,4) DEFAULT NULL,
  `descuentoPorcentaje` decimal(10,4) DEFAULT NULL,
  `descuentoImporte` decimal(10,0) DEFAULT NULL,
  `subtotal` decimal(10,4) NOT NULL,
  `total` decimal(10,4) NOT NULL,
  `estatus_id` int(11) unsigned NOT NULL,
  `subcuenta_id` int(11) NOT NULL,
  `version` bigint(11) DEFAULT NULL,
  `movimiento_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`facturaDetalle_id`),
  KEY `FK_FacturasDetalles_Facturas` (`factura_id`),
  KEY `FK_FacturasDetalles_Estatus` (`estatus_id`),
  KEY `FK_FacturasDetalles_Movimientos` (`movimiento_id`),
  CONSTRAINT `FK_FacturasDetalles_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`),
  CONSTRAINT `FK_FacturasDetalles_Facturas` FOREIGN KEY (`factura_id`) REFERENCES `Facturas` (`factura_id`),
  CONSTRAINT `FK_FacturasDetalles_Movimientos` FOREIGN KEY (`movimiento_id`) REFERENCES `Movimientos` (`movimiento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Facturas_Detalle`
--

LOCK TABLES `Facturas_Detalle` WRITE;
/*!40000 ALTER TABLE `Facturas_Detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `Facturas_Detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Profesiones`
--

DROP TABLE IF EXISTS `Profesiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Profesiones` (
  `profesion_id` int(11) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `nivelAcademico_id` int(11) unsigned NOT NULL,
  `estatus_id` int(11) unsigned NOT NULL,
  `version` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`profesion_id`),
  UNIQUE KEY `unique_profesiones_nombre` (`nombre`),
  KEY `FK_Profesiones_Estatus` (`estatus_id`),
  KEY `FK_Profesiones_NivelesAcademicos` (`nivelAcademico_id`),
  CONSTRAINT `FK_Profesiones_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`),
  CONSTRAINT `FK_Profesiones_NivelesAcademicos` FOREIGN KEY (`nivelAcademico_id`) REFERENCES `Niveles_Academicos` (`nivelAcademico_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Profesiones`
--

LOCK TABLES `Profesiones` WRITE;
/*!40000 ALTER TABLE `Profesiones` DISABLE KEYS */;
/*!40000 ALTER TABLE `Profesiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sexos`
--

DROP TABLE IF EXISTS `Sexos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sexos` (
  `sexo_id` int(11) unsigned NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `estatus_id` int(11) unsigned DEFAULT NULL,
  `version` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`sexo_id`),
  UNIQUE KEY `unique_sexos_nombre` (`nombre`),
  KEY `FK_Sexos_Estatus` (`estatus_id`),
  CONSTRAINT `FK_Sexos_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sexos`
--

LOCK TABLES `Sexos` WRITE;
/*!40000 ALTER TABLE `Sexos` DISABLE KEYS */;
INSERT INTO `Sexos` VALUES (1,'MASCULINO',1,NULL),(2,'FEMENINO',1,NULL);
/*!40000 ALTER TABLE `Sexos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Documentos`
--

DROP TABLE IF EXISTS `Documentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Documentos` (
  `documento_id` int(11) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `nombrecorto` varchar(50) NOT NULL DEFAULT '',
  `estatus_id` int(11) unsigned NOT NULL,
  `empresa_id` int(11) unsigned NOT NULL,
  `version` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`documento_id`),
  UNIQUE KEY `unique_documentos_nombre` (`nombre`),
  UNIQUE KEY `unique_nombrecorto_nombrecorto` (`nombrecorto`),
  KEY `FK_Documentos_Estatus` (`estatus_id`),
  KEY `FK_Documentos_Empresas` (`empresa_id`),
  CONSTRAINT `FK_Documentos_Empresas` FOREIGN KEY (`empresa_id`) REFERENCES `Empresas` (`empresa_id`),
  CONSTRAINT `FK_Documentos_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Documentos`
--

LOCK TABLES `Documentos` WRITE;
/*!40000 ALTER TABLE `Documentos` DISABLE KEYS */;
INSERT INTO `Documentos` VALUES (1,'Acta de Nacimiento','AC',1,1,0),(2,'Certificado de Preparatoria','CP',1,1,0),(3,'Fotografías','F',1,1,0),(5,'Comprobante de Domicilio','CD',1,1,0),(6,'Kardex','K',1,1,0),(7,'Certificado Medico','CM',1,1,0),(8,'Examen de Admisión','EA',1,1,0),(9,'Examen de Orientación Vocacional','OV',1,1,0),(10,'Examen Format','EF',1,1,0),(11,'Examen EDAOM','EE',1,1,0),(12,'Estudio Socioeconómico','ES',1,1,0),(13,'Comprobante de Ingresos','CI',1,1,0),(14,'Boleta de Beca','BB',1,1,0),(15,'Copias de Acta de Nacimiento','CAN',1,1,0),(16,'Copias de Certificado de Preparatoria','CCP',1,1,0);
/*!40000 ALTER TABLE `Documentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prospectos`
--

DROP TABLE IF EXISTS `Prospectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Prospectos` (
  `prospecto_id` int(11) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `referenciaBancaria` int(11) DEFAULT NULL,
  `apellidoPaterno` varchar(100) NOT NULL DEFAULT '',
  `apellidoMaterno` varchar(100) NOT NULL DEFAULT '',
  `telefono` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(50) DEFAULT '',
  `preparatoria_id` int(11) unsigned DEFAULT NULL,
  `promedio` decimal(10,2) DEFAULT NULL,
  `tipoInstitucion_id` int(11) unsigned DEFAULT NULL,
  `calle` varchar(50) NOT NULL DEFAULT '',
  `numero` varchar(20) NOT NULL DEFAULT '',
  `colonia_id` int(11) unsigned NOT NULL,
  `poblacion_id` int(11) unsigned NOT NULL,
  `codigoPostal` varchar(20) DEFAULT '',
  `edad` int(3) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `tipoSangre` varchar(30) DEFAULT '',
  `celular` varchar(30) DEFAULT '',
  `estatus_id` int(11) unsigned NOT NULL,
  `sexo_id` int(11) unsigned NOT NULL,
  `empresa_id` int(11) unsigned NOT NULL,
  `version` bigint(11) DEFAULT NULL,
  `promocion_id` int(11) DEFAULT NULL,
  `nombre_padre` varchar(100) DEFAULT NULL,
  `nombre_madre` varchar(100) DEFAULT NULL,
  `tel_padre` varchar(30) DEFAULT NULL,
  `tel_madre` varchar(30) DEFAULT NULL,
  `tutor1` varchar(100) DEFAULT NULL,
  `tutor2` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`prospecto_id`),
  KEY `FK_Prospectos_Preparatorias` (`preparatoria_id`),
  KEY `FK_Prospectos_TIposInstitucion` (`tipoInstitucion_id`),
  KEY `FK_Prospectos_Colonias` (`colonia_id`),
  KEY `FK_Prospectos_Poblaciones` (`poblacion_id`),
  KEY `FK_Prospectos_Estatus` (`estatus_id`),
  KEY `FK_Prospectos_Sexos` (`sexo_id`),
  KEY `FK_Prospectos_Empresas` (`empresa_id`),
  CONSTRAINT `FK_Prospectos_Colonias` FOREIGN KEY (`colonia_id`) REFERENCES `Colonias` (`colonia_id`),
  CONSTRAINT `FK_Prospectos_Empresas` FOREIGN KEY (`empresa_id`) REFERENCES `Empresas` (`empresa_id`),
  CONSTRAINT `FK_Prospectos_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`),
  CONSTRAINT `FK_Prospectos_Poblaciones` FOREIGN KEY (`poblacion_id`) REFERENCES `Poblaciones` (`poblacion_id`),
  CONSTRAINT `FK_Prospectos_Preparatorias` FOREIGN KEY (`preparatoria_id`) REFERENCES `Preparatorias` (`preparatoria_id`),
  CONSTRAINT `FK_Prospectos_Sexos` FOREIGN KEY (`sexo_id`) REFERENCES `Sexos` (`sexo_id`),
  CONSTRAINT `FK_Prospectos_TIposInstitucion` FOREIGN KEY (`tipoInstitucion_id`) REFERENCES `Tipos_Institucion` (`tipoInstitucion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prospectos`
--

LOCK TABLES `Prospectos` WRITE;
/*!40000 ALTER TABLE `Prospectos` DISABLE KEYS */;
INSERT INTO `Prospectos` VALUES (1,'Joshua',1112432,'Trejo','-','-','joshua9013@hotmail.com',73,'7.35',2,'Baampohia de Agiab','1605',58,1,'80170',2,'2010-02-18','ARH+','6672346024',1,1,1,0,1,'Anfonsino','Alfonsina','1234','4567','José Trejo','Mirna Araceli Díaz'),(2,'Paulina',1,'Olivas','Lora','-','-',1,'1.00',1,'-','-',1,1,'-',18,'1993-07-04','-','-',1,2,1,0,1,NULL,NULL,NULL,NULL,'',''),(3,'Sofía',1112408,'López','Acosta','-','-',32,'7.50',2,'Rio Mocorito','135',100,1,'-',18,'1993-09-22','-','-',1,2,1,0,1,NULL,NULL,NULL,NULL,'Edgar Arturo López Niebla','María Zaida Acosta Villa'),(4,'Alexis Arnoldo',1110303,'Ibarra','Elizalde','2576061','alex5.7@hotmail.com',44,'7.54',1,'Vicente Guerrero','457',36,1,'80200',19,'1993-02-02','ARH+','6677985348',1,1,1,0,1,NULL,NULL,NULL,NULL,'José Arnoldo Ibarra Yañez','Doreida Elizalde Monzón'),(5,'Alicia Daniela',1110626,'García','Gastelum','-','danielita_gaicia@hotmail.com',1,'1.00',1,'-','-',1,1,'-',21,'1991-02-15','--','-',1,2,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(6,'Alma Nahidy',1110030,'Pérez','Espinoza','2571075','nahi_e25@hotmail.com',44,'8.80',1,'Monte Tabor','3242',44,1,'80135',18,'1993-06-01','ARH+','6674751945',1,2,1,0,1,NULL,NULL,NULL,NULL,'José Gonzalo Pérez Castro','Alma Adelina Espinoza Alvarado'),(7,'Joel',1112424,'Valenzuela','Ledesma','-','-',109,'10.00',1,'-','-',1,1,'-',18,'1993-05-11','-','-',1,1,1,0,1,NULL,NULL,NULL,NULL,'Joel Valenzuela Valenzuela','Reyna Amalia Ledesma'),(8,'Anais',1110493,'Vargas','Sepulveda','7493722','anaiss@uss.mx',117,'7.84',1,'Adolfo de la Huerta','2120',32,1,'80290',21,'1990-12-21','ORH+','6677566186',1,2,1,0,1,NULL,NULL,NULL,NULL,'Guadalupe Vargas Lugo','Francisca Sepulveda Garcia'),(9,'Aranza Pamela',1110444,'Espinoza','Villalobos','2831720','ara.socutte@hotmail.com',43,'8.17',1,'Artemisa','3744-33-A',13,1,'80059',21,'1991-01-07','ORH+','6671367531',1,2,1,0,1,NULL,NULL,NULL,NULL,'Oscar Roberto Espinoza Reyes','Leticia Eugenia Villalobos Revello'),(10,'Ariana Aimee',1110048,'Parra','Garcìa','1734143','shina_736@hotmail.com',34,'9.40',1,'Matías Rodríguez','1759-B',3,1,'80190',18,'1993-06-11','ORH+','6671447617',1,2,1,0,1,NULL,NULL,NULL,NULL,'Celso Parra Barraza','María Eugenia García Soto'),(11,'Betsabe',1110071,'Cruz','Cebreros','7281346','betza_chiquitaa@hotmail.com',83,'8.44',1,'Dieciocho','63',46,1,'80430',18,'1993-08-26','ARH+','6671842473',1,2,1,0,1,NULL,NULL,NULL,NULL,'Rivardo Cruz Hernández','Agustina Cebreros Baez'),(12,'Brianda Guadalupe',1110295,'Gonzalez','Osuna','268932','brigo_1209@hotmail.com',1,'7.90',1,'Ararat','2153-B',40,1,'80058',19,'1992-12-04','ORH+','6673061639',1,2,1,0,1,NULL,NULL,NULL,NULL,'Luis Alberto Gonzalez Alvarado','Elisa Guadalupe Osuna Medina'),(13,'Efraín',1112440,'Félix','De León','-','-',1,'1.00',1,'-','-',1,1,'-',22,'1989-07-18','-','-',1,1,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(14,'Carlos',1110105,'Serrano','Pérez','7188109','charlie9327@hotmail.com',47,'7.25',1,'Roque Gonzalez Garza','1742',32,1,'80290',18,'1993-05-27','ARH+','6677913151',1,1,1,0,1,NULL,NULL,NULL,NULL,'Aristeo Serrano Muro','María Calletana Pérez Pulido'),(15,'Carlos Mario',1110584,'Cárdenas','Uriarte','-','a',1,'1.00',1,'-','-',1,1,'-',20,'1991-09-02','-','-',1,1,1,0,1,NULL,NULL,NULL,NULL,'',''),(16,'Jaime',1100098,'Barraza','Vargas','7171546','-',34,'7.32',1,'Cerro Macoriba','3092',63,1,'80177',25,'1986-08-08','ORH+','6671610404',1,1,1,0,1,NULL,NULL,NULL,NULL,'José Jaime Barraza Rodríguez','Aurora Vargas Garay'),(17,'Salvador José',1110014,'Mora','Santoscoy','7273978','s.mora10@hotmail.com',66,'9.00',1,'Altadena','1061',42,2,'80323',18,'1993-03-13','BRH+','6672376389',1,1,1,0,1,NULL,NULL,NULL,NULL,'Juan Salvador Mora Franco','Martha Elena Santoscoy Iribe'),(18,'Francisco',1110022,'Godoy','López','7233334','panco93@hotmail.com',33,'8.80',1,'Luna','1217',43,1,'80055',18,'1993-09-03','ORH+','6671606827',1,1,1,0,1,NULL,NULL,NULL,NULL,'Francisco Godoy Gaxiola','Blanca Aracely López López'),(19,'Luis Antonio',1110055,'Estrada','Castañeda','7449307','luis_thederious@hotmail.com',47,'7.83',1,'Valle Imperial','313',45,1,'80294',19,'1992-06-23','BRH+','6671876697',1,1,1,0,1,NULL,NULL,NULL,NULL,'Abel Estrada Olmos','María Elena Castañeda Nevarez'),(20,'Irving Allan',1110063,'Reyes','Obeso','7150434','irving47@hotmail.com',48,'7.65',1,'Juan M. Banderas','580',35,1,'80200',26,'1985-03-20','ARH+','-',1,1,1,0,1,NULL,NULL,NULL,NULL,'Hector Reyes López','María del Carmen Obeso'),(21,'Juan',1110089,'Quintero','Zazueta','7895088','-',1,'1.00',1,'Principal','Post. 86',126,1,'80300',18,'1993-09-11','ORH+','6672217819',1,1,1,0,1,NULL,NULL,NULL,NULL,'Juan Quintero Zazueta','Patricia Guadalupe Zazueta Vizar'),(22,'Judith',1110097,'Cabada','Medina','7622378','-',42,'8.33',1,'Ignacio Manuel Altamirano','3072',47,1,'80070',19,'1992-11-21','ORH+','6677308901',1,2,1,0,1,NULL,NULL,NULL,NULL,'Joaquin Norberto Cabada Moreno','Virginia Veronica Medina'),(23,'Carlos',1,'Pérez','Serrano','7188109','A',1,'1.00',1,'Roque Gonzales Garza','1745',32,1,'80290',18,'1993-05-27','ARH+','6677913151',1,1,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(24,'Cristian Gregorio',1110113,'Bojorquez','Vega','7452557','-',55,'9.58',1,'Alejandro Barrantes','2915',49,1,'80197',19,'1992-10-25','ABRH+','6672674624',1,1,1,0,1,NULL,NULL,NULL,NULL,'Gregorio Bojorquez Estrada','María Cristina Vega Soto'),(25,'Nadia Lucero',1110121,'Guerra','García','7534963','lucerito_ggl@hotmail.com',52,'8.90',1,'Alvaro Obregón','4951',50,1,'80300',18,'1993-09-01','ORH+','6671845848',1,2,1,0,1,NULL,NULL,NULL,NULL,'Jesús Armando Guerra Mendivil','Eliud García Coronel'),(26,'Claudia Isabel',1110139,'Plata','León','6721150331','claudia_plata@hotmail.com',60,'8.79',1,'Alvaro Obregón','323',52,2,'80370',18,'1993-07-01','ORH+','6728543464',1,2,1,0,1,NULL,NULL,NULL,NULL,'Juan Diego Plata Amarillas','Nereida León Ontiveros'),(38,'Claudia María',1110147,'Aispuro','García','-','claudia_aispuro55@hotmail.com',104,'8.50',1,'Juan de la Barrera','2170-1',53,1,'80030',19,'1992-05-22','ARH+','667182206',1,2,1,0,1,NULL,NULL,NULL,NULL,'Jesús Aispuro Campos','Yolanda García Urquidez'),(39,'Dayanahra Rosalina',1110154,'Magaña','Pérez','7173846','dayast_19@hotmail.com',55,'8.73',1,'Tabasco','2493',54,1,'80160',18,'1993-08-03','-','6672307578',1,2,1,0,1,NULL,NULL,NULL,NULL,'Juan Magaña Castro','Guadalupe Pérez Morales'),(40,'Georgina Elizabeth',1110162,'Figueroa','Rangel','7621594','ginisfr@hotmail.com',96,'7.38',2,'Hidalgo','3888',1,1,'30088',21,'1990-12-26','-','6672540505',1,2,1,0,1,NULL,NULL,NULL,NULL,'Jorge Moises Figueroa Favela','Adriana Francisca Rangel Aguirre'),(41,'Jorge Luis',1110170,'Padilla','Monge','7177991','angi_18hlpm@hotmail.com',55,'7.29',1,'Reforma','2137',56,1,'80160',19,'1993-02-14','ORH+','6672317122',1,1,1,0,1,NULL,NULL,NULL,NULL,'Jorge Luis Padilla López','Ramona Alicia Monge Quizan'),(42,'Maura Karina',1110188,'Cardoza','Ríos','7616345','mmaurakarina@hotmail.com',48,'8.63',1,'Pradera','3873',57,1,'80190',18,'1993-08-24','ABRH-','6672134797',1,2,1,0,1,NULL,NULL,NULL,NULL,'Carlos Enrique Cardoza Acosta','Nancy Karina Rios Arechiga'),(43,'Irving',1110196,'González','Hernández','7174251','irving@hotmail.com',43,'8.17',1,'Bahia de Altamira','1456',58,1,'80170',19,'1992-11-28','BRH+','6671249141',1,1,1,0,1,NULL,NULL,NULL,NULL,'Francisco Gonzalez Nuñez','Rosario Hernandez Gomez'),(44,'José Roberto',0,'Cuevas','Félix','729502','-',1,'1.00',1,'Del Establo','1196',127,1,'80010',19,'1992-12-15','ARH+','6671300201',1,1,1,0,1,NULL,NULL,NULL,NULL,'Nicasio Adalberto Cuevas Leyva','Aisa Aracely Félix Valles'),(45,'María Fernanda',1110212,'Rivas','Sauceda','4566193','puellatua@hotmail.com',52,'8.87',1,'Juno','3834',13,1,'80059',18,'1993-09-29','ORH+','6672168737',1,2,1,0,1,NULL,NULL,NULL,NULL,'Ines Alberto Rivas Barraza','María Concepción Sauceda Pérez'),(46,'Juán José',1110220,'Dominguez','Mena','-','eneroki_009@hotmail.com',80,'8.26',1,'Tomas Alba Edison','261',59,1,'80230',21,'1990-11-16','ARH+','6672134974',1,1,1,0,1,NULL,NULL,NULL,NULL,'José Luis Domínguez Pérez','Patricia Mena Ahumada'),(47,'Ivan Samir',1110238,'Romero','Rubio','7521150','ivan_samir@hotmail.com',52,'7.65',1,'Doctor Mora','1224',60,1,'80060',19,'1992-12-19','ARH+','6672279555',1,1,1,0,1,NULL,NULL,NULL,NULL,'Francisco Salvador Romero Chavira','Delia Patricia Rubio Castro'),(48,'Miguel Ángel',1110246,'Gutierrez','Bastidas','7185094','guero_066@hotmail.com',47,'7.63',1,'Anacleto Correa','3336',25,1,'80280',19,'1992-10-01','ORH+','6671896494',1,1,1,0,1,NULL,NULL,NULL,NULL,'Benito Gutierrez Barrón','Alejandrina Bastidas Torres'),(50,'Marysol',1110253,'Espinoza','Escareño','-','-',1,'1.00',1,'-','-',1,1,'-',20,'1991-12-02','-','-',1,2,1,0,1,NULL,NULL,NULL,NULL,'-','-'),(51,'Maricruz Alejandra',1110261,'Zevada','Osuna','-','-',1,'1.00',1,'-','-',1,1,'-',18,'1993-10-13','-','-',1,2,1,0,1,NULL,NULL,NULL,NULL,'-','-'),(52,'Gloria Aracely',1110311,'Medina','Gómez','2573734','chely_15_aracely@hotmail.com',78,'8.19',1,'Manuel Gutierrez','2934',61,1,'80197',19,'1992-09-30','-','6673884645',1,2,1,0,1,NULL,NULL,NULL,NULL,'Luis Guillermo Medina Plata','Soledad Gómez Romero'),(53,'Mario',1110329,'Cuevas','Soledad','6731212629','mariio00123@hotmail.com',102,'9.50',1,'Agustina Ramirez','6',19,4,'80800',18,'1993-09-03','ORH+','6731148749',1,1,1,0,1,NULL,NULL,NULL,NULL,'Mario Cuevas Leyva','Leticia Soledad Sosa'),(54,'Mariangel',1110337,'Castro','Soledad','-','mariian_128@hotmail.com',102,'9.10',1,'Atardeceres','4777',128,1,'80200',19,'1993-01-24','ORH+','6738526073',1,2,1,0,1,NULL,NULL,NULL,NULL,'Rene Castro López','Briseida Soledad Sosa'),(55,'María Fernanda',1110345,'Higuera','Sajaropulos','-','fernandita_beia1@hotmail.com',103,'10.00',1,'Cerro del Risco','3176',63,1,'-',20,'1991-08-06','BRH+','6671184305',1,2,1,0,1,NULL,NULL,NULL,NULL,'Arnoldo Higuera Rocha','Ana Cecilia Sajaropulos Corona'),(56,'Sofía Guadalupe',1110352,'Quintero','Cota','7537756','-',7,'8.00',2,'Cuarzo','832',64,1,'80016',19,'1993-01-05','BRH+','6671206161',1,2,1,0,1,NULL,NULL,NULL,NULL,'Ricardo Quintero Batiz','Amanda Guadalupe Cota Armendariz'),(57,'Carlos Alfonso',1110360,'Pérez','Camacho','7141383','charlie9327@hotmail.com',35,'8.30',1,'Bahia de Topolobampo','1020',58,1,'80170',20,'1991-09-03','ARH+','-',1,1,1,0,1,NULL,NULL,NULL,NULL,'Alfonso Pérez González','Elma Cristina Camacho Pérez'),(58,'Alejandra',1110378,'Gutierrez','Angulo','6977340239','-',99,'9.91',1,'Valle de los Andes','2734',65,1,'81600',18,'1993-04-07','ORH+','6971105851',1,2,1,0,1,NULL,NULL,NULL,NULL,'Fernando Gutierrez Ortega','Jesús Marlen Angulo Rodriguez'),(59,'Juán Antonio',1110386,'Camacho','Reyes','-','darknauj@hotmail.com',97,'8.02',1,'Bahia de Altata','1537',66,1,'80854',20,'1991-11-29','ORH+','6672226628',1,1,1,0,1,NULL,NULL,NULL,NULL,'Jesús Abel Camacho Angulo','Teresa de Jesús Reyes Uriarte'),(60,'Nancy Carolina',1110394,'Gámez','Castro','7164151','-',1,'8.00',1,'Abogados','18',67,1,'80030',19,'1992-11-24','ORH+','6672681954',1,2,1,0,1,NULL,NULL,NULL,NULL,'Hector Manuel Gámez Castro','Luz María Castro López'),(61,'Marisol',1110402,'García','Pérez','-','A',1,'1.00',1,'-','-',1,1,'-',19,'1992-09-15','ABRH+','-',1,2,1,0,1,NULL,NULL,NULL,NULL,'-','-'),(62,'Karen Abigail',1110410,'Sepulveda','Bustamante','-','abigail_sepulveda@hotmail.com',44,'9.20',1,'Antonio del Valle','2955',68,1,'80194',19,'1992-09-15','ABRH+','6672442260',1,2,1,0,1,NULL,NULL,NULL,NULL,'José Israel Sapulveda Félix','Martha Julieta Bustamante Tapia'),(63,'Mariant',1110428,'Barrón','Quevedo','-','-',1,'1.00',1,'Acorazado','3785',69,1,'80150',20,'1991-10-30','BRH+','6672060293',1,2,1,0,1,NULL,NULL,NULL,NULL,'Ricardo Barrón Beltrán','María Antonieta Quevedo Gómez'),(64,'Ruby Guadalupe',1110436,'Monarrez','Zamora','7157055','-',29,'9.86',2,'Articulo 123','1298',70,1,'80040',19,'1992-07-15','ORH+','-',1,2,1,0,1,NULL,NULL,NULL,NULL,'Roberto Monarrez Meraz','María Guadalupe Zamora Padilla'),(65,'Nancy Guadalupe',1110451,'Ocegueda','Escobedo','7184435','nancy_15oct@hotmail.com',34,'9.50',1,'Andador Artículo 83','4947-A',11,1,'80184',19,'1992-10-15','ORH+','6672647128',1,2,1,0,1,NULL,NULL,NULL,NULL,'Oscar de Jesús Ocegueda Mendoza','Nnacy Veronica Escobedo Orona'),(66,'Manuel Fernando',1110469,'Urias','Toral','2752501','fer_toral@hotmail.com',44,'7.24',1,'Temis','3972',13,1,'80059',19,'1993-01-16','-','6677867693',1,1,1,0,1,NULL,NULL,NULL,NULL,'Felizardo Urias Burgos','Silvia Lorena Toral Osuna'),(67,'Cecilia Guadalupe',1110477,'Beltrán','Villanueva','-','cecyybeltrann@hotmail.com',55,'8.81',1,'Andador Articulo 63','5308-A',72,1,'80190',19,'1993-01-13','ORH+','6672375338',1,2,1,0,1,NULL,NULL,NULL,NULL,'Cecilio Beltrán Caro','Solangel Villanueva Baba'),(68,'Gladys Sarahi',1110485,'Sainz','Moreno','7270137','sarahii_sainz@hotmail.com',47,'7.63',1,'Santa Martha','2350',73,1,'80290',18,'1993-05-31','ORH+','6672451201',1,2,1,0,1,NULL,NULL,NULL,NULL,'Jesús Ramón Sainz Padilla','Martha Alicia Moreno Ponce'),(69,'Sergio Gibran',1110501,'Macias','Arredondo','7184870','matthew_1626@hotmail.com',47,'8.33',1,'Canario','1352',74,1,'80260',18,'1993-07-14','ARH+','6671884974',1,1,1,0,1,NULL,NULL,NULL,NULL,'Sergio Macias Frias','Alma Hermenegilda Arredondo Hermosillo'),(70,'Teodoro Ángel',1110519,'Dehesa','Mitre','7143046','gidnight@hotmail.com',37,'7.50',1,'Rio Casas Grandes','1005',75,1,'80170',23,'1988-07-02','ARH+','6671288389',1,1,1,0,1,NULL,NULL,NULL,NULL,'Teodoro Angel Miguel Dehesa y Pérez Reguera','Elva Emilia Mitre García'),(71,'Larissa Berenice',1110527,'Mejia','Alarcón','1651249','-',116,'7.90',2,'Laguna de Tamaulipas','1247',60,1,'80060',19,'1992-10-12','ORH+','6681638303',1,2,1,0,1,NULL,NULL,NULL,NULL,'Flavio Medjia Cuadras','Berenice Alarcón Lozano'),(72,'Janitze Melissa',1110535,'Rodriguez','López','7894150','janitzemrl@hotmail.com',43,'7.93',1,'Santa Sabina','3931',76,1,'80029',21,'1991-01-21','ORH+','6672011005',1,2,1,0,1,NULL,NULL,NULL,NULL,'Martiniano Rodríguez Delgado','Janiel López Mendivil'),(73,'Oriana Anahi',1110543,'Bojorquez','Rivera','259897','x.oriana@live.com.mx',48,'9.21',1,'Bahia de Santa María','1606',129,1,'80050',20,'1991-07-29','ARH+','6673885044',1,2,1,0,1,NULL,NULL,NULL,NULL,'José Noe Bojorquez Camacho','Adelaida Rivera Niebla'),(74,'Jissel Rubi',1110550,'Meza','Lindor','1738710','jissel_9324@hotmail.com',73,'8.20',1,'Paseo Quinta del Rey','6262',77,1,'80149',18,'1993-03-15','ORH+','6671976769',1,2,1,0,1,NULL,NULL,NULL,NULL,'Martin Meza Ozrti','Martha Idelia Lindor de Meza'),(75,'Irma Judith',1110568,'Reynaga','Nuñez','7211563','irma-1322@hotmail.com',113,'7.58',1,'Mezquite','5792',78,1,'80189',19,'1992-11-23','ARH+','6672632123',1,2,1,0,1,NULL,NULL,NULL,NULL,'Cresencio Jacinto Reynaga Flores','Rosalina Nuñez Toloza'),(76,'Ana Paola',1110576,'Moreno','Herrera','7610462','anapmoreno_93@hotmail.com',31,'7.70',2,'Del Deportivo','2755',79,1,'80100',18,'1993-05-11','ARH+','6671262315',1,2,1,0,1,NULL,NULL,NULL,NULL,'Juan Manuel Moreno Padilla','María Paola Herrera González'),(77,'Cesar Raul',1110592,'Mendoza','Urdiales','7123468','raul.mendoza.u@gmail.com',33,'8.60',2,'Isla del Socorro','1457-4',60,1,'80060',0,'2011-11-11','BRH+','6671843106',1,1,1,0,1,NULL,NULL,NULL,NULL,'José Guadalupe Mendoza Macias','Alicia Esperanza Urdiales Pérez'),(78,'José Leobardo',1110600,'Niebla','Leyva','7601508','leo-nevermore@hotmail.com',34,'8.00',1,'Flor de Liz','6249',31,1,'80148',21,'1991-01-14','ORH+','6671891838',1,1,1,0,1,NULL,NULL,NULL,NULL,'José Jaime Niebla Serrano','Martha Olivia Leyva Rochin'),(79,'Yeny Rubi',1110618,'Tamez','Leyva','7602695','relampagoazul_22@hotmail.com',73,'10.00',2,'Campo Arbaco','3745',49,1,'80155',19,'1992-10-30','BRH+','6672204598',1,2,1,0,1,NULL,NULL,NULL,NULL,'José Humberto Támez Arellano','María Socorro Leyva de Támez'),(82,'Karla Melissa',1112416,'Herrera','Rosas','7542147','karlithaherrera@hotmail.com',98,'6.73',1,'Hera','3872',13,1,'-',21,'1991-02-12','-','-',1,2,1,0,1,NULL,NULL,NULL,NULL,'Sergio Herrera Félix','Elizabeth Carlota Rosas López Portillo'),(83,'Laura Elisa',1110634,'Valdez','Salcido','4558597','mcadorkable@gmail.com',44,'8.43',1,'Cerro del Elefante','1973',130,1,'80179',19,'1992-08-28','ORH+','6672523526',1,2,1,0,1,NULL,NULL,NULL,NULL,'Fortunato Valdez Galaviz','Laura Irene Salcido Hernandez'),(84,'Denisse Angelica',1110642,'Cristerna','Díaz','7531970','marden_12@hotmail.com',86,'7.13',1,'Ingnieros','16',53,1,'80030',22,'1989-09-20','ORH+','6672237269',1,2,1,0,1,NULL,NULL,NULL,NULL,'Mario Ruben Cristerna Izabal','María Angelica Díaz Bodart'),(85,'Mariana',1110659,'Mejía','Cortez','7531350','mc.mariinna@hotmail.com',42,'7.63',1,'hIPOCRATES','1501',80,1,'80013',19,'1992-12-05','ORH+','6672665181',1,2,1,0,1,NULL,NULL,NULL,NULL,'Fernando Mejía Castro','Ana María Cortez Traslavina'),(86,'Salvador',1110667,'Cardenas','Mokay','7215122','-',3,'8.00',2,'Campo Arbaco','5678',131,1,'80150',19,'1992-10-25','ORH-','6671980777',1,1,1,0,1,NULL,NULL,NULL,NULL,'José Salvador Cárdenas León','Guadalupe Mariela Mokay Buelna'),(87,'Hector Daniel',1110675,'Castro','Pérez','2581294','ivikeman_569@hotmail.com',43,'7.61',1,'Jaca','3402',81,1,'80058',18,'1993-04-13','ARH+','6671802473',1,1,1,0,1,NULL,NULL,NULL,NULL,'Hector Alan Castro Leyva','Alma Felicitas Pérez Morales'),(88,'Cristobal Alejandro',1110683,'Osuna','Olmeda','7161293','alexosuna-63@gmail.com',100,'7.70',1,'Volcan de Aire','2017',82,1,'81479',20,'1991-03-06','ARH+','6731014723',1,1,1,0,1,NULL,NULL,NULL,NULL,'José Cristobal Osuna Valdez','Lucia Guadalupe Olmeda Duarte'),(89,'Noheli Lorely',1110709,'López','Olivas','6977410056','nolabad@hotmail.com',75,'8.79',1,'Salvador Alvarado','Poste 191',19,5,'80500',18,'1993-04-06','-','6971046937',1,2,1,0,1,NULL,NULL,NULL,NULL,'Rodolfo López Pérez','Sandra Luz Olivas Muñoz'),(90,'Nayely',1110766,'Medina','Torres','1701105','-',34,'9.20',1,'Jesus Almada','156',88,2,'80376',19,'1992-08-25','ORH+','6671897532',1,2,1,0,1,NULL,NULL,NULL,NULL,'Fernando Medina Ramirez','María Migdalia Torres Quiroz'),(91,'Laura Cecilia',1110964,'Aguilar','Pineda','6737326427','laura_cecilia@hotmail.com',115,'8.43',1,'Mariano Matamoros','235',19,7,'81400',19,'1992-03-21','ARH+','6731001586',1,2,1,0,1,NULL,NULL,NULL,NULL,'Juan Carlos Aguilar Heredia','Laura Elena Pineda López'),(92,'Hector Jesus',1111061,'Padilla','Aceviz','7687815933','hector_chapo17@hotmail.com',68,'7.50',2,'Rio Elota','398',100,6,'81000',21,'1990-09-13','BRH-','16871016507',1,1,1,0,1,NULL,NULL,NULL,NULL,'José Jesús Padilla García','Yolanda Alicia Aceviz Lara'),(93,'Laura Teresa',1112085,'Calderón','Rivas','6721170169','calderon_laura22@hotmail.com',60,'7.69',1,'Principal','Poste 6',109,2,'80330',18,'1993-08-22','ARH+','6672117630',1,2,1,0,1,NULL,NULL,NULL,NULL,'Daniel Humberto Calderón Garibaldi','Laura Elena Rivas Iturrios'),(94,'Diana Lilia',1112150,'Soto','Berrelleza','7274001','titha_linda26@hotmail.com',66,'9.00',1,'Morelos','380',19,2,'80370',18,'1993-05-26','-','6721096304',1,2,1,0,1,NULL,NULL,NULL,NULL,'Carlos Humberto Soto','Diana Lilia Berrelleza Malacón'),(95,'Jonathan Francisco',1110691,'Peña','Patrón','7541595','jonathan.pp@hotmail.com',107,'7.02',2,'De la Virtud','3066',83,1,'-',20,'1991-06-26','BRH+','6673900170',1,1,1,0,1,NULL,NULL,NULL,NULL,'Francisco Samuel Peña Martínez','Lourdes Beatriz Patrón Rodríguez'),(96,'Luis Roberto',1110717,'Beltrán','Ojeda','1460702','lrbo92@hotmail.com',3,'7.13',2,'Cerro de los Pilares','2074',82,1,'80228',18,'1993-12-19','ARH+','6677481313',1,1,1,0,1,NULL,NULL,NULL,NULL,'Luis Roberto Beltrán Hernández','María Magdalena Ojeda'),(97,'Dante Geovanny',1110725,'Díaz','Chavez','7509065','dante_chivita@hotmail.com',38,'7.52',1,'Emilie Berline','1546',85,1,'80010',18,'1993-08-04','ORH+','6673164015',1,1,1,0,1,NULL,NULL,NULL,NULL,'Julian David Díaz Cruz','Rosa María Chavez Acosta'),(98,'Dulce Xihomara',1110733,'Zamudio','Bustamante','7615475','dulze_zamudio@hotmail.com',37,'8.70',1,'Constituyente Alberto Román','1999',28,1,'80180',18,'1993-04-08','ARH+','6672202774',1,2,1,0,1,NULL,NULL,NULL,NULL,'Aldo Ricardo Zamudio Ornelas','María Emma Bustamante Cruz'),(99,'Jonatan Misael',1110741,'Mora','Ibarra','7280484','misa_yoni@hotmail.com',83,'7.79',1,'Carlos M. Ezquerra','76',87,1,'80430',19,'1993-02-07','-','6672345262',1,1,1,0,1,NULL,NULL,NULL,NULL,'Victor Manuel Mora Ochoa','Guadalupe Ibarra Armenta'),(100,'María Alejandra',1110758,'Martinez','Sanchez','7107420','A',1,'1.00',1,'Calzada de los Empaques','5438-A',11,1,'80145',19,'1992-05-03','ORH+','6672355962',1,2,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(101,'Jesús Hernny',1110774,'Guerrero','Espinoza','7169071','-',37,'8.60',1,'16 de Septiembre','1062',89,1,'80230',18,'1993-06-16','BRH+','6672337315',1,1,1,0,1,NULL,NULL,NULL,NULL,'Jesús Guadalupe Guerrero Padilla','María de Jesús Espinoza Velazquez'),(102,'Silvia Janethe',1110782,'Ramos','Solano','8745010','cinderella_galactica@hotmail.com',92,'9.33',1,'Merida','85',58,1,'81144',19,'1992-12-04','ORH+','6871246971',1,2,1,0,1,NULL,NULL,NULL,NULL,'José Reyes Ramos Ramos','Silvia Belinda Solano Suarez'),(103,'Victor Daniel',1110790,'Palma','Cortes','-','spawn_03_@hotmail.com',108,'8.10',1,'Morelos','961-A',100,1,'80200',24,'1987-08-03','ORH+','6672473713',1,1,1,0,1,NULL,NULL,NULL,NULL,'Porfirio Palma Vera','María de la Luz Cortes Arias'),(104,'Pedro',1110808,'Sanchez','Inzunza','-','-',105,'9.87',1,'-','-',1,1,'-',25,'1986-08-12','-','-',1,1,1,0,1,NULL,NULL,NULL,NULL,'Pedro Sanchez Rodriguez','Mirna Inzunza Heraldez'),(105,'Yael Amapola',1110816,'Gonzalez','Silvestry','7124441','-',37,'7.90',1,'Juan José Ríos','-',35,1,'-',26,'1985-05-14','BRH+','-',1,2,1,0,1,NULL,NULL,NULL,NULL,'Inocencio Gonzalez Andrade','Leticia Guadalupe Silvestry Uribe'),(106,'Jesús Omar',1110824,'Covarrubias','Labra','6672558989','omar-17@msn.com',101,'8.10',1,'Enrique Félix Castro','3053',24,1,'80020',21,'1990-11-11','ORH+','6672558949',1,1,1,0,1,NULL,NULL,NULL,NULL,'Teodocio Covarrubias Valencia','María Labra Olivas'),(107,'José Fernando',1110832,'Pantoja','Granados','7160740','j_feer_7@hotmail.com',94,'7.22',1,'Josefa Ortiz de Dominguez','2660',91,1,'80040',17,'1994-08-17','-','6671854387',1,1,1,0,1,NULL,NULL,NULL,NULL,'Fernando Pantoja Arias','Graciela Granados Ibarra'),(108,'Victor Alejandro',1110840,'Madrigal','Salazar','1475404','victor_aclna@hotmail.com',86,'8.20',1,'Anastacio Bustamante','1569',32,1,'80290',18,'1993-09-28','ARH+','6672174491',1,1,1,0,1,NULL,NULL,NULL,NULL,'José Alfredo Madrigal Reyes','Consuelo Salazar Rodriguez'),(109,'Alejandra',1110857,'Velazquez','Ramirez','7508429','alezytta_vers@hotmail.com',52,'7.31',1,'Emile Barline','3290',20,1,'-',18,'1993-09-22','-','6672343816',1,2,1,0,1,NULL,NULL,NULL,NULL,'Eusebio Velazquez Uriostegui','María Magadalena Ramirez Barajas'),(110,'Kevin Daniel',1110865,'Beltrán','Ríos','-','-',4,'7.30',2,'Montesosa','640',93,1,'80227',19,'1993-01-07','ORH+','6677566618',1,1,1,0,1,NULL,NULL,NULL,NULL,'Eladio Beltrán Félix','Maricela Ríos de Beltrán'),(111,'Luz Raquel',1110873,'García','Padilla','7108296','luz_raquel93@hotmail.com',48,'8.29',1,'Benjamil Hill','3748',57,1,'80190',18,'1993-08-31','ARH+','6677563696',1,2,1,0,1,NULL,NULL,NULL,NULL,'Jaime García Monterrubio','Maria Jacqueline Padilla Molina'),(112,'Rosario Adilene',1110881,'Uraga','Espinoza','-','adilene_crazy@hotmail.com',44,'7.93',1,'HIguera Esquina con Oslo','5272',92,1,'80184',20,'1991-10-05','ARH+','6671751122',1,2,1,0,1,NULL,NULL,NULL,NULL,'Jesús Oscar Uraga Cárdenas','María de la Luz Espinoza'),(113,'José Arturo',1110899,'Benitez','Hernández','2584834','lazeman009@hotmail.com',3,'7.25',2,'Montemayor','560',93,1,'80077',18,'1994-02-23','ORH+','6679958206',1,1,1,0,1,NULL,NULL,NULL,NULL,'José Manuel Benitez Gastelum','Karla de Lourdes Hernández Mancillas'),(114,'Luis Humberto',1110907,'Verdugo','López','7616289','-',43,'7.76',1,'Primera Cerrada de Virreyes','1549',93,1,'80227',19,'1992-06-06','ARH+','6672287906',1,1,1,0,1,NULL,NULL,NULL,NULL,'Luis Enrique Verdugo Solis','Beatriz Amalia López Jacobo'),(115,'Fernando',1110915,'Beltrán','Manjarrez','4550364','farluisbuffon@hotmail.com',43,'7.78',1,'Sauce','1459',74,1,'80260',24,'1987-06-06','ORH+','6672342169',1,1,1,0,1,NULL,NULL,NULL,NULL,'José Francisco Beltrán','María Magdalena Manjarrez López'),(116,'José Alfonso',1110923,'García','Calderón','-','jose_garciac@hotmail.com',73,'7.26',2,'Lago de Patzcuaro','1254',60,1,'80060',20,'1991-03-20','ARH+','6671503887',1,1,1,0,1,NULL,NULL,NULL,NULL,'Manuel de Jesús García Sánchez','Evangelina Calderón Ojeda'),(117,'Sergio',1110931,'Hernandez','Molina','7147646','gioser_53@hotmail.com',44,'6.96',1,'Andador Sierra Pichacho','Dep. E',27,1,'80179',19,'1992-07-25','ORH+','6672099337',1,1,1,0,1,NULL,NULL,NULL,NULL,'Sergio Hernandez Peraza','María de los Angeles Molina Valencia'),(118,'Lucero',1110949,'León','Velez','7543367','lucero_lv74@hotmail.com',32,'7.30',2,'Del Destino','3416',95,1,'-',19,'1992-07-04','ORH+','6673057682',1,2,1,0,1,NULL,NULL,NULL,NULL,'Ramón León Gámez','Yadira Guadalupe Velez Cervantes'),(119,'José Armando',1110956,'Vázquez','Félix','-','armando02011@hotmail.com',49,'9.31',1,'Fray Bernardino de Sahagún','4438',96,1,'80249',22,'1989-11-03','ARH+','6672047785',1,1,1,0,1,NULL,NULL,NULL,NULL,'Rosendo Vázquez Corrales','María Josefina Félix Aispuro'),(120,'Elizabeth',1110972,'García','Ojeda','7535346','-',52,'8.58',1,'Alvaro Obregón','33',98,1,'80010',19,'1992-11-21','ARH+','6671822599',1,2,1,0,1,NULL,NULL,NULL,NULL,'Cruz Francisco García Rivera','Carmen María Ojeda Zamora'),(121,'Julio Cesar',1111004,'Castillo','Amezcua','7146700','julio-amezcua22@hotmail.com',111,'9.93',1,'Andador Vehicular','4414-402',21,1,'80159',24,'1987-12-31','-','6674768396',1,1,1,0,1,NULL,NULL,NULL,NULL,'Julio Cesar Castillo Verdugo','Trinidad Amezcua Moreno'),(122,'Roxana',1111012,'Amarillas','Romero','7122556','roxx_ara@hotmail.com',67,'8.20',1,'Kuculcan','75',99,1,'80100',19,'1993-02-23','ORH+','6727231689',1,2,1,0,1,NULL,NULL,NULL,NULL,'José Manuel Amarillas Gastelum','Susana Romero Gastelum'),(123,'Edna Judith',1111020,'Pérez','Lugo','7140197','edna_judith116@hotmail.com',114,'9.70',2,'Chiapas','1977-B',58,1,'80170',25,'1986-11-16','ORH+','6672239075',1,2,1,0,1,NULL,NULL,NULL,NULL,'Heriberto Pérez Soto','Silvina Lugo Sánchez'),(124,'Kenia Berenice',1111038,'Gutierrez','Castro','2589882','-',37,'7.40',1,'Santa Anita','2415',73,1,'80290',19,'1993-01-27','-','6671384401',1,2,1,0,1,NULL,NULL,NULL,NULL,'Rigoberto Gutierrez Ramos','Angelica Castro Rodríguez'),(125,'David Arturo',1111046,'Osuna','Acosta','-','doff69@hotmail.com',93,'7.90',2,'Venustiano Carranza','249',19,1,'80000',20,'1991-12-24','ORH+','6672446488',1,2,1,0,1,NULL,NULL,NULL,NULL,'Antonio Enrique Osuna','Julia Acosta Luque'),(126,'Carlos Ismael',1111053,'Moreno','Carrillo','7175010','-',93,'8.01',2,'Manuel J. Clouthier','2161',56,1,'80160',18,'1993-07-27','ARH+','6672350677',1,1,1,0,1,NULL,NULL,NULL,NULL,'Ismael Moreno García','Aurora Carrillo Landell'),(127,'Karla Cristina',1111079,'Rojo','Castro','4557647','cristy_roja@hotmail.com',37,'8.00',1,'Tales de Mileto','1674',80,1,'80010',19,'1992-08-01','ORH+','6671511970',1,2,1,0,1,NULL,NULL,NULL,NULL,'Saul Rojo Andablo','Matilde Castro Cruz'),(128,'Jesús Octavio',1111087,'Aceves','Favela','7531210','-',52,'8.06',1,'Galileo','750',4,1,'80100',20,'1991-12-15','ORH+','6672088712',1,1,1,0,1,NULL,NULL,NULL,NULL,'Jesús Octavio Aceves Nuñez','Ana María del Rosario Favela Ahumada'),(129,'Karen Alejandra',1111095,'Valenzuela','Cardenas','2602909','karen_17_0@hotmail.com',118,'9.20',1,'Valle del Fuerte','7246',101,1,'80143',19,'1992-05-21','ORH+','6671367385',1,2,1,0,1,NULL,NULL,NULL,NULL,'Mario Humberto Valenzuela Salcido','María Delia Cárdenas Sánchez'),(130,'Sarahi',1111103,'Sosa','Diarte','7535330','sara_sosa14@hotmail.com',42,'8.28',1,'Cantera','781',64,1,'80016',19,'1992-08-14','ARH+','6672078597',1,2,1,0,1,NULL,NULL,NULL,NULL,'Victor Manuel Sosa Zavala','Norma Diarte Ruiz'),(131,'Diana Alejandra',1111970,'Félix','Alfaro','7132138','-',52,'8.29',1,'Principal','Poste 6',103,1,'80384',19,'1992-09-20','ORH+','6671871877',1,2,1,0,1,NULL,NULL,NULL,NULL,'José Marcial Félix Ochoa','Diana del Carmen Alfaro Lora'),(132,'Gladis Lizeth',1111129,'Castro','López','2753186','galllethitha@hotmail.com',44,'8.13',1,'Islas Andaman','5442',132,1,'80296',21,'1990-11-27','ARH+','6674770097',1,2,1,0,1,NULL,NULL,NULL,NULL,'Martin Castro Nuñez','Adriana Guadalupe López Zavala'),(133,'Felipe de Jesús',1111137,'Moreno','Lara','2581882','felipe_25_93@hotmail.com',48,'9.04',1,'Francisco Gomez Flores','1290',29,1,'80090',19,'1993-02-02','ORH+','6671684625',1,1,1,0,1,NULL,NULL,NULL,NULL,'Fructoso Moreno Velarde','María del Carmen Lara Zavala'),(134,'Jorge Adrian',1111145,'Sepulveda','Piña','6672080975','ireland_gnomo@hotmail.com',98,'7.85',2,'De los Sauces','1138-41',133,1,'80063',19,'1992-12-14','ORH+','6673047253',1,1,1,0,1,NULL,NULL,NULL,NULL,'Jorge Adrian Sepulveda Vidals','Nora Leticia Piña Carrillo'),(135,'Edgar Alejandro',1112010,'Elenes','Toscano','7178902','edgarelenes6@hotmail.com',47,'7.82',1,'Rio Lerma','1478',34,1,'80120',21,'1990-11-04','ORH+','6672762756',1,1,1,0,1,NULL,NULL,NULL,NULL,'José Ignacio Elenes Pérez','Guadalupe del Carmen Toscano Zavala'),(136,'Pedro Alonso',1112028,'Serrano','Quintero','-','a',1,'1.00',1,'-','-',1,1,'-',18,'1993-08-16','-','-',1,1,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(137,'Carolina Copitzi',1112036,'Rodríguez','Toriz','4558655','copitzitha_copitzi@hotmail.com',116,'8.80',2,'Abedul','1691',74,1,'80260',18,'1993-06-06','ORH+','6672313665',1,2,1,0,1,NULL,NULL,NULL,NULL,'Daniel Rodríguez López','Laura María Toriz Millan'),(138,'Mayra Rosenda',1112044,'Avendaño','Acosta','2577302','mayra_9479@hotmail.com',94,'8.75',2,'José Aguilar Barraza','1217',106,1,'80210',19,'1993-01-07','ORH+','6671914220',1,2,1,0,1,NULL,NULL,NULL,NULL,'Ignacio Avendaño Camacho','Rosa María Acosta Ramirez'),(139,'Dierick Tadeo',1112051,'Delgado','López','2573145','dierick1993@rivera.ant',1,'8.10',1,'Leonardo Da Vinci','3800',107,1,'80028',19,'1993-01-16','ORH+','6674773984',1,1,1,0,1,NULL,NULL,NULL,NULL,'Elias Tadeo Delgado Moreno','Flor Marisela López Cabanillas'),(140,'Jesús Rosario',1112069,'-','Pérez','7128225','jandu_black666@hotmail.com',34,'7.70',1,'Puerto Ensenada','1952',108,1,'-',26,'1985-10-06','-','6677973635',1,1,1,0,1,NULL,NULL,NULL,NULL,'','Cruz Guadalupe Pérez Gámez'),(141,'Fanny',1112077,'Escobar','Sanchez','7531644','fita_13@hotmail.com',1,'1.00',1,'Platón','715',4,1,'80010',24,'1987-10-25','ORH+','6677953196',1,2,1,0,1,NULL,NULL,NULL,NULL,'Claudio Rene Escobar Juan','María Guadalupe Sánchez Najar'),(142,'Adriana Anayancy',1112093,'Hernandez','Cervantes','1350269','adriana02_92@hotmail.com',43,'8.50',1,'Amado Estrada','4530',134,1,'80190',19,'1992-10-29','ARH+','6672654491',1,2,1,0,1,NULL,NULL,NULL,NULL,'José Transito Hernández Ochoa','Rosalia Cervantes Lugo'),(143,'Patricia Yurivia',1112101,'Espinoza','Chaparro','7454337','p_turi_espinoza@hotmail.com',34,'9.40',1,'Alberto Terrones','3022',111,1,'80197',19,'1992-03-14','ORH+','6671427564',1,2,1,0,1,NULL,NULL,NULL,NULL,'Victor Manuel Espinoza Cuevas','Fidelia Chaparro Fuentes'),(144,'Giovanny',0,'Gónzalez','Félix','-','-',1,'1.00',1,'-','-',1,1,'-',0,'2011-11-11','-','-',1,1,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(145,'Trinidad Aracely',1112127,'Almodovar','Pulido','7281512','trini_araza@hotmail.com',34,'9.20',1,'Benjamin J. López','4148',26,1,'80190',19,'1992-06-20','ARH+','6672505536',1,2,1,0,1,NULL,NULL,NULL,NULL,'Guadalupe Almodovar Rivera','Lucila Pulido Escarcega'),(146,'Gonzalo',1112135,'Gonzales','Torres','7281512','-',84,'7.72',1,'Francisco Villa','35',106,1,'80430',19,'1993-01-07','ORH+','6671607060',1,1,1,0,1,NULL,NULL,NULL,NULL,'Jesús Manuel González Jimenez','Maricela Torres Noriega'),(147,'Blanca Rosa',1112143,'Carrasco','Valdez','7291070','brcv_sexygirl@hotmail.com',52,'8.38',1,'María de Jesús Neda','75',112,1,'80010',19,'1992-05-13','ORH+','6671801923',1,2,1,0,1,NULL,NULL,NULL,NULL,'Maximiliano Carrasco Padilla','Blanca Rosa Valdez Madrid'),(148,'Zurizadai',1112168,'Tolentino','Escarrega','2587019','-',78,'7.48',1,'José Limón Elias','3343',113,1,'80194',20,'1991-11-23','-','6677848396',1,2,1,0,1,NULL,NULL,NULL,NULL,'Federico Tolentino Rodríguez','María de los Angeles Escarrega'),(149,'Oscar Guadalupe',1112176,'Martínez','Zavala','-','oscarito_6yl@hotmail.com',37,'9.00',1,'Indio Guelatao','296',29,1,'80090',20,'1991-10-25','ARH+','6672494780',1,2,1,0,1,NULL,NULL,NULL,NULL,'Jorge Martínez Chacón','María Amelia Zavala Lara'),(150,'Karla Alejandra',1112184,'López ','Corrales','-','-',34,'7.50',1,'Rosendo Rodriguez','2868',61,1,'80197',22,'1989-11-20','-','6672656414',1,2,1,0,1,NULL,NULL,NULL,NULL,'Humberto Francisco López Montoya','Luz del Carmen Corrales Mancillas'),(151,'Karla Fernanda',1112192,'Angulo','Espinoza','6727271783','karla_kf1@hotmail.com',93,'8.15',2,'Antonio Bueno Escalante','908',115,1,'80322',20,'1991-09-22','ORH+','6721182784',1,2,1,0,1,NULL,NULL,NULL,NULL,'Hector Angulo Lafarga','Rosa Elia Espinoza Bojorquez'),(152,'Denisse Guadalupe',1112200,'Cardoza','Valdez','-','-',1,'1.00',1,'-','-',1,1,'-',0,'2011-11-11','-','-',1,2,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(153,'María Anaid',1112218,'López','Barraza','4558819','anaiid_barraza@hotmail.com',43,'8.07',1,'Benz Karl','1975',20,1,'80020',19,'1992-11-16','-','6672272887',1,2,1,0,1,NULL,NULL,NULL,NULL,'Miguel Angel López Rivera','Diana María Barraza Valdez'),(154,'Briseth Sarahi',1112234,'Sanchez','Sillas','7531682','bris_wuapa@hotmail.com',1,'1.00',1,'Primera','3939',135,1,'80016',25,'1986-07-18','ORH+','6671012464',1,2,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(155,'Francisco Javier',1112242,'Rodriguez','Bernal','7127824','jr2mb@hotmail.com',32,'6.70',2,'Monte Mayor','2913',93,1,'80227',19,'1993-01-27','-','6677302357',1,1,1,0,1,NULL,NULL,NULL,NULL,'Francisco Javier Rodríguez González','María Lydia Bernal Aguirre'),(156,'Diana Guadalupe',1110279,'Medina','Sandoval','-','-',1,'1.00',1,'-','-',1,1,'-',0,'2011-11-11','-','-',1,2,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(157,'Mayra Alejandra',1110287,'Sandoval','Mendoza','-','-',1,'1.00',1,'-','-',1,1,'-',0,'2011-12-12','-','-',1,2,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(158,'Carlos Mario',0,'Cárdenas','Uriarte','-','-',1,'1.00',1,'-','-',1,1,'-',0,'2011-12-11','-','-',1,1,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(159,'Melissa',1110980,'Urias','Cortez','-','-',1,'1.00',1,'-','-',1,1,'-',0,'2011-11-11','-','-',1,2,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(160,'María Isabel',1110998,'Estrada','Castro','-','-',1,'1.00',1,'-','-',1,1,'-',0,'2011-12-14','-','-',1,2,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(161,'Aleyda Anaid',1112259,'González','Silvestry','7124441','hags_carmelita@hotmail.com',95,'8.60',1,'Juan José Ríos','188',35,1,'80200',26,'1985-05-14','-','6673084292',1,2,1,0,1,NULL,NULL,NULL,NULL,'Inocencio Gonzalez Andrade','Leticia Guadalupe Silvestry Uribe'),(162,'Eleazar',1112267,'Medina','García','7494355','ele.culiacan23@hotmail.com',50,'7.88',1,'Girasol','2052-32',116,1,'-',25,'1986-08-23','BRH+','6671317247',1,1,1,0,1,NULL,NULL,NULL,NULL,'Victor Manuel Medina Olivas','María Sara García'),(163,'Luis Alonso',1112275,'Tavares','Castro','-','-',1,'7.70',1,'Las Torres','4657',11,1,'-',21,'1991-01-30','-','-',1,1,1,0,1,NULL,NULL,NULL,NULL,'Luis Gabriel Tavares Alonso','María de los Angeles Castro Medina'),(164,'Ivan Eduardo',1112283,'Torres','Meza','-','-',1,'1.00',1,'-','-',1,1,'-',0,'2012-01-01','-','-',1,1,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(165,'Antonio de Jesús ',1112291,'Gonzalez','Rivera','7290238','jesus-antonio1986@hotmail.com',48,'7.78',1,'6 de Septiembre','5151',117,1,'-',25,'1986-10-09','-','6677588985',1,1,1,0,1,NULL,NULL,NULL,NULL,'Refugio González Campos','María del Rosario Rivera Cárdenas'),(166,'Claudia',1112309,'Verduzco','Ceballos','-','-',112,'9.35',1,'Concordia','3323',14,1,'-',28,'1983-10-29','-','-',1,2,1,0,1,NULL,NULL,NULL,NULL,'Francisco Verduzco Castro','Norma Ceballos Padilla'),(167,'Miriadneth Sarai',1112317,'Romero','Ceniceros','-','sarai_romero88@hotmail.com',38,'8.72',1,'Dautillos','Poste 47',151,2,'-',24,'1988-03-25','ARH+','6727517471',1,2,1,0,1,NULL,NULL,NULL,NULL,'Efren Romero Hernández','María del Carmen Ceniceros Quiñonez'),(168,'Aimee Paulina',1112325,'López ','Hernández','-','amy_pau@hotmail.com',43,'9.04',1,'Tulipan','3554',119,1,'-',19,'1993-02-12','-','6672035829',1,2,1,0,1,NULL,NULL,NULL,NULL,'José Manuel López Ochiqui','Ancelma Josefina Hernández Valenzuela'),(169,'Flor Anette',1112333,'Gutierrez','Orozco','7172295','fago_jo09@hotmail.com',48,'8.08',1,'Luis Manuel Rojas','2183',28,1,'-',18,'1993-08-09','-','6677962043',1,2,1,0,1,NULL,NULL,NULL,NULL,'Alejandro Gutierrez Gutierrez','Florina Orozco Aguilar'),(170,'Victor Antonio',1112341,'Zambada','Reyes','-','pitor_rr@hotmail.com',93,'1.00',2,'Laguna de Salada','1298',60,1,'-',19,'1993-01-21','-','6677980868',1,1,1,0,1,NULL,NULL,NULL,NULL,'-','-'),(171,'Ana Rocío',1112358,'Sanchez','Mendoza','7147500','aniithapink21@hotmail.com',1,'8.50',1,'Cerro Otates','3278',120,1,'80177',19,'1993-01-20','-','6671616566',1,2,1,0,1,NULL,NULL,NULL,NULL,'Rene Octavio Sánchez Montoya','María del Rosario Mendoza Sánchez'),(172,'José Luis ',1112366,'Sánchez','González','1150504','luisio_gon93@hotmail.com',60,'8.25',1,'Antonio Nava','241',19,1,'-',18,'1993-07-26','-','6721194255',1,1,1,0,1,NULL,NULL,NULL,NULL,'José Luis Sánchez Chavez','María del Rosario González Avilez'),(173,'Gloria Zulema',1112374,'Sanchez','Bermudez','7532964','gloriasanchez_7@hotmail.com',82,'6.40',1,'C. Trinidad Dorame','868',122,1,'80016',25,'1986-05-02','-','6672672403',1,2,1,0,1,NULL,NULL,NULL,NULL,'Carlos Manuel Sánchez Alfaro','Gloria Bermudez Trujillo'),(174,'Heladio Antonio',1112382,'Beltrán','Ríos','-','-',1,'1.00',1,'-','-',1,1,'-',11,'2001-01-01','-','-',1,1,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(175,'Jesús Eduardo',1112390,'Leyva','Zarate','-','lalo_gringo@hotmail.com',35,'8.10',1,'Asalea','7082',123,1,'80143',11,'2001-01-02','-','6671911713',1,1,1,0,1,NULL,NULL,NULL,NULL,'Jesús Eduardo Leyva García','Norma Elida Zarate Aguirre'),(176,'Jesús Hernán ',1,'Aguilar','Espinoza','-','-',1,'1.00',1,'-','-',1,1,'-',11,'2001-01-01','-','-',1,1,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(177,'Miguel Angel Henok',1112457,'Velazquez','De la Vara','-','-',93,'8.30',2,'Eclipse','3377',125,1,'-',20,'1991-10-02','-','-',1,1,1,0,1,NULL,NULL,NULL,NULL,'Carlos Velazquez Guerra','Rosalina de la Vara Gastelum'),(178,'.Carolina',1112465,'Hernandez','Matus','-','-',86,'8.00',1,'-','-',1,1,'-',16,'1996-02-12','-','-',1,2,1,0,1,NULL,NULL,NULL,NULL,'Cesar Erasmo Hernández Rivera','María Consuelo Matus Machado'),(179,'Christian Michel',1112473,'Flores','Beltrán','-','-',48,'9.65',1,'-','-',1,1,'-',17,'1994-12-29','-','-',1,1,1,0,1,NULL,NULL,NULL,NULL,'Ruben Flores López','Adriana Beltrán'),(180,'Kathya Berenice',1112119,'Guzmán','Cristerna','-','-',1,'1.00',1,'-','-',1,1,'-',15,'1996-04-25','-','-',1,2,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(181,'Reina Lizbeth',1112226,'Ochoa','López','-','-',1,'1.00',1,'-','-',1,1,'-',24,'1987-04-08','-','-',1,1,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(182,'Marco Antonio',1100015,'Covantes','Chaidez','4557415','marco_rafaga@hotmail.com',22,'8.20',1,'Miguel Hidalgo','4138 ote.',1,1,'80088',21,'1990-06-13','-','6672167135',1,1,1,0,1,NULL,NULL,NULL,NULL,'José Manuel Covantes Rodriguez','Refugio de la Cruz Chaidez De Covantes'),(183,'Tania Gabriela',1100023,'Casillas','Cárdenas','7608217','gcasillas_91@hotmail.com',33,'7.80',2,'Fernando Orozco','7588',2,1,'-',21,'1991-01-04','-','6671387236',1,2,1,0,1,NULL,NULL,NULL,NULL,'José Gabriel Casillas Soto','Sandra Luz Cárdenas Valdez'),(184,'José Miguel',1100031,'Meza','Castro','4550759','miguel_meza@hotmail.es',37,'8.10',1,'Carlo Gracudas','1864',3,1,'80180',19,'1992-10-13','-','6677630595',1,1,1,0,1,NULL,NULL,NULL,NULL,'Jesús Alfonso Meza Bermudez','Ana María Castro Cervantes'),(185,'Claudia',1100049,'Valdez','Bello','753-97-30','clava_b@hotmail.com',7,'8.40',2,'Pitagoras','525',4,1,'80010',19,'1992-05-18','-','6671380953',1,2,1,0,1,NULL,NULL,NULL,NULL,'Victor Manuel Valdez Bermudes','Carmen Piedad Bello López'),(186,'Paulina',1100056,'Quintero','Gómez','-','pauquintero@live.com.mx',43,'8.54',1,'Doncel','2318',5,1,'80050',20,'1991-12-17','-','6671829248',1,2,1,0,1,NULL,NULL,NULL,NULL,'Alejandro Quintero Leuffer','Lorena Gomez de Quintero'),(187,'Erick Alberto',1100064,'Rivera','Martínez','7184544','besty_boy_1@hotmail.com',41,'7.91',1,'Revolución de Ayutla','2047',6,1,'80260',29,'1982-08-05','-','6671563373',1,2,1,0,1,NULL,NULL,NULL,NULL,'Carlos Rivera Calderon','Marcelina Martinez Martinez'),(188,'Ana Karen',1100072,'Anaya','Delgado','7169439','anakaren_akad@hotmail.com',82,'8.00',1,'Laguna de Yurivia','1296',60,1,'-',22,'1989-09-29','-','6671502297',1,2,1,0,1,NULL,NULL,NULL,NULL,'Carlos Alberto Anaya Lizarraga','Silvia Teresita Delgado Trejo'),(189,'Germán Melchor',1100080,'Peraza','Quintero','4551087','german_chorelo@hotmail.com',52,'7.83',1,'Rio Saba','7480',138,1,'-',20,'1991-09-27','-','6677673355',1,1,1,0,1,NULL,NULL,NULL,NULL,'German Peraza Burgos','Karla Lizsette Quintero de Peraza'),(190,'José Arturo',1100106,'Gálvez','Angulo','-','j_galvezangulo@hotmail.com',19,'7.52',1,'Lago de Texcoco','3110-2B',41,1,'-',23,'1988-07-01','-','6671952725',1,1,1,0,1,NULL,NULL,NULL,NULL,'Jorge Alberto Galvez Cazarez','María Josefa Angulo Jacobo'),(191,'Jesús Eduardo',1100114,'Hernández','Félix','7278086','lizarraga_2@hotmail.com',70,'8.19',1,'Av. Miguel Hidalgo','P-44',7,1,'-',19,'1992-05-05','-','6672258235',1,1,1,0,1,NULL,NULL,NULL,NULL,'Lorenzo Hernandez Piña','Meregilda Félix de Hernandez'),(192,'Mario',1100122,'Esquer ','Samaniego','-','mario_esquers@hotmail.com',71,'8.60',1,'Mar de plata','2600-85',8,1,'80014',21,'1990-09-12','-','6672033785',1,1,1,0,1,NULL,NULL,NULL,NULL,'Mario Emilio Esquer Hinojosa','Manuela del Carmen Samaniego de Esquer'),(193,'Virginia',1100130,'Godinez','Camacho','7600326','vgc142@hotmail.com',1,'81.00',1,'Diego Jospe Abad','8594',9,1,'-',21,'1991-02-11','-','6671177015',1,2,1,0,1,NULL,NULL,NULL,NULL,'Everardo Godinez','Karina Yukiko Camacho de Godinez'),(194,'Eduardo',1100148,'Lizarraga','Félix','6727286167','lizarraga_2@hotmail.com',72,'7.00',1,'Ignacio Altamirano','405',10,2,'80379',20,'1991-10-13','-','6672721257',1,1,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(195,'Daniela',1100155,'Loaiza','Marquez','1780115','danniela.marquez@hotmail.com',47,'6.76',1,'Articulo 23','4939',11,1,'80184',20,'1991-07-21','-','6677747747',1,2,1,0,1,NULL,NULL,NULL,NULL,'Juan Carlos Loaiza Manjarrez','María del Belen Márquez Meza'),(196,'Marvi Yamidi',1100163,'Lindoro','Barraza','7612723','marviyamidi@hotmail.com',37,'8.40',1,'Palma Viajera','5200',12,1,'80029',29,'1982-05-12','-','-',1,2,1,0,1,NULL,NULL,NULL,NULL,'Vicente Lindoro Acosta','Margarita Barraza Tizoc'),(197,'Marieva',1100171,'Valdes','Salazar','7540611','maribebita_valdes@hotmail.com',73,'8.22',2,'Juno','3738',13,1,'-',19,'1992-10-17','-','6672280559',1,2,1,0,1,NULL,NULL,NULL,NULL,'Miguel Valdes Bermudez','Maria Eva Salazar López'),(198,'Estefania',1100189,'Medina','Melchor','7181358','fanii27@hotmail.com',43,'9.00',1,'Alcachofas','4031',139,1,'-',20,'1991-11-24','-','6672296774',1,2,1,0,1,NULL,NULL,NULL,NULL,'Julián Medina Lugo','Josefina Melchor'),(199,'Elizabeth',1100197,'Villareal','Lopez','7106600','elizabeth_em9z@hotmail.com',39,'7.91',1,'Rodolfo Fierro','4880',140,1,'80184',20,'1991-11-22','-','6672245421',1,2,1,0,1,NULL,NULL,NULL,NULL,'Francisco Villareal García','María Guadalupe López'),(200,'Indira Lorrelaine',1100205,'Sánchez','Martínez','7541297','indira_ilsm@hotmail.com',50,'8.00',1,'Presagio','3257',14,1,'80400',25,'1986-11-06','-','6672138450',1,2,1,0,1,NULL,NULL,NULL,NULL,'Jorge Armando Sánchez Ibarra','Gloria de Jesús Martínez Estrada'),(201,'María Elena',1100213,'Cárdenas','Serrano','7478615','-',85,'10.00',1,'Conocido','-',141,1,'-',19,'1992-08-18','-','6671364002',1,2,1,0,1,NULL,NULL,NULL,NULL,'Juan Cardenas Arechiga','Carmen Serrano Pérez'),(202,'Karla Pamela',1100221,'Erenas','Parra','7626342','pamela_parra_10@hotmail.com',42,'8.00',1,'Carlos L. Gracidas','1904',3,1,'-',21,'1990-10-19','-','6674734497',1,2,1,0,1,NULL,NULL,NULL,NULL,'Oscar Martin Erenas Villegas','María Rita Parra Pérez'),(203,'Lizeth Alejandra',1100239,'León','Higuera','-','-',74,'8.00',1,'Canal de Zeus','72',15,1,'-',19,'1992-04-24','-','6671005034',1,2,1,0,1,NULL,NULL,NULL,NULL,'Jesús Javier León Rubio','Ines Higuera Berrelleza'),(204,'Cecilia Guadalupe',1100247,'Gutierrez','Ríos','7609598','cezii_171106@hotmail.com',74,'9.00',1,'Luis Encinas','3135',2,1,'-',19,'1992-08-19','-','6672017703',1,2,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(205,'Karla Beatriz',1100254,'Beltrán','Valenzuela','-','karla_bv86@hotmail.com',51,'8.00',1,'Albiza','2738',142,1,'80058',25,'1986-11-01','-','6672033298',1,2,1,0,1,NULL,NULL,NULL,NULL,'Luis Antonio Beltrán Gómez','Veneranda Valenzuela Castro'),(206,'Rene Raul',1100262,'Beltrán','Salcedo','7137663','rene_beltrans@hotmail.com',42,'8.00',1,'Cuitlahuac','74 nte.',16,1,'-',20,'1991-07-05','-','-',1,1,1,0,1,NULL,NULL,NULL,NULL,'José Rene Beltrán Uriarte','Alma Rosa Salcedo Sánchez'),(207,'Miguel Angel',1100270,'Rendón','Chávez','-','mrendc@hotmail.com',75,'9.00',1,'Republica Nicaragua','2113',17,1,'-',24,'1987-10-26','-','6671694104',1,1,1,0,1,NULL,NULL,NULL,NULL,'Angel Rendón Meza','Nohemy Chavez Ruis'),(208,'María Alejandra',1100288,'Aguayo','Hernández','9603508','aleeah23@hotmail.com',76,'9.00',1,'Rosales','55',143,1,'-',22,'1990-03-13','-','6671999522',1,2,1,0,1,NULL,NULL,NULL,NULL,'Tomás Aguayo Acosta','Alejandra del Carmen Hernandez'),(209,'Jeanette',1100296,'Montoya','Zavala','7623205','jeanette_montoya@hotmail.com',1,'1.00',1,'José Ferrel','3192',144,1,'-',20,'1991-10-09','-','-',1,2,1,0,1,NULL,NULL,NULL,NULL,'J. Carmen Montoya García','Francisca Zavala Nuñez'),(210,'Barjouth',1100304,'Pérez','Gaxiola','7232196','barjouth_pg@hotmail.com',73,'9.00',2,'Hernán Cortez','1807',18,1,'-',19,'1992-06-01','-','6674744920',1,2,1,0,1,NULL,NULL,NULL,NULL,'Ruben Pérez Avilez','Blanca Margarita Gaiola Godoy'),(211,'Sofía',1100312,'Sánchez','Salcido','4566379','ran_mouri_1@hotmail.com',43,'7.00',1,'Angel Flores','490',19,1,'80000',20,'1991-08-06','-','-',1,2,1,0,1,NULL,NULL,NULL,NULL,'Pedro Sanchez Cruz','Sandra Salcido de Sanchez'),(212,'Jael Estefania',1100320,'Carrasco','Acosta','7493292','jael_31_5@hotmail.com',47,'8.00',1,'Angel Mártinez','2872',25,1,'80280',19,'1992-03-28','-','6671171004',1,2,1,0,1,NULL,NULL,NULL,NULL,'Rogelio Carrazco Izabal','Francisca Eugenia Acosta Armenta'),(213,'Laura Patricia',1100338,'Aispuro','Ponce','674864218','jesus_tamazula@yahoo.com.mx',77,'7.00',1,'Guadalupe Victoria','-',19,1,'84580',20,'1991-04-02','-','6672324945',1,2,1,0,1,NULL,NULL,NULL,NULL,'José Jesús Aispuro Aispuro','Norma Leticia Ponce Valenzuela'),(214,'Sergio Javier',1100346,'Huitron','Zazueta','2572012','sergio_mxco@hotmail.com',1,'1.00',1,'Doceava','140-B',19,1,'80430',20,'1992-03-05','-','6671880619',1,1,1,0,1,NULL,NULL,NULL,NULL,'Sergio Javier Huitrón Tapia','Yolanda Zazueta Vizcarra'),(215,'Jair Mawendar',1100353,'Angulo','López','9922578','yahir_lopez@live.com.mx',12,'8.00',1,'Andador Cerro Bola','994-1-302',27,1,'80179',21,'1990-08-05','-','-',1,1,1,0,1,NULL,NULL,NULL,NULL,'María Elena Angulo López',''),(216,'Martin Ernesto',1100361,'Cruz','Acosta','7442757','ernesto3101@hotmail.com',51,'9.00',1,'Palo Alto','3101',145,1,'80014',25,'1987-01-15','-','-',1,1,1,0,1,NULL,NULL,NULL,NULL,'Romulo Cruz Maya','Elsa Acosta López'),(217,'Marco Cesar',1100379,'Barraza','Vazquez','7507109','marckwarrioe@hotmail.com',52,'7.00',1,'Antartida','3286',20,1,'80028',24,'1988-01-16','-','6672064716',1,1,1,0,1,NULL,NULL,NULL,NULL,'Sergio Barraza Araux','María de Jesús Velazquez Romero'),(218,'Valeria',1100387,'Moreno','Leyva','7146735','yeya_ml@hotmail.com',44,'10.00',1,'A','302-2067',21,1,'80159',20,'1991-12-27','-','6671394865',1,2,1,0,1,NULL,NULL,NULL,NULL,'Oscar Ruben Moreno Ovalle','María Elena Leyva Favela'),(219,'Anabel Alejandra',1100395,'Uriarte','Ruiz','016688171','anabelitha@hotmail.com',1,'1.00',1,'Araucaria','1984',5,1,'81247',20,'1991-05-11','-','6684720303',1,2,1,0,1,NULL,NULL,NULL,NULL,'Victor Manuel Uriarte López','Anabel Ruiz de Uriarte'),(220,'Yaritza Yahaira',1100403,'Renteria','Flores','-','-',34,'9.00',1,'Francisco Javier Clavijero','-',42,1,'-',20,'1991-08-23','-','6673884792',1,2,1,0,1,NULL,NULL,NULL,NULL,'Ramiro Renteria Morquecho','Lucia Flores Otelo'),(221,'Nayely',1100411,'Higuera','Alapisco','7286963','nayeli_91@hotmail.com',72,'9.00',1,'Juan Carrasco','1616',146,1,'--',21,'1991-01-09','-','6671666368',1,1,1,0,1,NULL,NULL,NULL,NULL,'Meduardo Higuera','Rosario Alapisco de Higuera'),(222,'Georgina',1100429,'Cohen','Chaidez','7496428','geor_robert@hotmail.com',87,'7.00',1,'Mina de la Purisima','2020',147,1,'-',25,'1986-11-08','-','6671624580',1,2,1,0,1,NULL,NULL,NULL,NULL,'Oswaldo Cohen Ramírez','María Lourdes Chaidez Rodríguez'),(223,'José Roberto',1100437,'Pérez','Najera','7496428','jr_robert_gina@hotmail.com',88,'9.00',1,'Mar de Plata','2600-84',147,1,'-',22,'1989-11-11','-','6671565542',1,1,1,0,1,NULL,NULL,NULL,NULL,'Javier Pérez Cabanilla','Martha Beatriz Najera Montoya'),(224,'Jorge Enrique',1100445,'González','Ham','7183396','alkolik_21@hotmail.com',52,'8.00',1,'José María Yañez','3023',25,1,'80280',20,'1992-03-06','-','6677980976',1,1,1,0,1,NULL,NULL,NULL,NULL,'Claudio Cesar Gonzalez Salazar','Martina Idalia Ham Mendivil'),(225,'Sandra Ilse',1100452,'Márquez','Parra','7145779','sandra_imp@hotmail.com',37,'8.00',1,'Palma Plumosa','5208',23,1,'80159',20,'1991-12-23','-','6671520060',1,2,1,0,1,NULL,NULL,NULL,NULL,'Jospe Luis Márquez Osuna','Sandra Luz Parra Beltrán'),(226,'Abdi Jahaziel',1100460,'Guerrero','González','7142808','jhzl@hotmail.com',50,'9.00',1,'Rio del Carmen','1678',90,1,'80128',30,'1981-11-26','-','6671424926',1,1,1,0,1,NULL,NULL,NULL,NULL,'Sergio Enrique Guerrero','Rosa Adela Gonzalez'),(227,'María Alejandra',1100478,'Fu','Gallardo','4558880','ale92fu@hotmail.com',1,'8.00',1,'De la Virtud','3251',14,1,'-',19,'1992-09-27','-','6672664695',1,2,1,0,1,NULL,NULL,NULL,NULL,'Joel Alberto Fu Padilla','Norma Leticia Gallardo Aldana'),(228,'Analy',1100486,'Meza','Tostado','7506031','analy_gl2@hotmail.com',1,'8.00',1,'Mercurio','1874-C',24,1,'-',19,'1992-08-12','-','6671040415',1,2,1,0,1,NULL,NULL,NULL,NULL,'Miguel Angel Meza Leyva','Ana Lucia Tostado'),(229,'Juan Carlos',1100494,'Orozco','De Hoyos','667306787','jco35@hotmail.com',79,'8.00',1,'Ignacio Pesqueira','3243',25,1,'80280',26,'1986-01-22','-','6672077958',1,2,1,0,1,NULL,NULL,NULL,NULL,'Juan Manuel Orozco Angulano','María Elena De Hoyos Arreola'),(230,'Isaac Alejandro ',1100502,'Diaz','Sandoval','7128595','-',52,'7.00',1,'Gustavo Garmendia','1670',29,1,'-',20,'1991-07-08','-','6672533241',1,1,1,0,1,NULL,NULL,NULL,NULL,'Omar Eduardo Díaz Martínez','Claudia Teresa Sandoval Frias'),(231,'Christian Samuel',1100510,'Sanchez','Mejia','7538549','-',22,'7.00',1,'Paseo de Roma','7789-B',148,1,'-',22,'1989-12-05','-','6672632923',1,1,1,0,1,NULL,NULL,NULL,NULL,'Mercedes Sanchez Mejía',''),(232,'Francisco Javier',1100528,' Valenzuela','Soto','2588474','javi.el.wapo.@hotmail.com',78,'9.00',1,'8 y Jorge Romero','-',26,1,'80190',19,'1992-07-23','-','6672534765',1,1,1,0,1,NULL,NULL,NULL,NULL,'Jospe Francisco Valenzuela Capusegua','Martha Beatriz Soto Barraza'),(233,'Diana Veronica',1100528,'Castillo','Beltrán','7292419','dark_sarchiel_92@hotmail.com',91,'8.00',1,'Agustin Yañez','1803',29,1,'80090',20,'1992-02-22','-','6671277321',1,2,1,0,1,NULL,NULL,NULL,NULL,'Victor Castillo Morales','Dora María Beltrán Arredondo'),(234,'Missael',1100544,'Beltrán','Vázquez','-','missael_nba@hotmail.com',1,'8.00',1,'Andador Sierra Ficacho','999-402',130,1,'-',22,'1990-01-29','-','6672998391',1,2,1,0,1,NULL,NULL,NULL,NULL,'Leopoldo Beltrán Payan','María Rosa Vázquez Corrales'),(235,'Blanca Susana',1100551,'Madrid','Félix','7170720','susy_mf@hotmail.com',37,'9.00',1,'Ignacio Ramos Praslow','1805',28,1,'20180',21,'1991-02-09','-','-',1,2,1,0,1,NULL,NULL,NULL,NULL,'Ramón Madrid Ceballos','Francisca Félix García'),(236,'Emanuel Guadalupe',1100569,'Ruiz','León','7150487','era_black666@hotmail.com',42,'9.00',1,'Manuel Doblado','1628',29,1,'80090',19,'1992-08-18','-','6672358190',1,1,1,0,1,NULL,NULL,NULL,NULL,'Enrique Ruiz Alvarez','María del Rosario Luz León Soto'),(237,'José Jesús',1100577,'Hernández','Zazueta','4553613','jose_her92@hotmail.com',37,'9.00',1,'Cerro de las Cumbres','877',30,1,'80177',19,'1992-06-08','-','6672001487',1,1,1,0,1,NULL,NULL,NULL,NULL,'´Manuel Hernandez Sanz','Gloria Guadalupe Zazueta Russel'),(238,'Daniel Armando',1100585,'Ibarra','Moreno','7613431','danny_dri18@hotmail.com',37,'8.00',1,'Heriberto Jara','1525',28,1,'80180',19,'1992-09-23','-','6671898821',1,1,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(239,'Loreto',1100593,'Barrera','López','-','ashley-9-92@hotmail.com',32,'7.00',2,'Flor de Liz','6069',31,1,'-',20,'1992-02-09','-','6673884637',1,2,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(240,'Neiva Alejandrina',1100601,'Delgado','Meza','-','-',80,'8.00',1,'José Joaquín Herrera','1944',32,1,'-',21,'1990-12-31','-','6671517412',1,2,1,0,1,NULL,NULL,NULL,NULL,'Alejandrino Delgado Bodart','María Victoria Meza de Delgado'),(241,'Celina Berenice',1100619,'Santillan','Verdugo','-','celyna_gs_1414@hotmail.com',1,'9.00',1,'Cerro del Tepeyac','716-101',27,1,'-',21,'1990-09-03','-','6672229005',1,2,1,0,1,NULL,NULL,NULL,NULL,'Geronimo Santillan Rosales','María de los Angeles Verdugo Solis'),(242,'Diana Karina',1100627,'Cabanillas','González','2577747','roberta_cheer@hotmail.com',1,'8.00',1,'Sor Juana Ines de la Cruz','8557',33,1,'-',21,'1990-10-28','-','6671637779',1,2,1,0,1,NULL,NULL,NULL,NULL,'Enrique Cabanillas Camacho','Clarissa Gonzalez López'),(243,'Daniel',1100635,'Olivares','López','7601228','daniel_olivares_26@hotmail.com',89,'7.00',1,'Eleutropos','6019',31,1,'83140',21,'1990-05-04','-','6671776512',1,1,1,0,1,NULL,NULL,NULL,NULL,'Francisco Manuel Olivares Gómez Llanos','Santa Rita López Castro'),(244,'Francisco',1100643,'Olivares','López','7601228','franciizko.o@hotmail.com',1,'7.00',1,'Elutropos','6019',31,1,'83140',20,'1991-12-14','-','-',1,1,1,0,1,NULL,NULL,NULL,NULL,'Francisco Manuel Olivares Goméz Llanos','Santa Rita López Castro'),(245,'Anahi Alejandra',1100650,'Rivera','Mendoza','7176327','anahy_rivera02@hotmail.com',12,'8.00',1,'Juan de Dios Batiz','858-A',34,1,'80120',21,'1990-12-31','-','6672329189',1,2,1,0,1,NULL,NULL,NULL,NULL,'José Alejandro Rivera López','Elva Mendoza Carrillo'),(246,'Carla Marissa',1100668,'Estrada','Torres','7521739','carlitam09@hotmail.com',73,'8.00',2,'Ignacio Ramirez','27',35,1,'80200',20,'1991-11-01','-','6672552959',1,2,1,0,1,NULL,NULL,NULL,NULL,'Luis Alberto Estrada Alvarez','María Marcela Torres Lugo'),(247,'Ulises',1100676,'Loaiza','Tostado','7546507','uli_loaiza@live.com.mx',43,'7.00',1,'Atenea','3745',13,1,'-',21,'1990-12-04','-','6672216888',1,2,1,0,1,NULL,NULL,NULL,NULL,'Oscar Loaiza Osuna','Margarita Tostado Aguilar'),(248,'Darney Mariana',1100684,'Lopez','Valdez','7106302','tierra_darney@hotmail.com',39,'9.00',1,'Andador Mauricio Magdaleno','4448',11,1,'80190',21,'1990-09-06','-','6671596269',1,2,1,0,1,NULL,NULL,NULL,NULL,'Martín Enrique López Gonzalez','Mariana Valdez Urrea'),(249,'Ramón Alberto',1100692,'Zepeda','Rocha','2574443','-',34,'9.00',1,'Andres Magallon','3574',26,1,'-',20,'1991-10-03','-','-',1,2,1,0,1,NULL,NULL,NULL,NULL,'Ramón Zepeda','Irma Leticia Rocha García'),(250,'Mario',1100700,'García','Madrid','-','mariogarcia11@hotmail.com',52,'8.00',1,'Francisco Zarco','5',36,1,'-',21,'1990-10-15','-','6677579088',1,1,1,0,1,NULL,NULL,NULL,NULL,'Mario Garcia Sainz','Laura Elena Madrid Ceballos'),(251,'Carmen Vanessa',1100718,'Leyva','García','7281684','vyp_182@hotmail.com',70,'9.00',1,'Vicente Guerrero','92',7,1,'80450',19,'1992-08-08','-','6671778923',1,2,1,0,1,NULL,NULL,NULL,NULL,'Jesús Antonio Leyva Alvarado','Martha Alicia García de Leyva'),(252,'Yenitzabel',1100726,'Rivera','Quintero','-','yeni_itzabel@hotmail.com',13,'7.00',1,'Estero Tula','3331',129,1,'80058',21,'1990-11-13','-','6671362692',1,2,1,0,1,NULL,NULL,NULL,NULL,'Julio Antonio Rivera López','María Isabel Quintero Rivera'),(253,'Rafael',1100734,'Favela','García','7535118','rafazul_8@hotmail.com',52,'8.00',1,'Carmen Serdan','396',149,1,'80019',20,'1992-03-03','-','6672294406',1,1,1,0,1,NULL,NULL,NULL,NULL,'Rafael Favela Reatiga','Blanca Beatriz García Coronel'),(254,'José Alan',1100742,'Riestra','Teran','-','jart_loco_92@hotmail.com',86,'1.00',1,'Lucio Blanco','1782',42,1,'-',19,'1992-09-25','-','6672724966',1,1,1,0,1,NULL,NULL,NULL,NULL,'José Alberto Riestra Barraza','María Delia Teran López'),(255,'Benito',1100759,'Vidal','Morales','7155275','benny1986_6@hotmail.com',81,'8.00',1,'Dr. Romero','704',70,1,'-',25,'1986-05-21','-','8116704641',1,1,1,0,1,NULL,NULL,NULL,NULL,'Maximo Vidal Cruz','Teresa Morales Ramirez'),(256,'Gloria Emilia',1100767,'Castro','Sanchez','7466208','gloritacastro@hotmail.com',82,'7.00',1,'José Clemente Orozco','385',38,1,'80020',22,'1989-07-21','-','6672434490',1,2,1,0,1,NULL,NULL,NULL,NULL,'Jorge Arturo Castro Aldana','Gloria del Carmen Sanchez'),(257,'Estefania',1100775,'Castro','Sanchez','1466208','-',31,'7.00',2,'Jose Clemente Orozco','385',38,1,'80020',20,'1992-03-07','-','-',1,2,1,0,1,NULL,NULL,NULL,NULL,'Jorge Arturo Castro Aldana','Gloria del Carmen Sanchez'),(258,'Aaron Eduardo',1100783,'Díaz','Sandoval','7128595','-',5,'8.00',2,'Gustavo Garmendia','1670',29,1,'-',22,'1989-05-05','-','6672328742',1,1,1,0,1,NULL,NULL,NULL,NULL,'Omar Eduardo Díaz Martínez','Claudia Sandoval Frias'),(259,'Sarahi',1100791,'Zurita','Cervantes','7508432','-',1,'8.00',1,'Circulo de Sol','3293',20,1,'-',20,'1992-01-07','-','6677484261',1,2,1,0,1,NULL,NULL,NULL,NULL,'Ediberto Zurita López','Marisa Cervantes López'),(260,'Omar Olegario',1100809,'Pérez','Soto','7156197','omar_black7@hotmail.com',18,'8.00',2,'Escuadro 201','-',35,1,'80200',19,'1992-08-26','-','6671906142',1,1,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(261,'Mario',1100817,'Beltran','Misquez','-','mariomisquez@gmail.com',83,'8.00',1,'San Marcos','1375-B',39,1,'80430',25,'1986-04-30','-','6672240817',1,1,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(262,'Daniela',1100825,'Rodriguez','Lizarraga','2752280','danny_capray@hotmail.com',37,'9.00',1,'Manaslu','2517-B',40,1,'80430',21,'1991-01-16','-','6672659318',1,2,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(263,'Marco Antonio',1100833,'Gastelum','Ramirez','7893459','marco_gr@hotmail.com',42,'7.00',1,'Media Luna','2762',150,1,'80028',26,'1985-05-17','-','6677474277',1,1,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(264,'Alan Randolfo',1100841,'Macias','Camacho','7179949','arandolfo@hotmail.com',73,'8.00',2,'Lago Ontario','3150',41,1,'80110',20,'1991-12-25','-','6671033470',1,1,1,0,1,NULL,NULL,NULL,NULL,'Randolfo Macias Valenzuela','Eva Marbella Camacho Armenta'),(265,'Juan Carlos',1100858,'Nuñez','Smith','7280064','hip_hop_smith@hotmail.com',84,'9.00',1,'Sexta','16',19,3,'80430',23,'1988-05-06','-','6671888496',1,1,1,0,1,NULL,NULL,NULL,NULL,'Juan Carlos Nuñez Soto','Sonia Smith Ochoa'),(266,'Anibal José',1100866,'Espinoza','Lizarraga','7171242','anark_ia@hotmail.com',19,'7.00',2,'Bahia de Agiabampo','1540',58,1,'80190',22,'1989-04-05','-','6677557085',1,1,1,0,1,NULL,NULL,NULL,NULL,'Gilberto Espinoza','Hilde Eliza Lizarraga');
/*!40000 ALTER TABLE `Prospectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Servicios_Interes_Prospectos`
--

DROP TABLE IF EXISTS `Servicios_Interes_Prospectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Servicios_Interes_Prospectos` (
  `servicio_id` int(11) unsigned NOT NULL,
  `prospecto_id` int(11) unsigned NOT NULL,
  `prioridad` int(10) NOT NULL,
  `estatus_id` int(11) unsigned NOT NULL,
  `empresa_id` int(11) unsigned NOT NULL,
  `version` bigint(11) DEFAULT NULL,
  KEY `FK_ServiciosInteresProspectos_Prospectos` (`prospecto_id`),
  KEY `FK_ServiciosProspectos_Empresas` (`empresa_id`),
  CONSTRAINT `FK_ServiciosInteresProspectos_Prospectos` FOREIGN KEY (`prospecto_id`) REFERENCES `Prospectos` (`prospecto_id`),
  CONSTRAINT `FK_ServiciosProspectos_Empresas` FOREIGN KEY (`empresa_id`) REFERENCES `Empresas` (`empresa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Servicios_Interes_Prospectos`
--

LOCK TABLES `Servicios_Interes_Prospectos` WRITE;
/*!40000 ALTER TABLE `Servicios_Interes_Prospectos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Servicios_Interes_Prospectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Niveles_Academicos`
--

DROP TABLE IF EXISTS `Niveles_Academicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Niveles_Academicos` (
  `nivelAcademico_id` int(11) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `estatus_id` int(11) unsigned NOT NULL,
  `version` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`nivelAcademico_id`),
  UNIQUE KEY `unique_nivelesacademicos_nombre` (`nombre`),
  KEY `FK_NivelesAcademicos_Estatus` (`estatus_id`),
  CONSTRAINT `FK_NivelesAcademicos_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Niveles_Academicos`
--

LOCK TABLES `Niveles_Academicos` WRITE;
/*!40000 ALTER TABLE `Niveles_Academicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Niveles_Academicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tutores`
--

DROP TABLE IF EXISTS `Tutores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tutores` (
  `tutor_id` int(11) unsigned NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellidoPaterno` varchar(100) DEFAULT NULL,
  `apellidoMaterno` varchar(100) DEFAULT NULL,
  `edad` int(3) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `celular` varchar(30) DEFAULT '',
  `sexo_id` int(11) unsigned DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `estatus_id` int(11) unsigned DEFAULT NULL,
  `empresa_id` int(11) unsigned DEFAULT NULL,
  `version` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`tutor_id`),
  KEY `FK_Tutores_Estatus` (`estatus_id`),
  KEY `FK_Tutores_Sexos` (`sexo_id`),
  KEY `FK_Tutores_Empresas` (`empresa_id`),
  CONSTRAINT `FK_Tutores_Empresas` FOREIGN KEY (`empresa_id`) REFERENCES `Empresas` (`empresa_id`),
  CONSTRAINT `FK_Tutores_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`),
  CONSTRAINT `FK_Tutores_Sexos` FOREIGN KEY (`sexo_id`) REFERENCES `Sexos` (`sexo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tutores`
--

LOCK TABLES `Tutores` WRITE;
/*!40000 ALTER TABLE `Tutores` DISABLE KEYS */;
INSERT INTO `Tutores` VALUES (1,'José Jaime','Barraza','Rodríguez',0,'-','6671212827',1,'jbarraza@hotmail.com',1,1,0),(2,'Aurora','Vargas','Garay',0,'-','6671193192',2,'avargas@hotmail.com',1,1,0),(3,'Juan Salvador','Mora','Franco',0,'-','6671573023',1,'jmora@hotmail.com',1,1,0),(4,'Martha Elena','Santoscoy','Iribe',0,'-','6671565821',2,'msantoscoy@hotmail.com',1,1,0),(5,'Francisco','Godoy','Gaxiola',0,'-','6671770790',1,'fgodoy@hotmail.com',1,1,0),(6,'Blanca Aracely','López','López',0,'-','6671962632',2,'blopez@hotmail.com',1,1,0),(7,'Jose Gonzalo','Pérez','Castro',0,'-','6672111010',1,'jperez@hotmail.com',1,1,0),(8,'Alma Adelina','Espinoza','Alvarado',0,'-','6671270754',2,'aespinoza@hotmail.com',1,1,0),(9,'Celso','Parra','-',0,'-','-',1,'cparra@hotmail.com',1,1,0),(10,'Maria','García','Soto',0,'-','6671481285',2,'mgarcia@hotmail.com',1,1,0),(11,'María Elena','Castañeda','Nevarez',0,'-','6672539433',2,'mcastañeda@hotmail.com',1,1,0),(12,'Hector ','Reyes','López',0,'-','6672090834',1,'hreyes@hotmail.com',1,1,0),(13,'Maria del Carmen','Obeso','De Reyes',0,'-','-',2,'mobeso@hotmail.com',1,1,0),(14,'Ricardo','Cruz','Hernandez',0,'-','6672117524',1,'rcruz@hotmail.com',1,1,0),(15,'Agustina','Cebreros','Baez',0,'-','6671638083',2,'acebreros@hotmail.com',1,1,0),(16,'Juan','Quintero','Zazueta',0,'-','6672640856',1,'jquintero@hotmail.com',1,1,0),(17,'Patricia Guadalupe','Zazueta','Vizar',0,'-','6671437949',2,'pzazueta@hotmail.com',1,1,0),(18,'Joaquin Norberto','Cabada','Moreno',0,'-','6671440118',1,'jcabada@hotmail.com',1,1,0),(19,'Virginia Veronica','Medina','-',0,'-','6671916907',2,'vmedina@hotmail.com',1,1,0),(20,'Aristeo','Serrano','Muro',0,'-','-',1,'aserrano@hotmail.com',1,1,0),(21,'María Calletana','Pérez','Pulido',0,'-','6672658082',2,'mperez@hotmail.com',1,1,0),(22,'Gregorio','Bojorquez','Estrada',0,'-','6671755656',1,'gbojorquez@hotmail.com',1,1,0),(23,'María Cristina','Vega','Soto',0,'-','-',2,'mvega@hotmail.com',1,1,0),(24,'Jesús Armando','Guerra','Mendivil',0,'-','6671024625',1,'jguerra@hotmail.com',1,1,0),(25,'Eluid','García','Coronel',0,'-','6671056680',2,'egarcia@hotmail.com',1,1,0),(26,'Juan Diego','Plata','Amarillas',0,'-','6728547030',1,'jplata@hotmail.com',1,1,0),(27,'Nereida','León','Ontiveros',0,'-','6721134292',2,'nleon@hotmail.com',1,1,0),(28,'Jesús Raul','Aispuro','Campos',0,'-','6672960491',1,'jaispuro@hotmail.com',1,1,0),(29,'Yolanda','García','Urquidez',0,'-','-',2,'ygarcia@hotmail.com',1,1,0),(30,'Juan ','Magaña','Castro',0,'-','6671426705',1,'jmagaña@hotmail.com',1,1,0),(31,'Guadalupe','Pérez','Morales',0,'-','-',2,'gperez@hotmail.com',1,1,0),(32,'Jorge Moises','Figueroa','Favela',0,'-','6677550805',1,'jfigueroa@hotmail.com',1,1,0),(33,'Adriana Francisca','Rangel','Aguirre',0,'-','-',2,'arangel@hotmail.com',1,1,0),(34,'Jorge Luis','Padilla','López',0,'-','6673055681',1,'jpadilla@hotmail.com',1,1,0),(35,'Ramona Alicia','Monge','-',0,'-','6674772897',2,'rmonge@hotmail.com',1,1,0),(36,'Carlos Enrique','Cardoza','Acosta',0,'-','6672434111',1,'ccardoza@hotmail.com',1,1,0),(37,'Nancy Karina','Rios','Arechiga',0,'-','6671888033',2,'nrios@hotmail.com',1,1,0),(38,'Francisco','Gonzales','Nuñez',0,'-','6671249141',1,'fgonzales@hotmail.com',1,1,0),(39,'Rosario','Hernandez','Gomez',0,'-','-',2,'rhernandez@hotmail.com',1,1,0),(40,'Nicasio Adalberto','Cuevas','Leyva',0,'-','6671010364',1,'ncuevas@hotmail.com',1,1,0),(41,'Aida Aracely','Félix','Valles',0,'-','6671310397',2,'afelix@hotmail.com',1,1,0),(42,'Ines Alberto','Rivas','Barraza',0,'-','6671740672',1,'irivas@hotmail.com',1,1,0),(43,'Maria Concepción','Sauceda','Pérez',0,'-','6671386996',2,'msauceda@hotmail.com',1,1,0),(44,'José Luis','Dominguez','Pérez',0,'-','-',1,'jdominguez@hotmail.com',1,1,0),(45,'Patricia','Mena','Ahumada',0,'-','6671634167',2,'pmena@hotmail.com',1,1,0),(46,'Francisco Salvador','Romero','Chavira',0,'-','6671072292',1,'fromero@hotmail.com',1,1,0),(47,'Delia Patricia','Rubio','Castro',0,'-','6671055650',2,'drubio@hotmail.com',1,1,0),(48,'Benito','Gutierrez','Barrón',0,'-','6677675404',1,'bgutierrez@hotmail.com',1,1,0),(49,'Luis Alberto','Gonzalez','Alvarado',0,'-','6671420510',1,'lgonzalez@hotmail.com',1,1,0),(50,'Elsa Guadalupe','Osuna','Medina',0,'-','6677720369',2,'eosuna@hotmail.com',1,1,0),(51,'José Arnoldo','Ibarra','Yañez',0,'-','6671530700',1,'jibarra@hotmail.com',1,1,0),(52,'Doreida','Elizalde','Monzon',0,'-','-',2,'delizalde@hotmail.com',1,1,0),(53,'Luis Guillermo','Medina','Plata',0,'-','6677481971',1,'lmedina@hotmail.com',1,1,0),(54,'Soledad','Gomez','Romero',0,'-','-',2,'sgomez@hotmail.com',1,1,0),(55,'Mario','Cuevas','Leyva',0,'-','6731305054',1,'mcuevas@hotmail.com',1,1,0),(56,'Leticia','Soledad','Sosa',0,'-','6731305768',2,'lsoledad@hotmail.com',1,1,0),(57,'Rene','Castro','López',0,'-','6441562886',1,'rcastro@hotmail.com',1,1,0),(58,'Briseida','Soledad','Sosa',0,'-','6731009926',2,'bsoledad@hotmail.com',1,1,0),(59,'Arnoldo','Higuera','Rocha',0,'-','-',1,'ahiguera@hotmail.com',1,1,0),(60,'Ana Cecilia','Sajaropulos','Coronal',0,'-','-',2,'asajaropulos@hotmail.com',1,1,0),(61,'Ricardo','Quintero','Batiz',0,'-','6671301635',1,'rquintero@hotmail.com',1,1,0),(62,'Amada Guadalupe','Cota','Armendariz',0,'-','6671660436',2,'acota@hotmail.com',1,1,0),(63,'Alfonso','Pérez','González',0,'-','-',1,'aperez@hotmail.com',1,1,0),(64,'Elma Cristina','Camacho','Pérez',0,'-','-',2,'ecamacho@hotmail.com',1,1,0),(65,'Fernando','Gutierrez','Ortega',0,'-','-',2,'fgutierrez@hotmail.com',1,1,0),(66,'Jesus Marlen','Angulo','Rodriguez',0,'-','6971093303',2,'jangulo@hotmail.com',1,1,0),(67,'Jesús Abel','Camacho','Angulo',0,'-','-',1,'jcamacho@hotmail.com',1,1,0),(68,'Teresa de Jesús','Reyes','Uriarte',0,'-','6671020274',2,'treyes@hotmail.com',1,1,0),(69,'Hector Manuel','Gamez','Castro',0,'-','6677769165',1,'hgamez@hotmail.com',1,1,0),(70,'Hector Manuel','Gamez','Castro',0,'-','6677769165',1,'hgamez@hotmail.com',1,1,0),(71,'Luz María','Castro','López',0,'-','6672498347',2,'lcastro@hotmail.com',1,1,0),(72,'José Israel','Sepulveda','Féliz',0,'-','6672073394',1,'jsepulveda@hotmail.com',1,1,0),(73,'Martha Julieta','Bustamante','Tapia',0,'-','6671613160',2,'mbustamante@hotmail.com',1,1,0),(74,'Ricardo','Barrón','Beltrán',0,'-','6679967173',1,'rbarron@hotmail.com',1,1,0),(75,'María Antonieta','Quevedo','Gómez',0,'-','6671010241',2,'mquevedo@hotmail.com',1,1,0),(76,'Roberto','Monarrez','Meraz',0,'7146597','-',1,'rmonarrez@hotmail.com',1,1,0),(77,'María Guadalupe','Zamora','Padilla',0,'-','-',2,'mzamora@hotmail.com',1,1,0),(78,'Leticia Eugenia','Villalobos','Revello',0,'-','6671634565',2,'lvillalobos@hotmail.com',1,1,0),(79,'Oscar de Jesús','Ocegueda','Mendoza',0,'-','72248327',1,'oocegueda@hotmail.com',1,1,0),(80,'Nancy Veronica','Escobedo','Orona',0,'-','6671541733',2,'nescobedo@hotmail.com',1,1,0),(81,'Felizardo','Urias','Burgos',0,'-','6672248186',1,'furias@hotmail.com',1,1,0),(82,'Silvia Lorena','Toral','Osuna',0,'-','6672280021',2,'storal@hotmail.com',1,1,0),(83,'Cecilio','Beltrán','Caro',0,'-','6241690907',1,'cbeltran@hotmail.com',1,1,0),(84,'Solangel','Villanueva','Baba',0,'-','6241694559',2,'svillanueva@hotmail.com',1,1,0),(85,'Jesús Ramón','Sainz','Padilla',0,'-','6671519478',1,'jsainz@hotmail.com',1,1,0),(86,'Jesús Ramón','Sainz','Padilla',0,'-','6671519478',1,'jsainz@hotmail.com',1,1,0),(87,'Martha Alicia','Moreno','Ponce',0,'-','-',2,'mmoreno@hotmail.com',1,1,0),(88,'Guadalupe','Vargas','Lugo',0,'-','0019287850187',1,'gvargas@hotmail.com',1,1,0),(89,'Francisca','Sepulveda','Garcia',0,'-','6871002459',2,'fsepulveda@hotmail.com',1,1,0),(90,'Teodoro Angel Miguel','Dehesa','Y Perez Reguera',0,'-','6671288389',1,'tdehesa@hotmail.com',1,1,0),(91,'Elva Emilia','Mitre','García',0,'-','6671288389',2,'emitre@hotmail.com',1,1,0),(92,'Flavio','Mejía','Alarcon',0,'-','6683960422',1,'fmejia@hotmail.com',1,1,0),(93,'Berenice','Alarcón','Lozano',0,'-','6681189900',2,'balarcon@hotmail.com',1,1,0),(94,'Janiel','López','Mendivil',0,'-','6672154745',2,'jlopez@hotmail.com',1,1,0),(95,'José Noe','Bojorquez','Camacho',0,'-','6671791080',1,'jbojorquez@hotmail.com',1,1,0),(96,'Adelaida','Rivera','Niebla',0,'-','-',2,'arivera@hotmail.com',1,1,0),(97,'Martin','Meza','Ortiz',0,'-','6679969975',1,'mmeza@hotmail.com',1,1,0),(98,'Karina Edith','López','Aldana',0,'-','6671540066',2,'klopez@hotmail.com',1,1,0),(99,'Marcelino','Vargas ','De la Peña',0,'-','6671792369',1,'mvargas@hotmail.com',1,1,0),(100,'Rosalina','Nuñez','Tolosa',0,'-','6672525179',2,'rnuñez@hotmail.com',1,1,0),(101,'Juan Manuel','Moreno','Padilla',0,'-','6677511999',1,'jmoreno@hotmail.com',1,1,0),(102,'Paola','Herrera','Gonzalez',0,'-','6677517917',2,'pherrera@hotmail.com',1,1,0),(103,'José Guadalupe','Mendoza','Macias',0,'-','6679967949',1,'jmendoza@hotmail.com',1,1,0),(104,'Alicia Esperanza','Urdiales','Pérez',0,'-','6671420663',2,'aurdiales@hotmail.com',1,1,0),(105,'José Jaime','Niebla','Serrano',0,'-','6671603716',1,'jniebla@hotmail.com',1,1,0),(106,'Martha Olivia','Leyva','Rochin',0,'-','-',2,'mleyva@hotmail.com',1,1,0),(107,'José Humberto','Tamez','Arellano',0,'-','6671885451',1,'jtamez@hotmail.com',1,1,0),(108,'María Socorro','Leyva','Vega',0,'-','6671534083',2,'mleyva@hotmail.com',1,1,0),(109,'Fortunato','Valdez','Galaviz',0,'-','6671620492',1,'fvaldez@hotmail.com',1,1,0),(110,'Laura Irene','Salcido','Hernandez',0,'-','6672657109',2,'lsalcido@hotmail.com',1,1,0),(111,'Mario Ruben','Cristerna','Izabal',0,'-','6671001011',1,'mcristerna@hotmail.com',1,1,0),(112,'María Angelica','Diaz','Bodart',0,'-','-',2,'mdiaz@hotmail.com',1,1,0),(113,'Fernando','Mejía','Castro',0,'-','6671610202',1,'fmejia@hotmail.com',1,1,0),(114,'Ana María','Traslaviña','Cortes',0,'-','6671029931',2,'atraslaviña@hotmail.com',1,1,0),(115,'José Salvador','Cárdenas','León',0,'-','-',1,'jcardenas@hotmail.com',1,1,0),(116,'Guadalupe Mariela','Mokay','Buelna',0,'-','6672150033',2,'gmokay@hotmail.com',1,1,0),(117,'Alma Felicitas','Pérez','Morales',0,'-','6677677392',2,'aperez@hotmail.com',1,1,0),(118,'José Cristobal','Osuna','Valdez',0,'-','6738524280',1,'josuna@hotmail.com',1,1,0),(119,'Lucia Guadalupe','Olmeda','Cuarte',0,'-','6738522983',2,'lolmeda@hotmail.com',1,1,0),(120,'Francisco Samuel','Peña','Martínez',0,'-','6691634658',1,'fpeña@hotmail.com',1,1,0),(121,'Lourdes Beatriz','Patrón','Rodriguez',0,'-','6671636468',2,'lpatron@hotmail.com',1,1,0),(122,'Rodolfo','López','Pérez',0,'-','6672337763',1,'rlopez@hotmail.com',1,1,0),(123,'Sandra Luz','Olivas','Muñoz',0,'-','6671049724',2,'solivas@hotmail.com',1,1,0),(124,'Luis Roberto','Beltrán','Hernandez',0,'2122885','-',1,'lbeltran@hotmail.com',1,1,0),(125,'Maria Magdalena','Ojeda','De Beltran',0,'-','6672244726',2,'mojeda@hotmail.com',1,1,0),(126,'Julian David','Díaz','Cruz',0,'-','6671170466',1,'jdiaz@hotmail.com',1,1,0),(127,'Rosa María','Chavez','Acosta',0,'-','-',2,'rchavez@hotmail.com',1,1,0),(128,'Aldo Ricardo','Zamudio','Ornelas',0,'-','6671270217',1,'azamudio@hotmail.com',1,1,0),(129,'María Emma','Bustamante','Cruz',0,'-','6672241310',2,'mbustamante@hotmail.com',1,1,0),(130,'Victor Manuel','Mora','Ochoa',0,'-','6672209707',1,'vmora@hotmail.com',1,1,0),(131,'Guadalupe','Ibarra','Armenta',0,'-','-',2,'gibarra@hotmail.com',1,1,0),(132,'Abelardo','Martínez','Fierro',0,'-','6671984396',1,'amartinez@hotmail.com',1,1,0),(133,'Adela','Sanchez','Aguirre',0,'-','6671028512',2,'adanchez@hotmail.com',1,1,0),(134,'Fernando','Medina','Ramirez',0,'-','6671984396',1,'fmedina@hotmail.com',1,1,0),(135,'María Migdalia','Torres','Quiroz',0,'1701105','-',2,'mtorres@hotmail.com',1,1,0),(136,'Jesús Guadalupe','Guerrero','Padilla',0,'-','6672640292',1,'jguerrero@hotmail.com',1,1,0),(137,'Maria de Jesus','Espinoza','Velazquez',0,'-','-',2,'mespinoza@hotmail.com',1,1,0),(138,'José Reyes','Ramos','Ramos',0,'-','-',1,'jramos@hotmail.com',1,1,0),(139,'Silvia Belinda','Solano','Suarez',0,'-','-',2,'ssolano@hotmail.com',1,1,0),(140,'Porfirio','Palma','Vera',0,'-','7221029189',1,'ppalma@hotmail.com',1,1,0),(141,'Maria de la Luz','Cortez','Arias',0,'-','7223571983',2,'mcortez@hotmail.com',1,1,0),(142,'Inocencio','Gonzalez','Andrade',0,'-','-',1,'igonzalez@hotmail.com',1,1,0),(143,'Leticia Guadalupe','Silvestry','Uribe',0,'-','18005614142',2,'lsilvestry@hotmail.com',1,1,0),(144,'Teodosio','Covarrubias','Valencia',0,'-','6671619769',1,'tcovarrubias@hotmail.com',1,1,0),(145,'María','Labra','Olivas',0,'-','6672469027',2,'mlabra@hotmail.com',1,1,0),(146,'José Alfredo','Madrigal','Reyes',0,'-','6672476973',1,'jmadrigal@hotmail.com',1,1,0),(147,'Consuelo','Salazar','Rodriguez',0,'-','6671339249',2,'csalazar@hotmail.com',1,1,0),(148,'Eusebio','Velazquez','Uriostegui',0,'-','6672476973',1,'evelazquez@hotmail.com',1,1,0),(149,'María Magdalena','Ramirez','Barajas',0,'-','6673081817',2,'mramirez@hotmail.com',1,1,0),(150,'Eladio','Beltran','Felix',0,'-','-',1,'ebletran@hotmail.com',1,1,0),(151,'Maricela','Rios','Soto',0,'-','6671509499',2,'mrios@hotmail.com',1,1,0),(152,'Jaime','Garcia','Monterrubio',0,'-','3314581469',1,'jgarcia@hotmail.com',1,1,0),(153,'María Jaqueline','Padilla','Molina',0,'-','6672781612',2,'mpadilla@hotmail.com',1,1,0),(154,'Jesús Oscar','Uraga','Cardenas',0,'-','6671326685',1,'juraga@hotmail.com',1,1,0),(155,'María de la Luz','Espinoza','-',0,'-','6672078429',2,'mespinoza@hotmail.com',1,1,0),(156,'Manuel','Chatfield','Gastelum',0,'-','6674761253',1,'mchatfield@hotmail.com',1,1,0),(157,'Alma','Cebrero','Moreno',0,'-','6671447696',2,'acebrero@hotmail.com',1,1,0),(158,'Luis Enrique','Verdugo','Solis',0,'-','6671361796',1,'lverdugo@hotmail.com',1,1,0),(159,'Beatriz Amalia','Lopez','Jacobo',0,'-','6679968344',2,'blopez@hotmail.com',1,1,0),(160,'José Francisco','Beltran','-',0,'-','-',1,'jbeltran@hotmail.com',1,1,0),(161,'María Magdalena','Manjarrez','López',0,'-','6671612144',2,'mmanjarrez@hotmail.com',1,1,0),(162,'Manuel de Jesús','García','Sánchez',0,'-','-',1,'mgarcia@hotmail.com',1,1,0),(163,'Eva Angelina','Calderon','Ojeda',0,'-','6672883290',2,'ecalderon@hotmail.com',1,1,0),(164,'Sergio','Hernandez','Peraza',0,'-','6671775069',1,'shernandez@hotmail.com',1,1,0),(165,'María de los Angeles','Molina','Valencia',0,'-','6672257726',2,'mmolina@hotmail.com',1,1,0),(166,'Ramón','León','Gamez',0,'-','-',1,'rleon@hotmail.com',1,1,0),(167,'Yadira','Velez','Cervantes',0,'-','6672226909',2,'yvelez@hotmail.com',1,1,0),(168,'Rosendo','Vazquez','Corrales',0,'-','6677809944',1,'rvazquez@hotmail.com',1,1,0),(169,'María Josefina','Félix','Aispuro',0,'-','-',2,'mfelix@hotmail.com',1,1,0),(170,'Juan Carlos','Aguilar','Heredia',0,'-','6737395371',1,'jaguilar@hotmail.com',1,1,0),(171,'Laura Elena','Pineda','Lopez',0,'-','6731073612',2,'lpineda@hotmail.com',1,1,0),(172,'Cruz Francisco','García','Rivera',0,'-','-',1,'cgarcia@hotmail.com',1,1,0),(173,'Carmen María','Ojeda','Zamora',0,'-','6671288587',2,'cojeda@hotmail.com',1,1,0),(174,'Julio Cesar','Castillo','Amezcua',0,'-','-',1,'jcastillo@hotmail.com',1,1,0),(175,'José Manuel','Amarillas','Gastelum',0,'-','6672375534',1,'jamarillas@hotmail.com',1,1,0),(176,'Susana','Romero','Gastelum',0,'-','6672252043',2,'sromero@hotmail.com',1,1,0),(177,'Heriberto','Pérez','Soto',0,'-','-',1,'hperez@hotmail.com',1,1,0),(178,'Silvana','Lugo','Sanchez',0,'-','6731041348',2,'slugo@hotmail.com',1,1,0),(179,'Rigoberto','Gutierrez','Ramos',0,'7124077','-',1,'rgutierrez@hotmail.com',1,1,0),(180,'Angelica','Castro','Rodriguez',0,'2589882','-',2,'acastro@hotmail.com',1,1,0),(181,'Antonio Enrique','Osuna','Bonilla',0,'-','-',1,'aosuna@hotmail.com',1,1,0),(182,'Julia','Acosta','Luque',0,'-','6671327964',2,'jacosta@hotmail.com',1,1,0),(183,'Ismael','Moreno','García',0,'-','6671802473',1,'imoreno@hotmail.com',1,1,0),(184,'Aurora','Carrillo','Landell',0,'-','72*2382*1',2,'acarrillo@hotmail.com',1,1,0),(185,'Jesús','Padilla','García',0,'-','-',1,'jpadilla@hotmail.com',1,1,0),(186,'Yolanda Alicia','Aceviz','Lara',0,'-','-',2,'yaceviz@hotmail.com',1,1,0),(187,'Saul','Rojo','Andablo',0,'-','-',1,'srojo@hotmail.com',1,1,0),(188,'Matilde','Castro','Cruz',0,'-','6671057341',2,'mcastro@hotmail.com',1,1,0),(189,'Jesús Octavio','Acevez','Nuñez',0,'-','6674744001',1,'jacevez@hotmail.com',1,1,0),(190,'Ana María','Favela','Ahumada',0,'-','6671026950',2,'afavela@hotmail.com',1,1,0),(191,'Mario Humberto','Valenzuela','-',0,'-','6441187388',2,'mvalenzuela@hotmail.com',1,1,0),(192,'María Delia','Cardenas','-',0,'-','6441406701',2,'mcardenas@hotmail.com',1,1,0),(193,'José Marcial','Félix','Ochoa',0,'-','6671650510',1,'jfelix@hotmail.com',1,1,0),(194,'Fructoso','Moreno','Velarde',0,'-','-',1,'fmoreno@hotmail.com',1,1,0),(195,'Jorge Adrian','Sepulveda','Vidales',0,'-','6142472143',1,'jsepulveda@hotmail.com',1,1,0),(196,'José Romulo','Rico ','Villareal',0,'-','6687696341',1,'jrico@hotmail.com',1,1,0),(197,'Ignacio','Avendaño','Camacho',0,'-','6674771986',1,'iavendaño@hotmail.com',1,1,0),(198,'Elias Tadeo','Delgado','Moreno',0,'-','6672010112',1,'edelgado@hotmail.com',1,1,0),(199,'Alberto','Contreras','Bueno',0,'-','6671528377',1,'acontreras@hotmail.com',1,1,0),(200,'Rene','Escobar','Juan',0,'-','-',1,'rescobar@hotmail.com',1,1,0),(201,'Daniel Humberto','Calderon','Garibaldi',0,'-','6721141223',1,'dcalderon@hotmail.com',1,1,0),(202,'José Transito','Hernandez','Ochoa',0,'-','6677471512',1,'jhernandez@hotmail.com',1,1,0),(203,'Victor Manuel','Espinoza','Cueva',0,'-','-',1,'vespinoza@hotmail.com',1,1,0),(204,'Guadalupe','Almodovar','Rivera',0,'-','-',1,'galmodovar@hotmail.com',1,1,0),(205,'Francisco Ramón','Medina','Barraza',0,'-','6671329302',1,'fmedina@hotmail.com',1,1,0),(206,'Maximiliano','Carrasco','Padilla',0,'-','-',1,'mcarrasco@hotmail.com',1,1,0),(207,'Carlos Humberto','Soto','Salgado',0,'-','6728543276',1,'csoto@hotmail.com',1,1,0),(208,'Federico','Tolentino','Rodriguez',0,'-','6671326615',1,'ftolentino@hotmail.com',1,1,0),(209,'Jorge','Martinez','Chaco',0,'-','6671368113',1,'jmartinez@hotmail.com',1,1,0),(210,'Francisco Humberto','Lopez','Montolla',0,'-','6671748080',1,'flopez@hotmail.com',1,1,0),(211,'Hector','Angulo','Lafarga',0,'-','6721142378',1,'hangulo@hotmail.com',1,1,0),(212,'Abraham','Sanchez','Oyervidez',0,'-','6671768526',1,'asanchez@hotmail.com',1,1,0),(213,'Javier','Rodriguez','Gonzalez',0,'-','6677513880',1,'jrodriguez@hotmail.com',1,1,0),(214,'Sara','García','Zepeda',0,'-','-',2,'sgarcia@hotmail.com',1,1,0),(215,'Victor','Medina','Olivas',0,'-','-',1,'vmedina@hotmail.com',1,1,0),(216,'Luis Gabriel','Tavares','Alonso',0,'-','6672000325',1,'ltavares@hotmail.com',1,1,0),(217,'Refugio','Gonzalez','Campos',0,'-','-',1,'rgonzalez@hotmail.com',1,1,0),(218,'Efren','Romero','Hernandez',0,'-','6727514471',1,'eromero@hotmail.com',1,1,0),(219,'Jesús','Zambada','García',0,'-','-',1,'jzambada@hotmail.com',1,1,0),(220,'Rene Octavio','Sanchez','Montoya',0,'-','6677780460',1,'rsanchez@hotmail.com',1,1,0),(221,'Humberto','Medrano','Beltrán',0,'-','667565437',1,'hmedrano@hotmail.com',1,1,0),(222,'Edgar Arturo','López','Niebla',0,'-','6671994976',1,'elopez@hotmail.com',1,1,0),(223,'Sergio','Herrera','Félix',0,'-','6671380646',1,'sherrera@hotmail.com',1,1,0),(224,'Cipriano','Gonzales','Orduño',0,'-','-',1,'cgonzales@hotmail.com',1,1,0),(225,'Norma','Diarte','Ruiz',0,'-','6671821303',2,'ndiarte@hotmail.com',1,1,0),(226,'Diana del Carmen','Alfaro','Lora',0,'-','6672650564',2,'dalfaro@hotmail.com',1,1,0),(227,'Adriana','Lopez','Zavala',0,'-','6671888465',2,'alopez@hotmail.com',1,1,0),(228,'María del Carmen','Lara','Zavala',0,'-','6671200426',2,'mlara@hotmail.com',1,1,0),(229,'Nora Leticia','Piña','Carrillo',0,'-','6672080975',2,'npiña@hotmail.com',1,1,0),(230,'Guadalupe del Carmen','Toscano','-',0,'-','6672762756',2,'gtoscano@hotmail.com',1,1,0),(231,'Laura María','Toriz','Millan',0,'-','6681067233',2,'ltoriz@hotmail.com',1,1,0),(232,'Rosa María','Acosta','Ramirez',0,'-','6671611724',2,'racosta@hotmail.com',1,1,0),(233,'Flor Marisela','López','Cabanillas',0,'-','6672279236',2,'flopez@hotmail.com',1,1,0),(234,'Cruz Guadalupe','Pérez','Gamez',0,'-','-',2,'cperez@hotmail.com',1,1,0),(235,'María Guadalupe','Sanchez','Najar',0,'-','-',2,'msanchez@hotmail.com',1,1,0),(236,'Laura Elena','Rivas','Iturrios',0,'-','6721200748',2,'lrivas@hotmail.com',1,1,0),(237,'Rosalia','Cervantes','Lugo',0,'-','6672005390',2,'rcervantes@hotmail.com',1,1,0),(238,'Fidelia','Chaparro','Fuentes',0,'-','6971118460',2,'fchaparro@hotmail.com',1,1,0),(239,'Lucila','Pulido','Escarcega',0,'-','6671745554',2,'lpulido@hotmail.com',1,1,0),(240,'Maricela','Torres','Noriega',0,'-','6671394113',2,'mtorres@hotmail.com',1,1,0),(241,'Blanca Rosa','Valdez','Madrid',0,'-','6677673483',2,'bvaldez@hotmail.com',1,1,0),(242,'Diana Lilia','Berrelleza','Malacon',0,'-','6728547348',2,'dberrelleza@hotmail.com',1,1,0),(243,'María de los Angeles','Escarrega','-',0,'-','6677754116',2,'mescarrega@hotmail.com',1,1,0),(244,'María','Zavala','Lara',0,'-','6671501932',2,'mzavala@hotmail.com',1,1,0),(245,'Luz del Carmen','Corrales','Mancillas',0,'-','6672340237',2,'lcorrales@hotmail.com',1,1,0),(246,'Rosa Elia','Espinoza','Bojorquez',0,'-','6672702268',2,'respinoza@hotmail.com',1,1,0),(247,'Silvia','Sillas','Aguilar',0,'-','6671960996',2,'ssillas@hotmail.com',1,1,0),(248,'Lidia','Bernal','Agruirre',0,'-','6671616012',2,'lbernal@hotmail.com',1,1,0),(249,'Maria de los Angeles','Castro','Medina',0,'-','6671968009',2,'mcastro@hotmail.com',1,1,0),(250,'Rosa Orquidea','Meza','Sanchez',0,'-','6671529078',2,'rmeza@hotmail.com',1,1,0),(251,'María del Rosario','Rivera','Cardenas',0,'-','6671177591',2,'mrivera@hotmail.com',1,1,0),(252,'Norma','Ceballos','Padilla',0,'-','16688123442',2,'nceballos@hotmail.com',1,1,0),(253,'María del Carmen','Ceniceros','Quiñonez',0,'-','6721095616',2,'mceniceros@hotmail.com',1,1,0),(254,'Ancelma  Josefina','Hernandez','-',0,'-','6671876659',2,'ahernandez@hotmail.com',1,1,0),(255,'Flor','Orozco','Aguilar',0,'-','6671824431',2,'forozco@hotmail.com',1,1,0),(256,'Victoria Hermila','Reyes','Moreno',0,'-','6671020634',2,'vreyes@hotmail.com',1,1,0),(257,'María del Rosario','Mendoza','Sanchez',0,'-','-',2,'mmendoza@hotmail.com',1,1,0),(258,'Mirna','Medrana','Diaz',0,'-','6672347782',2,'mmedrana@hotmail.com',1,1,0),(259,'Maria Zayda','Acosta','Villa',0,'-','6672105554',2,'macosta@hotmail.com',1,1,0),(260,'Elizabeth Carlota','Rosas','López Portillo',0,'-','-',2,'erosas@hotmail.com',1,1,0),(261,'María Cruz','Avilez','López',0,'-','-',2,'mavilez@hotmail.com',1,1,0),(262,'Juan Manuel','Covantes','Rodriguez',0,'4557415','-',2,'jcovantes@hotmail.com',1,1,0),(263,'Refugio de la Luz','Chaidez','-',0,'4557415','-',2,'rchaidez@hotmail.com',1,1,0),(264,'José Gabriel','Casillas','Soto',0,'7608217','-',1,'jcasillas@hotmail.com',1,1,0),(265,'Sandra Luz','Cardenas','Valdez',0,'7608217','-',2,'scardenas@hotmail.com',1,1,0),(266,'Jesus Alfonso','Meza','Bermudez',0,'4550759','-',1,'jmeza@hotmail.com',1,1,0),(267,'Ana María','Castro','Cervantes',0,'4550759','-',2,'acastro@hotmail.com',1,1,0),(268,'Victor Manuel','Valdez','Bermudez',0,'7539730','-',1,'vvaldez@hotmail.com',1,1,0),(269,'Carmen Piedad','Bello','Lopez',0,'7539730','-',2,'cbello@hotmail.com',1,1,0),(270,'Alejandro','Quintero','Leuffer',0,'-','-',1,'aquintero@hotmail.com',1,1,0),(271,'Lorena','Gomez','-',0,'-','-',2,'lgomez@hotmail.com',1,1,0),(272,'Carlos','Rivera','Calderon',0,'7184544','-',1,'crivera@hotmail.com',1,1,0),(273,'Marcelina','Martinez','Martinez',0,'7184544','-',2,'mmartinez@hotmail.com',1,1,0),(274,'Carlos Alberto','Anaya','Lizarraga',0,'7169439','-',1,'canaya@hotmail.com',1,1,0),(275,'Silvia Teresita','Delgado','Trejo',0,'7169439','-',2,'sdelgado@hotmail.com',1,1,0),(276,'German','Peraza','Burgos',0,'4551087','-',1,'gperaza@hotmail.com',1,1,0),(277,'Karla Lizsette','Quintero','-',0,'4551087','-',2,'kquintero@hotmail.com',1,1,0),(278,'José Jaime','Barraza','Rodriguez',0,'7171546','-',1,'jbarraza@hotmail.com',1,1,0),(279,'Aurora','Vargas','Garay',0,'7171546','-',2,'avargas@hotmail.com',1,1,0),(280,'Jorge Alberto','Galvez','Cazarez',0,'-','-',1,'jgalvez@hotmail.com',1,1,0),(281,'María Josefa','Angulo','Jacobo',0,'-','-',2,'mangulo@hotmail.com',1,1,0),(282,'Lorenzo','Hernandez','Piña',0,'7278086','-',1,'lhernandez@hotmail.com',1,1,0),(283,'Meregilda','Felix','-',0,'7278086','-',2,'mfelix@hotmail.com',1,1,0),(284,'Mario Emilio','Esquer','Hinojosa',0,'-','-',1,'mesquer@hotmail.com',1,1,0),(285,'Manuela del Carmen','Samaniego','-',0,'-','-',2,'msamaniego@hotmail.com',1,1,0),(286,'Everardo','Godinez','-',0,'7600326','-',1,'egodinez@hotmail.com',1,1,0),(287,'Karina Yuriko','Camacho','-',0,'7600326','-',2,'kcamacho@hotmail.com',1,1,0),(288,'Esiquio','Lizarraga','Cruz',0,'6727286167','-',1,'elizarraga@hotmail.com',1,1,0),(289,'Silvia','Felix','Corrales',0,'6727286167','-',2,'sfelix@hotmail.com',1,1,0),(290,'Maria del Belen','Marquez','Meza',0,'1780115','-',2,'mmarquez@hotmail.com',1,1,0),(291,'Juan Carlos','Loaiza','Manjarrez',0,'1780115','-',1,'jloaiza@hotmail.com',1,1,0),(292,'Vicente','Lindoro','Acosta',0,'1612723','-',1,'vlindoro@hotmail.com',1,1,0),(293,'Margarita','Barraza','Tizoc',0,'7612723','-',2,'mbarraza@hotmail.com',1,1,0),(294,'Miguel','Valdez','Bermudez',0,'7540611','-',1,'mvaldez@hotmail.com',1,1,0),(295,'Marieva','Salazar','Lopez',0,'7540611','-',2,'msalazar@hotmail.com',1,1,0),(296,'Julian','Medina','Lugo',0,'7181358','-',1,'jmedina@hotmail.com',1,1,0),(297,'Josefina','Melchor','-',0,'7181358','-',2,'jmelchor@hotmail.com',1,1,0),(298,'Francisco','Villareal','Garcia',0,'7106600','-',1,'fvillareal@hotmail.com',1,1,0),(299,'Maria Guadalupe','López','-',0,'7106600','-',2,'mlopez@hotmail.com',1,1,0),(300,'Jorge Armando','Sanchez','Ibarra',0,'7541297','-',1,'jsanchez@hotmail.com',1,1,0),(301,'Gloria de Jesus','Martinez','Estrada',0,'7541297','-',2,'gmartinez@hotmail.com',1,1,0),(302,'Juan','Cardenas','Arechiga',0,'-','-',1,'jcardenas@hotmail.com',1,1,0),(303,'Carmen','Serrano','Pérez',0,'-','-',2,'cserrano@hotmail.com',1,1,0),(304,'Oscar Martin','Erenas','Villegas',0,'7626342','-',1,'oerenas@hotmail.com',1,1,0),(305,'Maria Rita','Parra','Pérez',0,'7626342','-',2,'mparra@hotmail.com',1,1,0),(306,'Jesús Javier','León','Rubio',0,'-','-',1,'jleon@hotmail.com',1,1,0),(307,'Ines','Higuera','Berrelleza',0,'-','-',2,'ihiguera@hotmail.com',1,1,0),(308,'José Gilberto','Gutierrez','Medrano',0,'7609598','-',1,'jgutierrez@hotmail.com',1,1,0),(309,'Antonia','Rios','Vega',0,'7609598','-',2,'arios@hotmail.com',1,1,0),(310,'Luis Antonio','Beltrán','Gómez',0,'-','-',1,'lbeltran@hotmail.com',1,1,0),(311,'Venerada','Valenzuela','Castro',0,'-','-',2,'vvalenzuela@hotmail.com',1,1,0),(312,'José Rene','Beltrán','Uriarte',0,'7137663','-',1,'jbeltran@hotmail.com',1,1,0),(313,'Alma Rosa','Salcedo','Sanchez',0,'7137663','-',2,'asalcedo@hotmail.com',1,1,0),(314,'Angel','Rendón','Meza',0,'-','-',1,'arendon@hotmail.com',1,1,0),(315,'Nohemy','Chavez','Ruiz',0,'-','-',2,'nchavez@hotmail.com',1,1,0),(316,'Tomas','Aguayo','Acosta',0,'9603508','-',1,'taguayo@hotmail.com',1,1,0),(317,'Alejandra del Carmen','Hernandez','-',0,'9603508','-',2,'ahernandez@hotmail.com',1,1,0),(318,'J. Carmen','Montoya','Garcia',0,'7623205','-',1,'jmontoya@hotmail.com',1,1,0),(319,'Francisca','Zavala','Nuñez',0,'7623205','-',2,'fzavala@hotmail.com',1,1,0),(320,'Ruben','Pérez','Avilez',0,'7232196','-',1,'rperez@hotmail.com',1,1,0),(321,'Blanca Margarita','Gaxiola','Godoy',0,'7232196','-',2,'bgaxiola@hotmail.com',1,1,0),(322,'Pedro','Cruz','Sanchez',0,'4566379','-',1,'pcruz@hotmail.com',1,1,0),(323,'Sandra','Salcido','-',0,'4566379','-',2,'ssalcido@hotmail.com',1,1,0),(324,'Rogelio','Carrasco','Izabal',0,'7493292','-',1,'rcarrasco@hotmail.com',1,1,0),(325,'Francisca Eugenia','Acosta','Armenta',0,'7493292','-',2,'facosta@hotmail.com',1,1,0),(326,'José Jesús','Aispuro','Aispuro',0,'674864218','-',1,'jaispuro@hotmail.com',1,1,0),(327,'Norma Leticia','Ponce','Valenzuela',0,'674864218','-',2,'nponce@hotmail.com',1,1,0),(328,'Sergio Javier','Huitrón','Tapia',0,'2572012','-',1,'shuitron@hotmail.com',1,1,0),(329,'Yolanda','Zazueta','Vizcarra',0,'2572012','-',2,'yzazueta@hotmail.com',1,1,0),(330,'María Elena','Angulo','López',0,'9922578','-',1,'mangulo@hotmail.com',1,1,0),(331,'Romulo','Cruz','Maya',0,'7442767','-',1,'rcruz@hotmail.com',1,1,0),(332,'Elsa','Acosta','López',0,'7442757','-',2,'eacosta@hotmail.com',1,1,0),(333,'Sergio','Barraza','Araux',0,'7507109','-',1,'sbarraza@hotmail.com',1,1,0),(334,'Maria de Jesús','Velazquez','Romero',0,'7507109','-',2,'mvelazquez@hotmail.com',1,1,0),(335,'Oscar Ruben','Moreno','Ovalle',0,'7146735','-',1,'omoreno@hotmail.com',1,1,0),(336,'Maria Elena','Leyva','Favela',0,'7146735','-',2,'mleyva@hotmail.com',1,1,0),(337,'Victor Manuel','Uriarte','Lopez',0,'016688171','-',1,'vuriarte@hotmail.com',1,1,0),(338,'Anabel','Ruiz','-',0,'016688171','-',2,'aruiz@hotmail.com',1,1,0),(339,'Ramiro','Renteria','Morquecho',0,'-','-',1,'rrenteria@hotmail.com',1,1,0),(340,'Lucia','Flores','Otelo',0,'-','-',2,'lflores@hotmail.com',1,1,0),(341,'Meduardo','Higuera','-',0,'7286963','-',1,'mhiguera@hotmail.com',1,1,0),(342,'Rosario','Alapisco','-',0,'7286963','-',2,'ralapisco@hotmail.com',1,1,0),(343,'Oswaldo','Cohen','Ramirez',0,'7496428','-',1,'ocohen@hotmail.com',1,1,0),(344,'Maria Lourdes','Chaidez','Rodriguez',0,'7496428','-',2,'mchaidez@hotmail.com',1,1,0),(345,'Javier','Pérez','Cabanilla',0,'7496428','-',1,'jperez@hotmail.com',1,1,0),(346,'Martha Beatriz','Najera','Montoya',0,'7496428','-',2,'mnajera@hotmail.com',1,1,0),(347,'Claudio Cesar','Gonzalez','Salazar',0,'7183396','-',1,'cgonzalez@hotmail.com',1,1,0),(348,'Martina Idali','Ham','Mendivil',0,'7183396','-',2,'mham@hotmail.com',1,1,0),(349,'José Luis','Marquez','Osuna',0,'7145779','-',1,'jmarquez@hotmail.com',1,1,0),(350,'Sandra Luz','Parra','Beltrán',0,'7145779','-',2,'sparra@hotmail.com',1,1,0),(351,'Sergio Enrique','Guerrero','-',0,'7142808','-',1,'sguerrero@hotmail.com',1,1,0),(352,'Rosa Adela','Gonzalez','-',0,'7142808','-',2,'rgonzalez@hotmail.com',1,1,0),(353,'Joel Alberto','Fu','Pailla',0,'4558880','-',1,'jfu@hotmail.com',1,1,0),(354,'Norma Leticia','Gallardo','Aldana',0,'4558880','-',2,'ngallardo@hotmail.com',1,1,0),(355,'Miguel Angel','Meza','Leyva',0,'7506031','-',1,'mmeza@hotmail.com',1,1,0),(356,'Ana Luisa','Tostado','-',0,'7506031','-',2,'atostado@hotmail.com',1,1,0),(357,'Juan Manuel','Orozco','Angulano',0,'667306787','-',1,'jorozco@hotmail.com',1,1,0),(358,'Maria Elena','De Hoyos','Arreola',0,'667306787','-',2,'mdehoyos@hotmail.com',1,1,0),(359,'Omar Eduardo','Díaz','Martinez',0,'7128595','-',1,'odiaz@hotmail.com',1,1,0),(360,'Claudia Teresa','Sandoval','Frias',0,'7128595','-',2,'csandoval@hotmail.com',1,1,0),(361,'Mercedes','Sanchez','Mejía',0,'7598549','-',2,'msanchez@hotmail.com',1,1,0),(362,'José Francisco','Valenzuela','Capasegua',0,'2588474','-',1,'jvalenzuela@hotmail.com',1,1,0),(363,'Martha Beatriz','Soto','Barraza',0,'2588474','-',2,'msoto@hotmail.com',1,1,0),(364,'Victor','Castillo','Morales',0,'7292419','-',1,'vcastillo@hotmail.com',1,1,0),(365,'Dora María','Beltrán','Arredondo',0,'7292419','-',2,'dbeltran@hotmail.com',1,1,0),(366,'Leopoldo','Beltrán','Payan',0,'-','-',1,'lbeltran@hotmail.com',1,1,0),(367,'María Rosa','Vazquez','Corrales',0,'-','-',2,'mvazquez@hotmail.com',1,1,0),(368,'Ramón','Madrid','Ceballos',0,'7170720','-',1,'rmadrid@hotmail.com',1,1,0),(369,'Francisca','Félix','García',0,'7170720','-',2,'ffelix@hotmail.com',1,1,0),(370,'Enrique','Ruiz','Alvarez',0,'7150487','-',1,'eruiz@hotmail.com',1,1,0),(371,'María del Rosario lUZ','León','Soto',0,'7150487','-',2,'mleon@hotmail.com',1,1,0),(372,'Manuel','Hernandez','Sanz',0,'4553613','-',1,'mhernandez@hotmail.com',1,1,0),(373,'Gloria Guadalupe','Zazueta','Russel',0,'4553613','-',2,'gzazueta@hotmail.com',1,1,0),(374,'Alejandrino','Delgado','Bodart',0,'-','-',1,'adelgado@hotmail.com',1,1,0),(375,'Maria Victoria','Meza','-',0,'-','-',2,'mmeza@hotmail.com',1,1,0),(376,'Geronimo','Santillan','Rosales',0,'-','-',1,'gsantillan@hotmail.com',1,1,0),(377,'Maria de los Angeles','Verdugo','Solis',0,'-','-',2,'mverdugo@hotmail.com',1,1,0),(378,'Enrique','Cabanillas','Camacho',0,'2577747','-',1,'ecabanillas@hotmail.com',1,1,0),(379,'Clarissa','Gonzalez','López',0,'2577747','-',2,'cgonzalez@hotmail.com',1,1,0),(380,'Francisco Manuel','Olivares','Gómez',0,'7601228','-',1,'folivares@hotmail.com',1,1,0),(381,'Santa Rita','López','Corrales',0,'7601228','-',2,'slopez@hotmail.com',1,1,0),(382,'José Alejandro','Rivera','López',0,'7176927','-',1,'jrivera@hotmail.com',1,1,0),(383,'Elva','Mendoza','Carrillo',0,'7176927','-',2,'emendoza@hotmail.com',1,1,0),(384,'Luis Alberto','Estrada','Alvarez',0,'7521739','-',1,'lestrada@hotmail.com',1,1,0),(385,'María Marcela','Torres','Lugo',0,'7521739','-',2,'mtorres@hotmail.com',1,1,0),(386,'Oscar','Loaiza','Osuna',0,'7546507','-',1,'oloaiza@hotmail.com',1,1,0),(387,'Margarita','Tostado','Aguilar',0,'7546507','-',2,'mtostado@hotmail.com',1,1,0),(388,'Martin Enrique','López','Gonzalez',0,'7106302','-',1,'mlopez@hotmail.com',1,1,0),(389,'Mariana','Valdez','Urrea',0,'7106302','-',2,'mvaldez@hotmail.com',1,1,0),(390,'Ramón','Zepeda','-',0,'2574443','-',1,'rzepeda@hotmail.com',1,1,0),(391,'Irma Leticia','Rocha','García',0,'2574443','-',2,'irocha@hotmail.com',1,1,0),(392,'Mario','Garcia','Sainz',0,'-','-',1,'mgarcia@hotmail.com',1,1,0),(393,'Laura Elena','Madrid','Ceballos',0,'-','-',2,'lmadrid@hotmail.com',1,1,0),(394,'Jesús Antonio','Leyva','Alvarado',0,'7281684','-',1,'jleyva@hotmail.com',1,1,0),(395,'Martha Alicia','García','-',0,'7281684','-',2,'mgarcia@hotmail.com',1,1,0),(396,'Julio Antonio','Rivera','Lopez',0,'-','-',1,'jrivera@hotmail.com',1,1,0),(397,'Maria Isabel','Quintero','Rivera',0,'-','-',2,'mquintero@hotmail.com',1,1,0),(398,'Rafael','Favela','Reatiga',0,'7535118','-',1,'rfavela@hotmail.com',1,1,0),(399,'Blanca Beatriz','García','Coronel',0,'7595118','-',2,'bgarcia@hotmail.com',1,1,0),(400,'José Alberto','Riestra','Barraza',0,'-','-',1,'jriestra@hotmail.com',1,1,0),(401,'Maria Delia','Teran','Lopez',0,'-','-',2,'mteran@hotmail.com',1,1,0),(402,'Maximo','Vidal','Cruz',0,'7155275','-',1,'mvidal@hotmail.com',1,1,0),(403,'Teresa','Morales','Ramirez',0,'7155275','-',2,'tmorales@hotmail.com',1,1,0),(404,'Jorge Arturo','Castro','Aldana',0,'1466208','-',1,'jcastro@hotmail.com',1,1,0),(405,'Gloria del Carmen','Sanchez','-',0,'1466208','-',2,'gsanchez@hotmail.com',1,1,0),(406,'Adalberto','Zurita','Lopez',0,'7508432','-',1,'azurita@hotmail.com',1,1,0),(407,'Marisa','Cervantes','Lopez',0,'7508432','-',2,'mcervantes@hotmail.com',1,1,0),(408,'Randolfo','Macias','Valenzuela',0,'7179949','-',1,'rmacias@hotmail.com',1,1,0),(409,'Eva Marbella','Camacho','Armenta',0,'7179949','-',2,'ecamacho@hotmail.com',1,1,0),(410,'Juan Carlos','Nuñez','Soto',0,'7280064','-',1,'jnuñez@hotmail.com',1,1,0),(411,'Sonia ','Smith','Ochoa',0,'7280064','-',2,'ssmith@hotmail.com',1,1,0),(412,'Gilberto','Espinoza','-',0,'7171242','-',1,'gespinoza@hotmail.com',1,1,0),(413,'Hilde Elisa','Lizarraga','-',0,'7171242','-',2,'hlizarraga@hotmail.com',1,1,0);
/*!40000 ALTER TABLE `Tutores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Aulas`
--

DROP TABLE IF EXISTS `Aulas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Aulas` (
  `aula_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `estatus_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`aula_id`),
  UNIQUE KEY `unique_aulas_nombre` (`nombre`),
  KEY `FK_Aulas_Estatus` (`estatus_id`),
  CONSTRAINT `FK_Aulas_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Aulas`
--

LOCK TABLES `Aulas` WRITE;
/*!40000 ALTER TABLE `Aulas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Aulas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Paises`
--

DROP TABLE IF EXISTS `Paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Paises` (
  `pais_id` int(11) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `estatus_id` int(11) unsigned NOT NULL,
  `version` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`pais_id`),
  UNIQUE KEY `unique_paises_nombre` (`nombre`),
  KEY `FK_Paises_Estatus` (`estatus_id`),
  CONSTRAINT `FK_Paises_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Paises`
--

LOCK TABLES `Paises` WRITE;
/*!40000 ALTER TABLE `Paises` DISABLE KEYS */;
INSERT INTO `Paises` VALUES (1,'MÉXICO',1,0);
/*!40000 ALTER TABLE `Paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tipos_Becas`
--

DROP TABLE IF EXISTS `Tipos_Becas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tipos_Becas` (
  `tipoBeca_id` int(11) unsigned NOT NULL,
  `nombre` varchar(50) NOT NULL DEFAULT '',
  `estatus_id` int(11) unsigned NOT NULL,
  `empresa_id` int(11) unsigned DEFAULT NULL,
  `version` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`tipoBeca_id`),
  UNIQUE KEY `uniqu_tiposbecas_nombre` (`nombre`),
  KEY `FK_TiposBecas_Estatus` (`estatus_id`),
  KEY `FK_TiposBecas_Empresas` (`empresa_id`),
  CONSTRAINT `FK_TiposBecas_Empresas` FOREIGN KEY (`empresa_id`) REFERENCES `Empresas` (`empresa_id`),
  CONSTRAINT `FK_TiposBecas_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tipos_Becas`
--

LOCK TABLES `Tipos_Becas` WRITE;
/*!40000 ALTER TABLE `Tipos_Becas` DISABLE KEYS */;
INSERT INTO `Tipos_Becas` VALUES (1,'ACADÉMICA',1,1,0),(2,'BAJOS RECURSOS',1,1,0),(3,'ARTISTICA',1,1,0),(4,'DEPORTIVA',1,1,0),(5,'CRÉDITO',1,1,0);
/*!40000 ALTER TABLE `Tipos_Becas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Preparatorias`
--

DROP TABLE IF EXISTS `Preparatorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Preparatorias` (
  `preparatoria_id` int(11) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `estatus_id` int(11) unsigned NOT NULL,
  `version` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`preparatoria_id`),
  UNIQUE KEY `unique_preparatorias_nombre` (`nombre`),
  KEY `FK_Preparatorias_Estatus` (`estatus_id`),
  CONSTRAINT `FK_Preparatorias_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Preparatorias`
--

LOCK TABLES `Preparatorias` WRITE;
/*!40000 ALTER TABLE `Preparatorias` DISABLE KEYS */;
INSERT INTO `Preparatorias` VALUES (1,'Cetis 107',1,0),(2,'Liceo Colhuacan',1,0),(3,'Colegio del Valle',1,0),(4,'Instituto Noray',1,0),(5,'Colegio Culiacan',1,0),(6,'Instituto de Estudios Superiores Vizcaya Pacifico',1,0),(7,'Universidad Católica',1,0),(8,'Instituto México',1,0),(9,'Rafael Ramírez',1,0),(10,'Colegio Aztlán',1,0),(11,'Centro de Capacitación Empresaarial',1,0),(12,'Escuela Preparatoria Cervantes',1,0),(13,'Instituto Windsor',1,0),(14,'Instituto Darwin de Educación Activa',1,0),(15,'Bachillerato Tres Rios',1,0),(16,'Centro de Estudios Superiores México Americano',1,0),(17,'Censtro de Estudios Universitarios Superiores',1,0),(18,'Instituto Siglo XXI',1,0),(19,'Colegio Renovación',1,0),(20,'Colegio Esperanza de Culiacán',1,0),(21,'ITESM',1,0),(22,'STASE',1,0),(23,'Instituto Antonio Rosales',1,0),(24,'Escuela de Entrenadores Tigre Negro',1,0),(25,'Instituto Bilingüe Jean Piajet',1,0),(26,'Instituto Humaya',1,0),(27,'Sistema Educativo Bilingüe Estefania Castañeda',1,0),(28,'Instituto Comercial Nueva Galicia',1,0),(29,'Instituto Cultural Galeno',1,0),(30,'Instituto Chapultepec',1,0),(31,'Colegio Chapultepec',1,0),(32,'COBAC',1,0),(33,'Universidad Tec Milenio',1,0),(34,'Conalep 1',1,0),(35,'Conalep 2',1,0),(36,'Conalep 3',1,0),(37,'CBTIS 224',1,0),(38,'Cobaes 22',1,0),(39,'Cobaes 23',1,0),(41,'Cobaes 24',1,0),(42,'Cobaes 25',1,0),(43,'Cobaes 26',1,0),(44,'Cobaes 27',1,0),(45,'Cobaes 28',1,0),(46,'U de O',1,0),(47,'Salvador Allende',1,0),(48,'Central Dierna',1,0),(49,'Hnos. Flores Magón',1,0),(50,'Central Nocturna',1,0),(51,'Semiescolarizada',1,0),(52,'Emiliano Zapata',1,0),(53,'Aguaruto',1,0),(54,'Sandino',1,0),(55,'Rafael Buelna',1,0),(56,'8 de Julio',1,0),(57,'Gabino Barreda',1,0),(58,'Genaro Vazquez',1,0),(59,'Culiacancito',1,0),(60,'Navolato',1,0),(61,'Sataya',1,0),(62,'El Dorado',1,0),(63,'Portaceli',1,0),(64,'El Atoron',1,0),(65,'Costa Rica',1,0),(66,'Conalep Navolato',1,0),(67,'Cobaes 29',1,0),(68,'Colegio Sor Juana Ines de la Cruz',1,0),(69,'UNITESIN',1,0),(70,'Vladimir I. Lenin',1,0),(71,'Instituto de Matemáticas y Humanidades del Bajio',1,0),(72,'CBTA 261',1,0),(73,'Colegio Sinaloa',1,0),(74,'COBAES 46',1,0),(75,'COBAES 18',1,0),(76,'COBAES 61',1,0),(77,'COBAED Tamazula',1,0),(78,'Augusto Cesar Sandino',1,0),(79,'COBACH',1,0),(80,'COBAES 60',1,0),(81,'CBTIS 74',1,0),(82,'Preparatoria Abierta',1,0),(83,'Carlos Marx',1,0),(84,'COBAES 30',1,0),(85,'COBAES 98',1,0),(86,'CEB',1,0),(87,'Salvador Alvarado',1,0),(88,'Santa Ana High School',1,0),(89,'Colegio Imperio',1,0),(90,'Imperio',1,0),(91,'CEBAEM',1,0),(92,'COBAES 55',1,0),(93,'Instituto Cultural Colhuacan',1,0),(94,'UNIVER',1,0),(95,'CBTIS 43',1,0),(96,'CEUS',1,0),(97,'Cobaes 20',1,0),(98,'Preparatoria Internacional',1,0),(99,'COBAES 16',1,0),(100,'CBTIS 45',1,0),(101,'CBTIS 158',1,0),(102,'Conalep Mocorito',1,0),(103,'Sunnyside',1,0),(104,'CBTA 116',1,0),(105,'Lázaro Cárdenas',1,0),(106,'-',1,0),(107,'Colegio Panamericano',1,0),(108,'Centro Escolar Benemerito de las Americas',1,0),(109,'Emerson High School',1,0),(111,'Cobaes 14',1,0),(112,'COBAES 02',1,0),(113,'Hermanos Flores Magon',1,0),(114,'Colegio Guamuchil',1,0),(115,'COBAES 21',1,0),(116,'Colegio Enrique Arreguin',1,0),(117,'COBAES 15',1,0),(118,'CBTA 38',1,0);
/*!40000 ALTER TABLE `Preparatorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_tareas`
--

DROP TABLE IF EXISTS `menu_tareas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_tareas` (
  `id_tarea` int(11) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `estatus_id` int(11) unsigned NOT NULL,
  `id_proceso` int(11) unsigned NOT NULL,
  `idioma_id` int(11) unsigned NOT NULL,
  `orden` int(11) NOT NULL,
  PRIMARY KEY (`id_tarea`),
  KEY `FK_menutareas_Estatus` (`estatus_id`),
  KEY `FK_menutareas_menuprocesos` (`id_proceso`),
  KEY `FK_menutareas_Idiomas` (`idioma_id`),
  CONSTRAINT `FK_menutareas_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`),
  CONSTRAINT `FK_menutareas_Idiomas` FOREIGN KEY (`idioma_id`) REFERENCES `Idiomas` (`idioma_id`),
  CONSTRAINT `FK_menutareas_menuprocesos` FOREIGN KEY (`id_proceso`) REFERENCES `menu_procesos` (`id_proceso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_tareas`
--

LOCK TABLES `menu_tareas` WRITE;
/*!40000 ALTER TABLE `menu_tareas` DISABLE KEYS */;
INSERT INTO `menu_tareas` VALUES (1,'OPCIONES ADMON. ESCOLAR',1,1,1,1),(2,'OPCIONES ADMON. ACADEMICA',1,2,1,1),(3,'OPCIONES VENTAS',1,3,1,1);
/*!40000 ALTER TABLE `menu_tareas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Alergias`
--

DROP TABLE IF EXISTS `Alergias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Alergias` (
  `alergia_id` int(11) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `estatus_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`alergia_id`),
  UNIQUE KEY `unique_alergias_nombre` (`nombre`),
  KEY `FK_Alergias_Estatus` (`estatus_id`),
  CONSTRAINT `FK_Alergias_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alergias`
--

LOCK TABLES `Alergias` WRITE;
/*!40000 ALTER TABLE `Alergias` DISABLE KEYS */;
INSERT INTO `Alergias` VALUES (1,'Alergia',1);
/*!40000 ALTER TABLE `Alergias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DatosFiscales`
--

DROP TABLE IF EXISTS `DatosFiscales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DatosFiscales` (
  `datoFiscalId` int(11) NOT NULL,
  `RFC` varchar(50) NOT NULL DEFAULT '',
  `prospecto_id` int(11) unsigned NOT NULL,
  `calle` varchar(50) NOT NULL DEFAULT '',
  `numero` int(10) NOT NULL,
  `codigoPostal` varchar(20) NOT NULL DEFAULT '',
  `colonia_id` int(11) unsigned NOT NULL,
  `razonSocial` varchar(30) NOT NULL DEFAULT '',
  `poblacion_id` int(11) unsigned NOT NULL,
  `estatus_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`datoFiscalId`),
  KEY `FK_DatosFiscales_Prospectos` (`prospecto_id`),
  KEY `FK_DatosFiscales_Colonias` (`colonia_id`),
  KEY `FK_DatosFiscales_Poblaciones` (`poblacion_id`),
  KEY `FK_DatosFiscales_Estatus` (`estatus_id`),
  CONSTRAINT `FK_DatosFiscales_Colonias` FOREIGN KEY (`colonia_id`) REFERENCES `Colonias` (`colonia_id`),
  CONSTRAINT `FK_DatosFiscales_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`),
  CONSTRAINT `FK_DatosFiscales_Poblaciones` FOREIGN KEY (`poblacion_id`) REFERENCES `Poblaciones` (`poblacion_id`),
  CONSTRAINT `FK_DatosFiscales_Prospectos` FOREIGN KEY (`prospecto_id`) REFERENCES `Prospectos` (`prospecto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DatosFiscales`
--

LOCK TABLES `DatosFiscales` WRITE;
/*!40000 ALTER TABLE `DatosFiscales` DISABLE KEYS */;
/*!40000 ALTER TABLE `DatosFiscales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Anticipos`
--

DROP TABLE IF EXISTS `Anticipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Anticipos` (
  `anticipo_id` int(11) unsigned NOT NULL,
  `prospecto_id` int(11) unsigned NOT NULL,
  `estatus_id` int(11) unsigned NOT NULL,
  `empresa_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`anticipo_id`),
  KEY `FK_Anticipos_Estatus` (`estatus_id`),
  KEY `FK_Anticipos_Prospectos` (`prospecto_id`),
  KEY `FK_Anticipos_Empresas` (`empresa_id`),
  CONSTRAINT `FK_Anticipos_Empresas` FOREIGN KEY (`empresa_id`) REFERENCES `Empresas` (`empresa_id`),
  CONSTRAINT `FK_Anticipos_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`),
  CONSTRAINT `FK_Anticipos_Prospectos` FOREIGN KEY (`prospecto_id`) REFERENCES `Prospectos` (`prospecto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Anticipos`
--

LOCK TABLES `Anticipos` WRITE;
/*!40000 ALTER TABLE `Anticipos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Anticipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Estados`
--

DROP TABLE IF EXISTS `Estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Estados` (
  `estado_id` int(11) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `pais_id` int(11) unsigned NOT NULL,
  `estatus_id` int(11) unsigned NOT NULL,
  `version` bigint(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`estado_id`),
  UNIQUE KEY `unique_estados_nombre` (`nombre`),
  KEY `FK_Estatos_Paises` (`pais_id`),
  KEY `FK_Estados_Estatus` (`estatus_id`),
  CONSTRAINT `FK_Estados_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`),
  CONSTRAINT `FK_Estatos_Paises` FOREIGN KEY (`pais_id`) REFERENCES `Paises` (`pais_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Estados`
--

LOCK TABLES `Estados` WRITE;
/*!40000 ALTER TABLE `Estados` DISABLE KEYS */;
INSERT INTO `Estados` VALUES (1,'SINALOA',1,1,0),(2,'SONORA',1,1,0),(3,'AGUASCALIENTES',1,1,0),(4,'CHIHUAHUA',1,1,0),(5,'NAYARIT',1,1,0);
/*!40000 ALTER TABLE `Estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tutores_Prospectos`
--

DROP TABLE IF EXISTS `Tutores_Prospectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tutores_Prospectos` (
  `tutor_id` int(11) unsigned NOT NULL,
  `prospecto_id` int(11) unsigned NOT NULL,
  `estatus_id` int(11) unsigned NOT NULL,
  `empresa_id` int(11) unsigned DEFAULT NULL,
  `version` bigint(11) DEFAULT NULL,
  KEY `FK_TutoresProspectos_Estatus` (`estatus_id`),
  KEY `FK_TutoresProspectos_Prospectos` (`prospecto_id`),
  KEY `FK_TutoresProspectos_Empresas` (`empresa_id`),
  CONSTRAINT `FK_TutoresProspectos_Empresas` FOREIGN KEY (`empresa_id`) REFERENCES `Empresas` (`empresa_id`),
  CONSTRAINT `FK_TutoresProspectos_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`),
  CONSTRAINT `FK_TutoresProspectos_Prospectos` FOREIGN KEY (`prospecto_id`) REFERENCES `Prospectos` (`prospecto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tutores_Prospectos`
--

LOCK TABLES `Tutores_Prospectos` WRITE;
/*!40000 ALTER TABLE `Tutores_Prospectos` DISABLE KEYS */;
INSERT INTO `Tutores_Prospectos` VALUES (1,16,1,1,NULL),(2,16,1,1,NULL),(3,17,1,1,NULL),(4,17,1,1,NULL);
/*!40000 ALTER TABLE `Tutores_Prospectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Servicios`
--

DROP TABLE IF EXISTS `Servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Servicios` (
  `servicio_id` int(11) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `estatus_id` int(11) unsigned NOT NULL,
  `categoriaServicio_id` int(11) unsigned NOT NULL,
  `esquemaProgramaPagos` tinyint(1) NOT NULL,
  `empresa_id` int(11) unsigned NOT NULL,
  `version` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`servicio_id`),
  UNIQUE KEY `unique_servicios_nombre` (`nombre`),
  KEY `FK_Servicios_Estatus` (`estatus_id`),
  KEY `FK_Servicios_CategoriasServicios` (`categoriaServicio_id`),
  KEY `FK_Servicios_Empresas` (`empresa_id`),
  CONSTRAINT `FK_Servicios_CategoriasServicios` FOREIGN KEY (`categoriaServicio_id`) REFERENCES `Categorias_Servicios` (`categoriaServicio_id`),
  CONSTRAINT `FK_Servicios_Empresas` FOREIGN KEY (`empresa_id`) REFERENCES `Empresas` (`empresa_id`),
  CONSTRAINT `FK_Servicios_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Servicios`
--

LOCK TABLES `Servicios` WRITE;
/*!40000 ALTER TABLE `Servicios` DISABLE KEYS */;
INSERT INTO `Servicios` VALUES (1,'COMUNICACIÓN',1,1,1,1,0),(2,'SIST. COMP. Y ADMON. DE EMPRESAS',1,1,1,1,0),(3,'PSICOPEDAGOGÍA',1,1,1,1,0),(4,'MERCADOTECNIA',1,1,1,1,0),(5,'DISEÑO GRÁFICO',1,1,1,1,0),(6,'COMERCIO INTERNACIONAL Y ADUANAS',1,1,1,1,0),(7,'ADMINISTRACIÓN TURÍSTICA',1,1,1,1,0),(8,'GASTRONOMÍA',1,1,1,1,0),(9,'ADMINISTRACIÓN Y FINANZAS',1,1,1,1,0),(10,'PSICOLOGÍA',1,1,1,1,0);
/*!40000 ALTER TABLE `Servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cuentas`
--

DROP TABLE IF EXISTS `Cuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cuentas` (
  `cuenta_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `estatus_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cuenta_id`),
  UNIQUE KEY `unique_cuentas_nombre` (`nombre`),
  KEY `FK_Cuentas_Estatus` (`estatus_id`),
  CONSTRAINT `FK_Cuentas_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cuentas`
--

LOCK TABLES `Cuentas` WRITE;
/*!40000 ALTER TABLE `Cuentas` DISABLE KEYS */;
INSERT INTO `Cuentas` VALUES (1,'ANTICIPOS',1),(2,'DESCUENTOS',1),(3,'PROGRAMA DE PAGO',1),(4,'CONTRATOS',1),(5,'PAGOS',1);
/*!40000 ALTER TABLE `Cuentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Anticipos_Detalle`
--

DROP TABLE IF EXISTS `Anticipos_Detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Anticipos_Detalle` (
  `anticipo_detalle_id` int(11) NOT NULL,
  `subcuenta_id` int(11) unsigned NOT NULL,
  `partida` int(10) NOT NULL,
  `fechaCreacion` date NOT NULL,
  `importe` decimal(10,0) NOT NULL,
  `estatus_id` int(11) unsigned NOT NULL,
  `anticipo_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`anticipo_detalle_id`),
  KEY `FK_AnticiposDetalle_Subcuentas` (`subcuenta_id`),
  KEY `FK_AnticiposDetalle_Estatus` (`estatus_id`),
  KEY `FK_AnticiposDetalle_Anticipos` (`anticipo_id`),
  CONSTRAINT `FK_AnticiposDetalle_Anticipos` FOREIGN KEY (`anticipo_id`) REFERENCES `Anticipos` (`anticipo_id`),
  CONSTRAINT `FK_AnticiposDetalle_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`),
  CONSTRAINT `FK_AnticiposDetalle_Subcuentas` FOREIGN KEY (`subcuenta_id`) REFERENCES `Subcuentas` (`subcuenta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Anticipos_Detalle`
--

LOCK TABLES `Anticipos_Detalle` WRITE;
/*!40000 ALTER TABLE `Anticipos_Detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `Anticipos_Detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_perfiles_master`
--

DROP TABLE IF EXISTS `menu_perfiles_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_perfiles_master` (
  `id_perfil` int(11) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `estatus_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_perfil`),
  KEY `FK_menuperfilesmaster_Estatus` (`estatus_id`),
  CONSTRAINT `FK_menuperfilesmaster_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_perfiles_master`
--

LOCK TABLES `menu_perfiles_master` WRITE;
/*!40000 ALTER TABLE `menu_perfiles_master` DISABLE KEYS */;
INSERT INTO `menu_perfiles_master` VALUES (1,'ADMINISTRADOR',1);
/*!40000 ALTER TABLE `menu_perfiles_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contratos_Detalle`
--

DROP TABLE IF EXISTS `Contratos_Detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Contratos_Detalle` (
  `contratos_Detalle_id` int(11) unsigned NOT NULL,
  `partida` int(10) NOT NULL,
  `subcuenta_id` int(11) unsigned NOT NULL,
  `fechaVigencia` date NOT NULL,
  `importe` decimal(10,0) NOT NULL,
  `contrato_id` int(11) unsigned NOT NULL,
  `estatus_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`contratos_Detalle_id`),
  KEY `FK_ContratosDetalle_Subcuentas` (`subcuenta_id`),
  KEY `FK_ContratosDetalle_Estatus` (`estatus_id`),
  KEY `FK_ContratosDetalle_Contratos` (`contrato_id`),
  CONSTRAINT `FK_ContratosDetalle_Contratos` FOREIGN KEY (`contrato_id`) REFERENCES `Contratos` (`contrato_id`),
  CONSTRAINT `FK_ContratosDetalle_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`),
  CONSTRAINT `FK_ContratosDetalle_Subcuentas` FOREIGN KEY (`subcuenta_id`) REFERENCES `Subcuentas` (`subcuenta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contratos_Detalle`
--

LOCK TABLES `Contratos_Detalle` WRITE;
/*!40000 ALTER TABLE `Contratos_Detalle` DISABLE KEYS */;
INSERT INTO `Contratos_Detalle` VALUES (1,1,2,'2010-08-23','1990',1,4),(2,2,2,'2010-09-08','1990',1,4),(3,3,2,'2010-10-08','1990',1,4),(4,4,2,'2010-11-08','1990',1,4),(5,5,2,'2010-12-08','1990',1,4),(6,6,2,'2011-01-10','1990',1,4),(7,7,2,'2011-02-08','1990',1,4),(8,8,2,'2011-03-09','1990',1,4),(9,9,2,'2011-04-08','1990',1,4),(10,10,2,'2011-05-09','1990',1,4),(11,11,2,'2011-06-08','1990',1,4),(12,12,2,'2011-07-08','1990',1,4),(13,13,2,'2011-08-08','1990',1,4),(14,14,2,'2011-09-08','1990',1,4),(15,15,2,'2011-10-10','1990',1,4),(16,16,2,'2011-11-08','1990',1,4),(17,17,2,'2011-12-08','1990',1,4),(18,18,2,'2012-01-09','1990',1,4),(19,19,2,'2012-02-08','1990',1,4),(20,20,2,'2012-03-08','1990',1,4),(21,21,2,'2012-04-09','1990',1,4),(22,22,2,'2012-05-08','1990',1,4),(23,23,2,'2012-07-09','1990',1,4),(24,24,2,'2012-08-08','1990',1,4),(25,25,2,'2012-09-10','1990',1,4),(26,26,2,'2012-10-08','1990',1,4),(27,27,2,'2012-11-08','1990',1,4),(28,28,2,'2012-12-10','1990',1,4),(29,29,2,'2013-01-08','1990',1,4),(30,30,2,'2013-02-08','1990',1,4),(31,31,2,'2013-03-08','1990',1,4),(32,32,2,'2013-04-08','1990',1,4),(33,33,2,'2013-05-08','1990',1,4),(34,34,2,'2013-06-10','1990',1,4),(35,35,2,'2013-07-08','1990',1,4),(36,36,2,'2013-08-08','1990',1,4),(37,37,2,'2013-09-09','1990',1,4),(38,38,2,'2013-10-08','1990',1,4),(39,39,2,'2013-11-08','1990',1,4),(40,40,2,'2013-12-09','1990',1,4),(41,41,2,'2014-01-08','1990',1,4),(42,42,2,'2014-02-10','1990',1,4),(43,43,2,'2014-03-10','1990',1,4),(44,44,2,'2014-04-08','1990',1,4),(45,45,2,'2014-05-08','1990',1,4),(46,46,2,'2014-06-09','1990',1,4),(47,1,2,'2010-08-23','1990',2,4),(48,2,2,'2010-09-08','1990',2,4),(49,3,2,'2010-10-08','1990',2,4),(50,4,2,'2010-11-08','1990',2,4),(51,5,2,'2010-12-08','1990',2,4),(52,6,2,'2011-01-10','1990',2,4),(53,7,2,'2011-02-08','1990',2,4),(54,8,2,'2011-03-09','1990',2,4),(55,9,2,'2011-04-08','1990',2,4),(56,10,2,'2011-05-09','1990',2,4),(57,11,2,'2011-06-08','1990',2,4),(58,12,2,'2011-07-08','1990',2,4),(59,13,2,'2011-08-08','1990',2,4),(60,14,2,'2011-09-08','1990',2,4),(61,15,2,'2011-10-10','1990',2,4),(62,16,2,'2011-11-08','1990',2,4),(63,17,2,'2011-12-08','1990',2,4),(64,18,2,'2012-01-09','1990',2,4),(65,19,2,'2012-02-08','1990',2,4),(66,20,2,'2012-03-08','1990',2,4),(67,21,2,'2012-04-09','1990',2,4),(68,22,2,'2012-05-08','1990',2,4),(69,23,2,'2012-07-09','1990',2,4),(70,24,2,'2012-08-08','1990',2,4),(71,25,2,'2012-09-10','1990',2,4),(72,26,2,'2012-10-08','1990',2,4),(73,27,2,'2012-11-08','1990',2,4),(74,28,2,'2012-12-10','1990',2,4),(75,29,2,'2013-01-08','1990',2,4),(76,30,2,'2013-02-08','1990',2,4),(77,31,2,'2013-03-08','1990',2,4),(78,32,2,'2013-04-08','1990',2,4),(79,33,2,'2013-05-08','1990',2,4),(80,34,2,'2013-06-10','1990',2,4),(81,35,2,'2013-07-08','1990',2,4),(82,36,2,'2013-08-08','1990',2,4),(83,37,2,'2013-09-09','1990',2,4),(84,38,2,'2013-10-08','1990',2,4),(85,39,2,'2013-11-08','1990',2,4),(86,40,2,'2013-12-09','1990',2,4),(87,41,2,'2014-01-08','1990',2,4),(88,42,2,'2014-02-10','1990',2,4),(89,43,2,'2014-03-10','1990',2,4),(90,44,2,'2014-04-08','1990',2,4),(91,45,2,'2014-05-08','1990',2,4),(92,46,2,'2014-06-09','1990',2,4),(93,1,2,'2010-08-23','1990',3,4),(94,2,2,'2010-09-08','1990',3,4),(95,3,2,'2010-10-08','1990',3,4),(96,4,2,'2010-11-08','1990',3,4),(97,5,2,'2010-12-08','1990',3,4),(98,6,2,'2011-01-10','1990',3,4),(99,7,2,'2011-02-08','1990',3,4),(100,8,2,'2011-03-09','1990',3,4),(101,9,2,'2011-04-08','1990',3,4),(102,10,2,'2011-05-09','1990',3,4),(103,11,2,'2011-06-08','1990',3,4),(104,12,2,'2011-07-08','1990',3,4),(105,13,2,'2011-08-08','1990',3,4),(106,14,2,'2011-09-08','1990',3,4),(107,15,2,'2011-10-10','1990',3,4),(108,16,2,'2011-11-08','1990',3,4),(109,17,2,'2011-12-08','1990',3,4),(110,18,2,'2012-01-09','1990',3,4),(111,19,2,'2012-02-08','1990',3,4),(112,20,2,'2012-03-08','1990',3,4),(113,21,2,'2012-04-09','1990',3,4),(114,22,2,'2012-05-08','1990',3,4),(115,23,2,'2012-07-09','1990',3,4),(116,24,2,'2012-08-08','1990',3,4),(117,25,2,'2012-09-10','1990',3,4),(118,26,2,'2012-10-08','1990',3,4),(119,27,2,'2012-11-08','1990',3,4),(120,28,2,'2012-12-10','1990',3,4),(121,29,2,'2013-01-08','1990',3,4),(122,30,2,'2013-02-08','1990',3,4),(123,31,2,'2013-03-08','1990',3,4),(124,32,2,'2013-04-08','1990',3,4),(125,33,2,'2013-05-08','1990',3,4),(126,34,2,'2013-06-10','1990',3,4),(127,35,2,'2013-07-08','1990',3,4),(128,36,2,'2013-08-08','1990',3,4),(129,37,2,'2013-09-09','1990',3,4),(130,38,2,'2013-10-08','1990',3,4),(131,39,2,'2013-11-08','1990',3,4),(132,40,2,'2013-12-09','1990',3,4),(133,41,2,'2014-01-08','1990',3,4),(134,42,2,'2014-02-10','1990',3,4),(135,43,2,'2014-03-10','1990',3,4),(136,44,2,'2014-04-08','1990',3,4),(137,45,2,'2014-05-08','1990',3,4),(138,46,2,'2014-06-09','1990',3,4),(139,1,2,'2010-08-23','1990',4,4),(140,2,2,'2010-09-08','1990',4,4),(141,3,2,'2010-10-08','1990',4,4),(142,4,2,'2010-11-08','1990',4,4),(143,5,2,'2010-12-08','1990',4,4),(144,6,2,'2011-01-10','1990',4,4),(145,7,2,'2011-02-08','1990',4,4),(146,8,2,'2011-03-09','1990',4,4),(147,9,2,'2011-04-08','1990',4,4),(148,10,2,'2011-05-09','1990',4,4),(149,11,2,'2011-06-08','1990',4,4),(150,12,2,'2011-07-08','1990',4,4),(151,13,2,'2011-08-08','1990',4,4),(152,14,2,'2011-09-08','1990',4,4),(153,15,2,'2011-10-10','1990',4,4),(154,16,2,'2011-11-08','1990',4,4),(155,17,2,'2011-12-08','1990',4,4),(156,18,2,'2012-01-09','1990',4,4),(157,19,2,'2012-02-08','1990',4,4),(158,20,2,'2012-03-08','1990',4,4),(159,21,2,'2012-04-09','1990',4,4),(160,22,2,'2012-05-08','1990',4,4),(161,23,2,'2012-07-09','1990',4,4),(162,24,2,'2012-08-08','1990',4,4),(163,25,2,'2012-09-10','1990',4,4),(164,26,2,'2012-10-08','1990',4,4),(165,27,2,'2012-11-08','1990',4,4),(166,28,2,'2012-12-10','1990',4,4),(167,29,2,'2013-01-08','1990',4,4),(168,30,2,'2013-02-08','1990',4,4),(169,31,2,'2013-03-08','1990',4,4),(170,32,2,'2013-04-08','1990',4,4),(171,33,2,'2013-05-08','1990',4,4),(172,34,2,'2013-06-10','1990',4,4),(173,35,2,'2013-07-08','1990',4,4),(174,36,2,'2013-08-08','1990',4,4),(175,37,2,'2013-09-09','1990',4,4),(176,38,2,'2013-10-08','1990',4,4),(177,39,2,'2013-11-08','1990',4,4),(178,40,2,'2013-12-09','1990',4,4),(179,41,2,'2014-01-08','1990',4,4),(180,42,2,'2014-02-10','1990',4,4),(181,43,2,'2014-03-10','1990',4,4),(182,44,2,'2014-04-08','1990',4,4),(183,45,2,'2014-05-08','1990',4,4),(184,46,2,'2014-06-09','1990',4,4),(185,1,2,'2010-08-23','1990',5,4),(186,2,2,'2010-09-08','1990',5,4),(187,3,2,'2010-10-08','1990',5,4),(188,4,2,'2010-11-08','1990',5,4),(189,5,2,'2010-12-08','1990',5,4),(190,6,2,'2011-01-10','1990',5,4),(191,7,2,'2011-02-08','1990',5,4),(192,8,2,'2011-03-09','1990',5,4),(193,9,2,'2011-04-08','1990',5,4),(194,10,2,'2011-05-09','1990',5,4),(195,11,2,'2011-06-08','1990',5,4),(196,12,2,'2011-07-08','1990',5,4),(197,13,2,'2011-08-08','1990',5,4),(198,14,2,'2011-09-08','1990',5,4),(199,15,2,'2011-10-10','1990',5,4),(200,16,2,'2011-11-08','1990',5,4),(201,17,2,'2011-12-08','1990',5,4),(202,18,2,'2012-01-09','1990',5,4),(203,19,2,'2012-02-08','1990',5,4),(204,20,2,'2012-03-08','1990',5,4),(205,21,2,'2012-04-09','1990',5,4),(206,22,2,'2012-05-08','1990',5,4),(207,23,2,'2012-07-09','1990',5,4),(208,24,2,'2012-08-08','1990',5,4),(209,25,2,'2012-09-10','1990',5,4),(210,26,2,'2012-10-08','1990',5,4),(211,27,2,'2012-11-08','1990',5,4),(212,28,2,'2012-12-10','1990',5,4),(213,29,2,'2013-01-08','1990',5,4),(214,30,2,'2013-02-08','1990',5,4),(215,31,2,'2013-03-08','1990',5,4),(216,32,2,'2013-04-08','1990',5,4),(217,33,2,'2013-05-08','1990',5,4),(218,34,2,'2013-06-10','1990',5,4),(219,35,2,'2013-07-08','1990',5,4),(220,36,2,'2013-08-08','1990',5,4),(221,37,2,'2013-09-09','1990',5,4),(222,38,2,'2013-10-08','1990',5,4),(223,39,2,'2013-11-08','1990',5,4),(224,40,2,'2013-12-09','1990',5,4),(225,41,2,'2014-01-08','1990',5,4),(226,42,2,'2014-02-10','1990',5,4),(227,43,2,'2014-03-10','1990',5,4),(228,44,2,'2014-04-08','1990',5,4),(229,45,2,'2014-05-08','1990',5,4),(230,46,2,'2014-06-09','1990',5,4),(231,1,2,'2010-08-23','1990',6,4),(232,2,2,'2010-09-08','1990',6,4),(233,3,2,'2010-10-08','1990',6,4),(234,4,2,'2010-11-08','1990',6,4),(235,5,2,'2010-12-08','1990',6,4),(236,6,2,'2011-01-10','1990',6,4),(237,7,2,'2011-02-08','1990',6,4),(238,8,2,'2011-03-09','1990',6,4),(239,9,2,'2011-04-08','1990',6,4),(240,10,2,'2011-05-09','1990',6,4),(241,11,2,'2011-06-08','1990',6,4),(242,12,2,'2011-07-08','1990',6,4),(243,13,2,'2011-08-08','1990',6,4),(244,14,2,'2011-09-08','1990',6,4),(245,15,2,'2011-10-10','1990',6,4),(246,16,2,'2011-11-08','1990',6,4),(247,17,2,'2011-12-08','1990',6,4),(248,18,2,'2012-01-09','1990',6,4),(249,19,2,'2012-02-08','1990',6,4),(250,20,2,'2012-03-08','1990',6,4),(251,21,2,'2012-04-09','1990',6,4),(252,22,2,'2012-05-08','1990',6,4),(253,23,2,'2012-07-09','1990',6,4),(254,24,2,'2012-08-08','1990',6,4),(255,25,2,'2012-09-10','1990',6,4),(256,26,2,'2012-10-08','1990',6,4),(257,27,2,'2012-11-08','1990',6,4),(258,28,2,'2012-12-10','1990',6,4),(259,29,2,'2013-01-08','1990',6,4),(260,30,2,'2013-02-08','1990',6,4),(261,31,2,'2013-03-08','1990',6,4),(262,32,2,'2013-04-08','1990',6,4),(263,33,2,'2013-05-08','1990',6,4),(264,34,2,'2013-06-10','1990',6,4),(265,35,2,'2013-07-08','1990',6,4),(266,36,2,'2013-08-08','1990',6,4),(267,37,2,'2013-09-09','1990',6,4),(268,38,2,'2013-10-08','1990',6,4),(269,39,2,'2013-11-08','1990',6,4),(270,40,2,'2013-12-09','1990',6,4),(271,41,2,'2014-01-08','1990',6,4),(272,42,2,'2014-02-10','1990',6,4),(273,43,2,'2014-03-10','1990',6,4),(274,44,2,'2014-04-08','1990',6,4),(275,45,2,'2014-05-08','1990',6,4),(276,46,2,'2014-06-09','1990',6,4),(277,1,2,'2010-08-23','1990',7,4),(278,2,2,'2010-09-08','1990',7,4),(279,3,2,'2010-10-08','1990',7,4),(280,4,2,'2010-11-08','1990',7,4),(281,5,2,'2010-12-08','1990',7,4),(282,6,2,'2011-01-10','1990',7,4),(283,7,2,'2011-02-08','1990',7,4),(284,8,2,'2011-03-09','1990',7,4),(285,9,2,'2011-04-08','1990',7,4),(286,10,2,'2011-05-09','1990',7,4),(287,11,2,'2011-06-08','1990',7,4),(288,12,2,'2011-07-08','1990',7,4),(289,13,2,'2011-08-08','1990',7,4),(290,14,2,'2011-09-08','1990',7,4),(291,15,2,'2011-10-10','1990',7,4),(292,16,2,'2011-11-08','1990',7,4),(293,17,2,'2011-12-08','1990',7,4),(294,18,2,'2012-01-09','1990',7,4),(295,19,2,'2012-02-08','1990',7,4),(296,20,2,'2012-03-08','1990',7,4),(297,21,2,'2012-04-09','1990',7,4),(298,22,2,'2012-05-08','1990',7,4),(299,23,2,'2012-07-09','1990',7,4),(300,24,2,'2012-08-08','1990',7,4),(301,25,2,'2012-09-10','1990',7,4),(302,26,2,'2012-10-08','1990',7,4),(303,27,2,'2012-11-08','1990',7,4),(304,28,2,'2012-12-10','1990',7,4),(305,29,2,'2013-01-08','1990',7,4),(306,30,2,'2013-02-08','1990',7,4),(307,31,2,'2013-03-08','1990',7,4),(308,32,2,'2013-04-08','1990',7,4),(309,33,2,'2013-05-08','1990',7,4),(310,34,2,'2013-06-10','1990',7,4),(311,35,2,'2013-07-08','1990',7,4),(312,36,2,'2013-08-08','1990',7,4),(313,37,2,'2013-09-09','1990',7,4),(314,38,2,'2013-10-08','1990',7,4),(315,39,2,'2013-11-08','1990',7,4),(316,40,2,'2013-12-09','1990',7,4),(317,41,2,'2014-01-08','1990',7,4),(318,42,2,'2014-02-10','1990',7,4),(319,43,2,'2014-03-10','1990',7,4),(320,44,2,'2014-04-08','1990',7,4),(321,45,2,'2014-05-08','1990',7,4),(322,46,2,'2014-06-09','1990',7,4),(323,1,2,'2010-08-23','1990',8,4),(324,2,2,'2010-09-08','1990',8,4),(325,3,2,'2010-10-08','1990',8,4),(326,4,2,'2010-11-08','1990',8,4),(327,5,2,'2010-12-08','1990',8,4),(328,6,2,'2011-01-10','1990',8,4),(329,7,2,'2011-02-08','1990',8,4),(330,8,2,'2011-03-09','1990',8,4),(331,9,2,'2011-04-08','1990',8,4),(332,10,2,'2011-05-09','1990',8,4),(333,11,2,'2011-06-08','1990',8,4),(334,12,2,'2011-07-08','1990',8,4),(335,13,2,'2011-08-08','1990',8,4),(336,14,2,'2011-09-08','1990',8,4),(337,15,2,'2011-10-10','1990',8,4),(338,16,2,'2011-11-08','1990',8,4),(339,17,2,'2011-12-08','1990',8,4),(340,18,2,'2012-01-09','1990',8,4),(341,19,2,'2012-02-08','1990',8,4),(342,20,2,'2012-03-08','1990',8,4),(343,21,2,'2012-04-09','1990',8,4),(344,22,2,'2012-05-08','1990',8,4),(345,23,2,'2012-07-09','1990',8,4),(346,24,2,'2012-08-08','1990',8,4),(347,25,2,'2012-09-10','1990',8,4),(348,26,2,'2012-10-08','1990',8,4),(349,27,2,'2012-11-08','1990',8,4),(350,28,2,'2012-12-10','1990',8,4),(351,29,2,'2013-01-08','1990',8,4),(352,30,2,'2013-02-08','1990',8,4),(353,31,2,'2013-03-08','1990',8,4),(354,32,2,'2013-04-08','1990',8,4),(355,33,2,'2013-05-08','1990',8,4),(356,34,2,'2013-06-10','1990',8,4),(357,35,2,'2013-07-08','1990',8,4),(358,36,2,'2013-08-08','1990',8,4),(359,37,2,'2013-09-09','1990',8,4),(360,38,2,'2013-10-08','1990',8,4),(361,39,2,'2013-11-08','1990',8,4),(362,40,2,'2013-12-09','1990',8,4),(363,41,2,'2014-01-08','1990',8,4),(364,42,2,'2014-02-10','1990',8,4),(365,43,2,'2014-03-10','1990',8,4),(366,44,2,'2014-04-08','1990',8,4),(367,45,2,'2014-05-08','1990',8,4),(368,46,2,'2014-06-09','1990',8,4),(369,1,2,'2010-08-23','1990',9,4),(370,2,2,'2010-09-08','1990',9,4),(371,3,2,'2010-10-08','1990',9,4),(372,4,2,'2010-11-08','1990',9,4),(373,5,2,'2010-12-08','1990',9,4),(374,6,2,'2011-01-10','1990',9,4),(375,7,2,'2011-02-08','1990',9,4),(376,8,2,'2011-03-09','1990',9,4),(377,9,2,'2011-04-08','1990',9,4),(378,10,2,'2011-05-09','1990',9,4),(379,11,2,'2011-06-08','1990',9,4),(380,12,2,'2011-07-08','1990',9,4),(381,13,2,'2011-08-08','1990',9,4),(382,14,2,'2011-09-08','1990',9,4),(383,15,2,'2011-10-10','1990',9,4),(384,16,2,'2011-11-08','1990',9,4),(385,17,2,'2011-12-08','1990',9,4),(386,18,2,'2012-01-09','1990',9,4),(387,19,2,'2012-02-08','1990',9,4),(388,20,2,'2012-03-08','1990',9,4),(389,21,2,'2012-04-09','1990',9,4),(390,22,2,'2012-05-08','1990',9,4),(391,23,2,'2012-07-09','1990',9,4),(392,24,2,'2012-08-08','1990',9,4),(393,25,2,'2012-09-10','1990',9,4),(394,26,2,'2012-10-08','1990',9,4),(395,27,2,'2012-11-08','1990',9,4),(396,28,2,'2012-12-10','1990',9,4),(397,29,2,'2013-01-08','1990',9,4),(398,30,2,'2013-02-08','1990',9,4),(399,31,2,'2013-03-08','1990',9,4),(400,32,2,'2013-04-08','1990',9,4),(401,33,2,'2013-05-08','1990',9,4),(402,34,2,'2013-06-10','1990',9,4),(403,35,2,'2013-07-08','1990',9,4),(404,36,2,'2013-08-08','1990',9,4),(405,37,2,'2013-09-09','1990',9,4),(406,38,2,'2013-10-08','1990',9,4),(407,39,2,'2013-11-08','1990',9,4),(408,40,2,'2013-12-09','1990',9,4),(409,41,2,'2014-01-08','1990',9,4),(410,42,2,'2014-02-10','1990',9,4),(411,43,2,'2014-03-10','1990',9,4),(412,44,2,'2014-04-08','1990',9,4),(413,45,2,'2014-05-08','1990',9,4),(414,46,2,'2014-06-09','1990',9,4),(415,1,2,'2010-08-23','1990',10,4),(416,2,2,'2010-09-08','1990',10,4),(417,3,2,'2010-10-08','1990',10,4),(418,4,2,'2010-11-08','1990',10,4),(419,5,2,'2010-12-08','1990',10,4),(420,6,2,'2011-01-10','1990',10,4),(421,7,2,'2011-02-08','1990',10,4),(422,8,2,'2011-03-09','1990',10,4),(423,9,2,'2011-04-08','1990',10,4),(424,10,2,'2011-05-09','1990',10,4),(425,11,2,'2011-06-08','1990',10,4),(426,12,2,'2011-07-08','1990',10,4),(427,13,2,'2011-08-08','1990',10,4),(428,14,2,'2011-09-08','1990',10,4),(429,15,2,'2011-10-10','1990',10,4),(430,16,2,'2011-11-08','1990',10,4),(431,17,2,'2011-12-08','1990',10,4),(432,18,2,'2012-01-09','1990',10,4),(433,19,2,'2012-02-08','1990',10,4),(434,20,2,'2012-03-08','1990',10,4),(435,21,2,'2012-04-09','1990',10,4),(436,22,2,'2012-05-08','1990',10,4),(437,23,2,'2012-07-09','1990',10,4),(438,24,2,'2012-08-08','1990',10,4),(439,25,2,'2012-09-10','1990',10,4),(440,26,2,'2012-10-08','1990',10,4),(441,27,2,'2012-11-08','1990',10,4),(442,28,2,'2012-12-10','1990',10,4),(443,29,2,'2013-01-08','1990',10,4),(444,30,2,'2013-02-08','1990',10,4),(445,31,2,'2013-03-08','1990',10,4),(446,32,2,'2013-04-08','1990',10,4),(447,33,2,'2013-05-08','1990',10,4),(448,34,2,'2013-06-10','1990',10,4),(449,35,2,'2013-07-08','1990',10,4),(450,36,2,'2013-08-08','1990',10,4),(451,37,2,'2013-09-09','1990',10,4),(452,38,2,'2013-10-08','1990',10,4),(453,39,2,'2013-11-08','1990',10,4),(454,40,2,'2013-12-09','1990',10,4),(455,41,2,'2014-01-08','1990',10,4),(456,42,2,'2014-02-10','1990',10,4),(457,43,2,'2014-03-10','1990',10,4),(458,44,2,'2014-04-08','1990',10,4),(459,45,2,'2014-05-08','1990',10,4),(460,46,2,'2014-06-09','1990',10,4),(461,1,2,'2010-08-23','1990',11,4),(462,2,2,'2010-09-08','1990',11,4),(463,3,2,'2010-10-08','1990',11,4),(464,4,2,'2010-11-08','1990',11,4),(465,5,2,'2010-12-08','1990',11,4),(466,6,2,'2011-01-10','1990',11,4),(467,7,2,'2011-02-08','1990',11,4),(468,8,2,'2011-03-09','1990',11,4),(469,9,2,'2011-04-08','1990',11,4),(470,10,2,'2011-05-09','1990',11,4),(471,11,2,'2011-06-08','1990',11,4),(472,12,2,'2011-07-08','1990',11,4),(473,13,2,'2011-08-08','1990',11,4),(474,14,2,'2011-09-08','1990',11,4),(475,15,2,'2011-10-10','1990',11,4),(476,16,2,'2011-11-08','1990',11,4),(477,17,2,'2011-12-08','1990',11,4),(478,18,2,'2012-01-09','1990',11,4),(479,19,2,'2012-02-08','1990',11,4),(480,20,2,'2012-03-08','1990',11,4),(481,21,2,'2012-04-09','1990',11,4),(482,22,2,'2012-05-08','1990',11,4),(483,23,2,'2012-07-09','1990',11,4),(484,24,2,'2012-08-08','1990',11,4),(485,25,2,'2012-09-10','1990',11,4),(486,26,2,'2012-10-08','1990',11,4),(487,27,2,'2012-11-08','1990',11,4),(488,28,2,'2012-12-10','1990',11,4),(489,29,2,'2013-01-08','1990',11,4),(490,30,2,'2013-02-08','1990',11,4),(491,31,2,'2013-03-08','1990',11,4),(492,32,2,'2013-04-08','1990',11,4),(493,33,2,'2013-05-08','1990',11,4),(494,34,2,'2013-06-10','1990',11,4),(495,35,2,'2013-07-08','1990',11,4),(496,36,2,'2013-08-08','1990',11,4),(497,37,2,'2013-09-09','1990',11,4),(498,38,2,'2013-10-08','1990',11,4),(499,39,2,'2013-11-08','1990',11,4),(500,40,2,'2013-12-09','1990',11,4),(501,41,2,'2014-01-08','1990',11,4),(502,42,2,'2014-02-10','1990',11,4),(503,43,2,'2014-03-10','1990',11,4),(504,44,2,'2014-04-08','1990',11,4),(505,45,2,'2014-05-08','1990',11,4),(506,46,2,'2014-06-09','1990',11,4),(507,1,2,'2010-08-23','1990',12,4),(508,2,2,'2010-09-08','1990',12,4),(509,3,2,'2010-10-08','1990',12,4),(510,4,2,'2010-11-08','1990',12,4),(511,5,2,'2010-12-08','1990',12,4),(512,6,2,'2011-01-10','1990',12,4),(513,7,2,'2011-02-08','1990',12,4),(514,8,2,'2011-03-09','1990',12,4),(515,9,2,'2011-04-08','1990',12,4),(516,10,2,'2011-05-09','1990',12,4),(517,11,2,'2011-06-08','1990',12,4),(518,12,2,'2011-07-08','1990',12,4),(519,13,2,'2011-08-08','1990',12,4),(520,14,2,'2011-09-08','1990',12,4),(521,15,2,'2011-10-10','1990',12,4),(522,16,2,'2011-11-08','1990',12,4),(523,17,2,'2011-12-08','1990',12,4),(524,18,2,'2012-01-09','1990',12,4),(525,19,2,'2012-02-08','1990',12,4),(526,20,2,'2012-03-08','1990',12,4),(527,21,2,'2012-04-09','1990',12,4),(528,22,2,'2012-05-08','1990',12,4),(529,23,2,'2012-07-09','1990',12,4),(530,24,2,'2012-08-08','1990',12,4),(531,25,2,'2012-09-10','1990',12,4),(532,26,2,'2012-10-08','1990',12,4),(533,27,2,'2012-11-08','1990',12,4),(534,28,2,'2012-12-10','1990',12,4),(535,29,2,'2013-01-08','1990',12,4),(536,30,2,'2013-02-08','1990',12,4),(537,31,2,'2013-03-08','1990',12,4),(538,32,2,'2013-04-08','1990',12,4),(539,33,2,'2013-05-08','1990',12,4),(540,34,2,'2013-06-10','1990',12,4),(541,35,2,'2013-07-08','1990',12,4),(542,36,2,'2013-08-08','1990',12,4),(543,37,2,'2013-09-09','1990',12,4),(544,38,2,'2013-10-08','1990',12,4),(545,39,2,'2013-11-08','1990',12,4),(546,40,2,'2013-12-09','1990',12,4),(547,41,2,'2014-01-08','1990',12,4),(548,42,2,'2014-02-10','1990',12,4),(549,43,2,'2014-03-10','1990',12,4),(550,44,2,'2014-04-08','1990',12,4),(551,45,2,'2014-05-08','1990',12,4),(552,46,2,'2014-06-09','1990',12,4),(553,1,2,'2010-08-23','1990',13,4),(554,2,2,'2010-09-08','1990',13,4),(555,3,2,'2010-10-08','1990',13,4),(556,4,2,'2010-11-08','1990',13,4),(557,5,2,'2010-12-08','1990',13,4),(558,6,2,'2011-01-10','1990',13,4),(559,7,2,'2011-02-08','1990',13,4),(560,8,2,'2011-03-09','1990',13,4),(561,9,2,'2011-04-08','1990',13,4),(562,10,2,'2011-05-09','1990',13,4),(563,11,2,'2011-06-08','1990',13,4),(564,12,2,'2011-07-08','1990',13,4),(565,13,2,'2011-08-08','1990',13,4),(566,14,2,'2011-09-08','1990',13,4),(567,15,2,'2011-10-10','1990',13,4),(568,16,2,'2011-11-08','1990',13,4),(569,17,2,'2011-12-08','1990',13,4),(570,18,2,'2012-01-09','1990',13,4),(571,19,2,'2012-02-08','1990',13,4),(572,20,2,'2012-03-08','1990',13,4),(573,21,2,'2012-04-09','1990',13,4),(574,22,2,'2012-05-08','1990',13,4),(575,23,2,'2012-07-09','1990',13,4),(576,24,2,'2012-08-08','1990',13,4),(577,25,2,'2012-09-10','1990',13,4),(578,26,2,'2012-10-08','1990',13,4),(579,27,2,'2012-11-08','1990',13,4),(580,28,2,'2012-12-10','1990',13,4),(581,29,2,'2013-01-08','1990',13,4),(582,30,2,'2013-02-08','1990',13,4),(583,31,2,'2013-03-08','1990',13,4),(584,32,2,'2013-04-08','1990',13,4),(585,33,2,'2013-05-08','1990',13,4),(586,34,2,'2013-06-10','1990',13,4),(587,35,2,'2013-07-08','1990',13,4),(588,36,2,'2013-08-08','1990',13,4),(589,37,2,'2013-09-09','1990',13,4),(590,38,2,'2013-10-08','1990',13,4),(591,39,2,'2013-11-08','1990',13,4),(592,40,2,'2013-12-09','1990',13,4),(593,41,2,'2014-01-08','1990',13,4),(594,42,2,'2014-02-10','1990',13,4),(595,43,2,'2014-03-10','1990',13,4),(596,44,2,'2014-04-08','1990',13,4),(597,45,2,'2014-05-08','1990',13,4),(598,46,2,'2014-06-09','1990',13,4),(599,1,2,'2010-08-23','1990',14,4),(600,2,2,'2010-09-08','1990',14,4),(601,3,2,'2010-10-08','1990',14,4),(602,4,2,'2010-11-08','1990',14,4),(603,5,2,'2010-12-08','1990',14,4),(604,6,2,'2011-01-10','1990',14,4),(605,7,2,'2011-02-08','1990',14,4),(606,8,2,'2011-03-09','1990',14,4),(607,9,2,'2011-04-08','1990',14,4),(608,10,2,'2011-05-09','1990',14,4),(609,11,2,'2011-06-08','1990',14,4),(610,12,2,'2011-07-08','1990',14,4),(611,13,2,'2011-08-08','1990',14,4),(612,14,2,'2011-09-08','1990',14,4),(613,15,2,'2011-10-10','1990',14,4),(614,16,2,'2011-11-08','1990',14,4),(615,17,2,'2011-12-08','1990',14,4),(616,18,2,'2012-01-09','1990',14,4),(617,19,2,'2012-02-08','1990',14,4),(618,20,2,'2012-03-08','1990',14,4),(619,21,2,'2012-04-09','1990',14,4),(620,22,2,'2012-05-08','1990',14,4),(621,23,2,'2012-07-09','1990',14,4),(622,24,2,'2012-08-08','1990',14,4),(623,25,2,'2012-09-10','1990',14,4),(624,26,2,'2012-10-08','1990',14,4),(625,27,2,'2012-11-08','1990',14,4),(626,28,2,'2012-12-10','1990',14,4),(627,29,2,'2013-01-08','1990',14,4),(628,30,2,'2013-02-08','1990',14,4),(629,31,2,'2013-03-08','1990',14,4),(630,32,2,'2013-04-08','1990',14,4),(631,33,2,'2013-05-08','1990',14,4),(632,34,2,'2013-06-10','1990',14,4),(633,35,2,'2013-07-08','1990',14,4),(634,36,2,'2013-08-08','1990',14,4),(635,37,2,'2013-09-09','1990',14,4),(636,38,2,'2013-10-08','1990',14,4),(637,39,2,'2013-11-08','1990',14,4),(638,40,2,'2013-12-09','1990',14,4),(639,41,2,'2014-01-08','1990',14,4),(640,42,2,'2014-02-10','1990',14,4),(641,43,2,'2014-03-10','1990',14,4),(642,44,2,'2014-04-08','1990',14,4),(643,45,2,'2014-05-08','1990',14,4),(644,46,2,'2014-06-09','1990',14,4),(645,1,2,'2010-08-23','1990',15,4),(646,2,2,'2010-09-08','1990',15,4),(647,3,2,'2010-10-08','1990',15,4),(648,4,2,'2010-11-08','1990',15,4),(649,5,2,'2010-12-08','1990',15,4),(650,6,2,'2011-01-10','1990',15,4),(651,7,2,'2011-02-08','1990',15,4),(652,8,2,'2011-03-09','1990',15,4),(653,9,2,'2011-04-08','1990',15,4),(654,10,2,'2011-05-09','1990',15,4),(655,11,2,'2011-06-08','1990',15,4),(656,12,2,'2011-07-08','1990',15,4),(657,13,2,'2011-08-08','1990',15,4),(658,14,2,'2011-09-08','1990',15,4),(659,15,2,'2011-10-10','1990',15,4),(660,16,2,'2011-11-08','1990',15,4),(661,17,2,'2011-12-08','1990',15,4),(662,18,2,'2012-01-09','1990',15,4),(663,19,2,'2012-02-08','1990',15,4),(664,20,2,'2012-03-08','1990',15,4),(665,21,2,'2012-04-09','1990',15,4),(666,22,2,'2012-05-08','1990',15,4),(667,23,2,'2012-07-09','1990',15,4),(668,24,2,'2012-08-08','1990',15,4),(669,25,2,'2012-09-10','1990',15,4),(670,26,2,'2012-10-08','1990',15,4),(671,27,2,'2012-11-08','1990',15,4),(672,28,2,'2012-12-10','1990',15,4),(673,29,2,'2013-01-08','1990',15,4),(674,30,2,'2013-02-08','1990',15,4),(675,31,2,'2013-03-08','1990',15,4),(676,32,2,'2013-04-08','1990',15,4),(677,33,2,'2013-05-08','1990',15,4),(678,34,2,'2013-06-10','1990',15,4),(679,35,2,'2013-07-08','1990',15,4),(680,36,2,'2013-08-08','1990',15,4),(681,37,2,'2013-09-09','1990',15,4),(682,38,2,'2013-10-08','1990',15,4),(683,39,2,'2013-11-08','1990',15,4),(684,40,2,'2013-12-09','1990',15,4),(685,41,2,'2014-01-08','1990',15,4),(686,42,2,'2014-02-10','1990',15,4),(687,43,2,'2014-03-10','1990',15,4),(688,44,2,'2014-04-08','1990',15,4),(689,45,2,'2014-05-08','1990',15,4),(690,46,2,'2014-06-09','1990',15,4),(691,1,2,'2010-08-23','1990',16,4),(692,2,2,'2010-09-08','1990',16,4),(693,3,2,'2010-10-08','1990',16,4),(694,4,2,'2010-11-08','1990',16,4),(695,5,2,'2010-12-08','1990',16,4),(696,6,2,'2011-01-10','1990',16,4),(697,7,2,'2011-02-08','1990',16,4),(698,8,2,'2011-03-09','1990',16,4),(699,9,2,'2011-04-08','1990',16,4),(700,10,2,'2011-05-09','1990',16,4),(701,11,2,'2011-06-08','1990',16,4),(702,12,2,'2011-07-08','1990',16,4),(703,13,2,'2011-08-08','1990',16,4),(704,14,2,'2011-09-08','1990',16,4),(705,15,2,'2011-10-10','1990',16,4),(706,16,2,'2011-11-08','1990',16,4),(707,17,2,'2011-12-08','1990',16,4),(708,18,2,'2012-01-09','1990',16,4),(709,19,2,'2012-02-08','1990',16,4),(710,20,2,'2012-03-08','1990',16,4),(711,21,2,'2012-04-09','1990',16,4),(712,22,2,'2012-05-08','1990',16,4),(713,23,2,'2012-07-09','1990',16,4),(714,24,2,'2012-08-08','1990',16,4),(715,25,2,'2012-09-10','1990',16,4),(716,26,2,'2012-10-08','1990',16,4),(717,27,2,'2012-11-08','1990',16,4),(718,28,2,'2012-12-10','1990',16,4),(719,29,2,'2013-01-08','1990',16,4),(720,30,2,'2013-02-08','1990',16,4),(721,31,2,'2013-03-08','1990',16,4),(722,32,2,'2013-04-08','1990',16,4),(723,33,2,'2013-05-08','1990',16,4),(724,34,2,'2013-06-10','1990',16,4),(725,35,2,'2013-07-08','1990',16,4),(726,36,2,'2013-08-08','1990',16,4),(727,37,2,'2013-09-09','1990',16,4),(728,38,2,'2013-10-08','1990',16,4),(729,39,2,'2013-11-08','1990',16,4),(730,40,2,'2013-12-09','1990',16,4),(731,41,2,'2014-01-08','1990',16,4),(732,42,2,'2014-02-10','1990',16,4),(733,43,2,'2014-03-10','1990',16,4),(734,44,2,'2014-04-08','1990',16,4),(735,45,2,'2014-05-08','1990',16,4),(736,46,2,'2014-06-09','1990',16,4),(737,1,2,'2010-08-23','1990',17,4),(738,2,2,'2010-09-08','1990',17,4),(739,3,2,'2010-10-08','1990',17,4),(740,4,2,'2010-11-08','1990',17,4),(741,5,2,'2010-12-08','1990',17,4),(742,6,2,'2011-01-10','1990',17,4),(743,7,2,'2011-02-08','1990',17,4),(744,8,2,'2011-03-09','1990',17,4),(745,9,2,'2011-04-08','1990',17,4),(746,10,2,'2011-05-09','1990',17,4),(747,11,2,'2011-06-08','1990',17,4),(748,12,2,'2011-07-08','1990',17,4),(749,13,2,'2011-08-08','1990',17,4),(750,14,2,'2011-09-08','1990',17,4),(751,15,2,'2011-10-10','1990',17,4),(752,16,2,'2011-11-08','1990',17,4),(753,17,2,'2011-12-08','1990',17,4),(754,18,2,'2012-01-09','1990',17,4),(755,19,2,'2012-02-08','1990',17,4),(756,20,2,'2012-03-08','1990',17,4),(757,21,2,'2012-04-09','1990',17,4),(758,22,2,'2012-05-08','1990',17,4),(759,23,2,'2012-07-09','1990',17,4),(760,24,2,'2012-08-08','1990',17,4),(761,25,2,'2012-09-10','1990',17,4),(762,26,2,'2012-10-08','1990',17,4),(763,27,2,'2012-11-08','1990',17,4),(764,28,2,'2012-12-10','1990',17,4),(765,29,2,'2013-01-08','1990',17,4),(766,30,2,'2013-02-08','1990',17,4),(767,31,2,'2013-03-08','1990',17,4),(768,32,2,'2013-04-08','1990',17,4),(769,33,2,'2013-05-08','1990',17,4),(770,34,2,'2013-06-10','1990',17,4),(771,35,2,'2013-07-08','1990',17,4),(772,36,2,'2013-08-08','1990',17,4),(773,37,2,'2013-09-09','1990',17,4),(774,38,2,'2013-10-08','1990',17,4),(775,39,2,'2013-11-08','1990',17,4),(776,40,2,'2013-12-09','1990',17,4),(777,41,2,'2014-01-08','1990',17,4),(778,42,2,'2014-02-10','1990',17,4),(779,43,2,'2014-03-10','1990',17,4),(780,44,2,'2014-04-08','1990',17,4),(781,45,2,'2014-05-08','1990',17,4),(782,46,2,'2014-06-09','1990',17,4),(783,1,2,'2010-08-23','1990',18,4),(784,2,2,'2010-09-08','1990',18,4),(785,3,2,'2010-10-08','1990',18,4),(786,4,2,'2010-11-08','1990',18,4),(787,5,2,'2010-12-08','1990',18,4),(788,6,2,'2011-01-10','1990',18,4),(789,7,2,'2011-02-08','1990',18,4),(790,8,2,'2011-03-09','1990',18,4),(791,9,2,'2011-04-08','1990',18,4),(792,10,2,'2011-05-09','1990',18,4),(793,11,2,'2011-06-08','1990',18,4),(794,12,2,'2011-07-08','1990',18,4),(795,13,2,'2011-08-08','1990',18,4),(796,14,2,'2011-09-08','1990',18,4),(797,15,2,'2011-10-10','1990',18,4),(798,16,2,'2011-11-08','1990',18,4),(799,17,2,'2011-12-08','1990',18,4),(800,18,2,'2012-01-09','1990',18,4),(801,19,2,'2012-02-08','1990',18,4),(802,20,2,'2012-03-08','1990',18,4),(803,21,2,'2012-04-09','1990',18,4),(804,22,2,'2012-05-08','1990',18,4),(805,23,2,'2012-07-09','1990',18,4),(806,24,2,'2012-08-08','1990',18,4),(807,25,2,'2012-09-10','1990',18,4),(808,26,2,'2012-10-08','1990',18,4),(809,27,2,'2012-11-08','1990',18,4),(810,28,2,'2012-12-10','1990',18,4),(811,29,2,'2013-01-08','1990',18,4),(812,30,2,'2013-02-08','1990',18,4),(813,31,2,'2013-03-08','1990',18,4),(814,32,2,'2013-04-08','1990',18,4),(815,33,2,'2013-05-08','1990',18,4),(816,34,2,'2013-06-10','1990',18,4),(817,35,2,'2013-07-08','1990',18,4),(818,36,2,'2013-08-08','1990',18,4),(819,37,2,'2013-09-09','1990',18,4),(820,38,2,'2013-10-08','1990',18,4),(821,39,2,'2013-11-08','1990',18,4),(822,40,2,'2013-12-09','1990',18,4),(823,41,2,'2014-01-08','1990',18,4),(824,42,2,'2014-02-10','1990',18,4),(825,43,2,'2014-03-10','1990',18,4),(826,44,2,'2014-04-08','1990',18,4),(827,45,2,'2014-05-08','1990',18,4),(828,46,2,'2014-06-09','1990',18,4),(829,1,2,'2010-08-23','1990',19,4),(830,2,2,'2010-09-08','1990',19,4),(831,3,2,'2010-10-08','1990',19,4),(832,4,2,'2010-11-08','1990',19,4),(833,5,2,'2010-12-08','1990',19,4),(834,6,2,'2011-01-10','1990',19,4),(835,7,2,'2011-02-08','1990',19,4),(836,8,2,'2011-03-09','1990',19,4),(837,9,2,'2011-04-08','1990',19,4),(838,10,2,'2011-05-09','1990',19,4),(839,11,2,'2011-06-08','1990',19,4),(840,12,2,'2011-07-08','1990',19,4),(841,13,2,'2011-08-08','1990',19,4),(842,14,2,'2011-09-08','1990',19,4),(843,15,2,'2011-10-10','1990',19,4),(844,16,2,'2011-11-08','1990',19,4),(845,17,2,'2011-12-08','1990',19,4),(846,18,2,'2012-01-09','1990',19,4),(847,19,2,'2012-02-08','1990',19,4),(848,20,2,'2012-03-08','1990',19,4),(849,21,2,'2012-04-09','1990',19,4),(850,22,2,'2012-05-08','1990',19,4),(851,23,2,'2012-07-09','1990',19,4),(852,24,2,'2012-08-08','1990',19,4),(853,25,2,'2012-09-10','1990',19,4),(854,26,2,'2012-10-08','1990',19,4),(855,27,2,'2012-11-08','1990',19,4),(856,28,2,'2012-12-10','1990',19,4),(857,29,2,'2013-01-08','1990',19,4),(858,30,2,'2013-02-08','1990',19,4),(859,31,2,'2013-03-08','1990',19,4),(860,32,2,'2013-04-08','1990',19,4),(861,33,2,'2013-05-08','1990',19,4),(862,34,2,'2013-06-10','1990',19,4),(863,35,2,'2013-07-08','1990',19,4),(864,36,2,'2013-08-08','1990',19,4),(865,37,2,'2013-09-09','1990',19,4),(866,38,2,'2013-10-08','1990',19,4),(867,39,2,'2013-11-08','1990',19,4),(868,40,2,'2013-12-09','1990',19,4),(869,41,2,'2014-01-08','1990',19,4),(870,42,2,'2014-02-10','1990',19,4),(871,43,2,'2014-03-10','1990',19,4),(872,44,2,'2014-04-08','1990',19,4),(873,45,2,'2014-05-08','1990',19,4),(874,46,2,'2014-06-09','1990',19,4),(875,1,2,'2010-08-23','1990',20,4),(876,2,2,'2010-09-08','1990',20,4),(877,3,2,'2010-10-08','1990',20,4),(878,4,2,'2010-11-08','1990',20,4),(879,5,2,'2010-12-08','1990',20,4),(880,6,2,'2011-01-10','1990',20,4),(881,7,2,'2011-02-08','1990',20,4),(882,8,2,'2011-03-09','1990',20,4),(883,9,2,'2011-04-08','1990',20,4),(884,10,2,'2011-05-09','1990',20,4),(885,11,2,'2011-06-08','1990',20,4),(886,12,2,'2011-07-08','1990',20,4),(887,13,2,'2011-08-08','1990',20,4),(888,14,2,'2011-09-08','1990',20,4),(889,15,2,'2011-10-10','1990',20,4),(890,16,2,'2011-11-08','1990',20,4),(891,17,2,'2011-12-08','1990',20,4),(892,18,2,'2012-01-09','1990',20,4),(893,19,2,'2012-02-08','1990',20,4),(894,20,2,'2012-03-08','1990',20,4),(895,21,2,'2012-04-09','1990',20,4),(896,22,2,'2012-05-08','1990',20,4),(897,23,2,'2012-07-09','1990',20,4),(898,24,2,'2012-08-08','1990',20,4),(899,25,2,'2012-09-10','1990',20,4),(900,26,2,'2012-10-08','1990',20,4),(901,27,2,'2012-11-08','1990',20,4),(902,28,2,'2012-12-10','1990',20,4),(903,29,2,'2013-01-08','1990',20,4),(904,30,2,'2013-02-08','1990',20,4),(905,31,2,'2013-03-08','1990',20,4),(906,32,2,'2013-04-08','1990',20,4),(907,33,2,'2013-05-08','1990',20,4),(908,34,2,'2013-06-10','1990',20,4),(909,35,2,'2013-07-08','1990',20,4),(910,36,2,'2013-08-08','1990',20,4),(911,37,2,'2013-09-09','1990',20,4),(912,38,2,'2013-10-08','1990',20,4),(913,39,2,'2013-11-08','1990',20,4),(914,40,2,'2013-12-09','1990',20,4),(915,41,2,'2014-01-08','1990',20,4),(916,42,2,'2014-02-10','1990',20,4),(917,43,2,'2014-03-10','1990',20,4),(918,44,2,'2014-04-08','1990',20,4),(919,45,2,'2014-05-08','1990',20,4),(920,46,2,'2014-06-09','1990',20,4),(921,1,2,'2010-08-23','1990',21,4),(922,2,2,'2010-09-08','1990',21,4),(923,3,2,'2010-10-08','1990',21,4),(924,4,2,'2010-11-08','1990',21,4),(925,5,2,'2010-12-08','1990',21,4),(926,6,2,'2011-01-10','1990',21,4),(927,7,2,'2011-02-08','1990',21,4),(928,8,2,'2011-03-09','1990',21,4),(929,9,2,'2011-04-08','1990',21,4),(930,10,2,'2011-05-09','1990',21,4),(931,11,2,'2011-06-08','1990',21,4),(932,12,2,'2011-07-08','1990',21,4),(933,13,2,'2011-08-08','1990',21,4),(934,14,2,'2011-09-08','1990',21,4),(935,15,2,'2011-10-10','1990',21,4),(936,16,2,'2011-11-08','1990',21,4),(937,17,2,'2011-12-08','1990',21,4),(938,18,2,'2012-01-09','1990',21,4),(939,19,2,'2012-02-08','1990',21,4),(940,20,2,'2012-03-08','1990',21,4),(941,21,2,'2012-04-09','1990',21,4),(942,22,2,'2012-05-08','1990',21,4),(943,23,2,'2012-07-09','1990',21,4),(944,24,2,'2012-08-08','1990',21,4),(945,25,2,'2012-09-10','1990',21,4),(946,26,2,'2012-10-08','1990',21,4),(947,27,2,'2012-11-08','1990',21,4),(948,28,2,'2012-12-10','1990',21,4),(949,29,2,'2013-01-08','1990',21,4),(950,30,2,'2013-02-08','1990',21,4),(951,31,2,'2013-03-08','1990',21,4),(952,32,2,'2013-04-08','1990',21,4),(953,33,2,'2013-05-08','1990',21,4),(954,34,2,'2013-06-10','1990',21,4),(955,35,2,'2013-07-08','1990',21,4),(956,36,2,'2013-08-08','1990',21,4),(957,37,2,'2013-09-09','1990',21,4),(958,38,2,'2013-10-08','1990',21,4),(959,39,2,'2013-11-08','1990',21,4),(960,40,2,'2013-12-09','1990',21,4),(961,41,2,'2014-01-08','1990',21,4),(962,42,2,'2014-02-10','1990',21,4),(963,43,2,'2014-03-10','1990',21,4),(964,44,2,'2014-04-08','1990',21,4),(965,45,2,'2014-05-08','1990',21,4),(966,46,2,'2014-06-09','1990',21,4),(967,1,2,'2010-08-23','1990',22,4),(968,2,2,'2010-09-08','1990',22,4),(969,3,2,'2010-10-08','1990',22,4),(970,4,2,'2010-11-08','1990',22,4),(971,5,2,'2010-12-08','1990',22,4),(972,6,2,'2011-01-10','1990',22,4),(973,7,2,'2011-02-08','1990',22,4),(974,8,2,'2011-03-09','1990',22,4),(975,9,2,'2011-04-08','1990',22,4),(976,10,2,'2011-05-09','1990',22,4),(977,11,2,'2011-06-08','1990',22,4),(978,12,2,'2011-07-08','1990',22,4),(979,13,2,'2011-08-08','1990',22,4),(980,14,2,'2011-09-08','1990',22,4),(981,15,2,'2011-10-10','1990',22,4),(982,16,2,'2011-11-08','1990',22,4),(983,17,2,'2011-12-08','1990',22,4),(984,18,2,'2012-01-09','1990',22,4),(985,19,2,'2012-02-08','1990',22,4),(986,20,2,'2012-03-08','1990',22,4),(987,21,2,'2012-04-09','1990',22,4),(988,22,2,'2012-05-08','1990',22,4),(989,23,2,'2012-07-09','1990',22,4),(990,24,2,'2012-08-08','1990',22,4),(991,25,2,'2012-09-10','1990',22,4),(992,26,2,'2012-10-08','1990',22,4),(993,27,2,'2012-11-08','1990',22,4),(994,28,2,'2012-12-10','1990',22,4),(995,29,2,'2013-01-08','1990',22,4),(996,30,2,'2013-02-08','1990',22,4),(997,31,2,'2013-03-08','1990',22,4),(998,32,2,'2013-04-08','1990',22,4),(999,33,2,'2013-05-08','1990',22,4),(1000,34,2,'2013-06-10','1990',22,4),(1001,35,2,'2013-07-08','1990',22,4),(1002,36,2,'2013-08-08','1990',22,4),(1003,37,2,'2013-09-09','1990',22,4),(1004,38,2,'2013-10-08','1990',22,4),(1005,39,2,'2013-11-08','1990',22,4),(1006,40,2,'2013-12-09','1990',22,4),(1007,41,2,'2014-01-08','1990',22,4),(1008,42,2,'2014-02-10','1990',22,4),(1009,43,2,'2014-03-10','1990',22,4),(1010,44,2,'2014-04-08','1990',22,4),(1011,45,2,'2014-05-08','1990',22,4),(1012,46,2,'2014-06-09','1990',22,4),(1013,1,2,'2010-08-23','1990',23,4),(1014,2,2,'2010-09-08','1990',23,4),(1015,3,2,'2010-10-08','1990',23,4),(1016,4,2,'2010-11-08','1990',23,4),(1017,5,2,'2010-12-08','1990',23,4),(1018,6,2,'2011-01-10','1990',23,4),(1019,7,2,'2011-02-08','1990',23,4),(1020,8,2,'2011-03-09','1990',23,4),(1021,9,2,'2011-04-08','1990',23,4),(1022,10,2,'2011-05-09','1990',23,4),(1023,11,2,'2011-06-08','1990',23,4),(1024,12,2,'2011-07-08','1990',23,4),(1025,13,2,'2011-08-08','1990',23,4),(1026,14,2,'2011-09-08','1990',23,4),(1027,15,2,'2011-10-10','1990',23,4),(1028,16,2,'2011-11-08','1990',23,4),(1029,17,2,'2011-12-08','1990',23,4),(1030,18,2,'2012-01-09','1990',23,4),(1031,19,2,'2012-02-08','1990',23,4),(1032,20,2,'2012-03-08','1990',23,4),(1033,21,2,'2012-04-09','1990',23,4),(1034,22,2,'2012-05-08','1990',23,4),(1035,23,2,'2012-07-09','1990',23,4),(1036,24,2,'2012-08-08','1990',23,4),(1037,25,2,'2012-09-10','1990',23,4),(1038,26,2,'2012-10-08','1990',23,4),(1039,27,2,'2012-11-08','1990',23,4),(1040,28,2,'2012-12-10','1990',23,4),(1041,29,2,'2013-01-08','1990',23,4),(1042,30,2,'2013-02-08','1990',23,4),(1043,31,2,'2013-03-08','1990',23,4),(1044,32,2,'2013-04-08','1990',23,4),(1045,33,2,'2013-05-08','1990',23,4),(1046,34,2,'2013-06-10','1990',23,4),(1047,35,2,'2013-07-08','1990',23,4),(1048,36,2,'2013-08-08','1990',23,4),(1049,37,2,'2013-09-09','1990',23,4),(1050,38,2,'2013-10-08','1990',23,4),(1051,39,2,'2013-11-08','1990',23,4),(1052,40,2,'2013-12-09','1990',23,4),(1053,41,2,'2014-01-08','1990',23,4),(1054,42,2,'2014-02-10','1990',23,4),(1055,43,2,'2014-03-10','1990',23,4),(1056,44,2,'2014-04-08','1990',23,4),(1057,45,2,'2014-05-08','1990',23,4),(1058,46,2,'2014-06-09','1990',23,4),(1059,1,2,'2010-08-23','1990',24,4),(1060,2,2,'2010-09-08','1990',24,4),(1061,3,2,'2010-10-08','1990',24,4),(1062,4,2,'2010-11-08','1990',24,4),(1063,5,2,'2010-12-08','1990',24,4),(1064,6,2,'2011-01-10','1990',24,4),(1065,7,2,'2011-02-08','1990',24,4),(1066,8,2,'2011-03-09','1990',24,4),(1067,9,2,'2011-04-08','1990',24,4),(1068,10,2,'2011-05-09','1990',24,4),(1069,11,2,'2011-06-08','1990',24,4),(1070,12,2,'2011-07-08','1990',24,4),(1071,13,2,'2011-08-08','1990',24,4),(1072,14,2,'2011-09-08','1990',24,4),(1073,15,2,'2011-10-10','1990',24,4),(1074,16,2,'2011-11-08','1990',24,4),(1075,17,2,'2011-12-08','1990',24,4),(1076,18,2,'2012-01-09','1990',24,4),(1077,19,2,'2012-02-08','1990',24,4),(1078,20,2,'2012-03-08','1990',24,4),(1079,21,2,'2012-04-09','1990',24,4),(1080,22,2,'2012-05-08','1990',24,4),(1081,23,2,'2012-07-09','1990',24,4),(1082,24,2,'2012-08-08','1990',24,4),(1083,25,2,'2012-09-10','1990',24,4),(1084,26,2,'2012-10-08','1990',24,4),(1085,27,2,'2012-11-08','1990',24,4),(1086,28,2,'2012-12-10','1990',24,4),(1087,29,2,'2013-01-08','1990',24,4),(1088,30,2,'2013-02-08','1990',24,4),(1089,31,2,'2013-03-08','1990',24,4),(1090,32,2,'2013-04-08','1990',24,4),(1091,33,2,'2013-05-08','1990',24,4),(1092,34,2,'2013-06-10','1990',24,4),(1093,35,2,'2013-07-08','1990',24,4),(1094,36,2,'2013-08-08','1990',24,4),(1095,37,2,'2013-09-09','1990',24,4),(1096,38,2,'2013-10-08','1990',24,4),(1097,39,2,'2013-11-08','1990',24,4),(1098,40,2,'2013-12-09','1990',24,4),(1099,41,2,'2014-01-08','1990',24,4),(1100,42,2,'2014-02-10','1990',24,4),(1101,43,2,'2014-03-10','1990',24,4),(1102,44,2,'2014-04-08','1990',24,4),(1103,45,2,'2014-05-08','1990',24,4),(1104,46,2,'2014-06-09','1990',24,4),(1105,1,2,'2010-08-23','1990',25,4),(1106,2,2,'2010-09-08','1990',25,4),(1107,3,2,'2010-10-08','1990',25,4),(1108,4,2,'2010-11-08','1990',25,4),(1109,5,2,'2010-12-08','1990',25,4),(1110,6,2,'2011-01-10','1990',25,4),(1111,7,2,'2011-02-08','1990',25,4),(1112,8,2,'2011-03-09','1990',25,4),(1113,9,2,'2011-04-08','1990',25,4),(1114,10,2,'2011-05-09','1990',25,4),(1115,11,2,'2011-06-08','1990',25,4),(1116,12,2,'2011-07-08','1990',25,4),(1117,13,2,'2011-08-08','1990',25,4),(1118,14,2,'2011-09-08','1990',25,4),(1119,15,2,'2011-10-10','1990',25,4),(1120,16,2,'2011-11-08','1990',25,4),(1121,17,2,'2011-12-08','1990',25,4),(1122,18,2,'2012-01-09','1990',25,4),(1123,19,2,'2012-02-08','1990',25,4),(1124,20,2,'2012-03-08','1990',25,4),(1125,21,2,'2012-04-09','1990',25,4),(1126,22,2,'2012-05-08','1990',25,4),(1127,23,2,'2012-07-09','1990',25,4),(1128,24,2,'2012-08-08','1990',25,4),(1129,25,2,'2012-09-10','1990',25,4),(1130,26,2,'2012-10-08','1990',25,4),(1131,27,2,'2012-11-08','1990',25,4),(1132,28,2,'2012-12-10','1990',25,4),(1133,29,2,'2013-01-08','1990',25,4),(1134,30,2,'2013-02-08','1990',25,4),(1135,31,2,'2013-03-08','1990',25,4),(1136,32,2,'2013-04-08','1990',25,4),(1137,33,2,'2013-05-08','1990',25,4),(1138,34,2,'2013-06-10','1990',25,4),(1139,35,2,'2013-07-08','1990',25,4),(1140,36,2,'2013-08-08','1990',25,4),(1141,37,2,'2013-09-09','1990',25,4),(1142,38,2,'2013-10-08','1990',25,4),(1143,39,2,'2013-11-08','1990',25,4),(1144,40,2,'2013-12-09','1990',25,4),(1145,41,2,'2014-01-08','1990',25,4),(1146,42,2,'2014-02-10','1990',25,4),(1147,43,2,'2014-03-10','1990',25,4),(1148,44,2,'2014-04-08','1990',25,4),(1149,45,2,'2014-05-08','1990',25,4),(1150,46,2,'2014-06-09','1990',25,4),(1151,1,2,'2010-08-23','1990',26,4),(1152,2,2,'2010-09-08','1990',26,4),(1153,3,2,'2010-10-08','1990',26,4),(1154,4,2,'2010-11-08','1990',26,4),(1155,5,2,'2010-12-08','1990',26,4),(1156,6,2,'2011-01-10','1990',26,4),(1157,7,2,'2011-02-08','1990',26,4),(1158,8,2,'2011-03-09','1990',26,4),(1159,9,2,'2011-04-08','1990',26,4),(1160,10,2,'2011-05-09','1990',26,4),(1161,11,2,'2011-06-08','1990',26,4),(1162,12,2,'2011-07-08','1990',26,4),(1163,13,2,'2011-08-08','1990',26,4),(1164,14,2,'2011-09-08','1990',26,4),(1165,15,2,'2011-10-10','1990',26,4),(1166,16,2,'2011-11-08','1990',26,4),(1167,17,2,'2011-12-08','1990',26,4),(1168,18,2,'2012-01-09','1990',26,4),(1169,19,2,'2012-02-08','1990',26,4),(1170,20,2,'2012-03-08','1990',26,4),(1171,21,2,'2012-04-09','1990',26,4),(1172,22,2,'2012-05-08','1990',26,4),(1173,23,2,'2012-07-09','1990',26,4),(1174,24,2,'2012-08-08','1990',26,4),(1175,25,2,'2012-09-10','1990',26,4),(1176,26,2,'2012-10-08','1990',26,4),(1177,27,2,'2012-11-08','1990',26,4),(1178,28,2,'2012-12-10','1990',26,4),(1179,29,2,'2013-01-08','1990',26,4),(1180,30,2,'2013-02-08','1990',26,4),(1181,31,2,'2013-03-08','1990',26,4),(1182,32,2,'2013-04-08','1990',26,4),(1183,33,2,'2013-05-08','1990',26,4),(1184,34,2,'2013-06-10','1990',26,4),(1185,35,2,'2013-07-08','1990',26,4),(1186,36,2,'2013-08-08','1990',26,4),(1187,37,2,'2013-09-09','1990',26,4),(1188,38,2,'2013-10-08','1990',26,4),(1189,39,2,'2013-11-08','1990',26,4),(1190,40,2,'2013-12-09','1990',26,4),(1191,41,2,'2014-01-08','1990',26,4),(1192,42,2,'2014-02-10','1990',26,4),(1193,43,2,'2014-03-10','1990',26,4),(1194,44,2,'2014-04-08','1990',26,4),(1195,45,2,'2014-05-08','1990',26,4),(1196,46,2,'2014-06-09','1990',26,4),(1197,1,2,'2010-08-23','1990',27,4),(1198,2,2,'2010-09-08','1990',27,4),(1199,3,2,'2010-10-08','1990',27,4),(1200,4,2,'2010-11-08','1990',27,4),(1201,5,2,'2010-12-08','1990',27,4),(1202,6,2,'2011-01-10','1990',27,4),(1203,7,2,'2011-02-08','1990',27,4),(1204,8,2,'2011-03-09','1990',27,4),(1205,9,2,'2011-04-08','1990',27,4),(1206,10,2,'2011-05-09','1990',27,4),(1207,11,2,'2011-06-08','1990',27,4),(1208,12,2,'2011-07-08','1990',27,4),(1209,13,2,'2011-08-08','1990',27,4),(1210,14,2,'2011-09-08','1990',27,4),(1211,15,2,'2011-10-10','1990',27,4),(1212,16,2,'2011-11-08','1990',27,4),(1213,17,2,'2011-12-08','1990',27,4),(1214,18,2,'2012-01-09','1990',27,4),(1215,19,2,'2012-02-08','1990',27,4),(1216,20,2,'2012-03-08','1990',27,4),(1217,21,2,'2012-04-09','1990',27,4),(1218,22,2,'2012-05-08','1990',27,4),(1219,23,2,'2012-07-09','1990',27,4),(1220,24,2,'2012-08-08','1990',27,4),(1221,25,2,'2012-09-10','1990',27,4),(1222,26,2,'2012-10-08','1990',27,4),(1223,27,2,'2012-11-08','1990',27,4),(1224,28,2,'2012-12-10','1990',27,4),(1225,29,2,'2013-01-08','1990',27,4),(1226,30,2,'2013-02-08','1990',27,4),(1227,31,2,'2013-03-08','1990',27,4),(1228,32,2,'2013-04-08','1990',27,4),(1229,33,2,'2013-05-08','1990',27,4),(1230,34,2,'2013-06-10','1990',27,4),(1231,35,2,'2013-07-08','1990',27,4),(1232,36,2,'2013-08-08','1990',27,4),(1233,37,2,'2013-09-09','1990',27,4),(1234,38,2,'2013-10-08','1990',27,4),(1235,39,2,'2013-11-08','1990',27,4),(1236,40,2,'2013-12-09','1990',27,4),(1237,41,2,'2014-01-08','1990',27,4),(1238,42,2,'2014-02-10','1990',27,4),(1239,43,2,'2014-03-10','1990',27,4),(1240,44,2,'2014-04-08','1990',27,4),(1241,45,2,'2014-05-08','1990',27,4),(1242,46,2,'2014-06-09','1990',27,4),(1243,1,2,'2010-08-23','1990',28,4),(1244,2,2,'2010-09-08','1990',28,4),(1245,3,2,'2010-10-08','1990',28,4),(1246,4,2,'2010-11-08','1990',28,4),(1247,5,2,'2010-12-08','1990',28,4),(1248,6,2,'2011-01-10','1990',28,4),(1249,7,2,'2011-02-08','1990',28,4),(1250,8,2,'2011-03-09','1990',28,4),(1251,9,2,'2011-04-08','1990',28,4),(1252,10,2,'2011-05-09','1990',28,4),(1253,11,2,'2011-06-08','1990',28,4),(1254,12,2,'2011-07-08','1990',28,4),(1255,13,2,'2011-08-08','1990',28,4),(1256,14,2,'2011-09-08','1990',28,4),(1257,15,2,'2011-10-10','1990',28,4),(1258,16,2,'2011-11-08','1990',28,4),(1259,17,2,'2011-12-08','1990',28,4),(1260,18,2,'2012-01-09','1990',28,4),(1261,19,2,'2012-02-08','1990',28,4),(1262,20,2,'2012-03-08','1990',28,4),(1263,21,2,'2012-04-09','1990',28,4),(1264,22,2,'2012-05-08','1990',28,4),(1265,23,2,'2012-07-09','1990',28,4),(1266,24,2,'2012-08-08','1990',28,4),(1267,25,2,'2012-09-10','1990',28,4),(1268,26,2,'2012-10-08','1990',28,4),(1269,27,2,'2012-11-08','1990',28,4),(1270,28,2,'2012-12-10','1990',28,4),(1271,29,2,'2013-01-08','1990',28,4),(1272,30,2,'2013-02-08','1990',28,4),(1273,31,2,'2013-03-08','1990',28,4),(1274,32,2,'2013-04-08','1990',28,4),(1275,33,2,'2013-05-08','1990',28,4),(1276,34,2,'2013-06-10','1990',28,4),(1277,35,2,'2013-07-08','1990',28,4),(1278,36,2,'2013-08-08','1990',28,4),(1279,37,2,'2013-09-09','1990',28,4),(1280,38,2,'2013-10-08','1990',28,4),(1281,39,2,'2013-11-08','1990',28,4),(1282,40,2,'2013-12-09','1990',28,4),(1283,41,2,'2014-01-08','1990',28,4),(1284,42,2,'2014-02-10','1990',28,4),(1285,43,2,'2014-03-10','1990',28,4),(1286,44,2,'2014-04-08','1990',28,4),(1287,45,2,'2014-05-08','1990',28,4),(1288,46,2,'2014-06-09','1990',28,4),(1289,1,2,'2010-08-23','1990',29,4),(1290,2,2,'2010-09-08','1990',29,4),(1291,3,2,'2010-10-08','1990',29,4),(1292,4,2,'2010-11-08','1990',29,4),(1293,5,2,'2010-12-08','1990',29,4),(1294,6,2,'2011-01-10','1990',29,4),(1295,7,2,'2011-02-08','1990',29,4),(1296,8,2,'2011-03-09','1990',29,4),(1297,9,2,'2011-04-08','1990',29,4),(1298,10,2,'2011-05-09','1990',29,4),(1299,11,2,'2011-06-08','1990',29,4),(1300,12,2,'2011-07-08','1990',29,4),(1301,13,2,'2011-08-08','1990',29,4),(1302,14,2,'2011-09-08','1990',29,4),(1303,15,2,'2011-10-10','1990',29,4),(1304,16,2,'2011-11-08','1990',29,4),(1305,17,2,'2011-12-08','1990',29,4),(1306,18,2,'2012-01-09','1990',29,4),(1307,19,2,'2012-02-08','1990',29,4),(1308,20,2,'2012-03-08','1990',29,4),(1309,21,2,'2012-04-09','1990',29,4),(1310,22,2,'2012-05-08','1990',29,4),(1311,23,2,'2012-07-09','1990',29,4),(1312,24,2,'2012-08-08','1990',29,4),(1313,25,2,'2012-09-10','1990',29,4),(1314,26,2,'2012-10-08','1990',29,4),(1315,27,2,'2012-11-08','1990',29,4),(1316,28,2,'2012-12-10','1990',29,4),(1317,29,2,'2013-01-08','1990',29,4),(1318,30,2,'2013-02-08','1990',29,4),(1319,31,2,'2013-03-08','1990',29,4),(1320,32,2,'2013-04-08','1990',29,4),(1321,33,2,'2013-05-08','1990',29,4),(1322,34,2,'2013-06-10','1990',29,4),(1323,35,2,'2013-07-08','1990',29,4),(1324,36,2,'2013-08-08','1990',29,4),(1325,37,2,'2013-09-09','1990',29,4),(1326,38,2,'2013-10-08','1990',29,4),(1327,39,2,'2013-11-08','1990',29,4),(1328,40,2,'2013-12-09','1990',29,4),(1329,41,2,'2014-01-08','1990',29,4),(1330,42,2,'2014-02-10','1990',29,4),(1331,43,2,'2014-03-10','1990',29,4),(1332,44,2,'2014-04-08','1990',29,4),(1333,45,2,'2014-05-08','1990',29,4),(1334,46,2,'2014-06-09','1990',29,4),(1335,1,2,'2010-08-23','1990',30,4),(1336,2,2,'2010-09-08','1990',30,4),(1337,3,2,'2010-10-08','1990',30,4),(1338,4,2,'2010-11-08','1990',30,4),(1339,5,2,'2010-12-08','1990',30,4),(1340,6,2,'2011-01-10','1990',30,4),(1341,7,2,'2011-02-08','1990',30,4),(1342,8,2,'2011-03-09','1990',30,4),(1343,9,2,'2011-04-08','1990',30,4),(1344,10,2,'2011-05-09','1990',30,4),(1345,11,2,'2011-06-08','1990',30,4),(1346,12,2,'2011-07-08','1990',30,4),(1347,13,2,'2011-08-08','1990',30,4),(1348,14,2,'2011-09-08','1990',30,4),(1349,15,2,'2011-10-10','1990',30,4),(1350,16,2,'2011-11-08','1990',30,4),(1351,17,2,'2011-12-08','1990',30,4),(1352,18,2,'2012-01-09','1990',30,4),(1353,19,2,'2012-02-08','1990',30,4),(1354,20,2,'2012-03-08','1990',30,4),(1355,21,2,'2012-04-09','1990',30,4),(1356,22,2,'2012-05-08','1990',30,4),(1357,23,2,'2012-07-09','1990',30,4),(1358,24,2,'2012-08-08','1990',30,4),(1359,25,2,'2012-09-10','1990',30,4),(1360,26,2,'2012-10-08','1990',30,4),(1361,27,2,'2012-11-08','1990',30,4),(1362,28,2,'2012-12-10','1990',30,4),(1363,29,2,'2013-01-08','1990',30,4),(1364,30,2,'2013-02-08','1990',30,4),(1365,31,2,'2013-03-08','1990',30,4),(1366,32,2,'2013-04-08','1990',30,4),(1367,33,2,'2013-05-08','1990',30,4),(1368,34,2,'2013-06-10','1990',30,4),(1369,35,2,'2013-07-08','1990',30,4),(1370,36,2,'2013-08-08','1990',30,4),(1371,37,2,'2013-09-09','1990',30,4),(1372,38,2,'2013-10-08','1990',30,4),(1373,39,2,'2013-11-08','1990',30,4),(1374,40,2,'2013-12-09','1990',30,4),(1375,41,2,'2014-01-08','1990',30,4),(1376,42,2,'2014-02-10','1990',30,4),(1377,43,2,'2014-03-10','1990',30,4),(1378,44,2,'2014-04-08','1990',30,4),(1379,45,2,'2014-05-08','1990',30,4),(1380,46,2,'2014-06-09','1990',30,4),(1381,1,2,'2010-08-23','1990',31,4),(1382,2,2,'2010-09-08','1990',31,4),(1383,3,2,'2010-10-08','1990',31,4),(1384,4,2,'2010-11-08','1990',31,4),(1385,5,2,'2010-12-08','1990',31,4),(1386,6,2,'2011-01-10','1990',31,4),(1387,7,2,'2011-02-08','1990',31,4),(1388,8,2,'2011-03-09','1990',31,4),(1389,9,2,'2011-04-08','1990',31,4),(1390,10,2,'2011-05-09','1990',31,4),(1391,11,2,'2011-06-08','1990',31,4),(1392,12,2,'2011-07-08','1990',31,4),(1393,13,2,'2011-08-08','1990',31,4),(1394,14,2,'2011-09-08','1990',31,4),(1395,15,2,'2011-10-10','1990',31,4),(1396,16,2,'2011-11-08','1990',31,4),(1397,17,2,'2011-12-08','1990',31,4),(1398,18,2,'2012-01-09','1990',31,4),(1399,19,2,'2012-02-08','1990',31,4),(1400,20,2,'2012-03-08','1990',31,4),(1401,21,2,'2012-04-09','1990',31,4),(1402,22,2,'2012-05-08','1990',31,4),(1403,23,2,'2012-07-09','1990',31,4),(1404,24,2,'2012-08-08','1990',31,4),(1405,25,2,'2012-09-10','1990',31,4),(1406,26,2,'2012-10-08','1990',31,4),(1407,27,2,'2012-11-08','1990',31,4),(1408,28,2,'2012-12-10','1990',31,4),(1409,29,2,'2013-01-08','1990',31,4),(1410,30,2,'2013-02-08','1990',31,4),(1411,31,2,'2013-03-08','1990',31,4),(1412,32,2,'2013-04-08','1990',31,4),(1413,33,2,'2013-05-08','1990',31,4),(1414,34,2,'2013-06-10','1990',31,4),(1415,35,2,'2013-07-08','1990',31,4),(1416,36,2,'2013-08-08','1990',31,4),(1417,37,2,'2013-09-09','1990',31,4),(1418,38,2,'2013-10-08','1990',31,4),(1419,39,2,'2013-11-08','1990',31,4),(1420,40,2,'2013-12-09','1990',31,4),(1421,41,2,'2014-01-08','1990',31,4),(1422,42,2,'2014-02-10','1990',31,4),(1423,43,2,'2014-03-10','1990',31,4),(1424,44,2,'2014-04-08','1990',31,4),(1425,45,2,'2014-05-08','1990',31,4),(1426,46,2,'2014-06-09','1990',31,4),(1427,1,2,'2010-08-23','1990',32,4),(1428,2,2,'2010-09-08','1990',32,4),(1429,3,2,'2010-10-08','1990',32,4),(1430,4,2,'2010-11-08','1990',32,4),(1431,5,2,'2010-12-08','1990',32,4),(1432,6,2,'2011-01-10','1990',32,4),(1433,7,2,'2011-02-08','1990',32,4),(1434,8,2,'2011-03-09','1990',32,4),(1435,9,2,'2011-04-08','1990',32,4),(1436,10,2,'2011-05-09','1990',32,4),(1437,11,2,'2011-06-08','1990',32,4),(1438,12,2,'2011-07-08','1990',32,4),(1439,13,2,'2011-08-08','1990',32,4),(1440,14,2,'2011-09-08','1990',32,4),(1441,15,2,'2011-10-10','1990',32,4),(1442,16,2,'2011-11-08','1990',32,4),(1443,17,2,'2011-12-08','1990',32,4),(1444,18,2,'2012-01-09','1990',32,4),(1445,19,2,'2012-02-08','1990',32,4),(1446,20,2,'2012-03-08','1990',32,4),(1447,21,2,'2012-04-09','1990',32,4),(1448,22,2,'2012-05-08','1990',32,4),(1449,23,2,'2012-07-09','1990',32,4),(1450,24,2,'2012-08-08','1990',32,4),(1451,25,2,'2012-09-10','1990',32,4),(1452,26,2,'2012-10-08','1990',32,4),(1453,27,2,'2012-11-08','1990',32,4),(1454,28,2,'2012-12-10','1990',32,4),(1455,29,2,'2013-01-08','1990',32,4),(1456,30,2,'2013-02-08','1990',32,4),(1457,31,2,'2013-03-08','1990',32,4),(1458,32,2,'2013-04-08','1990',32,4),(1459,33,2,'2013-05-08','1990',32,4),(1460,34,2,'2013-06-10','1990',32,4),(1461,35,2,'2013-07-08','1990',32,4),(1462,36,2,'2013-08-08','1990',32,4),(1463,37,2,'2013-09-09','1990',32,4),(1464,38,2,'2013-10-08','1990',32,4),(1465,39,2,'2013-11-08','1990',32,4),(1466,40,2,'2013-12-09','1990',32,4),(1467,41,2,'2014-01-08','1990',32,4),(1468,42,2,'2014-02-10','1990',32,4),(1469,43,2,'2014-03-10','1990',32,4),(1470,44,2,'2014-04-08','1990',32,4),(1471,45,2,'2014-05-08','1990',32,4),(1472,46,2,'2014-06-09','1990',32,4),(1473,1,2,'2010-08-23','1990',33,4),(1474,2,2,'2010-09-08','1990',33,4),(1475,3,2,'2010-10-08','1990',33,4),(1476,4,2,'2010-11-08','1990',33,4),(1477,5,2,'2010-12-08','1990',33,4),(1478,6,2,'2011-01-10','1990',33,4),(1479,7,2,'2011-02-08','1990',33,4),(1480,8,2,'2011-03-09','1990',33,4),(1481,9,2,'2011-04-08','1990',33,4),(1482,10,2,'2011-05-09','1990',33,4),(1483,11,2,'2011-06-08','1990',33,4),(1484,12,2,'2011-07-08','1990',33,4),(1485,13,2,'2011-08-08','1990',33,4),(1486,14,2,'2011-09-08','1990',33,4),(1487,15,2,'2011-10-10','1990',33,4),(1488,16,2,'2011-11-08','1990',33,4),(1489,17,2,'2011-12-08','1990',33,4),(1490,18,2,'2012-01-09','1990',33,4),(1491,19,2,'2012-02-08','1990',33,4),(1492,20,2,'2012-03-08','1990',33,4),(1493,21,2,'2012-04-09','1990',33,4),(1494,22,2,'2012-05-08','1990',33,4),(1495,23,2,'2012-07-09','1990',33,4),(1496,24,2,'2012-08-08','1990',33,4),(1497,25,2,'2012-09-10','1990',33,4),(1498,26,2,'2012-10-08','1990',33,4),(1499,27,2,'2012-11-08','1990',33,4),(1500,28,2,'2012-12-10','1990',33,4),(1501,29,2,'2013-01-08','1990',33,4),(1502,30,2,'2013-02-08','1990',33,4),(1503,31,2,'2013-03-08','1990',33,4),(1504,32,2,'2013-04-08','1990',33,4),(1505,33,2,'2013-05-08','1990',33,4),(1506,34,2,'2013-06-10','1990',33,4),(1507,35,2,'2013-07-08','1990',33,4),(1508,36,2,'2013-08-08','1990',33,4),(1509,37,2,'2013-09-09','1990',33,4),(1510,38,2,'2013-10-08','1990',33,4),(1511,39,2,'2013-11-08','1990',33,4),(1512,40,2,'2013-12-09','1990',33,4),(1513,41,2,'2014-01-08','1990',33,4),(1514,42,2,'2014-02-10','1990',33,4),(1515,43,2,'2014-03-10','1990',33,4),(1516,44,2,'2014-04-08','1990',33,4),(1517,45,2,'2014-05-08','1990',33,4),(1518,46,2,'2014-06-09','1990',33,4),(1519,1,2,'2010-08-23','1990',34,4),(1520,2,2,'2010-09-08','1990',34,4),(1521,3,2,'2010-10-08','1990',34,4),(1522,4,2,'2010-11-08','1990',34,4),(1523,5,2,'2010-12-08','1990',34,4),(1524,6,2,'2011-01-10','1990',34,4),(1525,7,2,'2011-02-08','1990',34,4),(1526,8,2,'2011-03-09','1990',34,4),(1527,9,2,'2011-04-08','1990',34,4),(1528,10,2,'2011-05-09','1990',34,4),(1529,11,2,'2011-06-08','1990',34,4),(1530,12,2,'2011-07-08','1990',34,4),(1531,13,2,'2011-08-08','1990',34,4),(1532,14,2,'2011-09-08','1990',34,4),(1533,15,2,'2011-10-10','1990',34,4),(1534,16,2,'2011-11-08','1990',34,4),(1535,17,2,'2011-12-08','1990',34,4),(1536,18,2,'2012-01-09','1990',34,4),(1537,19,2,'2012-02-08','1990',34,4),(1538,20,2,'2012-03-08','1990',34,4),(1539,21,2,'2012-04-09','1990',34,4),(1540,22,2,'2012-05-08','1990',34,4),(1541,23,2,'2012-07-09','1990',34,4),(1542,24,2,'2012-08-08','1990',34,4),(1543,25,2,'2012-09-10','1990',34,4),(1544,26,2,'2012-10-08','1990',34,4),(1545,27,2,'2012-11-08','1990',34,4),(1546,28,2,'2012-12-10','1990',34,4),(1547,29,2,'2013-01-08','1990',34,4),(1548,30,2,'2013-02-08','1990',34,4),(1549,31,2,'2013-03-08','1990',34,4),(1550,32,2,'2013-04-08','1990',34,4),(1551,33,2,'2013-05-08','1990',34,4),(1552,34,2,'2013-06-10','1990',34,4),(1553,35,2,'2013-07-08','1990',34,4),(1554,36,2,'2013-08-08','1990',34,4),(1555,37,2,'2013-09-09','1990',34,4),(1556,38,2,'2013-10-08','1990',34,4),(1557,39,2,'2013-11-08','1990',34,4),(1558,40,2,'2013-12-09','1990',34,4),(1559,41,2,'2014-01-08','1990',34,4),(1560,42,2,'2014-02-10','1990',34,4),(1561,43,2,'2014-03-10','1990',34,4),(1562,44,2,'2014-04-08','1990',34,4),(1563,45,2,'2014-05-08','1990',34,4),(1564,46,2,'2014-06-09','1990',34,4),(1565,1,2,'2010-08-23','1990',35,4),(1566,2,2,'2010-09-08','1990',35,4),(1567,3,2,'2010-10-08','1990',35,4),(1568,4,2,'2010-11-08','1990',35,4),(1569,5,2,'2010-12-08','1990',35,4),(1570,6,2,'2011-01-10','1990',35,4),(1571,7,2,'2011-02-08','1990',35,4),(1572,8,2,'2011-03-09','1990',35,4),(1573,9,2,'2011-04-08','1990',35,4),(1574,10,2,'2011-05-09','1990',35,4),(1575,11,2,'2011-06-08','1990',35,4),(1576,12,2,'2011-07-08','1990',35,4),(1577,13,2,'2011-08-08','1990',35,4),(1578,14,2,'2011-09-08','1990',35,4),(1579,15,2,'2011-10-10','1990',35,4),(1580,16,2,'2011-11-08','1990',35,4),(1581,17,2,'2011-12-08','1990',35,4),(1582,18,2,'2012-01-09','1990',35,4),(1583,19,2,'2012-02-08','1990',35,4),(1584,20,2,'2012-03-08','1990',35,4),(1585,21,2,'2012-04-09','1990',35,4),(1586,22,2,'2012-05-08','1990',35,4),(1587,23,2,'2012-07-09','1990',35,4),(1588,24,2,'2012-08-08','1990',35,4),(1589,25,2,'2012-09-10','1990',35,4),(1590,26,2,'2012-10-08','1990',35,4),(1591,27,2,'2012-11-08','1990',35,4),(1592,28,2,'2012-12-10','1990',35,4),(1593,29,2,'2013-01-08','1990',35,4),(1594,30,2,'2013-02-08','1990',35,4),(1595,31,2,'2013-03-08','1990',35,4),(1596,32,2,'2013-04-08','1990',35,4),(1597,33,2,'2013-05-08','1990',35,4),(1598,34,2,'2013-06-10','1990',35,4),(1599,35,2,'2013-07-08','1990',35,4),(1600,36,2,'2013-08-08','1990',35,4),(1601,37,2,'2013-09-09','1990',35,4),(1602,38,2,'2013-10-08','1990',35,4),(1603,39,2,'2013-11-08','1990',35,4),(1604,40,2,'2013-12-09','1990',35,4),(1605,41,2,'2014-01-08','1990',35,4),(1606,42,2,'2014-02-10','1990',35,4),(1607,43,2,'2014-03-10','1990',35,4),(1608,44,2,'2014-04-08','1990',35,4),(1609,45,2,'2014-05-08','1990',35,4),(1610,46,2,'2014-06-09','1990',35,4),(1611,1,2,'2010-08-23','1990',36,4),(1612,2,2,'2010-09-08','1990',36,4),(1613,3,2,'2010-10-08','1990',36,4),(1614,4,2,'2010-11-08','1990',36,4),(1615,5,2,'2010-12-08','1990',36,4),(1616,6,2,'2011-01-10','1990',36,4),(1617,7,2,'2011-02-08','1990',36,4),(1618,8,2,'2011-03-09','1990',36,4),(1619,9,2,'2011-04-08','1990',36,4),(1620,10,2,'2011-05-09','1990',36,4),(1621,11,2,'2011-06-08','1990',36,4),(1622,12,2,'2011-07-08','1990',36,4),(1623,13,2,'2011-08-08','1990',36,4),(1624,14,2,'2011-09-08','1990',36,4),(1625,15,2,'2011-10-10','1990',36,4),(1626,16,2,'2011-11-08','1990',36,4),(1627,17,2,'2011-12-08','1990',36,4),(1628,18,2,'2012-01-09','1990',36,4),(1629,19,2,'2012-02-08','1990',36,4),(1630,20,2,'2012-03-08','1990',36,4),(1631,21,2,'2012-04-09','1990',36,4),(1632,22,2,'2012-05-08','1990',36,4),(1633,23,2,'2012-07-09','1990',36,4),(1634,24,2,'2012-08-08','1990',36,4),(1635,25,2,'2012-09-10','1990',36,4),(1636,26,2,'2012-10-08','1990',36,4),(1637,27,2,'2012-11-08','1990',36,4),(1638,28,2,'2012-12-10','1990',36,4),(1639,29,2,'2013-01-08','1990',36,4),(1640,30,2,'2013-02-08','1990',36,4),(1641,31,2,'2013-03-08','1990',36,4),(1642,32,2,'2013-04-08','1990',36,4),(1643,33,2,'2013-05-08','1990',36,4),(1644,34,2,'2013-06-10','1990',36,4),(1645,35,2,'2013-07-08','1990',36,4),(1646,36,2,'2013-08-08','1990',36,4),(1647,37,2,'2013-09-09','1990',36,4),(1648,38,2,'2013-10-08','1990',36,4),(1649,39,2,'2013-11-08','1990',36,4),(1650,40,2,'2013-12-09','1990',36,4),(1651,41,2,'2014-01-08','1990',36,4),(1652,42,2,'2014-02-10','1990',36,4),(1653,43,2,'2014-03-10','1990',36,4),(1654,44,2,'2014-04-08','1990',36,4),(1655,45,2,'2014-05-08','1990',36,4),(1656,46,2,'2014-06-09','1990',36,4),(1657,1,2,'2010-08-23','1990',37,4),(1658,2,2,'2010-09-08','1990',37,4),(1659,3,2,'2010-10-08','1990',37,4),(1660,4,2,'2010-11-08','1990',37,4),(1661,5,2,'2010-12-08','1990',37,4),(1662,6,2,'2011-01-10','1990',37,4),(1663,7,2,'2011-02-08','1990',37,4),(1664,8,2,'2011-03-09','1990',37,4),(1665,9,2,'2011-04-08','1990',37,4),(1666,10,2,'2011-05-09','1990',37,4),(1667,11,2,'2011-06-08','1990',37,4),(1668,12,2,'2011-07-08','1990',37,4),(1669,13,2,'2011-08-08','1990',37,4),(1670,14,2,'2011-09-08','1990',37,4),(1671,15,2,'2011-10-10','1990',37,4),(1672,16,2,'2011-11-08','1990',37,4),(1673,17,2,'2011-12-08','1990',37,4),(1674,18,2,'2012-01-09','1990',37,4),(1675,19,2,'2012-02-08','1990',37,4),(1676,20,2,'2012-03-08','1990',37,4),(1677,21,2,'2012-04-09','1990',37,4),(1678,22,2,'2012-05-08','1990',37,4),(1679,23,2,'2012-07-09','1990',37,4),(1680,24,2,'2012-08-08','1990',37,4),(1681,25,2,'2012-09-10','1990',37,4),(1682,26,2,'2012-10-08','1990',37,4),(1683,27,2,'2012-11-08','1990',37,4),(1684,28,2,'2012-12-10','1990',37,4),(1685,29,2,'2013-01-08','1990',37,4),(1686,30,2,'2013-02-08','1990',37,4),(1687,31,2,'2013-03-08','1990',37,4),(1688,32,2,'2013-04-08','1990',37,4),(1689,33,2,'2013-05-08','1990',37,4),(1690,34,2,'2013-06-10','1990',37,4),(1691,35,2,'2013-07-08','1990',37,4),(1692,36,2,'2013-08-08','1990',37,4),(1693,37,2,'2013-09-09','1990',37,4),(1694,38,2,'2013-10-08','1990',37,4),(1695,39,2,'2013-11-08','1990',37,4),(1696,40,2,'2013-12-09','1990',37,4),(1697,41,2,'2014-01-08','1990',37,4),(1698,42,2,'2014-02-10','1990',37,4),(1699,43,2,'2014-03-10','1990',37,4),(1700,44,2,'2014-04-08','1990',37,4),(1701,45,2,'2014-05-08','1990',37,4),(1702,46,2,'2014-06-09','1990',37,4),(1703,1,2,'2010-08-23','1990',38,4),(1704,2,2,'2010-09-08','1990',38,4),(1705,3,2,'2010-10-08','1990',38,4),(1706,4,2,'2010-11-08','1990',38,4),(1707,5,2,'2010-12-08','1990',38,4),(1708,6,2,'2011-01-10','1990',38,4),(1709,7,2,'2011-02-08','1990',38,4),(1710,8,2,'2011-03-09','1990',38,4),(1711,9,2,'2011-04-08','1990',38,4),(1712,10,2,'2011-05-09','1990',38,4),(1713,11,2,'2011-06-08','1990',38,4),(1714,12,2,'2011-07-08','1990',38,4),(1715,13,2,'2011-08-08','1990',38,4),(1716,14,2,'2011-09-08','1990',38,4),(1717,15,2,'2011-10-10','1990',38,4),(1718,16,2,'2011-11-08','1990',38,4),(1719,17,2,'2011-12-08','1990',38,4),(1720,18,2,'2012-01-09','1990',38,4),(1721,19,2,'2012-02-08','1990',38,4),(1722,20,2,'2012-03-08','1990',38,4),(1723,21,2,'2012-04-09','1990',38,4),(1724,22,2,'2012-05-08','1990',38,4),(1725,23,2,'2012-07-09','1990',38,4),(1726,24,2,'2012-08-08','1990',38,4),(1727,25,2,'2012-09-10','1990',38,4),(1728,26,2,'2012-10-08','1990',38,4),(1729,27,2,'2012-11-08','1990',38,4),(1730,28,2,'2012-12-10','1990',38,4),(1731,29,2,'2013-01-08','1990',38,4),(1732,30,2,'2013-02-08','1990',38,4),(1733,31,2,'2013-03-08','1990',38,4),(1734,32,2,'2013-04-08','1990',38,4),(1735,33,2,'2013-05-08','1990',38,4),(1736,34,2,'2013-06-10','1990',38,4),(1737,35,2,'2013-07-08','1990',38,4),(1738,36,2,'2013-08-08','1990',38,4),(1739,37,2,'2013-09-09','1990',38,4),(1740,38,2,'2013-10-08','1990',38,4),(1741,39,2,'2013-11-08','1990',38,4),(1742,40,2,'2013-12-09','1990',38,4),(1743,41,2,'2014-01-08','1990',38,4),(1744,42,2,'2014-02-10','1990',38,4),(1745,43,2,'2014-03-10','1990',38,4),(1746,44,2,'2014-04-08','1990',38,4),(1747,45,2,'2014-05-08','1990',38,4),(1748,46,2,'2014-06-09','1990',38,4),(1749,1,2,'2010-08-23','1990',39,4),(1750,2,2,'2010-09-08','1990',39,4),(1751,3,2,'2010-10-08','1990',39,4),(1752,4,2,'2010-11-08','1990',39,4),(1753,5,2,'2010-12-08','1990',39,4),(1754,6,2,'2011-01-10','1990',39,4),(1755,7,2,'2011-02-08','1990',39,4),(1756,8,2,'2011-03-09','1990',39,4),(1757,9,2,'2011-04-08','1990',39,4),(1758,10,2,'2011-05-09','1990',39,4),(1759,11,2,'2011-06-08','1990',39,4),(1760,12,2,'2011-07-08','1990',39,4),(1761,13,2,'2011-08-08','1990',39,4),(1762,14,2,'2011-09-08','1990',39,4),(1763,15,2,'2011-10-10','1990',39,4),(1764,16,2,'2011-11-08','1990',39,4),(1765,17,2,'2011-12-08','1990',39,4),(1766,18,2,'2012-01-09','1990',39,4),(1767,19,2,'2012-02-08','1990',39,4),(1768,20,2,'2012-03-08','1990',39,4),(1769,21,2,'2012-04-09','1990',39,4),(1770,22,2,'2012-05-08','1990',39,4),(1771,23,2,'2012-07-09','1990',39,4),(1772,24,2,'2012-08-08','1990',39,4),(1773,25,2,'2012-09-10','1990',39,4),(1774,26,2,'2012-10-08','1990',39,4),(1775,27,2,'2012-11-08','1990',39,4),(1776,28,2,'2012-12-10','1990',39,4),(1777,29,2,'2013-01-08','1990',39,4),(1778,30,2,'2013-02-08','1990',39,4),(1779,31,2,'2013-03-08','1990',39,4),(1780,32,2,'2013-04-08','1990',39,4),(1781,33,2,'2013-05-08','1990',39,4),(1782,34,2,'2013-06-10','1990',39,4),(1783,35,2,'2013-07-08','1990',39,4),(1784,36,2,'2013-08-08','1990',39,4),(1785,37,2,'2013-09-09','1990',39,4),(1786,38,2,'2013-10-08','1990',39,4),(1787,39,2,'2013-11-08','1990',39,4),(1788,40,2,'2013-12-09','1990',39,4),(1789,41,2,'2014-01-08','1990',39,4),(1790,42,2,'2014-02-10','1990',39,4),(1791,43,2,'2014-03-10','1990',39,4),(1792,44,2,'2014-04-08','1990',39,4),(1793,45,2,'2014-05-08','1990',39,4),(1794,46,2,'2014-06-09','1990',39,4),(1795,1,2,'2010-08-23','1990',40,4),(1796,2,2,'2010-09-08','1990',40,4),(1797,3,2,'2010-10-08','1990',40,4),(1798,4,2,'2010-11-08','1990',40,4),(1799,5,2,'2010-12-08','1990',40,4),(1800,6,2,'2011-01-10','1990',40,4),(1801,7,2,'2011-02-08','1990',40,4),(1802,8,2,'2011-03-09','1990',40,4),(1803,9,2,'2011-04-08','1990',40,4),(1804,10,2,'2011-05-09','1990',40,4),(1805,11,2,'2011-06-08','1990',40,4),(1806,12,2,'2011-07-08','1990',40,4),(1807,13,2,'2011-08-08','1990',40,4),(1808,14,2,'2011-09-08','1990',40,4),(1809,15,2,'2011-10-10','1990',40,4),(1810,16,2,'2011-11-08','1990',40,4),(1811,17,2,'2011-12-08','1990',40,4),(1812,18,2,'2012-01-09','1990',40,4),(1813,19,2,'2012-02-08','1990',40,4),(1814,20,2,'2012-03-08','1990',40,4),(1815,21,2,'2012-04-09','1990',40,4),(1816,22,2,'2012-05-08','1990',40,4),(1817,23,2,'2012-07-09','1990',40,4),(1818,24,2,'2012-08-08','1990',40,4),(1819,25,2,'2012-09-10','1990',40,4),(1820,26,2,'2012-10-08','1990',40,4),(1821,27,2,'2012-11-08','1990',40,4),(1822,28,2,'2012-12-10','1990',40,4),(1823,29,2,'2013-01-08','1990',40,4),(1824,30,2,'2013-02-08','1990',40,4),(1825,31,2,'2013-03-08','1990',40,4),(1826,32,2,'2013-04-08','1990',40,4),(1827,33,2,'2013-05-08','1990',40,4),(1828,34,2,'2013-06-10','1990',40,4),(1829,35,2,'2013-07-08','1990',40,4),(1830,36,2,'2013-08-08','1990',40,4),(1831,37,2,'2013-09-09','1990',40,4),(1832,38,2,'2013-10-08','1990',40,4),(1833,39,2,'2013-11-08','1990',40,4),(1834,40,2,'2013-12-09','1990',40,4),(1835,41,2,'2014-01-08','1990',40,4),(1836,42,2,'2014-02-10','1990',40,4),(1837,43,2,'2014-03-10','1990',40,4),(1838,44,2,'2014-04-08','1990',40,4),(1839,45,2,'2014-05-08','1990',40,4),(1840,46,2,'2014-06-09','1990',40,4),(1841,1,2,'2010-08-23','1990',41,4),(1842,2,2,'2010-09-08','1990',41,4),(1843,3,2,'2010-10-08','1990',41,4),(1844,4,2,'2010-11-08','1990',41,4),(1845,5,2,'2010-12-08','1990',41,4),(1846,6,2,'2011-01-10','1990',41,4),(1847,7,2,'2011-02-08','1990',41,4),(1848,8,2,'2011-03-09','1990',41,4),(1849,9,2,'2011-04-08','1990',41,4),(1850,10,2,'2011-05-09','1990',41,4),(1851,11,2,'2011-06-08','1990',41,4),(1852,12,2,'2011-07-08','1990',41,4),(1853,13,2,'2011-08-08','1990',41,4),(1854,14,2,'2011-09-08','1990',41,4),(1855,15,2,'2011-10-10','1990',41,4),(1856,16,2,'2011-11-08','1990',41,4),(1857,17,2,'2011-12-08','1990',41,4),(1858,18,2,'2012-01-09','1990',41,4),(1859,19,2,'2012-02-08','1990',41,4),(1860,20,2,'2012-03-08','1990',41,4),(1861,21,2,'2012-04-09','1990',41,4),(1862,22,2,'2012-05-08','1990',41,4),(1863,23,2,'2012-07-09','1990',41,4),(1864,24,2,'2012-08-08','1990',41,4),(1865,25,2,'2012-09-10','1990',41,4),(1866,26,2,'2012-10-08','1990',41,4),(1867,27,2,'2012-11-08','1990',41,4),(1868,28,2,'2012-12-10','1990',41,4),(1869,29,2,'2013-01-08','1990',41,4),(1870,30,2,'2013-02-08','1990',41,4),(1871,31,2,'2013-03-08','1990',41,4),(1872,32,2,'2013-04-08','1990',41,4),(1873,33,2,'2013-05-08','1990',41,4),(1874,34,2,'2013-06-10','1990',41,4),(1875,35,2,'2013-07-08','1990',41,4),(1876,36,2,'2013-08-08','1990',41,4),(1877,37,2,'2013-09-09','1990',41,4),(1878,38,2,'2013-10-08','1990',41,4),(1879,39,2,'2013-11-08','1990',41,4),(1880,40,2,'2013-12-09','1990',41,4),(1881,41,2,'2014-01-08','1990',41,4),(1882,42,2,'2014-02-10','1990',41,4),(1883,43,2,'2014-03-10','1990',41,4),(1884,44,2,'2014-04-08','1990',41,4),(1885,45,2,'2014-05-08','1990',41,4),(1886,46,2,'2014-06-09','1990',41,4),(1887,1,2,'2010-08-23','1990',42,4),(1888,2,2,'2010-09-08','1990',42,4),(1889,3,2,'2010-10-08','1990',42,4),(1890,4,2,'2010-11-08','1990',42,4),(1891,5,2,'2010-12-08','1990',42,4),(1892,6,2,'2011-01-10','1990',42,4),(1893,7,2,'2011-02-08','1990',42,4),(1894,8,2,'2011-03-09','1990',42,4),(1895,9,2,'2011-04-08','1990',42,4),(1896,10,2,'2011-05-09','1990',42,4),(1897,11,2,'2011-06-08','1990',42,4),(1898,12,2,'2011-07-08','1990',42,4),(1899,13,2,'2011-08-08','1990',42,4),(1900,14,2,'2011-09-08','1990',42,4),(1901,15,2,'2011-10-10','1990',42,4),(1902,16,2,'2011-11-08','1990',42,4),(1903,17,2,'2011-12-08','1990',42,4),(1904,18,2,'2012-01-09','1990',42,4),(1905,19,2,'2012-02-08','1990',42,4),(1906,20,2,'2012-03-08','1990',42,4),(1907,21,2,'2012-04-09','1990',42,4),(1908,22,2,'2012-05-08','1990',42,4),(1909,23,2,'2012-07-09','1990',42,4),(1910,24,2,'2012-08-08','1990',42,4),(1911,25,2,'2012-09-10','1990',42,4),(1912,26,2,'2012-10-08','1990',42,4),(1913,27,2,'2012-11-08','1990',42,4),(1914,28,2,'2012-12-10','1990',42,4),(1915,29,2,'2013-01-08','1990',42,4),(1916,30,2,'2013-02-08','1990',42,4),(1917,31,2,'2013-03-08','1990',42,4),(1918,32,2,'2013-04-08','1990',42,4),(1919,33,2,'2013-05-08','1990',42,4),(1920,34,2,'2013-06-10','1990',42,4),(1921,35,2,'2013-07-08','1990',42,4),(1922,36,2,'2013-08-08','1990',42,4),(1923,37,2,'2013-09-09','1990',42,4),(1924,38,2,'2013-10-08','1990',42,4),(1925,39,2,'2013-11-08','1990',42,4),(1926,40,2,'2013-12-09','1990',42,4),(1927,41,2,'2014-01-08','1990',42,4),(1928,42,2,'2014-02-10','1990',42,4),(1929,43,2,'2014-03-10','1990',42,4),(1930,44,2,'2014-04-08','1990',42,4),(1931,45,2,'2014-05-08','1990',42,4),(1932,46,2,'2014-06-09','1990',42,4),(1933,1,2,'2010-08-23','1990',43,4),(1934,2,2,'2010-09-08','1990',43,4),(1935,3,2,'2010-10-08','1990',43,4),(1936,4,2,'2010-11-08','1990',43,4),(1937,5,2,'2010-12-08','1990',43,4),(1938,6,2,'2011-01-10','1990',43,4),(1939,7,2,'2011-02-08','1990',43,4),(1940,8,2,'2011-03-09','1990',43,4),(1941,9,2,'2011-04-08','1990',43,4),(1942,10,2,'2011-05-09','1990',43,4),(1943,11,2,'2011-06-08','1990',43,4),(1944,12,2,'2011-07-08','1990',43,4),(1945,13,2,'2011-08-08','1990',43,4),(1946,14,2,'2011-09-08','1990',43,4),(1947,15,2,'2011-10-10','1990',43,4),(1948,16,2,'2011-11-08','1990',43,4),(1949,17,2,'2011-12-08','1990',43,4),(1950,18,2,'2012-01-09','1990',43,4),(1951,19,2,'2012-02-08','1990',43,4),(1952,20,2,'2012-03-08','1990',43,4),(1953,21,2,'2012-04-09','1990',43,4),(1954,22,2,'2012-05-08','1990',43,4),(1955,23,2,'2012-07-09','1990',43,4),(1956,24,2,'2012-08-08','1990',43,4),(1957,25,2,'2012-09-10','1990',43,4),(1958,26,2,'2012-10-08','1990',43,4),(1959,27,2,'2012-11-08','1990',43,4),(1960,28,2,'2012-12-10','1990',43,4),(1961,29,2,'2013-01-08','1990',43,4),(1962,30,2,'2013-02-08','1990',43,4),(1963,31,2,'2013-03-08','1990',43,4),(1964,32,2,'2013-04-08','1990',43,4),(1965,33,2,'2013-05-08','1990',43,4),(1966,34,2,'2013-06-10','1990',43,4),(1967,35,2,'2013-07-08','1990',43,4),(1968,36,2,'2013-08-08','1990',43,4),(1969,37,2,'2013-09-09','1990',43,4),(1970,38,2,'2013-10-08','1990',43,4),(1971,39,2,'2013-11-08','1990',43,4),(1972,40,2,'2013-12-09','1990',43,4),(1973,41,2,'2014-01-08','1990',43,4),(1974,42,2,'2014-02-10','1990',43,4),(1975,43,2,'2014-03-10','1990',43,4),(1976,44,2,'2014-04-08','1990',43,4),(1977,45,2,'2014-05-08','1990',43,4),(1978,46,2,'2014-06-09','1990',43,4),(1979,1,2,'2010-08-23','1990',44,4),(1980,2,2,'2010-09-08','1990',44,4),(1981,3,2,'2010-10-08','1990',44,4),(1982,4,2,'2010-11-08','1990',44,4),(1983,5,2,'2010-12-08','1990',44,4),(1984,6,2,'2011-01-10','1990',44,4),(1985,7,2,'2011-02-08','1990',44,4),(1986,8,2,'2011-03-09','1990',44,4),(1987,9,2,'2011-04-08','1990',44,4),(1988,10,2,'2011-05-09','1990',44,4),(1989,11,2,'2011-06-08','1990',44,4),(1990,12,2,'2011-07-08','1990',44,4),(1991,13,2,'2011-08-08','1990',44,4),(1992,14,2,'2011-09-08','1990',44,4),(1993,15,2,'2011-10-10','1990',44,4),(1994,16,2,'2011-11-08','1990',44,4),(1995,17,2,'2011-12-08','1990',44,4),(1996,18,2,'2012-01-09','1990',44,4),(1997,19,2,'2012-02-08','1990',44,4),(1998,20,2,'2012-03-08','1990',44,4),(1999,21,2,'2012-04-09','1990',44,4),(2000,22,2,'2012-05-08','1990',44,4),(2001,23,2,'2012-07-09','1990',44,4),(2002,24,2,'2012-08-08','1990',44,4),(2003,25,2,'2012-09-10','1990',44,4),(2004,26,2,'2012-10-08','1990',44,4),(2005,27,2,'2012-11-08','1990',44,4),(2006,28,2,'2012-12-10','1990',44,4),(2007,29,2,'2013-01-08','1990',44,4),(2008,30,2,'2013-02-08','1990',44,4),(2009,31,2,'2013-03-08','1990',44,4),(2010,32,2,'2013-04-08','1990',44,4),(2011,33,2,'2013-05-08','1990',44,4),(2012,34,2,'2013-06-10','1990',44,4),(2013,35,2,'2013-07-08','1990',44,4),(2014,36,2,'2013-08-08','1990',44,4),(2015,37,2,'2013-09-09','1990',44,4),(2016,38,2,'2013-10-08','1990',44,4),(2017,39,2,'2013-11-08','1990',44,4),(2018,40,2,'2013-12-09','1990',44,4),(2019,41,2,'2014-01-08','1990',44,4),(2020,42,2,'2014-02-10','1990',44,4),(2021,43,2,'2014-03-10','1990',44,4),(2022,44,2,'2014-04-08','1990',44,4),(2023,45,2,'2014-05-08','1990',44,4),(2024,46,2,'2014-06-09','1990',44,4),(2025,1,2,'2010-08-23','1990',45,4),(2026,2,2,'2010-09-08','1990',45,4),(2027,3,2,'2010-10-08','1990',45,4),(2028,4,2,'2010-11-08','1990',45,4),(2029,5,2,'2010-12-08','1990',45,4),(2030,6,2,'2011-01-10','1990',45,4),(2031,7,2,'2011-02-08','1990',45,4),(2032,8,2,'2011-03-09','1990',45,4),(2033,9,2,'2011-04-08','1990',45,4),(2034,10,2,'2011-05-09','1990',45,4),(2035,11,2,'2011-06-08','1990',45,4),(2036,12,2,'2011-07-08','1990',45,4),(2037,13,2,'2011-08-08','1990',45,4),(2038,14,2,'2011-09-08','1990',45,4),(2039,15,2,'2011-10-10','1990',45,4),(2040,16,2,'2011-11-08','1990',45,4),(2041,17,2,'2011-12-08','1990',45,4),(2042,18,2,'2012-01-09','1990',45,4),(2043,19,2,'2012-02-08','1990',45,4),(2044,20,2,'2012-03-08','1990',45,4),(2045,21,2,'2012-04-09','1990',45,4),(2046,22,2,'2012-05-08','1990',45,4),(2047,23,2,'2012-07-09','1990',45,4),(2048,24,2,'2012-08-08','1990',45,4),(2049,25,2,'2012-09-10','1990',45,4),(2050,26,2,'2012-10-08','1990',45,4),(2051,27,2,'2012-11-08','1990',45,4),(2052,28,2,'2012-12-10','1990',45,4),(2053,29,2,'2013-01-08','1990',45,4),(2054,30,2,'2013-02-08','1990',45,4),(2055,31,2,'2013-03-08','1990',45,4),(2056,32,2,'2013-04-08','1990',45,4),(2057,33,2,'2013-05-08','1990',45,4),(2058,34,2,'2013-06-10','1990',45,4),(2059,35,2,'2013-07-08','1990',45,4),(2060,36,2,'2013-08-08','1990',45,4),(2061,37,2,'2013-09-09','1990',45,4),(2062,38,2,'2013-10-08','1990',45,4),(2063,39,2,'2013-11-08','1990',45,4),(2064,40,2,'2013-12-09','1990',45,4),(2065,41,2,'2014-01-08','1990',45,4),(2066,42,2,'2014-02-10','1990',45,4),(2067,43,2,'2014-03-10','1990',45,4),(2068,44,2,'2014-04-08','1990',45,4),(2069,45,2,'2014-05-08','1990',45,4),(2070,46,2,'2014-06-09','1990',45,4),(2071,1,2,'2010-08-23','1990',46,4),(2072,2,2,'2010-09-08','1990',46,4),(2073,3,2,'2010-10-08','1990',46,4),(2074,4,2,'2010-11-08','1990',46,4),(2075,5,2,'2010-12-08','1990',46,4),(2076,6,2,'2011-01-10','1990',46,4),(2077,7,2,'2011-02-08','1990',46,4),(2078,8,2,'2011-03-09','1990',46,4),(2079,9,2,'2011-04-08','1990',46,4),(2080,10,2,'2011-05-09','1990',46,4),(2081,11,2,'2011-06-08','1990',46,4),(2082,12,2,'2011-07-08','1990',46,4),(2083,13,2,'2011-08-08','1990',46,4),(2084,14,2,'2011-09-08','1990',46,4),(2085,15,2,'2011-10-10','1990',46,4),(2086,16,2,'2011-11-08','1990',46,4),(2087,17,2,'2011-12-08','1990',46,4),(2088,18,2,'2012-01-09','1990',46,4),(2089,19,2,'2012-02-08','1990',46,4),(2090,20,2,'2012-03-08','1990',46,4),(2091,21,2,'2012-04-09','1990',46,4),(2092,22,2,'2012-05-08','1990',46,4),(2093,23,2,'2012-07-09','1990',46,4),(2094,24,2,'2012-08-08','1990',46,4),(2095,25,2,'2012-09-10','1990',46,4),(2096,26,2,'2012-10-08','1990',46,4),(2097,27,2,'2012-11-08','1990',46,4),(2098,28,2,'2012-12-10','1990',46,4),(2099,29,2,'2013-01-08','1990',46,4),(2100,30,2,'2013-02-08','1990',46,4),(2101,31,2,'2013-03-08','1990',46,4),(2102,32,2,'2013-04-08','1990',46,4),(2103,33,2,'2013-05-08','1990',46,4),(2104,34,2,'2013-06-10','1990',46,4),(2105,35,2,'2013-07-08','1990',46,4),(2106,36,2,'2013-08-08','1990',46,4),(2107,37,2,'2013-09-09','1990',46,4),(2108,38,2,'2013-10-08','1990',46,4),(2109,39,2,'2013-11-08','1990',46,4),(2110,40,2,'2013-12-09','1990',46,4),(2111,41,2,'2014-01-08','1990',46,4),(2112,42,2,'2014-02-10','1990',46,4),(2113,43,2,'2014-03-10','1990',46,4),(2114,44,2,'2014-04-08','1990',46,4),(2115,45,2,'2014-05-08','1990',46,4),(2116,46,2,'2014-06-09','1990',46,4),(2117,1,2,'2010-08-23','1990',47,4),(2118,2,2,'2010-09-08','1990',47,4),(2119,3,2,'2010-10-08','1990',47,4),(2120,4,2,'2010-11-08','1990',47,4),(2121,5,2,'2010-12-08','1990',47,4),(2122,6,2,'2011-01-10','1990',47,4),(2123,7,2,'2011-02-08','1990',47,4),(2124,8,2,'2011-03-09','1990',47,4),(2125,9,2,'2011-04-08','1990',47,4),(2126,10,2,'2011-05-09','1990',47,4),(2127,11,2,'2011-06-08','1990',47,4),(2128,12,2,'2011-07-08','1990',47,4),(2129,13,2,'2011-08-08','1990',47,4),(2130,14,2,'2011-09-08','1990',47,4),(2131,15,2,'2011-10-10','1990',47,4),(2132,16,2,'2011-11-08','1990',47,4),(2133,17,2,'2011-12-08','1990',47,4),(2134,18,2,'2012-01-09','1990',47,4),(2135,19,2,'2012-02-08','1990',47,4),(2136,20,2,'2012-03-08','1990',47,4),(2137,21,2,'2012-04-09','1990',47,4),(2138,22,2,'2012-05-08','1990',47,4),(2139,23,2,'2012-07-09','1990',47,4),(2140,24,2,'2012-08-08','1990',47,4),(2141,25,2,'2012-09-10','1990',47,4),(2142,26,2,'2012-10-08','1990',47,4),(2143,27,2,'2012-11-08','1990',47,4),(2144,28,2,'2012-12-10','1990',47,4),(2145,29,2,'2013-01-08','1990',47,4),(2146,30,2,'2013-02-08','1990',47,4),(2147,31,2,'2013-03-08','1990',47,4),(2148,32,2,'2013-04-08','1990',47,4),(2149,33,2,'2013-05-08','1990',47,4),(2150,34,2,'2013-06-10','1990',47,4),(2151,35,2,'2013-07-08','1990',47,4),(2152,36,2,'2013-08-08','1990',47,4),(2153,37,2,'2013-09-09','1990',47,4),(2154,38,2,'2013-10-08','1990',47,4),(2155,39,2,'2013-11-08','1990',47,4),(2156,40,2,'2013-12-09','1990',47,4),(2157,41,2,'2014-01-08','1990',47,4),(2158,42,2,'2014-02-10','1990',47,4),(2159,43,2,'2014-03-10','1990',47,4),(2160,44,2,'2014-04-08','1990',47,4),(2161,45,2,'2014-05-08','1990',47,4),(2162,46,2,'2014-06-09','1990',47,4),(2163,1,2,'2010-08-23','1990',48,4),(2164,2,2,'2010-09-08','1990',48,4),(2165,3,2,'2010-10-08','1990',48,4),(2166,4,2,'2010-11-08','1990',48,4),(2167,5,2,'2010-12-08','1990',48,4),(2168,6,2,'2011-01-10','1990',48,4),(2169,7,2,'2011-02-08','1990',48,4),(2170,8,2,'2011-03-09','1990',48,4),(2171,9,2,'2011-04-08','1990',48,4),(2172,10,2,'2011-05-09','1990',48,4),(2173,11,2,'2011-06-08','1990',48,4),(2174,12,2,'2011-07-08','1990',48,4),(2175,13,2,'2011-08-08','1990',48,4),(2176,14,2,'2011-09-08','1990',48,4),(2177,15,2,'2011-10-10','1990',48,4),(2178,16,2,'2011-11-08','1990',48,4),(2179,17,2,'2011-12-08','1990',48,4),(2180,18,2,'2012-01-09','1990',48,4),(2181,19,2,'2012-02-08','1990',48,4),(2182,20,2,'2012-03-08','1990',48,4),(2183,21,2,'2012-04-09','1990',48,4),(2184,22,2,'2012-05-08','1990',48,4),(2185,23,2,'2012-07-09','1990',48,4),(2186,24,2,'2012-08-08','1990',48,4),(2187,25,2,'2012-09-10','1990',48,4),(2188,26,2,'2012-10-08','1990',48,4),(2189,27,2,'2012-11-08','1990',48,4),(2190,28,2,'2012-12-10','1990',48,4),(2191,29,2,'2013-01-08','1990',48,4),(2192,30,2,'2013-02-08','1990',48,4),(2193,31,2,'2013-03-08','1990',48,4),(2194,32,2,'2013-04-08','1990',48,4),(2195,33,2,'2013-05-08','1990',48,4),(2196,34,2,'2013-06-10','1990',48,4),(2197,35,2,'2013-07-08','1990',48,4),(2198,36,2,'2013-08-08','1990',48,4),(2199,37,2,'2013-09-09','1990',48,4),(2200,38,2,'2013-10-08','1990',48,4),(2201,39,2,'2013-11-08','1990',48,4),(2202,40,2,'2013-12-09','1990',48,4),(2203,41,2,'2014-01-08','1990',48,4),(2204,42,2,'2014-02-10','1990',48,4),(2205,43,2,'2014-03-10','1990',48,4),(2206,44,2,'2014-04-08','1990',48,4),(2207,45,2,'2014-05-08','1990',48,4),(2208,46,2,'2014-06-09','1990',48,4),(2209,1,2,'2010-08-23','1990',49,4),(2210,2,2,'2010-09-08','1990',49,4),(2211,3,2,'2010-10-08','1990',49,4),(2212,4,2,'2010-11-08','1990',49,4),(2213,5,2,'2010-12-08','1990',49,4),(2214,6,2,'2011-01-10','1990',49,4),(2215,7,2,'2011-02-08','1990',49,4),(2216,8,2,'2011-03-09','1990',49,4),(2217,9,2,'2011-04-08','1990',49,4),(2218,10,2,'2011-05-09','1990',49,4),(2219,11,2,'2011-06-08','1990',49,4),(2220,12,2,'2011-07-08','1990',49,4),(2221,13,2,'2011-08-08','1990',49,4),(2222,14,2,'2011-09-08','1990',49,4),(2223,15,2,'2011-10-10','1990',49,4),(2224,16,2,'2011-11-08','1990',49,4),(2225,17,2,'2011-12-08','1990',49,4),(2226,18,2,'2012-01-09','1990',49,4),(2227,19,2,'2012-02-08','1990',49,4),(2228,20,2,'2012-03-08','1990',49,4),(2229,21,2,'2012-04-09','1990',49,4),(2230,22,2,'2012-05-08','1990',49,4),(2231,23,2,'2012-07-09','1990',49,4),(2232,24,2,'2012-08-08','1990',49,4),(2233,25,2,'2012-09-10','1990',49,4),(2234,26,2,'2012-10-08','1990',49,4),(2235,27,2,'2012-11-08','1990',49,4),(2236,28,2,'2012-12-10','1990',49,4),(2237,29,2,'2013-01-08','1990',49,4),(2238,30,2,'2013-02-08','1990',49,4),(2239,31,2,'2013-03-08','1990',49,4),(2240,32,2,'2013-04-08','1990',49,4),(2241,33,2,'2013-05-08','1990',49,4),(2242,34,2,'2013-06-10','1990',49,4),(2243,35,2,'2013-07-08','1990',49,4),(2244,36,2,'2013-08-08','1990',49,4),(2245,37,2,'2013-09-09','1990',49,4),(2246,38,2,'2013-10-08','1990',49,4),(2247,39,2,'2013-11-08','1990',49,4),(2248,40,2,'2013-12-09','1990',49,4),(2249,41,2,'2014-01-08','1990',49,4),(2250,42,2,'2014-02-10','1990',49,4),(2251,43,2,'2014-03-10','1990',49,4),(2252,44,2,'2014-04-08','1990',49,4),(2253,45,2,'2014-05-08','1990',49,4),(2254,46,2,'2014-06-09','1990',49,4),(2255,1,2,'2010-08-23','1990',50,4),(2256,2,2,'2010-09-08','1990',50,4),(2257,3,2,'2010-10-08','1990',50,4),(2258,4,2,'2010-11-08','1990',50,4),(2259,5,2,'2010-12-08','1990',50,4),(2260,6,2,'2011-01-10','1990',50,4),(2261,7,2,'2011-02-08','1990',50,4),(2262,8,2,'2011-03-09','1990',50,4),(2263,9,2,'2011-04-08','1990',50,4),(2264,10,2,'2011-05-09','1990',50,4),(2265,11,2,'2011-06-08','1990',50,4),(2266,12,2,'2011-07-08','1990',50,4),(2267,13,2,'2011-08-08','1990',50,4),(2268,14,2,'2011-09-08','1990',50,4),(2269,15,2,'2011-10-10','1990',50,4),(2270,16,2,'2011-11-08','1990',50,4),(2271,17,2,'2011-12-08','1990',50,4),(2272,18,2,'2012-01-09','1990',50,4),(2273,19,2,'2012-02-08','1990',50,4),(2274,20,2,'2012-03-08','1990',50,4),(2275,21,2,'2012-04-09','1990',50,4),(2276,22,2,'2012-05-08','1990',50,4),(2277,23,2,'2012-07-09','1990',50,4),(2278,24,2,'2012-08-08','1990',50,4),(2279,25,2,'2012-09-10','1990',50,4),(2280,26,2,'2012-10-08','1990',50,4),(2281,27,2,'2012-11-08','1990',50,4),(2282,28,2,'2012-12-10','1990',50,4),(2283,29,2,'2013-01-08','1990',50,4),(2284,30,2,'2013-02-08','1990',50,4),(2285,31,2,'2013-03-08','1990',50,4),(2286,32,2,'2013-04-08','1990',50,4),(2287,33,2,'2013-05-08','1990',50,4),(2288,34,2,'2013-06-10','1990',50,4),(2289,35,2,'2013-07-08','1990',50,4),(2290,36,2,'2013-08-08','1990',50,4),(2291,37,2,'2013-09-09','1990',50,4),(2292,38,2,'2013-10-08','1990',50,4),(2293,39,2,'2013-11-08','1990',50,4),(2294,40,2,'2013-12-09','1990',50,4),(2295,41,2,'2014-01-08','1990',50,4),(2296,42,2,'2014-02-10','1990',50,4),(2297,43,2,'2014-03-10','1990',50,4),(2298,44,2,'2014-04-08','1990',50,4),(2299,45,2,'2014-05-08','1990',50,4),(2300,46,2,'2014-06-09','1990',50,4),(2301,1,2,'2010-08-23','1990',51,4),(2302,2,2,'2010-09-08','1990',51,4),(2303,3,2,'2010-10-08','1990',51,4),(2304,4,2,'2010-11-08','1990',51,4),(2305,5,2,'2010-12-08','1990',51,4),(2306,6,2,'2011-01-10','1990',51,4),(2307,7,2,'2011-02-08','1990',51,4),(2308,8,2,'2011-03-09','1990',51,4),(2309,9,2,'2011-04-08','1990',51,4),(2310,10,2,'2011-05-09','1990',51,4),(2311,11,2,'2011-06-08','1990',51,4),(2312,12,2,'2011-07-08','1990',51,4),(2313,13,2,'2011-08-08','1990',51,4),(2314,14,2,'2011-09-08','1990',51,4),(2315,15,2,'2011-10-10','1990',51,4),(2316,16,2,'2011-11-08','1990',51,4),(2317,17,2,'2011-12-08','1990',51,4),(2318,18,2,'2012-01-09','1990',51,4),(2319,19,2,'2012-02-08','1990',51,4),(2320,20,2,'2012-03-08','1990',51,4),(2321,21,2,'2012-04-09','1990',51,4),(2322,22,2,'2012-05-08','1990',51,4),(2323,23,2,'2012-07-09','1990',51,4),(2324,24,2,'2012-08-08','1990',51,4),(2325,25,2,'2012-09-10','1990',51,4),(2326,26,2,'2012-10-08','1990',51,4),(2327,27,2,'2012-11-08','1990',51,4),(2328,28,2,'2012-12-10','1990',51,4),(2329,29,2,'2013-01-08','1990',51,4),(2330,30,2,'2013-02-08','1990',51,4),(2331,31,2,'2013-03-08','1990',51,4),(2332,32,2,'2013-04-08','1990',51,4),(2333,33,2,'2013-05-08','1990',51,4),(2334,34,2,'2013-06-10','1990',51,4),(2335,35,2,'2013-07-08','1990',51,4),(2336,36,2,'2013-08-08','1990',51,4),(2337,37,2,'2013-09-09','1990',51,4),(2338,38,2,'2013-10-08','1990',51,4),(2339,39,2,'2013-11-08','1990',51,4),(2340,40,2,'2013-12-09','1990',51,4),(2341,41,2,'2014-01-08','1990',51,4),(2342,42,2,'2014-02-10','1990',51,4),(2343,43,2,'2014-03-10','1990',51,4),(2344,44,2,'2014-04-08','1990',51,4),(2345,45,2,'2014-05-08','1990',51,4),(2346,46,2,'2014-06-09','1990',51,4),(2347,1,2,'2010-08-23','1990',52,4),(2348,2,2,'2010-09-08','1990',52,4),(2349,3,2,'2010-10-08','1990',52,4),(2350,4,2,'2010-11-08','1990',52,4),(2351,5,2,'2010-12-08','1990',52,4),(2352,6,2,'2011-01-10','1990',52,4),(2353,7,2,'2011-02-08','1990',52,4),(2354,8,2,'2011-03-09','1990',52,4),(2355,9,2,'2011-04-08','1990',52,4),(2356,10,2,'2011-05-09','1990',52,4),(2357,11,2,'2011-06-08','1990',52,4),(2358,12,2,'2011-07-08','1990',52,4),(2359,13,2,'2011-08-08','1990',52,4),(2360,14,2,'2011-09-08','1990',52,4),(2361,15,2,'2011-10-10','1990',52,4),(2362,16,2,'2011-11-08','1990',52,4),(2363,17,2,'2011-12-08','1990',52,4),(2364,18,2,'2012-01-09','1990',52,4),(2365,19,2,'2012-02-08','1990',52,4),(2366,20,2,'2012-03-08','1990',52,4),(2367,21,2,'2012-04-09','1990',52,4),(2368,22,2,'2012-05-08','1990',52,4),(2369,23,2,'2012-07-09','1990',52,4),(2370,24,2,'2012-08-08','1990',52,4),(2371,25,2,'2012-09-10','1990',52,4),(2372,26,2,'2012-10-08','1990',52,4),(2373,27,2,'2012-11-08','1990',52,4),(2374,28,2,'2012-12-10','1990',52,4),(2375,29,2,'2013-01-08','1990',52,4),(2376,30,2,'2013-02-08','1990',52,4),(2377,31,2,'2013-03-08','1990',52,4),(2378,32,2,'2013-04-08','1990',52,4),(2379,33,2,'2013-05-08','1990',52,4),(2380,34,2,'2013-06-10','1990',52,4),(2381,35,2,'2013-07-08','1990',52,4),(2382,36,2,'2013-08-08','1990',52,4),(2383,37,2,'2013-09-09','1990',52,4),(2384,38,2,'2013-10-08','1990',52,4),(2385,39,2,'2013-11-08','1990',52,4),(2386,40,2,'2013-12-09','1990',52,4),(2387,41,2,'2014-01-08','1990',52,4),(2388,42,2,'2014-02-10','1990',52,4),(2389,43,2,'2014-03-10','1990',52,4),(2390,44,2,'2014-04-08','1990',52,4),(2391,45,2,'2014-05-08','1990',52,4),(2392,46,2,'2014-06-09','1990',52,4),(2393,1,2,'2010-08-23','1990',53,4),(2394,2,2,'2010-09-08','1990',53,4),(2395,3,2,'2010-10-08','1990',53,4),(2396,4,2,'2010-11-08','1990',53,4),(2397,5,2,'2010-12-08','1990',53,4),(2398,6,2,'2011-01-10','1990',53,4),(2399,7,2,'2011-02-08','1990',53,4),(2400,8,2,'2011-03-09','1990',53,4),(2401,9,2,'2011-04-08','1990',53,4),(2402,10,2,'2011-05-09','1990',53,4),(2403,11,2,'2011-06-08','1990',53,4),(2404,12,2,'2011-07-08','1990',53,4),(2405,13,2,'2011-08-08','1990',53,4),(2406,14,2,'2011-09-08','1990',53,4),(2407,15,2,'2011-10-10','1990',53,4),(2408,16,2,'2011-11-08','1990',53,4),(2409,17,2,'2011-12-08','1990',53,4),(2410,18,2,'2012-01-09','1990',53,4),(2411,19,2,'2012-02-08','1990',53,4),(2412,20,2,'2012-03-08','1990',53,4),(2413,21,2,'2012-04-09','1990',53,4),(2414,22,2,'2012-05-08','1990',53,4),(2415,23,2,'2012-07-09','1990',53,4),(2416,24,2,'2012-08-08','1990',53,4),(2417,25,2,'2012-09-10','1990',53,4),(2418,26,2,'2012-10-08','1990',53,4),(2419,27,2,'2012-11-08','1990',53,4),(2420,28,2,'2012-12-10','1990',53,4),(2421,29,2,'2013-01-08','1990',53,4),(2422,30,2,'2013-02-08','1990',53,4),(2423,31,2,'2013-03-08','1990',53,4),(2424,32,2,'2013-04-08','1990',53,4),(2425,33,2,'2013-05-08','1990',53,4),(2426,34,2,'2013-06-10','1990',53,4),(2427,35,2,'2013-07-08','1990',53,4),(2428,36,2,'2013-08-08','1990',53,4),(2429,37,2,'2013-09-09','1990',53,4),(2430,38,2,'2013-10-08','1990',53,4),(2431,39,2,'2013-11-08','1990',53,4),(2432,40,2,'2013-12-09','1990',53,4),(2433,41,2,'2014-01-08','1990',53,4),(2434,42,2,'2014-02-10','1990',53,4),(2435,43,2,'2014-03-10','1990',53,4),(2436,44,2,'2014-04-08','1990',53,4),(2437,45,2,'2014-05-08','1990',53,4),(2438,46,2,'2014-06-09','1990',53,4),(2439,1,2,'2010-08-23','1990',54,4),(2440,2,2,'2010-09-08','1990',54,4),(2441,3,2,'2010-10-08','1990',54,4),(2442,4,2,'2010-11-08','1990',54,4),(2443,5,2,'2010-12-08','1990',54,4),(2444,6,2,'2011-01-10','1990',54,4),(2445,7,2,'2011-02-08','1990',54,4),(2446,8,2,'2011-03-09','1990',54,4),(2447,9,2,'2011-04-08','1990',54,4),(2448,10,2,'2011-05-09','1990',54,4),(2449,11,2,'2011-06-08','1990',54,4),(2450,12,2,'2011-07-08','1990',54,4),(2451,13,2,'2011-08-08','1990',54,4),(2452,14,2,'2011-09-08','1990',54,4),(2453,15,2,'2011-10-10','1990',54,4),(2454,16,2,'2011-11-08','1990',54,4),(2455,17,2,'2011-12-08','1990',54,4),(2456,18,2,'2012-01-09','1990',54,4),(2457,19,2,'2012-02-08','1990',54,4),(2458,20,2,'2012-03-08','1990',54,4),(2459,21,2,'2012-04-09','1990',54,4),(2460,22,2,'2012-05-08','1990',54,4),(2461,23,2,'2012-07-09','1990',54,4),(2462,24,2,'2012-08-08','1990',54,4),(2463,25,2,'2012-09-10','1990',54,4),(2464,26,2,'2012-10-08','1990',54,4),(2465,27,2,'2012-11-08','1990',54,4),(2466,28,2,'2012-12-10','1990',54,4),(2467,29,2,'2013-01-08','1990',54,4),(2468,30,2,'2013-02-08','1990',54,4),(2469,31,2,'2013-03-08','1990',54,4),(2470,32,2,'2013-04-08','1990',54,4),(2471,33,2,'2013-05-08','1990',54,4),(2472,34,2,'2013-06-10','1990',54,4),(2473,35,2,'2013-07-08','1990',54,4),(2474,36,2,'2013-08-08','1990',54,4),(2475,37,2,'2013-09-09','1990',54,4),(2476,38,2,'2013-10-08','1990',54,4),(2477,39,2,'2013-11-08','1990',54,4),(2478,40,2,'2013-12-09','1990',54,4),(2479,41,2,'2014-01-08','1990',54,4),(2480,42,2,'2014-02-10','1990',54,4),(2481,43,2,'2014-03-10','1990',54,4),(2482,44,2,'2014-04-08','1990',54,4),(2483,45,2,'2014-05-08','1990',54,4),(2484,46,2,'2014-06-09','1990',54,4),(2485,1,2,'2010-08-23','1990',55,4),(2486,2,2,'2010-09-08','1990',55,4),(2487,3,2,'2010-10-08','1990',55,4),(2488,4,2,'2010-11-08','1990',55,4),(2489,5,2,'2010-12-08','1990',55,4),(2490,6,2,'2011-01-10','1990',55,4),(2491,7,2,'2011-02-08','1990',55,4),(2492,8,2,'2011-03-09','1990',55,4),(2493,9,2,'2011-04-08','1990',55,4),(2494,10,2,'2011-05-09','1990',55,4),(2495,11,2,'2011-06-08','1990',55,4),(2496,12,2,'2011-07-08','1990',55,4),(2497,13,2,'2011-08-08','1990',55,4),(2498,14,2,'2011-09-08','1990',55,4),(2499,15,2,'2011-10-10','1990',55,4),(2500,16,2,'2011-11-08','1990',55,4),(2501,17,2,'2011-12-08','1990',55,4),(2502,18,2,'2012-01-09','1990',55,4),(2503,19,2,'2012-02-08','1990',55,4),(2504,20,2,'2012-03-08','1990',55,4),(2505,21,2,'2012-04-09','1990',55,4),(2506,22,2,'2012-05-08','1990',55,4),(2507,23,2,'2012-07-09','1990',55,4),(2508,24,2,'2012-08-08','1990',55,4),(2509,25,2,'2012-09-10','1990',55,4),(2510,26,2,'2012-10-08','1990',55,4),(2511,27,2,'2012-11-08','1990',55,4),(2512,28,2,'2012-12-10','1990',55,4),(2513,29,2,'2013-01-08','1990',55,4),(2514,30,2,'2013-02-08','1990',55,4),(2515,31,2,'2013-03-08','1990',55,4),(2516,32,2,'2013-04-08','1990',55,4),(2517,33,2,'2013-05-08','1990',55,4),(2518,34,2,'2013-06-10','1990',55,4),(2519,35,2,'2013-07-08','1990',55,4),(2520,36,2,'2013-08-08','1990',55,4),(2521,37,2,'2013-09-09','1990',55,4),(2522,38,2,'2013-10-08','1990',55,4),(2523,39,2,'2013-11-08','1990',55,4),(2524,40,2,'2013-12-09','1990',55,4),(2525,41,2,'2014-01-08','1990',55,4),(2526,42,2,'2014-02-10','1990',55,4),(2527,43,2,'2014-03-10','1990',55,4),(2528,44,2,'2014-04-08','1990',55,4),(2529,45,2,'2014-05-08','1990',55,4),(2530,46,2,'2014-06-09','1990',55,4),(2531,1,2,'2010-08-23','1990',56,4),(2532,2,2,'2010-09-08','1990',56,4),(2533,3,2,'2010-10-08','1990',56,4),(2534,4,2,'2010-11-08','1990',56,4),(2535,5,2,'2010-12-08','1990',56,4),(2536,6,2,'2011-01-10','1990',56,4),(2537,7,2,'2011-02-08','1990',56,4),(2538,8,2,'2011-03-09','1990',56,4),(2539,9,2,'2011-04-08','1990',56,4),(2540,10,2,'2011-05-09','1990',56,4),(2541,11,2,'2011-06-08','1990',56,4),(2542,12,2,'2011-07-08','1990',56,4),(2543,13,2,'2011-08-08','1990',56,4),(2544,14,2,'2011-09-08','1990',56,4),(2545,15,2,'2011-10-10','1990',56,4),(2546,16,2,'2011-11-08','1990',56,4),(2547,17,2,'2011-12-08','1990',56,4),(2548,18,2,'2012-01-09','1990',56,4),(2549,19,2,'2012-02-08','1990',56,4),(2550,20,2,'2012-03-08','1990',56,4),(2551,21,2,'2012-04-09','1990',56,4),(2552,22,2,'2012-05-08','1990',56,4),(2553,23,2,'2012-07-09','1990',56,4),(2554,24,2,'2012-08-08','1990',56,4),(2555,25,2,'2012-09-10','1990',56,4),(2556,26,2,'2012-10-08','1990',56,4),(2557,27,2,'2012-11-08','1990',56,4),(2558,28,2,'2012-12-10','1990',56,4),(2559,29,2,'2013-01-08','1990',56,4),(2560,30,2,'2013-02-08','1990',56,4),(2561,31,2,'2013-03-08','1990',56,4),(2562,32,2,'2013-04-08','1990',56,4),(2563,33,2,'2013-05-08','1990',56,4),(2564,34,2,'2013-06-10','1990',56,4),(2565,35,2,'2013-07-08','1990',56,4),(2566,36,2,'2013-08-08','1990',56,4),(2567,37,2,'2013-09-09','1990',56,4),(2568,38,2,'2013-10-08','1990',56,4),(2569,39,2,'2013-11-08','1990',56,4),(2570,40,2,'2013-12-09','1990',56,4),(2571,41,2,'2014-01-08','1990',56,4),(2572,42,2,'2014-02-10','1990',56,4),(2573,43,2,'2014-03-10','1990',56,4),(2574,44,2,'2014-04-08','1990',56,4),(2575,45,2,'2014-05-08','1990',56,4),(2576,46,2,'2014-06-09','1990',56,4),(2577,1,2,'2010-08-23','1990',57,4),(2578,2,2,'2010-09-08','1990',57,4),(2579,3,2,'2010-10-08','1990',57,4),(2580,4,2,'2010-11-08','1990',57,4),(2581,5,2,'2010-12-08','1990',57,4),(2582,6,2,'2011-01-10','1990',57,4),(2583,7,2,'2011-02-08','1990',57,4),(2584,8,2,'2011-03-09','1990',57,4),(2585,9,2,'2011-04-08','1990',57,4),(2586,10,2,'2011-05-09','1990',57,4),(2587,11,2,'2011-06-08','1990',57,4),(2588,12,2,'2011-07-08','1990',57,4),(2589,13,2,'2011-08-08','1990',57,4),(2590,14,2,'2011-09-08','1990',57,4),(2591,15,2,'2011-10-10','1990',57,4),(2592,16,2,'2011-11-08','1990',57,4),(2593,17,2,'2011-12-08','1990',57,4),(2594,18,2,'2012-01-09','1990',57,4),(2595,19,2,'2012-02-08','1990',57,4),(2596,20,2,'2012-03-08','1990',57,4),(2597,21,2,'2012-04-09','1990',57,4),(2598,22,2,'2012-05-08','1990',57,4),(2599,23,2,'2012-07-09','1990',57,4),(2600,24,2,'2012-08-08','1990',57,4),(2601,25,2,'2012-09-10','1990',57,4),(2602,26,2,'2012-10-08','1990',57,4),(2603,27,2,'2012-11-08','1990',57,4),(2604,28,2,'2012-12-10','1990',57,4),(2605,29,2,'2013-01-08','1990',57,4),(2606,30,2,'2013-02-08','1990',57,4),(2607,31,2,'2013-03-08','1990',57,4),(2608,32,2,'2013-04-08','1990',57,4),(2609,33,2,'2013-05-08','1990',57,4),(2610,34,2,'2013-06-10','1990',57,4),(2611,35,2,'2013-07-08','1990',57,4),(2612,36,2,'2013-08-08','1990',57,4),(2613,37,2,'2013-09-09','1990',57,4),(2614,38,2,'2013-10-08','1990',57,4),(2615,39,2,'2013-11-08','1990',57,4),(2616,40,2,'2013-12-09','1990',57,4),(2617,41,2,'2014-01-08','1990',57,4),(2618,42,2,'2014-02-10','1990',57,4),(2619,43,2,'2014-03-10','1990',57,4),(2620,44,2,'2014-04-08','1990',57,4),(2621,45,2,'2014-05-08','1990',57,4),(2622,46,2,'2014-06-09','1990',57,4),(2623,1,2,'2010-08-23','1990',58,4),(2624,2,2,'2010-09-08','1990',58,4),(2625,3,2,'2010-10-08','1990',58,4),(2626,4,2,'2010-11-08','1990',58,4),(2627,5,2,'2010-12-08','1990',58,4),(2628,6,2,'2011-01-10','1990',58,4),(2629,7,2,'2011-02-08','1990',58,4),(2630,8,2,'2011-03-09','1990',58,4),(2631,9,2,'2011-04-08','1990',58,4),(2632,10,2,'2011-05-09','1990',58,4),(2633,11,2,'2011-06-08','1990',58,4),(2634,12,2,'2011-07-08','1990',58,4),(2635,13,2,'2011-08-08','1990',58,4),(2636,14,2,'2011-09-08','1990',58,4),(2637,15,2,'2011-10-10','1990',58,4),(2638,16,2,'2011-11-08','1990',58,4),(2639,17,2,'2011-12-08','1990',58,4),(2640,18,2,'2012-01-09','1990',58,4),(2641,19,2,'2012-02-08','1990',58,4),(2642,20,2,'2012-03-08','1990',58,4),(2643,21,2,'2012-04-09','1990',58,4),(2644,22,2,'2012-05-08','1990',58,4),(2645,23,2,'2012-07-09','1990',58,4),(2646,24,2,'2012-08-08','1990',58,4),(2647,25,2,'2012-09-10','1990',58,4),(2648,26,2,'2012-10-08','1990',58,4),(2649,27,2,'2012-11-08','1990',58,4),(2650,28,2,'2012-12-10','1990',58,4),(2651,29,2,'2013-01-08','1990',58,4),(2652,30,2,'2013-02-08','1990',58,4),(2653,31,2,'2013-03-08','1990',58,4),(2654,32,2,'2013-04-08','1990',58,4),(2655,33,2,'2013-05-08','1990',58,4),(2656,34,2,'2013-06-10','1990',58,4),(2657,35,2,'2013-07-08','1990',58,4),(2658,36,2,'2013-08-08','1990',58,4),(2659,37,2,'2013-09-09','1990',58,4),(2660,38,2,'2013-10-08','1990',58,4),(2661,39,2,'2013-11-08','1990',58,4),(2662,40,2,'2013-12-09','1990',58,4),(2663,41,2,'2014-01-08','1990',58,4),(2664,42,2,'2014-02-10','1990',58,4),(2665,43,2,'2014-03-10','1990',58,4),(2666,44,2,'2014-04-08','1990',58,4),(2667,45,2,'2014-05-08','1990',58,4),(2668,46,2,'2014-06-09','1990',58,4),(2669,1,2,'2010-08-23','1990',59,4),(2670,2,2,'2010-09-08','1990',59,4),(2671,3,2,'2010-10-08','1990',59,4),(2672,4,2,'2010-11-08','1990',59,4),(2673,5,2,'2010-12-08','1990',59,4),(2674,6,2,'2011-01-10','1990',59,4),(2675,7,2,'2011-02-08','1990',59,4),(2676,8,2,'2011-03-09','1990',59,4),(2677,9,2,'2011-04-08','1990',59,4),(2678,10,2,'2011-05-09','1990',59,4),(2679,11,2,'2011-06-08','1990',59,4),(2680,12,2,'2011-07-08','1990',59,4),(2681,13,2,'2011-08-08','1990',59,4),(2682,14,2,'2011-09-08','1990',59,4),(2683,15,2,'2011-10-10','1990',59,4),(2684,16,2,'2011-11-08','1990',59,4),(2685,17,2,'2011-12-08','1990',59,4),(2686,18,2,'2012-01-09','1990',59,4),(2687,19,2,'2012-02-08','1990',59,4),(2688,20,2,'2012-03-08','1990',59,4),(2689,21,2,'2012-04-09','1990',59,4),(2690,22,2,'2012-05-08','1990',59,4),(2691,23,2,'2012-07-09','1990',59,4),(2692,24,2,'2012-08-08','1990',59,4),(2693,25,2,'2012-09-10','1990',59,4),(2694,26,2,'2012-10-08','1990',59,4),(2695,27,2,'2012-11-08','1990',59,4),(2696,28,2,'2012-12-10','1990',59,4),(2697,29,2,'2013-01-08','1990',59,4),(2698,30,2,'2013-02-08','1990',59,4),(2699,31,2,'2013-03-08','1990',59,4),(2700,32,2,'2013-04-08','1990',59,4),(2701,33,2,'2013-05-08','1990',59,4),(2702,34,2,'2013-06-10','1990',59,4),(2703,35,2,'2013-07-08','1990',59,4),(2704,36,2,'2013-08-08','1990',59,4),(2705,37,2,'2013-09-09','1990',59,4),(2706,38,2,'2013-10-08','1990',59,4),(2707,39,2,'2013-11-08','1990',59,4),(2708,40,2,'2013-12-09','1990',59,4),(2709,41,2,'2014-01-08','1990',59,4),(2710,42,2,'2014-02-10','1990',59,4),(2711,43,2,'2014-03-10','1990',59,4),(2712,44,2,'2014-04-08','1990',59,4),(2713,45,2,'2014-05-08','1990',59,4),(2714,46,2,'2014-06-09','1990',59,4),(2715,1,2,'2010-08-23','1990',60,4),(2716,2,2,'2010-09-08','1990',60,4),(2717,3,2,'2010-10-08','1990',60,4),(2718,4,2,'2010-11-08','1990',60,4),(2719,5,2,'2010-12-08','1990',60,4),(2720,6,2,'2011-01-10','1990',60,4),(2721,7,2,'2011-02-08','1990',60,4),(2722,8,2,'2011-03-09','1990',60,4),(2723,9,2,'2011-04-08','1990',60,4),(2724,10,2,'2011-05-09','1990',60,4),(2725,11,2,'2011-06-08','1990',60,4),(2726,12,2,'2011-07-08','1990',60,4),(2727,13,2,'2011-08-08','1990',60,4),(2728,14,2,'2011-09-08','1990',60,4),(2729,15,2,'2011-10-10','1990',60,4),(2730,16,2,'2011-11-08','1990',60,4),(2731,17,2,'2011-12-08','1990',60,4),(2732,18,2,'2012-01-09','1990',60,4),(2733,19,2,'2012-02-08','1990',60,4),(2734,20,2,'2012-03-08','1990',60,4),(2735,21,2,'2012-04-09','1990',60,4),(2736,22,2,'2012-05-08','1990',60,4),(2737,23,2,'2012-07-09','1990',60,4),(2738,24,2,'2012-08-08','1990',60,4),(2739,25,2,'2012-09-10','1990',60,4),(2740,26,2,'2012-10-08','1990',60,4),(2741,27,2,'2012-11-08','1990',60,4),(2742,28,2,'2012-12-10','1990',60,4),(2743,29,2,'2013-01-08','1990',60,4),(2744,30,2,'2013-02-08','1990',60,4),(2745,31,2,'2013-03-08','1990',60,4),(2746,32,2,'2013-04-08','1990',60,4),(2747,33,2,'2013-05-08','1990',60,4),(2748,34,2,'2013-06-10','1990',60,4),(2749,35,2,'2013-07-08','1990',60,4),(2750,36,2,'2013-08-08','1990',60,4),(2751,37,2,'2013-09-09','1990',60,4),(2752,38,2,'2013-10-08','1990',60,4),(2753,39,2,'2013-11-08','1990',60,4),(2754,40,2,'2013-12-09','1990',60,4),(2755,41,2,'2014-01-08','1990',60,4),(2756,42,2,'2014-02-10','1990',60,4),(2757,43,2,'2014-03-10','1990',60,4),(2758,44,2,'2014-04-08','1990',60,4),(2759,45,2,'2014-05-08','1990',60,4),(2760,46,2,'2014-06-09','1990',60,4),(2761,1,2,'2010-08-23','1990',61,4),(2762,2,2,'2010-09-08','1990',61,4),(2763,3,2,'2010-10-08','1990',61,4),(2764,4,2,'2010-11-08','1990',61,4),(2765,5,2,'2010-12-08','1990',61,4),(2766,6,2,'2011-01-10','1990',61,4),(2767,7,2,'2011-02-08','1990',61,4),(2768,8,2,'2011-03-09','1990',61,4),(2769,9,2,'2011-04-08','1990',61,4),(2770,10,2,'2011-05-09','1990',61,4),(2771,11,2,'2011-06-08','1990',61,4),(2772,12,2,'2011-07-08','1990',61,4),(2773,13,2,'2011-08-08','1990',61,4),(2774,14,2,'2011-09-08','1990',61,4),(2775,15,2,'2011-10-10','1990',61,4),(2776,16,2,'2011-11-08','1990',61,4),(2777,17,2,'2011-12-08','1990',61,4),(2778,18,2,'2012-01-09','1990',61,4),(2779,19,2,'2012-02-08','1990',61,4),(2780,20,2,'2012-03-08','1990',61,4),(2781,21,2,'2012-04-09','1990',61,4),(2782,22,2,'2012-05-08','1990',61,4),(2783,23,2,'2012-07-09','1990',61,4),(2784,24,2,'2012-08-08','1990',61,4),(2785,25,2,'2012-09-10','1990',61,4),(2786,26,2,'2012-10-08','1990',61,4),(2787,27,2,'2012-11-08','1990',61,4),(2788,28,2,'2012-12-10','1990',61,4),(2789,29,2,'2013-01-08','1990',61,4),(2790,30,2,'2013-02-08','1990',61,4),(2791,31,2,'2013-03-08','1990',61,4),(2792,32,2,'2013-04-08','1990',61,4),(2793,33,2,'2013-05-08','1990',61,4),(2794,34,2,'2013-06-10','1990',61,4),(2795,35,2,'2013-07-08','1990',61,4),(2796,36,2,'2013-08-08','1990',61,4),(2797,37,2,'2013-09-09','1990',61,4),(2798,38,2,'2013-10-08','1990',61,4),(2799,39,2,'2013-11-08','1990',61,4),(2800,40,2,'2013-12-09','1990',61,4),(2801,41,2,'2014-01-08','1990',61,4),(2802,42,2,'2014-02-10','1990',61,4),(2803,43,2,'2014-03-10','1990',61,4),(2804,44,2,'2014-04-08','1990',61,4),(2805,45,2,'2014-05-08','1990',61,4),(2806,46,2,'2014-06-09','1990',61,4),(2807,1,2,'2010-08-23','1990',62,4),(2808,2,2,'2010-09-08','1990',62,4),(2809,3,2,'2010-10-08','1990',62,4),(2810,4,2,'2010-11-08','1990',62,4),(2811,5,2,'2010-12-08','1990',62,4),(2812,6,2,'2011-01-10','1990',62,4),(2813,7,2,'2011-02-08','1990',62,4),(2814,8,2,'2011-03-09','1990',62,4),(2815,9,2,'2011-04-08','1990',62,4),(2816,10,2,'2011-05-09','1990',62,4),(2817,11,2,'2011-06-08','1990',62,4),(2818,12,2,'2011-07-08','1990',62,4),(2819,13,2,'2011-08-08','1990',62,4),(2820,14,2,'2011-09-08','1990',62,4),(2821,15,2,'2011-10-10','1990',62,4),(2822,16,2,'2011-11-08','1990',62,4),(2823,17,2,'2011-12-08','1990',62,4),(2824,18,2,'2012-01-09','1990',62,4),(2825,19,2,'2012-02-08','1990',62,4),(2826,20,2,'2012-03-08','1990',62,4),(2827,21,2,'2012-04-09','1990',62,4),(2828,22,2,'2012-05-08','1990',62,4),(2829,23,2,'2012-07-09','1990',62,4),(2830,24,2,'2012-08-08','1990',62,4),(2831,25,2,'2012-09-10','1990',62,4),(2832,26,2,'2012-10-08','1990',62,4),(2833,27,2,'2012-11-08','1990',62,4),(2834,28,2,'2012-12-10','1990',62,4),(2835,29,2,'2013-01-08','1990',62,4),(2836,30,2,'2013-02-08','1990',62,4),(2837,31,2,'2013-03-08','1990',62,4),(2838,32,2,'2013-04-08','1990',62,4),(2839,33,2,'2013-05-08','1990',62,4),(2840,34,2,'2013-06-10','1990',62,4),(2841,35,2,'2013-07-08','1990',62,4),(2842,36,2,'2013-08-08','1990',62,4),(2843,37,2,'2013-09-09','1990',62,4),(2844,38,2,'2013-10-08','1990',62,4),(2845,39,2,'2013-11-08','1990',62,4),(2846,40,2,'2013-12-09','1990',62,4),(2847,41,2,'2014-01-08','1990',62,4),(2848,42,2,'2014-02-10','1990',62,4),(2849,43,2,'2014-03-10','1990',62,4),(2850,44,2,'2014-04-08','1990',62,4),(2851,45,2,'2014-05-08','1990',62,4),(2852,46,2,'2014-06-09','1990',62,4),(2853,1,2,'2010-08-23','1990',63,4),(2854,2,2,'2010-09-08','1990',63,4),(2855,3,2,'2010-10-08','1990',63,4),(2856,4,2,'2010-11-08','1990',63,4),(2857,5,2,'2010-12-08','1990',63,4),(2858,6,2,'2011-01-10','1990',63,4),(2859,7,2,'2011-02-08','1990',63,4),(2860,8,2,'2011-03-09','1990',63,4),(2861,9,2,'2011-04-08','1990',63,4),(2862,10,2,'2011-05-09','1990',63,4),(2863,11,2,'2011-06-08','1990',63,4),(2864,12,2,'2011-07-08','1990',63,4),(2865,13,2,'2011-08-08','1990',63,4),(2866,14,2,'2011-09-08','1990',63,4),(2867,15,2,'2011-10-10','1990',63,4),(2868,16,2,'2011-11-08','1990',63,4),(2869,17,2,'2011-12-08','1990',63,4),(2870,18,2,'2012-01-09','1990',63,4),(2871,19,2,'2012-02-08','1990',63,4),(2872,20,2,'2012-03-08','1990',63,4),(2873,21,2,'2012-04-09','1990',63,4),(2874,22,2,'2012-05-08','1990',63,4),(2875,23,2,'2012-07-09','1990',63,4),(2876,24,2,'2012-08-08','1990',63,4),(2877,25,2,'2012-09-10','1990',63,4),(2878,26,2,'2012-10-08','1990',63,4),(2879,27,2,'2012-11-08','1990',63,4),(2880,28,2,'2012-12-10','1990',63,4),(2881,29,2,'2013-01-08','1990',63,4),(2882,30,2,'2013-02-08','1990',63,4),(2883,31,2,'2013-03-08','1990',63,4),(2884,32,2,'2013-04-08','1990',63,4),(2885,33,2,'2013-05-08','1990',63,4),(2886,34,2,'2013-06-10','1990',63,4),(2887,35,2,'2013-07-08','1990',63,4),(2888,36,2,'2013-08-08','1990',63,4),(2889,37,2,'2013-09-09','1990',63,4),(2890,38,2,'2013-10-08','1990',63,4),(2891,39,2,'2013-11-08','1990',63,4),(2892,40,2,'2013-12-09','1990',63,4),(2893,41,2,'2014-01-08','1990',63,4),(2894,42,2,'2014-02-10','1990',63,4),(2895,43,2,'2014-03-10','1990',63,4),(2896,44,2,'2014-04-08','1990',63,4),(2897,45,2,'2014-05-08','1990',63,4),(2898,46,2,'2014-06-09','1990',63,4),(2899,1,2,'2010-08-23','1990',64,4),(2900,2,2,'2010-09-08','1990',64,4),(2901,3,2,'2010-10-08','1990',64,4),(2902,4,2,'2010-11-08','1990',64,4),(2903,5,2,'2010-12-08','1990',64,4),(2904,6,2,'2011-01-10','1990',64,4),(2905,7,2,'2011-02-08','1990',64,4),(2906,8,2,'2011-03-09','1990',64,4),(2907,9,2,'2011-04-08','1990',64,4),(2908,10,2,'2011-05-09','1990',64,4),(2909,11,2,'2011-06-08','1990',64,4),(2910,12,2,'2011-07-08','1990',64,4),(2911,13,2,'2011-08-08','1990',64,4),(2912,14,2,'2011-09-08','1990',64,4),(2913,15,2,'2011-10-10','1990',64,4),(2914,16,2,'2011-11-08','1990',64,4),(2915,17,2,'2011-12-08','1990',64,4),(2916,18,2,'2012-01-09','1990',64,4),(2917,19,2,'2012-02-08','1990',64,4),(2918,20,2,'2012-03-08','1990',64,4),(2919,21,2,'2012-04-09','1990',64,4),(2920,22,2,'2012-05-08','1990',64,4),(2921,23,2,'2012-07-09','1990',64,4),(2922,24,2,'2012-08-08','1990',64,4),(2923,25,2,'2012-09-10','1990',64,4),(2924,26,2,'2012-10-08','1990',64,4),(2925,27,2,'2012-11-08','1990',64,4),(2926,28,2,'2012-12-10','1990',64,4),(2927,29,2,'2013-01-08','1990',64,4),(2928,30,2,'2013-02-08','1990',64,4),(2929,31,2,'2013-03-08','1990',64,4),(2930,32,2,'2013-04-08','1990',64,4),(2931,33,2,'2013-05-08','1990',64,4),(2932,34,2,'2013-06-10','1990',64,4),(2933,35,2,'2013-07-08','1990',64,4),(2934,36,2,'2013-08-08','1990',64,4),(2935,37,2,'2013-09-09','1990',64,4),(2936,38,2,'2013-10-08','1990',64,4),(2937,39,2,'2013-11-08','1990',64,4),(2938,40,2,'2013-12-09','1990',64,4),(2939,41,2,'2014-01-08','1990',64,4),(2940,42,2,'2014-02-10','1990',64,4),(2941,43,2,'2014-03-10','1990',64,4),(2942,44,2,'2014-04-08','1990',64,4),(2943,45,2,'2014-05-08','1990',64,4),(2944,46,2,'2014-06-09','1990',64,4),(2945,1,2,'2010-08-23','1990',65,4),(2946,2,2,'2010-09-08','1990',65,4),(2947,3,2,'2010-10-08','1990',65,4),(2948,4,2,'2010-11-08','1990',65,4),(2949,5,2,'2010-12-08','1990',65,4),(2950,6,2,'2011-01-10','1990',65,4),(2951,7,2,'2011-02-08','1990',65,4),(2952,8,2,'2011-03-09','1990',65,4),(2953,9,2,'2011-04-08','1990',65,4),(2954,10,2,'2011-05-09','1990',65,4),(2955,11,2,'2011-06-08','1990',65,4),(2956,12,2,'2011-07-08','1990',65,4),(2957,13,2,'2011-08-08','1990',65,4),(2958,14,2,'2011-09-08','1990',65,4),(2959,15,2,'2011-10-10','1990',65,4),(2960,16,2,'2011-11-08','1990',65,4),(2961,17,2,'2011-12-08','1990',65,4),(2962,18,2,'2012-01-09','1990',65,4),(2963,19,2,'2012-02-08','1990',65,4),(2964,20,2,'2012-03-08','1990',65,4),(2965,21,2,'2012-04-09','1990',65,4),(2966,22,2,'2012-05-08','1990',65,4),(2967,23,2,'2012-07-09','1990',65,4),(2968,24,2,'2012-08-08','1990',65,4),(2969,25,2,'2012-09-10','1990',65,4),(2970,26,2,'2012-10-08','1990',65,4),(2971,27,2,'2012-11-08','1990',65,4),(2972,28,2,'2012-12-10','1990',65,4),(2973,29,2,'2013-01-08','1990',65,4),(2974,30,2,'2013-02-08','1990',65,4),(2975,31,2,'2013-03-08','1990',65,4),(2976,32,2,'2013-04-08','1990',65,4),(2977,33,2,'2013-05-08','1990',65,4),(2978,34,2,'2013-06-10','1990',65,4),(2979,35,2,'2013-07-08','1990',65,4),(2980,36,2,'2013-08-08','1990',65,4),(2981,37,2,'2013-09-09','1990',65,4),(2982,38,2,'2013-10-08','1990',65,4),(2983,39,2,'2013-11-08','1990',65,4),(2984,40,2,'2013-12-09','1990',65,4),(2985,41,2,'2014-01-08','1990',65,4),(2986,42,2,'2014-02-10','1990',65,4),(2987,43,2,'2014-03-10','1990',65,4),(2988,44,2,'2014-04-08','1990',65,4),(2989,45,2,'2014-05-08','1990',65,4),(2990,46,2,'2014-06-09','1990',65,4),(2991,1,2,'2010-08-23','1990',66,4),(2992,2,2,'2010-09-08','1990',66,4),(2993,3,2,'2010-10-08','1990',66,4),(2994,4,2,'2010-11-08','1990',66,4),(2995,5,2,'2010-12-08','1990',66,4),(2996,6,2,'2011-01-10','1990',66,4),(2997,7,2,'2011-02-08','1990',66,4),(2998,8,2,'2011-03-09','1990',66,4),(2999,9,2,'2011-04-08','1990',66,4),(3000,10,2,'2011-05-09','1990',66,4),(3001,11,2,'2011-06-08','1990',66,4),(3002,12,2,'2011-07-08','1990',66,4),(3003,13,2,'2011-08-08','1990',66,4),(3004,14,2,'2011-09-08','1990',66,4),(3005,15,2,'2011-10-10','1990',66,4),(3006,16,2,'2011-11-08','1990',66,4),(3007,17,2,'2011-12-08','1990',66,4),(3008,18,2,'2012-01-09','1990',66,4),(3009,19,2,'2012-02-08','1990',66,4),(3010,20,2,'2012-03-08','1990',66,4),(3011,21,2,'2012-04-09','1990',66,4),(3012,22,2,'2012-05-08','1990',66,4),(3013,23,2,'2012-07-09','1990',66,4),(3014,24,2,'2012-08-08','1990',66,4),(3015,25,2,'2012-09-10','1990',66,4),(3016,26,2,'2012-10-08','1990',66,4),(3017,27,2,'2012-11-08','1990',66,4),(3018,28,2,'2012-12-10','1990',66,4),(3019,29,2,'2013-01-08','1990',66,4),(3020,30,2,'2013-02-08','1990',66,4),(3021,31,2,'2013-03-08','1990',66,4),(3022,32,2,'2013-04-08','1990',66,4),(3023,33,2,'2013-05-08','1990',66,4),(3024,34,2,'2013-06-10','1990',66,4),(3025,35,2,'2013-07-08','1990',66,4),(3026,36,2,'2013-08-08','1990',66,4),(3027,37,2,'2013-09-09','1990',66,4),(3028,38,2,'2013-10-08','1990',66,4),(3029,39,2,'2013-11-08','1990',66,4),(3030,40,2,'2013-12-09','1990',66,4),(3031,41,2,'2014-01-08','1990',66,4),(3032,42,2,'2014-02-10','1990',66,4),(3033,43,2,'2014-03-10','1990',66,4),(3034,44,2,'2014-04-08','1990',66,4),(3035,45,2,'2014-05-08','1990',66,4),(3036,46,2,'2014-06-09','1990',66,4),(3037,1,2,'2010-08-23','1990',67,4),(3038,2,2,'2010-09-08','1990',67,4),(3039,3,2,'2010-10-08','1990',67,4),(3040,4,2,'2010-11-08','1990',67,4),(3041,5,2,'2010-12-08','1990',67,4),(3042,6,2,'2011-01-10','1990',67,4),(3043,7,2,'2011-02-08','1990',67,4),(3044,8,2,'2011-03-09','1990',67,4),(3045,9,2,'2011-04-08','1990',67,4),(3046,10,2,'2011-05-09','1990',67,4),(3047,11,2,'2011-06-08','1990',67,4),(3048,12,2,'2011-07-08','1990',67,4),(3049,13,2,'2011-08-08','1990',67,4),(3050,14,2,'2011-09-08','1990',67,4),(3051,15,2,'2011-10-10','1990',67,4),(3052,16,2,'2011-11-08','1990',67,4),(3053,17,2,'2011-12-08','1990',67,4),(3054,18,2,'2012-01-09','1990',67,4),(3055,19,2,'2012-02-08','1990',67,4),(3056,20,2,'2012-03-08','1990',67,4),(3057,21,2,'2012-04-09','1990',67,4),(3058,22,2,'2012-05-08','1990',67,4),(3059,23,2,'2012-07-09','1990',67,4),(3060,24,2,'2012-08-08','1990',67,4),(3061,25,2,'2012-09-10','1990',67,4),(3062,26,2,'2012-10-08','1990',67,4),(3063,27,2,'2012-11-08','1990',67,4),(3064,28,2,'2012-12-10','1990',67,4),(3065,29,2,'2013-01-08','1990',67,4),(3066,30,2,'2013-02-08','1990',67,4),(3067,31,2,'2013-03-08','1990',67,4),(3068,32,2,'2013-04-08','1990',67,4),(3069,33,2,'2013-05-08','1990',67,4),(3070,34,2,'2013-06-10','1990',67,4),(3071,35,2,'2013-07-08','1990',67,4),(3072,36,2,'2013-08-08','1990',67,4),(3073,37,2,'2013-09-09','1990',67,4),(3074,38,2,'2013-10-08','1990',67,4),(3075,39,2,'2013-11-08','1990',67,4),(3076,40,2,'2013-12-09','1990',67,4),(3077,41,2,'2014-01-08','1990',67,4),(3078,42,2,'2014-02-10','1990',67,4),(3079,43,2,'2014-03-10','1990',67,4),(3080,44,2,'2014-04-08','1990',67,4),(3081,45,2,'2014-05-08','1990',67,4),(3082,46,2,'2014-06-09','1990',67,4),(3083,1,2,'2010-08-23','1990',68,4),(3084,2,2,'2010-09-08','1990',68,4),(3085,3,2,'2010-10-08','1990',68,4),(3086,4,2,'2010-11-08','1990',68,4),(3087,5,2,'2010-12-08','1990',68,4),(3088,6,2,'2011-01-10','1990',68,4),(3089,7,2,'2011-02-08','1990',68,4),(3090,8,2,'2011-03-09','1990',68,4),(3091,9,2,'2011-04-08','1990',68,4),(3092,10,2,'2011-05-09','1990',68,4),(3093,11,2,'2011-06-08','1990',68,4),(3094,12,2,'2011-07-08','1990',68,4),(3095,13,2,'2011-08-08','1990',68,4),(3096,14,2,'2011-09-08','1990',68,4),(3097,15,2,'2011-10-10','1990',68,4),(3098,16,2,'2011-11-08','1990',68,4),(3099,17,2,'2011-12-08','1990',68,4),(3100,18,2,'2012-01-09','1990',68,4),(3101,19,2,'2012-02-08','1990',68,4),(3102,20,2,'2012-03-08','1990',68,4),(3103,21,2,'2012-04-09','1990',68,4),(3104,22,2,'2012-05-08','1990',68,4),(3105,23,2,'2012-07-09','1990',68,4),(3106,24,2,'2012-08-08','1990',68,4),(3107,25,2,'2012-09-10','1990',68,4),(3108,26,2,'2012-10-08','1990',68,4),(3109,27,2,'2012-11-08','1990',68,4),(3110,28,2,'2012-12-10','1990',68,4),(3111,29,2,'2013-01-08','1990',68,4),(3112,30,2,'2013-02-08','1990',68,4),(3113,31,2,'2013-03-08','1990',68,4),(3114,32,2,'2013-04-08','1990',68,4),(3115,33,2,'2013-05-08','1990',68,4),(3116,34,2,'2013-06-10','1990',68,4),(3117,35,2,'2013-07-08','1990',68,4),(3118,36,2,'2013-08-08','1990',68,4),(3119,37,2,'2013-09-09','1990',68,4),(3120,38,2,'2013-10-08','1990',68,4),(3121,39,2,'2013-11-08','1990',68,4),(3122,40,2,'2013-12-09','1990',68,4),(3123,41,2,'2014-01-08','1990',68,4),(3124,42,2,'2014-02-10','1990',68,4),(3125,43,2,'2014-03-10','1990',68,4),(3126,44,2,'2014-04-08','1990',68,4),(3127,45,2,'2014-05-08','1990',68,4),(3128,46,2,'2014-06-09','1990',68,4),(3129,1,2,'2010-08-23','1990',69,4),(3130,2,2,'2010-09-08','1990',69,4),(3131,3,2,'2010-10-08','1990',69,4),(3132,4,2,'2010-11-08','1990',69,4),(3133,5,2,'2010-12-08','1990',69,4),(3134,6,2,'2011-01-10','1990',69,4),(3135,7,2,'2011-02-08','1990',69,4),(3136,8,2,'2011-03-09','1990',69,4),(3137,9,2,'2011-04-08','1990',69,4),(3138,10,2,'2011-05-09','1990',69,4),(3139,11,2,'2011-06-08','1990',69,4),(3140,12,2,'2011-07-08','1990',69,4),(3141,13,2,'2011-08-08','1990',69,4),(3142,14,2,'2011-09-08','1990',69,4),(3143,15,2,'2011-10-10','1990',69,4),(3144,16,2,'2011-11-08','1990',69,4),(3145,17,2,'2011-12-08','1990',69,4),(3146,18,2,'2012-01-09','1990',69,4),(3147,19,2,'2012-02-08','1990',69,4),(3148,20,2,'2012-03-08','1990',69,4),(3149,21,2,'2012-04-09','1990',69,4),(3150,22,2,'2012-05-08','1990',69,4),(3151,23,2,'2012-07-09','1990',69,4),(3152,24,2,'2012-08-08','1990',69,4),(3153,25,2,'2012-09-10','1990',69,4),(3154,26,2,'2012-10-08','1990',69,4),(3155,27,2,'2012-11-08','1990',69,4),(3156,28,2,'2012-12-10','1990',69,4),(3157,29,2,'2013-01-08','1990',69,4),(3158,30,2,'2013-02-08','1990',69,4),(3159,31,2,'2013-03-08','1990',69,4),(3160,32,2,'2013-04-08','1990',69,4),(3161,33,2,'2013-05-08','1990',69,4),(3162,34,2,'2013-06-10','1990',69,4),(3163,35,2,'2013-07-08','1990',69,4),(3164,36,2,'2013-08-08','1990',69,4),(3165,37,2,'2013-09-09','1990',69,4),(3166,38,2,'2013-10-08','1990',69,4),(3167,39,2,'2013-11-08','1990',69,4),(3168,40,2,'2013-12-09','1990',69,4),(3169,41,2,'2014-01-08','1990',69,4),(3170,42,2,'2014-02-10','1990',69,4),(3171,43,2,'2014-03-10','1990',69,4),(3172,44,2,'2014-04-08','1990',69,4),(3173,45,2,'2014-05-08','1990',69,4),(3174,46,2,'2014-06-09','1990',69,4),(3175,1,2,'2010-08-23','1990',70,4),(3176,2,2,'2010-09-08','1990',70,4),(3177,3,2,'2010-10-08','1990',70,4),(3178,4,2,'2010-11-08','1990',70,4),(3179,5,2,'2010-12-08','1990',70,4),(3180,6,2,'2011-01-10','1990',70,4),(3181,7,2,'2011-02-08','1990',70,4),(3182,8,2,'2011-03-09','1990',70,4),(3183,9,2,'2011-04-08','1990',70,4),(3184,10,2,'2011-05-09','1990',70,4),(3185,11,2,'2011-06-08','1990',70,4),(3186,12,2,'2011-07-08','1990',70,4),(3187,13,2,'2011-08-08','1990',70,4),(3188,14,2,'2011-09-08','1990',70,4),(3189,15,2,'2011-10-10','1990',70,4),(3190,16,2,'2011-11-08','1990',70,4),(3191,17,2,'2011-12-08','1990',70,4),(3192,18,2,'2012-01-09','1990',70,4),(3193,19,2,'2012-02-08','1990',70,4),(3194,20,2,'2012-03-08','1990',70,4),(3195,21,2,'2012-04-09','1990',70,4),(3196,22,2,'2012-05-08','1990',70,4),(3197,23,2,'2012-07-09','1990',70,4),(3198,24,2,'2012-08-08','1990',70,4),(3199,25,2,'2012-09-10','1990',70,4),(3200,26,2,'2012-10-08','1990',70,4),(3201,27,2,'2012-11-08','1990',70,4),(3202,28,2,'2012-12-10','1990',70,4),(3203,29,2,'2013-01-08','1990',70,4),(3204,30,2,'2013-02-08','1990',70,4),(3205,31,2,'2013-03-08','1990',70,4),(3206,32,2,'2013-04-08','1990',70,4),(3207,33,2,'2013-05-08','1990',70,4),(3208,34,2,'2013-06-10','1990',70,4),(3209,35,2,'2013-07-08','1990',70,4),(3210,36,2,'2013-08-08','1990',70,4),(3211,37,2,'2013-09-09','1990',70,4),(3212,38,2,'2013-10-08','1990',70,4),(3213,39,2,'2013-11-08','1990',70,4),(3214,40,2,'2013-12-09','1990',70,4),(3215,41,2,'2014-01-08','1990',70,4),(3216,42,2,'2014-02-10','1990',70,4),(3217,43,2,'2014-03-10','1990',70,4),(3218,44,2,'2014-04-08','1990',70,4),(3219,45,2,'2014-05-08','1990',70,4),(3220,46,2,'2014-06-09','1990',70,4),(3221,1,2,'2010-08-23','1990',71,4),(3222,2,2,'2010-09-08','1990',71,4),(3223,3,2,'2010-10-08','1990',71,4),(3224,4,2,'2010-11-08','1990',71,4),(3225,5,2,'2010-12-08','1990',71,4),(3226,6,2,'2011-01-10','1990',71,4),(3227,7,2,'2011-02-08','1990',71,4),(3228,8,2,'2011-03-09','1990',71,4),(3229,9,2,'2011-04-08','1990',71,4),(3230,10,2,'2011-05-09','1990',71,4),(3231,11,2,'2011-06-08','1990',71,4),(3232,12,2,'2011-07-08','1990',71,4),(3233,13,2,'2011-08-08','1990',71,4),(3234,14,2,'2011-09-08','1990',71,4),(3235,15,2,'2011-10-10','1990',71,4),(3236,16,2,'2011-11-08','1990',71,4),(3237,17,2,'2011-12-08','1990',71,4),(3238,18,2,'2012-01-09','1990',71,4),(3239,19,2,'2012-02-08','1990',71,4),(3240,20,2,'2012-03-08','1990',71,4),(3241,21,2,'2012-04-09','1990',71,4),(3242,22,2,'2012-05-08','1990',71,4),(3243,23,2,'2012-07-09','1990',71,4),(3244,24,2,'2012-08-08','1990',71,4),(3245,25,2,'2012-09-10','1990',71,4),(3246,26,2,'2012-10-08','1990',71,4),(3247,27,2,'2012-11-08','1990',71,4),(3248,28,2,'2012-12-10','1990',71,4),(3249,29,2,'2013-01-08','1990',71,4),(3250,30,2,'2013-02-08','1990',71,4),(3251,31,2,'2013-03-08','1990',71,4),(3252,32,2,'2013-04-08','1990',71,4),(3253,33,2,'2013-05-08','1990',71,4),(3254,34,2,'2013-06-10','1990',71,4),(3255,35,2,'2013-07-08','1990',71,4),(3256,36,2,'2013-08-08','1990',71,4),(3257,37,2,'2013-09-09','1990',71,4),(3258,38,2,'2013-10-08','1990',71,4),(3259,39,2,'2013-11-08','1990',71,4),(3260,40,2,'2013-12-09','1990',71,4),(3261,41,2,'2014-01-08','1990',71,4),(3262,42,2,'2014-02-10','1990',71,4),(3263,43,2,'2014-03-10','1990',71,4),(3264,44,2,'2014-04-08','1990',71,4),(3265,45,2,'2014-05-08','1990',71,4),(3266,46,2,'2014-06-09','1990',71,4),(3267,1,2,'2010-08-23','1990',72,4),(3268,2,2,'2010-09-08','1990',72,4),(3269,3,2,'2010-10-08','1990',72,4),(3270,4,2,'2010-11-08','1990',72,4),(3271,5,2,'2010-12-08','1990',72,4),(3272,6,2,'2011-01-10','1990',72,4),(3273,7,2,'2011-02-08','1990',72,4),(3274,8,2,'2011-03-09','1990',72,4),(3275,9,2,'2011-04-08','1990',72,4),(3276,10,2,'2011-05-09','1990',72,4),(3277,11,2,'2011-06-08','1990',72,4),(3278,12,2,'2011-07-08','1990',72,4),(3279,13,2,'2011-08-08','1990',72,4),(3280,14,2,'2011-09-08','1990',72,4),(3281,15,2,'2011-10-10','1990',72,4),(3282,16,2,'2011-11-08','1990',72,4),(3283,17,2,'2011-12-08','1990',72,4),(3284,18,2,'2012-01-09','1990',72,4),(3285,19,2,'2012-02-08','1990',72,4),(3286,20,2,'2012-03-08','1990',72,4),(3287,21,2,'2012-04-09','1990',72,4),(3288,22,2,'2012-05-08','1990',72,4),(3289,23,2,'2012-07-09','1990',72,4),(3290,24,2,'2012-08-08','1990',72,4),(3291,25,2,'2012-09-10','1990',72,4),(3292,26,2,'2012-10-08','1990',72,4),(3293,27,2,'2012-11-08','1990',72,4),(3294,28,2,'2012-12-10','1990',72,4),(3295,29,2,'2013-01-08','1990',72,4),(3296,30,2,'2013-02-08','1990',72,4),(3297,31,2,'2013-03-08','1990',72,4),(3298,32,2,'2013-04-08','1990',72,4),(3299,33,2,'2013-05-08','1990',72,4),(3300,34,2,'2013-06-10','1990',72,4),(3301,35,2,'2013-07-08','1990',72,4),(3302,36,2,'2013-08-08','1990',72,4),(3303,37,2,'2013-09-09','1990',72,4),(3304,38,2,'2013-10-08','1990',72,4),(3305,39,2,'2013-11-08','1990',72,4),(3306,40,2,'2013-12-09','1990',72,4),(3307,41,2,'2014-01-08','1990',72,4),(3308,42,2,'2014-02-10','1990',72,4),(3309,43,2,'2014-03-10','1990',72,4),(3310,44,2,'2014-04-08','1990',72,4),(3311,45,2,'2014-05-08','1990',72,4),(3312,46,2,'2014-06-09','1990',72,4),(3313,1,2,'2010-08-23','1990',73,4),(3314,2,2,'2010-09-08','1990',73,4),(3315,3,2,'2010-10-08','1990',73,4),(3316,4,2,'2010-11-08','1990',73,4),(3317,5,2,'2010-12-08','1990',73,4),(3318,6,2,'2011-01-10','1990',73,4),(3319,7,2,'2011-02-08','1990',73,4),(3320,8,2,'2011-03-09','1990',73,4),(3321,9,2,'2011-04-08','1990',73,4),(3322,10,2,'2011-05-09','1990',73,4),(3323,11,2,'2011-06-08','1990',73,4),(3324,12,2,'2011-07-08','1990',73,4),(3325,13,2,'2011-08-08','1990',73,4),(3326,14,2,'2011-09-08','1990',73,4),(3327,15,2,'2011-10-10','1990',73,4),(3328,16,2,'2011-11-08','1990',73,4),(3329,17,2,'2011-12-08','1990',73,4),(3330,18,2,'2012-01-09','1990',73,4),(3331,19,2,'2012-02-08','1990',73,4),(3332,20,2,'2012-03-08','1990',73,4),(3333,21,2,'2012-04-09','1990',73,4),(3334,22,2,'2012-05-08','1990',73,4),(3335,23,2,'2012-07-09','1990',73,4),(3336,24,2,'2012-08-08','1990',73,4),(3337,25,2,'2012-09-10','1990',73,4),(3338,26,2,'2012-10-08','1990',73,4),(3339,27,2,'2012-11-08','1990',73,4),(3340,28,2,'2012-12-10','1990',73,4),(3341,29,2,'2013-01-08','1990',73,4),(3342,30,2,'2013-02-08','1990',73,4),(3343,31,2,'2013-03-08','1990',73,4),(3344,32,2,'2013-04-08','1990',73,4),(3345,33,2,'2013-05-08','1990',73,4),(3346,34,2,'2013-06-10','1990',73,4),(3347,35,2,'2013-07-08','1990',73,4),(3348,36,2,'2013-08-08','1990',73,4),(3349,37,2,'2013-09-09','1990',73,4),(3350,38,2,'2013-10-08','1990',73,4),(3351,39,2,'2013-11-08','1990',73,4),(3352,40,2,'2013-12-09','1990',73,4),(3353,41,2,'2014-01-08','1990',73,4),(3354,42,2,'2014-02-10','1990',73,4),(3355,43,2,'2014-03-10','1990',73,4),(3356,44,2,'2014-04-08','1990',73,4),(3357,45,2,'2014-05-08','1990',73,4),(3358,46,2,'2014-06-09','1990',73,4),(3359,1,2,'2010-08-23','1990',74,4),(3360,2,2,'2010-09-08','1990',74,4),(3361,3,2,'2010-10-08','1990',74,4),(3362,4,2,'2010-11-08','1990',74,4),(3363,5,2,'2010-12-08','1990',74,4),(3364,6,2,'2011-01-10','1990',74,4),(3365,7,2,'2011-02-08','1990',74,4),(3366,8,2,'2011-03-09','1990',74,4),(3367,9,2,'2011-04-08','1990',74,4),(3368,10,2,'2011-05-09','1990',74,4),(3369,11,2,'2011-06-08','1990',74,4),(3370,12,2,'2011-07-08','1990',74,4),(3371,13,2,'2011-08-08','1990',74,4),(3372,14,2,'2011-09-08','1990',74,4),(3373,15,2,'2011-10-10','1990',74,4),(3374,16,2,'2011-11-08','1990',74,4),(3375,17,2,'2011-12-08','1990',74,4),(3376,18,2,'2012-01-09','1990',74,4),(3377,19,2,'2012-02-08','1990',74,4),(3378,20,2,'2012-03-08','1990',74,4),(3379,21,2,'2012-04-09','1990',74,4),(3380,22,2,'2012-05-08','1990',74,4),(3381,23,2,'2012-07-09','1990',74,4),(3382,24,2,'2012-08-08','1990',74,4),(3383,25,2,'2012-09-10','1990',74,4),(3384,26,2,'2012-10-08','1990',74,4),(3385,27,2,'2012-11-08','1990',74,4),(3386,28,2,'2012-12-10','1990',74,4),(3387,29,2,'2013-01-08','1990',74,4),(3388,30,2,'2013-02-08','1990',74,4),(3389,31,2,'2013-03-08','1990',74,4),(3390,32,2,'2013-04-08','1990',74,4),(3391,33,2,'2013-05-08','1990',74,4),(3392,34,2,'2013-06-10','1990',74,4),(3393,35,2,'2013-07-08','1990',74,4),(3394,36,2,'2013-08-08','1990',74,4),(3395,37,2,'2013-09-09','1990',74,4),(3396,38,2,'2013-10-08','1990',74,4),(3397,39,2,'2013-11-08','1990',74,4),(3398,40,2,'2013-12-09','1990',74,4),(3399,41,2,'2014-01-08','1990',74,4),(3400,42,2,'2014-02-10','1990',74,4),(3401,43,2,'2014-03-10','1990',74,4),(3402,44,2,'2014-04-08','1990',74,4),(3403,45,2,'2014-05-08','1990',74,4),(3404,46,2,'2014-06-09','1990',74,4),(3405,1,2,'2010-08-23','1990',75,4),(3406,2,2,'2010-09-08','1990',75,4),(3407,3,2,'2010-10-08','1990',75,4),(3408,4,2,'2010-11-08','1990',75,4),(3409,5,2,'2010-12-08','1990',75,4),(3410,6,2,'2011-01-10','1990',75,4),(3411,7,2,'2011-02-08','1990',75,4),(3412,8,2,'2011-03-09','1990',75,4),(3413,9,2,'2011-04-08','1990',75,4),(3414,10,2,'2011-05-09','1990',75,4),(3415,11,2,'2011-06-08','1990',75,4),(3416,12,2,'2011-07-08','1990',75,4),(3417,13,2,'2011-08-08','1990',75,4),(3418,14,2,'2011-09-08','1990',75,4),(3419,15,2,'2011-10-10','1990',75,4),(3420,16,2,'2011-11-08','1990',75,4),(3421,17,2,'2011-12-08','1990',75,4),(3422,18,2,'2012-01-09','1990',75,4),(3423,19,2,'2012-02-08','1990',75,4),(3424,20,2,'2012-03-08','1990',75,4),(3425,21,2,'2012-04-09','1990',75,4),(3426,22,2,'2012-05-08','1990',75,4),(3427,23,2,'2012-07-09','1990',75,4),(3428,24,2,'2012-08-08','1990',75,4),(3429,25,2,'2012-09-10','1990',75,4),(3430,26,2,'2012-10-08','1990',75,4),(3431,27,2,'2012-11-08','1990',75,4),(3432,28,2,'2012-12-10','1990',75,4),(3433,29,2,'2013-01-08','1990',75,4),(3434,30,2,'2013-02-08','1990',75,4),(3435,31,2,'2013-03-08','1990',75,4),(3436,32,2,'2013-04-08','1990',75,4),(3437,33,2,'2013-05-08','1990',75,4),(3438,34,2,'2013-06-10','1990',75,4),(3439,35,2,'2013-07-08','1990',75,4),(3440,36,2,'2013-08-08','1990',75,4),(3441,37,2,'2013-09-09','1990',75,4),(3442,38,2,'2013-10-08','1990',75,4),(3443,39,2,'2013-11-08','1990',75,4),(3444,40,2,'2013-12-09','1990',75,4),(3445,41,2,'2014-01-08','1990',75,4),(3446,42,2,'2014-02-10','1990',75,4),(3447,43,2,'2014-03-10','1990',75,4),(3448,44,2,'2014-04-08','1990',75,4),(3449,45,2,'2014-05-08','1990',75,4),(3450,46,2,'2014-06-09','1990',75,4),(3451,1,2,'2010-08-23','1990',76,4),(3452,2,2,'2010-09-08','1990',76,4),(3453,3,2,'2010-10-08','1990',76,4),(3454,4,2,'2010-11-08','1990',76,4),(3455,5,2,'2010-12-08','1990',76,4),(3456,6,2,'2011-01-10','1990',76,4),(3457,7,2,'2011-02-08','1990',76,4),(3458,8,2,'2011-03-09','1990',76,4),(3459,9,2,'2011-04-08','1990',76,4),(3460,10,2,'2011-05-09','1990',76,4),(3461,11,2,'2011-06-08','1990',76,4),(3462,12,2,'2011-07-08','1990',76,4),(3463,13,2,'2011-08-08','1990',76,4),(3464,14,2,'2011-09-08','1990',76,4),(3465,15,2,'2011-10-10','1990',76,4),(3466,16,2,'2011-11-08','1990',76,4),(3467,17,2,'2011-12-08','1990',76,4),(3468,18,2,'2012-01-09','1990',76,4),(3469,19,2,'2012-02-08','1990',76,4),(3470,20,2,'2012-03-08','1990',76,4),(3471,21,2,'2012-04-09','1990',76,4),(3472,22,2,'2012-05-08','1990',76,4),(3473,23,2,'2012-07-09','1990',76,4),(3474,24,2,'2012-08-08','1990',76,4),(3475,25,2,'2012-09-10','1990',76,4),(3476,26,2,'2012-10-08','1990',76,4),(3477,27,2,'2012-11-08','1990',76,4),(3478,28,2,'2012-12-10','1990',76,4),(3479,29,2,'2013-01-08','1990',76,4),(3480,30,2,'2013-02-08','1990',76,4),(3481,31,2,'2013-03-08','1990',76,4),(3482,32,2,'2013-04-08','1990',76,4),(3483,33,2,'2013-05-08','1990',76,4),(3484,34,2,'2013-06-10','1990',76,4),(3485,35,2,'2013-07-08','1990',76,4),(3486,36,2,'2013-08-08','1990',76,4),(3487,37,2,'2013-09-09','1990',76,4),(3488,38,2,'2013-10-08','1990',76,4),(3489,39,2,'2013-11-08','1990',76,4),(3490,40,2,'2013-12-09','1990',76,4),(3491,41,2,'2014-01-08','1990',76,4),(3492,42,2,'2014-02-10','1990',76,4),(3493,43,2,'2014-03-10','1990',76,4),(3494,44,2,'2014-04-08','1990',76,4),(3495,45,2,'2014-05-08','1990',76,4),(3496,46,2,'2014-06-09','1990',76,4),(3497,1,2,'2010-08-23','1990',77,4),(3498,2,2,'2010-09-08','1990',77,4),(3499,3,2,'2010-10-08','1990',77,4),(3500,4,2,'2010-11-08','1990',77,4),(3501,5,2,'2010-12-08','1990',77,4),(3502,6,2,'2011-01-10','1990',77,4),(3503,7,2,'2011-02-08','1990',77,4),(3504,8,2,'2011-03-09','1990',77,4),(3505,9,2,'2011-04-08','1990',77,4),(3506,10,2,'2011-05-09','1990',77,4),(3507,11,2,'2011-06-08','1990',77,4),(3508,12,2,'2011-07-08','1990',77,4),(3509,13,2,'2011-08-08','1990',77,4),(3510,14,2,'2011-09-08','1990',77,4),(3511,15,2,'2011-10-10','1990',77,4),(3512,16,2,'2011-11-08','1990',77,4),(3513,17,2,'2011-12-08','1990',77,4),(3514,18,2,'2012-01-09','1990',77,4),(3515,19,2,'2012-02-08','1990',77,4),(3516,20,2,'2012-03-08','1990',77,4),(3517,21,2,'2012-04-09','1990',77,4),(3518,22,2,'2012-05-08','1990',77,4),(3519,23,2,'2012-07-09','1990',77,4),(3520,24,2,'2012-08-08','1990',77,4),(3521,25,2,'2012-09-10','1990',77,4),(3522,26,2,'2012-10-08','1990',77,4),(3523,27,2,'2012-11-08','1990',77,4),(3524,28,2,'2012-12-10','1990',77,4),(3525,29,2,'2013-01-08','1990',77,4),(3526,30,2,'2013-02-08','1990',77,4),(3527,31,2,'2013-03-08','1990',77,4),(3528,32,2,'2013-04-08','1990',77,4),(3529,33,2,'2013-05-08','1990',77,4),(3530,34,2,'2013-06-10','1990',77,4),(3531,35,2,'2013-07-08','1990',77,4),(3532,36,2,'2013-08-08','1990',77,4),(3533,37,2,'2013-09-09','1990',77,4),(3534,38,2,'2013-10-08','1990',77,4),(3535,39,2,'2013-11-08','1990',77,4),(3536,40,2,'2013-12-09','1990',77,4),(3537,41,2,'2014-01-08','1990',77,4),(3538,42,2,'2014-02-10','1990',77,4),(3539,43,2,'2014-03-10','1990',77,4),(3540,44,2,'2014-04-08','1990',77,4),(3541,45,2,'2014-05-08','1990',77,4),(3542,46,2,'2014-06-09','1990',77,4),(3543,1,2,'2010-08-23','1990',78,4),(3544,2,2,'2010-09-08','1990',78,4),(3545,3,2,'2010-10-08','1990',78,4),(3546,4,2,'2010-11-08','1990',78,4),(3547,5,2,'2010-12-08','1990',78,4),(3548,6,2,'2011-01-10','1990',78,4),(3549,7,2,'2011-02-08','1990',78,4),(3550,8,2,'2011-03-09','1990',78,4),(3551,9,2,'2011-04-08','1990',78,4),(3552,10,2,'2011-05-09','1990',78,4),(3553,11,2,'2011-06-08','1990',78,4),(3554,12,2,'2011-07-08','1990',78,4),(3555,13,2,'2011-08-08','1990',78,4),(3556,14,2,'2011-09-08','1990',78,4),(3557,15,2,'2011-10-10','1990',78,4),(3558,16,2,'2011-11-08','1990',78,4),(3559,17,2,'2011-12-08','1990',78,4),(3560,18,2,'2012-01-09','1990',78,4),(3561,19,2,'2012-02-08','1990',78,4),(3562,20,2,'2012-03-08','1990',78,4),(3563,21,2,'2012-04-09','1990',78,4),(3564,22,2,'2012-05-08','1990',78,4),(3565,23,2,'2012-07-09','1990',78,4),(3566,24,2,'2012-08-08','1990',78,4),(3567,25,2,'2012-09-10','1990',78,4),(3568,26,2,'2012-10-08','1990',78,4),(3569,27,2,'2012-11-08','1990',78,4),(3570,28,2,'2012-12-10','1990',78,4),(3571,29,2,'2013-01-08','1990',78,4),(3572,30,2,'2013-02-08','1990',78,4),(3573,31,2,'2013-03-08','1990',78,4),(3574,32,2,'2013-04-08','1990',78,4),(3575,33,2,'2013-05-08','1990',78,4),(3576,34,2,'2013-06-10','1990',78,4),(3577,35,2,'2013-07-08','1990',78,4),(3578,36,2,'2013-08-08','1990',78,4),(3579,37,2,'2013-09-09','1990',78,4),(3580,38,2,'2013-10-08','1990',78,4),(3581,39,2,'2013-11-08','1990',78,4),(3582,40,2,'2013-12-09','1990',78,4),(3583,41,2,'2014-01-08','1990',78,4),(3584,42,2,'2014-02-10','1990',78,4),(3585,43,2,'2014-03-10','1990',78,4),(3586,44,2,'2014-04-08','1990',78,4),(3587,45,2,'2014-05-08','1990',78,4),(3588,46,2,'2014-06-09','1990',78,4),(3589,1,2,'2010-08-23','1990',79,4),(3590,2,2,'2010-09-08','1990',79,4),(3591,3,2,'2010-10-08','1990',79,4),(3592,4,2,'2010-11-08','1990',79,4),(3593,5,2,'2010-12-08','1990',79,4),(3594,6,2,'2011-01-10','1990',79,4),(3595,7,2,'2011-02-08','1990',79,4),(3596,8,2,'2011-03-09','1990',79,4),(3597,9,2,'2011-04-08','1990',79,4),(3598,10,2,'2011-05-09','1990',79,4),(3599,11,2,'2011-06-08','1990',79,4),(3600,12,2,'2011-07-08','1990',79,4),(3601,13,2,'2011-08-08','1990',79,4),(3602,14,2,'2011-09-08','1990',79,4),(3603,15,2,'2011-10-10','1990',79,4),(3604,16,2,'2011-11-08','1990',79,4),(3605,17,2,'2011-12-08','1990',79,4),(3606,18,2,'2012-01-09','1990',79,4),(3607,19,2,'2012-02-08','1990',79,4),(3608,20,2,'2012-03-08','1990',79,4),(3609,21,2,'2012-04-09','1990',79,4),(3610,22,2,'2012-05-08','1990',79,4),(3611,23,2,'2012-07-09','1990',79,4),(3612,24,2,'2012-08-08','1990',79,4),(3613,25,2,'2012-09-10','1990',79,4),(3614,26,2,'2012-10-08','1990',79,4),(3615,27,2,'2012-11-08','1990',79,4),(3616,28,2,'2012-12-10','1990',79,4),(3617,29,2,'2013-01-08','1990',79,4),(3618,30,2,'2013-02-08','1990',79,4),(3619,31,2,'2013-03-08','1990',79,4),(3620,32,2,'2013-04-08','1990',79,4),(3621,33,2,'2013-05-08','1990',79,4),(3622,34,2,'2013-06-10','1990',79,4),(3623,35,2,'2013-07-08','1990',79,4),(3624,36,2,'2013-08-08','1990',79,4),(3625,37,2,'2013-09-09','1990',79,4),(3626,38,2,'2013-10-08','1990',79,4),(3627,39,2,'2013-11-08','1990',79,4),(3628,40,2,'2013-12-09','1990',79,4),(3629,41,2,'2014-01-08','1990',79,4),(3630,42,2,'2014-02-10','1990',79,4),(3631,43,2,'2014-03-10','1990',79,4),(3632,44,2,'2014-04-08','1990',79,4),(3633,45,2,'2014-05-08','1990',79,4),(3634,46,2,'2014-06-09','1990',79,4),(3635,1,2,'2010-08-23','1990',80,4),(3636,2,2,'2010-09-08','1990',80,4),(3637,3,2,'2010-10-08','1990',80,4),(3638,4,2,'2010-11-08','1990',80,4),(3639,5,2,'2010-12-08','1990',80,4),(3640,6,2,'2011-01-10','1990',80,4),(3641,7,2,'2011-02-08','1990',80,4),(3642,8,2,'2011-03-09','1990',80,4),(3643,9,2,'2011-04-08','1990',80,4),(3644,10,2,'2011-05-09','1990',80,4),(3645,11,2,'2011-06-08','1990',80,4),(3646,12,2,'2011-07-08','1990',80,4),(3647,13,2,'2011-08-08','1990',80,4),(3648,14,2,'2011-09-08','1990',80,4),(3649,15,2,'2011-10-10','1990',80,4),(3650,16,2,'2011-11-08','1990',80,4),(3651,17,2,'2011-12-08','1990',80,4),(3652,18,2,'2012-01-09','1990',80,4),(3653,19,2,'2012-02-08','1990',80,4),(3654,20,2,'2012-03-08','1990',80,4),(3655,21,2,'2012-04-09','1990',80,4),(3656,22,2,'2012-05-08','1990',80,4),(3657,23,2,'2012-07-09','1990',80,4),(3658,24,2,'2012-08-08','1990',80,4),(3659,25,2,'2012-09-10','1990',80,4),(3660,26,2,'2012-10-08','1990',80,4),(3661,27,2,'2012-11-08','1990',80,4),(3662,28,2,'2012-12-10','1990',80,4),(3663,29,2,'2013-01-08','1990',80,4),(3664,30,2,'2013-02-08','1990',80,4),(3665,31,2,'2013-03-08','1990',80,4),(3666,32,2,'2013-04-08','1990',80,4),(3667,33,2,'2013-05-08','1990',80,4),(3668,34,2,'2013-06-10','1990',80,4),(3669,35,2,'2013-07-08','1990',80,4),(3670,36,2,'2013-08-08','1990',80,4),(3671,37,2,'2013-09-09','1990',80,4),(3672,38,2,'2013-10-08','1990',80,4),(3673,39,2,'2013-11-08','1990',80,4),(3674,40,2,'2013-12-09','1990',80,4),(3675,41,2,'2014-01-08','1990',80,4),(3676,42,2,'2014-02-10','1990',80,4),(3677,43,2,'2014-03-10','1990',80,4),(3678,44,2,'2014-04-08','1990',80,4),(3679,45,2,'2014-05-08','1990',80,4),(3680,46,2,'2014-06-09','1990',80,4),(3681,1,2,'2010-08-23','1990',81,4),(3682,2,2,'2010-09-08','1990',81,4),(3683,3,2,'2010-10-08','1990',81,4),(3684,4,2,'2010-11-08','1990',81,4),(3685,5,2,'2010-12-08','1990',81,4),(3686,6,2,'2011-01-10','1990',81,4),(3687,7,2,'2011-02-08','1990',81,4),(3688,8,2,'2011-03-09','1990',81,4),(3689,9,2,'2011-04-08','1990',81,4),(3690,10,2,'2011-05-09','1990',81,4),(3691,11,2,'2011-06-08','1990',81,4),(3692,12,2,'2011-07-08','1990',81,4),(3693,13,2,'2011-08-08','1990',81,4),(3694,14,2,'2011-09-08','1990',81,4),(3695,15,2,'2011-10-10','1990',81,4),(3696,16,2,'2011-11-08','1990',81,4),(3697,17,2,'2011-12-08','1990',81,4),(3698,18,2,'2012-01-09','1990',81,4),(3699,19,2,'2012-02-08','1990',81,4),(3700,20,2,'2012-03-08','1990',81,4),(3701,21,2,'2012-04-09','1990',81,4),(3702,22,2,'2012-05-08','1990',81,4),(3703,23,2,'2012-07-09','1990',81,4),(3704,24,2,'2012-08-08','1990',81,4),(3705,25,2,'2012-09-10','1990',81,4),(3706,26,2,'2012-10-08','1990',81,4),(3707,27,2,'2012-11-08','1990',81,4),(3708,28,2,'2012-12-10','1990',81,4),(3709,29,2,'2013-01-08','1990',81,4),(3710,30,2,'2013-02-08','1990',81,4),(3711,31,2,'2013-03-08','1990',81,4),(3712,32,2,'2013-04-08','1990',81,4),(3713,33,2,'2013-05-08','1990',81,4),(3714,34,2,'2013-06-10','1990',81,4),(3715,35,2,'2013-07-08','1990',81,4),(3716,36,2,'2013-08-08','1990',81,4),(3717,37,2,'2013-09-09','1990',81,4),(3718,38,2,'2013-10-08','1990',81,4),(3719,39,2,'2013-11-08','1990',81,4),(3720,40,2,'2013-12-09','1990',81,4),(3721,41,2,'2014-01-08','1990',81,4),(3722,42,2,'2014-02-10','1990',81,4),(3723,43,2,'2014-03-10','1990',81,4),(3724,44,2,'2014-04-08','1990',81,4),(3725,45,2,'2014-05-08','1990',81,4),(3726,46,2,'2014-06-09','1990',81,4),(3727,1,2,'2010-08-23','1990',82,4),(3728,2,2,'2010-09-08','1990',82,4),(3729,3,2,'2010-10-08','1990',82,4),(3730,4,2,'2010-11-08','1990',82,4),(3731,5,2,'2010-12-08','1990',82,4),(3732,6,2,'2011-01-10','1990',82,4),(3733,7,2,'2011-02-08','1990',82,4),(3734,8,2,'2011-03-09','1990',82,4),(3735,9,2,'2011-04-08','1990',82,4),(3736,10,2,'2011-05-09','1990',82,4),(3737,11,2,'2011-06-08','1990',82,4),(3738,12,2,'2011-07-08','1990',82,4),(3739,13,2,'2011-08-08','1990',82,4),(3740,14,2,'2011-09-08','1990',82,4),(3741,15,2,'2011-10-10','1990',82,4),(3742,16,2,'2011-11-08','1990',82,4),(3743,17,2,'2011-12-08','1990',82,4),(3744,18,2,'2012-01-09','1990',82,4),(3745,19,2,'2012-02-08','1990',82,4),(3746,20,2,'2012-03-08','1990',82,4),(3747,21,2,'2012-04-09','1990',82,4),(3748,22,2,'2012-05-08','1990',82,4),(3749,23,2,'2012-07-09','1990',82,4),(3750,24,2,'2012-08-08','1990',82,4),(3751,25,2,'2012-09-10','1990',82,4),(3752,26,2,'2012-10-08','1990',82,4),(3753,27,2,'2012-11-08','1990',82,4),(3754,28,2,'2012-12-10','1990',82,4),(3755,29,2,'2013-01-08','1990',82,4),(3756,30,2,'2013-02-08','1990',82,4),(3757,31,2,'2013-03-08','1990',82,4),(3758,32,2,'2013-04-08','1990',82,4),(3759,33,2,'2013-05-08','1990',82,4),(3760,34,2,'2013-06-10','1990',82,4),(3761,35,2,'2013-07-08','1990',82,4),(3762,36,2,'2013-08-08','1990',82,4),(3763,37,2,'2013-09-09','1990',82,4),(3764,38,2,'2013-10-08','1990',82,4),(3765,39,2,'2013-11-08','1990',82,4),(3766,40,2,'2013-12-09','1990',82,4),(3767,41,2,'2014-01-08','1990',82,4),(3768,42,2,'2014-02-10','1990',82,4),(3769,43,2,'2014-03-10','1990',82,4),(3770,44,2,'2014-04-08','1990',82,4),(3771,45,2,'2014-05-08','1990',82,4),(3772,46,2,'2014-06-09','1990',82,4),(3773,1,2,'2010-08-23','1990',83,4),(3774,2,2,'2010-09-08','1990',83,4),(3775,3,2,'2010-10-08','1990',83,4),(3776,4,2,'2010-11-08','1990',83,4),(3777,5,2,'2010-12-08','1990',83,4),(3778,6,2,'2011-01-10','1990',83,4),(3779,7,2,'2011-02-08','1990',83,4),(3780,8,2,'2011-03-09','1990',83,4),(3781,9,2,'2011-04-08','1990',83,4),(3782,10,2,'2011-05-09','1990',83,4),(3783,11,2,'2011-06-08','1990',83,4),(3784,12,2,'2011-07-08','1990',83,4),(3785,13,2,'2011-08-08','1990',83,4),(3786,14,2,'2011-09-08','1990',83,4),(3787,15,2,'2011-10-10','1990',83,4),(3788,16,2,'2011-11-08','1990',83,4),(3789,17,2,'2011-12-08','1990',83,4),(3790,18,2,'2012-01-09','1990',83,4),(3791,19,2,'2012-02-08','1990',83,4),(3792,20,2,'2012-03-08','1990',83,4),(3793,21,2,'2012-04-09','1990',83,4),(3794,22,2,'2012-05-08','1990',83,4),(3795,23,2,'2012-07-09','1990',83,4),(3796,24,2,'2012-08-08','1990',83,4),(3797,25,2,'2012-09-10','1990',83,4),(3798,26,2,'2012-10-08','1990',83,4),(3799,27,2,'2012-11-08','1990',83,4),(3800,28,2,'2012-12-10','1990',83,4),(3801,29,2,'2013-01-08','1990',83,4),(3802,30,2,'2013-02-08','1990',83,4),(3803,31,2,'2013-03-08','1990',83,4),(3804,32,2,'2013-04-08','1990',83,4),(3805,33,2,'2013-05-08','1990',83,4),(3806,34,2,'2013-06-10','1990',83,4),(3807,35,2,'2013-07-08','1990',83,4),(3808,36,2,'2013-08-08','1990',83,4),(3809,37,2,'2013-09-09','1990',83,4),(3810,38,2,'2013-10-08','1990',83,4),(3811,39,2,'2013-11-08','1990',83,4),(3812,40,2,'2013-12-09','1990',83,4),(3813,41,2,'2014-01-08','1990',83,4),(3814,42,2,'2014-02-10','1990',83,4),(3815,43,2,'2014-03-10','1990',83,4),(3816,44,2,'2014-04-08','1990',83,4),(3817,45,2,'2014-05-08','1990',83,4),(3818,46,2,'2014-06-09','1990',83,4),(3819,1,2,'2010-08-23','1990',84,4),(3820,2,2,'2010-09-08','1990',84,4),(3821,3,2,'2010-10-08','1990',84,4),(3822,4,2,'2010-11-08','1990',84,4),(3823,5,2,'2010-12-08','1990',84,4),(3824,6,2,'2011-01-10','1990',84,4),(3825,7,2,'2011-02-08','1990',84,4),(3826,8,2,'2011-03-09','1990',84,4),(3827,9,2,'2011-04-08','1990',84,4),(3828,10,2,'2011-05-09','1990',84,4),(3829,11,2,'2011-06-08','1990',84,4),(3830,12,2,'2011-07-08','1990',84,4),(3831,13,2,'2011-08-08','1990',84,4),(3832,14,2,'2011-09-08','1990',84,4),(3833,15,2,'2011-10-10','1990',84,4),(3834,16,2,'2011-11-08','1990',84,4),(3835,17,2,'2011-12-08','1990',84,4),(3836,18,2,'2012-01-09','1990',84,4),(3837,19,2,'2012-02-08','1990',84,4),(3838,20,2,'2012-03-08','1990',84,4),(3839,21,2,'2012-04-09','1990',84,4),(3840,22,2,'2012-05-08','1990',84,4),(3841,23,2,'2012-07-09','1990',84,4),(3842,24,2,'2012-08-08','1990',84,4),(3843,25,2,'2012-09-10','1990',84,4),(3844,26,2,'2012-10-08','1990',84,4),(3845,27,2,'2012-11-08','1990',84,4),(3846,28,2,'2012-12-10','1990',84,4),(3847,29,2,'2013-01-08','1990',84,4),(3848,30,2,'2013-02-08','1990',84,4),(3849,31,2,'2013-03-08','1990',84,4),(3850,32,2,'2013-04-08','1990',84,4),(3851,33,2,'2013-05-08','1990',84,4),(3852,34,2,'2013-06-10','1990',84,4),(3853,35,2,'2013-07-08','1990',84,4),(3854,36,2,'2013-08-08','1990',84,4),(3855,37,2,'2013-09-09','1990',84,4),(3856,38,2,'2013-10-08','1990',84,4),(3857,39,2,'2013-11-08','1990',84,4),(3858,40,2,'2013-12-09','1990',84,4),(3859,41,2,'2014-01-08','1990',84,4),(3860,42,2,'2014-02-10','1990',84,4),(3861,43,2,'2014-03-10','1990',84,4),(3862,44,2,'2014-04-08','1990',84,4),(3863,45,2,'2014-05-08','1990',84,4),(3864,46,2,'2014-06-09','1990',84,4),(3865,1,2,'2010-08-23','1990',85,4),(3866,2,2,'2010-09-08','1990',85,4),(3867,3,2,'2010-10-08','1990',85,4),(3868,4,2,'2010-11-08','1990',85,4),(3869,5,2,'2010-12-08','1990',85,4),(3870,6,2,'2011-01-10','1990',85,4),(3871,7,2,'2011-02-08','1990',85,4),(3872,8,2,'2011-03-09','1990',85,4),(3873,9,2,'2011-04-08','1990',85,4),(3874,10,2,'2011-05-09','1990',85,4),(3875,11,2,'2011-06-08','1990',85,4),(3876,12,2,'2011-07-08','1990',85,4),(3877,13,2,'2011-08-08','1990',85,4),(3878,14,2,'2011-09-08','1990',85,4),(3879,15,2,'2011-10-10','1990',85,4),(3880,16,2,'2011-11-08','1990',85,4),(3881,17,2,'2011-12-08','1990',85,4),(3882,18,2,'2012-01-09','1990',85,4),(3883,19,2,'2012-02-08','1990',85,4),(3884,20,2,'2012-03-08','1990',85,4),(3885,21,2,'2012-04-09','1990',85,4),(3886,22,2,'2012-05-08','1990',85,4),(3887,23,2,'2012-07-09','1990',85,4),(3888,24,2,'2012-08-08','1990',85,4),(3889,25,2,'2012-09-10','1990',85,4),(3890,26,2,'2012-10-08','1990',85,4),(3891,27,2,'2012-11-08','1990',85,4),(3892,28,2,'2012-12-10','1990',85,4),(3893,29,2,'2013-01-08','1990',85,4),(3894,30,2,'2013-02-08','1990',85,4),(3895,31,2,'2013-03-08','1990',85,4),(3896,32,2,'2013-04-08','1990',85,4),(3897,33,2,'2013-05-08','1990',85,4),(3898,34,2,'2013-06-10','1990',85,4),(3899,35,2,'2013-07-08','1990',85,4),(3900,36,2,'2013-08-08','1990',85,4),(3901,37,2,'2013-09-09','1990',85,4),(3902,38,2,'2013-10-08','1990',85,4),(3903,39,2,'2013-11-08','1990',85,4),(3904,40,2,'2013-12-09','1990',85,4),(3905,41,2,'2014-01-08','1990',85,4),(3906,42,2,'2014-02-10','1990',85,4),(3907,43,2,'2014-03-10','1990',85,4),(3908,44,2,'2014-04-08','1990',85,4),(3909,45,2,'2014-05-08','1990',85,4),(3910,46,2,'2014-06-09','1990',85,4),(3911,1,2,'2010-08-23','1990',86,4),(3912,2,2,'2010-09-08','1990',86,4),(3913,3,2,'2010-10-08','1990',86,4),(3914,4,2,'2010-11-08','1990',86,4),(3915,5,2,'2010-12-08','1990',86,4),(3916,6,2,'2011-01-10','1990',86,4),(3917,7,2,'2011-02-08','1990',86,4),(3918,8,2,'2011-03-09','1990',86,4),(3919,9,2,'2011-04-08','1990',86,4),(3920,10,2,'2011-05-09','1990',86,4),(3921,11,2,'2011-06-08','1990',86,4),(3922,12,2,'2011-07-08','1990',86,4),(3923,13,2,'2011-08-08','1990',86,4),(3924,14,2,'2011-09-08','1990',86,4),(3925,15,2,'2011-10-10','1990',86,4),(3926,16,2,'2011-11-08','1990',86,4),(3927,17,2,'2011-12-08','1990',86,4),(3928,18,2,'2012-01-09','1990',86,4),(3929,19,2,'2012-02-08','1990',86,4),(3930,20,2,'2012-03-08','1990',86,4),(3931,21,2,'2012-04-09','1990',86,4),(3932,22,2,'2012-05-08','1990',86,4),(3933,23,2,'2012-07-09','1990',86,4),(3934,24,2,'2012-08-08','1990',86,4),(3935,25,2,'2012-09-10','1990',86,4),(3936,26,2,'2012-10-08','1990',86,4),(3937,27,2,'2012-11-08','1990',86,4),(3938,28,2,'2012-12-10','1990',86,4),(3939,29,2,'2013-01-08','1990',86,4),(3940,30,2,'2013-02-08','1990',86,4),(3941,31,2,'2013-03-08','1990',86,4),(3942,32,2,'2013-04-08','1990',86,4),(3943,33,2,'2013-05-08','1990',86,4),(3944,34,2,'2013-06-10','1990',86,4),(3945,35,2,'2013-07-08','1990',86,4),(3946,36,2,'2013-08-08','1990',86,4),(3947,37,2,'2013-09-09','1990',86,4),(3948,38,2,'2013-10-08','1990',86,4),(3949,39,2,'2013-11-08','1990',86,4),(3950,40,2,'2013-12-09','1990',86,4),(3951,41,2,'2014-01-08','1990',86,4),(3952,42,2,'2014-02-10','1990',86,4),(3953,43,2,'2014-03-10','1990',86,4),(3954,44,2,'2014-04-08','1990',86,4),(3955,45,2,'2014-05-08','1990',86,4),(3956,46,2,'2014-06-09','1990',86,4),(3957,1,2,'2011-08-31','1990',87,4),(3958,2,2,'2011-09-08','1990',87,4),(3959,3,2,'2011-10-10','1990',87,4),(3960,4,2,'2011-11-08','1990',87,4),(3961,5,2,'2011-12-08','1990',87,4),(3962,6,2,'2012-01-09','1990',87,4),(3963,7,2,'2012-02-08','1990',87,4),(3964,8,2,'2012-03-08','1990',87,4),(3965,9,2,'2012-04-11','1990',87,4),(3966,10,2,'2012-05-08','1990',87,4),(3967,11,2,'2012-06-08','1990',87,4),(3968,12,2,'2012-07-09','1990',87,4),(3969,13,2,'2012-08-08','1990',87,4),(3970,14,2,'2012-09-10','1990',87,4),(3971,15,2,'2012-10-08','1990',87,4),(3972,16,2,'2012-11-08','1990',87,4),(3973,17,2,'2012-12-10','1990',87,4),(3974,18,2,'2013-01-08','1990',87,4),(3975,19,2,'2013-02-08','1990',87,4),(3976,20,2,'2013-03-08','1990',87,4),(3977,21,2,'2013-04-08','1990',87,4),(3978,22,2,'2013-05-08','1990',87,4),(3979,23,2,'2013-06-10','1990',87,4),(3980,24,2,'2013-07-08','1990',87,4),(3981,25,2,'2013-08-08','1990',87,4),(3982,26,2,'2013-09-09','1990',87,4),(3983,27,2,'2013-10-08','1990',87,4),(3984,28,2,'2013-11-08','1990',87,4),(3985,29,2,'2013-12-09','1990',87,4),(3986,30,2,'2014-01-08','1990',87,4),(3987,31,2,'2014-02-10','1990',87,4),(3988,32,2,'2014-03-10','1990',87,4),(3989,33,2,'2014-04-08','1990',87,4),(3990,34,2,'2014-05-08','1990',87,4),(3991,35,2,'2014-06-09','1990',87,4),(3992,36,2,'2014-07-08','1990',87,4),(3993,37,2,'2014-08-08','1990',87,4),(3994,38,2,'2014-09-08','1990',87,4),(3995,39,2,'2014-10-08','1990',87,4),(3996,40,2,'2014-11-10','1990',87,4),(3997,41,2,'2014-12-08','1990',87,4),(3998,42,2,'2015-01-08','1990',87,4),(3999,43,2,'2015-02-09','1990',87,4),(4000,44,2,'2015-03-09','1990',87,4),(4001,45,2,'2015-04-08','1990',87,4),(4002,46,2,'2015-05-08','1990',87,4),(4003,47,2,'2015-06-08','1990',87,4),(4004,48,2,'2015-07-08','1990',87,4),(4005,1,2,'2011-08-31','1990',88,4),(4006,2,2,'2011-09-08','1990',88,4),(4007,3,2,'2011-10-10','1990',88,4),(4008,4,2,'2011-11-08','1990',88,4),(4009,5,2,'2011-12-08','1990',88,4),(4010,6,2,'2012-01-09','1990',88,4),(4011,7,2,'2012-02-08','1990',88,4),(4012,8,2,'2012-03-08','1990',88,4),(4013,9,2,'2012-04-11','1990',88,4),(4014,10,2,'2012-05-08','1990',88,4),(4015,11,2,'2012-06-08','1990',88,4),(4016,12,2,'2012-07-09','1990',88,4),(4017,13,2,'2012-08-08','1990',88,4),(4018,14,2,'2012-09-10','1990',88,4),(4019,15,2,'2012-10-08','1990',88,4),(4020,16,2,'2012-11-08','1990',88,4),(4021,17,2,'2012-12-10','1990',88,4),(4022,18,2,'2013-01-08','1990',88,4),(4023,19,2,'2013-02-08','1990',88,4),(4024,20,2,'2013-03-08','1990',88,4),(4025,21,2,'2013-04-08','1990',88,4),(4026,22,2,'2013-05-08','1990',88,4),(4027,23,2,'2013-06-10','1990',88,4),(4028,24,2,'2013-07-08','1990',88,4),(4029,25,2,'2013-08-08','1990',88,4),(4030,26,2,'2013-09-09','1990',88,4),(4031,27,2,'2013-10-08','1990',88,4),(4032,28,2,'2013-11-08','1990',88,4),(4033,29,2,'2013-12-09','1990',88,4),(4034,30,2,'2014-01-08','1990',88,4),(4035,31,2,'2014-02-10','1990',88,4),(4036,32,2,'2014-03-10','1990',88,4),(4037,33,2,'2014-04-08','1990',88,4),(4038,34,2,'2014-05-08','1990',88,4),(4039,35,2,'2014-06-09','1990',88,4),(4040,36,2,'2014-07-08','1990',88,4),(4041,37,2,'2014-08-08','1990',88,4),(4042,38,2,'2014-09-08','1990',88,4),(4043,39,2,'2014-10-08','1990',88,4),(4044,40,2,'2014-11-10','1990',88,4),(4045,41,2,'2014-12-08','1990',88,4),(4046,42,2,'2015-01-08','1990',88,4),(4047,43,2,'2015-02-09','1990',88,4),(4048,44,2,'2015-03-09','1990',88,4),(4049,45,2,'2015-04-08','1990',88,4),(4050,46,2,'2015-05-08','1990',88,4),(4051,47,2,'2015-06-08','1990',88,4),(4052,48,2,'2015-07-08','1990',88,4),(4053,1,2,'2011-08-31','1990',89,4),(4054,2,2,'2011-09-08','1990',89,4),(4055,3,2,'2011-10-10','1990',89,4),(4056,4,2,'2011-11-08','1990',89,4),(4057,5,2,'2011-12-08','1990',89,4),(4058,6,2,'2012-01-09','1990',89,4),(4059,7,2,'2012-02-08','1990',89,4),(4060,8,2,'2012-03-08','1990',89,4),(4061,9,2,'2012-04-11','1990',89,4),(4062,10,2,'2012-05-08','1990',89,4),(4063,11,2,'2012-06-08','1990',89,4),(4064,12,2,'2012-07-09','1990',89,4),(4065,13,2,'2012-08-08','1990',89,4),(4066,14,2,'2012-09-10','1990',89,4),(4067,15,2,'2012-10-08','1990',89,4),(4068,16,2,'2012-11-08','1990',89,4),(4069,17,2,'2012-12-10','1990',89,4),(4070,18,2,'2013-01-08','1990',89,4),(4071,19,2,'2013-02-08','1990',89,4),(4072,20,2,'2013-03-08','1990',89,4),(4073,21,2,'2013-04-08','1990',89,4),(4074,22,2,'2013-05-08','1990',89,4),(4075,23,2,'2013-06-10','1990',89,4),(4076,24,2,'2013-07-08','1990',89,4),(4077,25,2,'2013-08-08','1990',89,4),(4078,26,2,'2013-09-09','1990',89,4),(4079,27,2,'2013-10-08','1990',89,4),(4080,28,2,'2013-11-08','1990',89,4),(4081,29,2,'2013-12-09','1990',89,4),(4082,30,2,'2014-01-08','1990',89,4),(4083,31,2,'2014-02-10','1990',89,4),(4084,32,2,'2014-03-10','1990',89,4),(4085,33,2,'2014-04-08','1990',89,4),(4086,34,2,'2014-05-08','1990',89,4),(4087,35,2,'2014-06-09','1990',89,4),(4088,36,2,'2014-07-08','1990',89,4),(4089,37,2,'2014-08-08','1990',89,4),(4090,38,2,'2014-09-08','1990',89,4),(4091,39,2,'2014-10-08','1990',89,4),(4092,40,2,'2014-11-10','1990',89,4),(4093,41,2,'2014-12-08','1990',89,4),(4094,42,2,'2015-01-08','1990',89,4),(4095,43,2,'2015-02-09','1990',89,4),(4096,44,2,'2015-03-09','1990',89,4),(4097,45,2,'2015-04-08','1990',89,4),(4098,46,2,'2015-05-08','1990',89,4),(4099,47,2,'2015-06-08','1990',89,4),(4100,48,2,'2015-07-08','1990',89,4),(4101,1,2,'2011-08-31','1990',90,4),(4102,2,2,'2011-09-08','1990',90,4),(4103,3,2,'2011-10-10','1990',90,4),(4104,4,2,'2011-11-08','1990',90,4),(4105,5,2,'2011-12-08','1990',90,4),(4106,6,2,'2012-01-09','1990',90,4),(4107,7,2,'2012-02-08','1990',90,4),(4108,8,2,'2012-03-08','1990',90,4),(4109,9,2,'2012-04-11','1990',90,4),(4110,10,2,'2012-05-08','1990',90,4),(4111,11,2,'2012-06-08','1990',90,4),(4112,12,2,'2012-07-09','1990',90,4),(4113,13,2,'2012-08-08','1990',90,4),(4114,14,2,'2012-09-10','1990',90,4),(4115,15,2,'2012-10-08','1990',90,4),(4116,16,2,'2012-11-08','1990',90,4),(4117,17,2,'2012-12-10','1990',90,4),(4118,18,2,'2013-01-08','1990',90,4),(4119,19,2,'2013-02-08','1990',90,4),(4120,20,2,'2013-03-08','1990',90,4),(4121,21,2,'2013-04-08','1990',90,4),(4122,22,2,'2013-05-08','1990',90,4),(4123,23,2,'2013-06-10','1990',90,4),(4124,24,2,'2013-07-08','1990',90,4),(4125,25,2,'2013-08-08','1990',90,4),(4126,26,2,'2013-09-09','1990',90,4),(4127,27,2,'2013-10-08','1990',90,4),(4128,28,2,'2013-11-08','1990',90,4),(4129,29,2,'2013-12-09','1990',90,4),(4130,30,2,'2014-01-08','1990',90,4),(4131,31,2,'2014-02-10','1990',90,4),(4132,32,2,'2014-03-10','1990',90,4),(4133,33,2,'2014-04-08','1990',90,4),(4134,34,2,'2014-05-08','1990',90,4),(4135,35,2,'2014-06-09','1990',90,4),(4136,36,2,'2014-07-08','1990',90,4),(4137,37,2,'2014-08-08','1990',90,4),(4138,38,2,'2014-09-08','1990',90,4),(4139,39,2,'2014-10-08','1990',90,4),(4140,40,2,'2014-11-10','1990',90,4),(4141,41,2,'2014-12-08','1990',90,4),(4142,42,2,'2015-01-08','1990',90,4),(4143,43,2,'2015-02-09','1990',90,4),(4144,44,2,'2015-03-09','1990',90,4),(4145,45,2,'2015-04-08','1990',90,4),(4146,46,2,'2015-05-08','1990',90,4),(4147,47,2,'2015-06-08','1990',90,4),(4148,48,2,'2015-07-08','1990',90,4),(4149,1,2,'2011-08-31','1990',91,4),(4150,2,2,'2011-09-08','1990',91,4),(4151,3,2,'2011-10-10','1990',91,4),(4152,4,2,'2011-11-08','1990',91,4),(4153,5,2,'2011-12-08','1990',91,4),(4154,6,2,'2012-01-09','1990',91,4),(4155,7,2,'2012-02-08','1990',91,4),(4156,8,2,'2012-03-08','1990',91,4),(4157,9,2,'2012-04-11','1990',91,4),(4158,10,2,'2012-05-08','1990',91,4),(4159,11,2,'2012-06-08','1990',91,4),(4160,12,2,'2012-07-09','1990',91,4),(4161,13,2,'2012-08-08','1990',91,4),(4162,14,2,'2012-09-10','1990',91,4),(4163,15,2,'2012-10-08','1990',91,4),(4164,16,2,'2012-11-08','1990',91,4),(4165,17,2,'2012-12-10','1990',91,4),(4166,18,2,'2013-01-08','1990',91,4),(4167,19,2,'2013-02-08','1990',91,4),(4168,20,2,'2013-03-08','1990',91,4),(4169,21,2,'2013-04-08','1990',91,4),(4170,22,2,'2013-05-08','1990',91,4),(4171,23,2,'2013-06-10','1990',91,4),(4172,24,2,'2013-07-08','1990',91,4),(4173,25,2,'2013-08-08','1990',91,4),(4174,26,2,'2013-09-09','1990',91,4),(4175,27,2,'2013-10-08','1990',91,4),(4176,28,2,'2013-11-08','1990',91,4),(4177,29,2,'2013-12-09','1990',91,4),(4178,30,2,'2014-01-08','1990',91,4),(4179,31,2,'2014-02-10','1990',91,4),(4180,32,2,'2014-03-10','1990',91,4),(4181,33,2,'2014-04-08','1990',91,4),(4182,34,2,'2014-05-08','1990',91,4),(4183,35,2,'2014-06-09','1990',91,4),(4184,36,2,'2014-07-08','1990',91,4),(4185,37,2,'2014-08-08','1990',91,4),(4186,38,2,'2014-09-08','1990',91,4),(4187,39,2,'2014-10-08','1990',91,4),(4188,40,2,'2014-11-10','1990',91,4),(4189,41,2,'2014-12-08','1990',91,4),(4190,42,2,'2015-01-08','1990',91,4),(4191,43,2,'2015-02-09','1990',91,4),(4192,44,2,'2015-03-09','1990',91,4),(4193,45,2,'2015-04-08','1990',91,4),(4194,46,2,'2015-05-08','1990',91,4),(4195,47,2,'2015-06-08','1990',91,4),(4196,48,2,'2015-07-08','1990',91,4),(4197,1,2,'2011-08-31','1990',92,4),(4198,2,2,'2011-09-08','1990',92,4),(4199,3,2,'2011-10-10','1990',92,4),(4200,4,2,'2011-11-08','1990',92,4),(4201,5,2,'2011-12-08','1990',92,4),(4202,6,2,'2012-01-09','1990',92,4),(4203,7,2,'2012-02-08','1990',92,4),(4204,8,2,'2012-03-08','1990',92,4),(4205,9,2,'2012-04-11','1990',92,4),(4206,10,2,'2012-05-08','1990',92,4),(4207,11,2,'2012-06-08','1990',92,4),(4208,12,2,'2012-07-09','1990',92,4),(4209,13,2,'2012-08-08','1990',92,4),(4210,14,2,'2012-09-10','1990',92,4),(4211,15,2,'2012-10-08','1990',92,4),(4212,16,2,'2012-11-08','1990',92,4),(4213,17,2,'2012-12-10','1990',92,4),(4214,18,2,'2013-01-08','1990',92,4),(4215,19,2,'2013-02-08','1990',92,4),(4216,20,2,'2013-03-08','1990',92,4),(4217,21,2,'2013-04-08','1990',92,4),(4218,22,2,'2013-05-08','1990',92,4),(4219,23,2,'2013-06-10','1990',92,4),(4220,24,2,'2013-07-08','1990',92,4),(4221,25,2,'2013-08-08','1990',92,4),(4222,26,2,'2013-09-09','1990',92,4),(4223,27,2,'2013-10-08','1990',92,4),(4224,28,2,'2013-11-08','1990',92,4),(4225,29,2,'2013-12-09','1990',92,4),(4226,30,2,'2014-01-08','1990',92,4),(4227,31,2,'2014-02-10','1990',92,4),(4228,32,2,'2014-03-10','1990',92,4),(4229,33,2,'2014-04-08','1990',92,4),(4230,34,2,'2014-05-08','1990',92,4),(4231,35,2,'2014-06-09','1990',92,4),(4232,36,2,'2014-07-08','1990',92,4),(4233,37,2,'2014-08-08','1990',92,4),(4234,38,2,'2014-09-08','1990',92,4),(4235,39,2,'2014-10-08','1990',92,4),(4236,40,2,'2014-11-10','1990',92,4),(4237,41,2,'2014-12-08','1990',92,4),(4238,42,2,'2015-01-08','1990',92,4),(4239,43,2,'2015-02-09','1990',92,4),(4240,44,2,'2015-03-09','1990',92,4),(4241,45,2,'2015-04-08','1990',92,4),(4242,46,2,'2015-05-08','1990',92,4),(4243,47,2,'2015-06-08','1990',92,4),(4244,48,2,'2015-07-08','1990',92,4),(4245,1,2,'2011-08-31','1990',93,4),(4246,2,2,'2011-09-08','1990',93,4),(4247,3,2,'2011-10-10','1990',93,4),(4248,4,2,'2011-11-08','1990',93,4),(4249,5,2,'2011-12-08','1990',93,4),(4250,6,2,'2012-01-09','1990',93,4),(4251,7,2,'2012-02-08','1990',93,4),(4252,8,2,'2012-03-08','1990',93,4),(4253,9,2,'2012-04-11','1990',93,4),(4254,10,2,'2012-05-08','1990',93,4),(4255,11,2,'2012-06-08','1990',93,4),(4256,12,2,'2012-07-09','1990',93,4),(4257,13,2,'2012-08-08','1990',93,4),(4258,14,2,'2012-09-10','1990',93,4),(4259,15,2,'2012-10-08','1990',93,4),(4260,16,2,'2012-11-08','1990',93,4),(4261,17,2,'2012-12-10','1990',93,4),(4262,18,2,'2013-01-08','1990',93,4),(4263,19,2,'2013-02-08','1990',93,4),(4264,20,2,'2013-03-08','1990',93,4),(4265,21,2,'2013-04-08','1990',93,4),(4266,22,2,'2013-05-08','1990',93,4),(4267,23,2,'2013-06-10','1990',93,4),(4268,24,2,'2013-07-08','1990',93,4),(4269,25,2,'2013-08-08','1990',93,4),(4270,26,2,'2013-09-09','1990',93,4),(4271,27,2,'2013-10-08','1990',93,4),(4272,28,2,'2013-11-08','1990',93,4),(4273,29,2,'2013-12-09','1990',93,4),(4274,30,2,'2014-01-08','1990',93,4),(4275,31,2,'2014-02-10','1990',93,4),(4276,32,2,'2014-03-10','1990',93,4),(4277,33,2,'2014-04-08','1990',93,4),(4278,34,2,'2014-05-08','1990',93,4),(4279,35,2,'2014-06-09','1990',93,4),(4280,36,2,'2014-07-08','1990',93,4),(4281,37,2,'2014-08-08','1990',93,4),(4282,38,2,'2014-09-08','1990',93,4),(4283,39,2,'2014-10-08','1990',93,4),(4284,40,2,'2014-11-10','1990',93,4),(4285,41,2,'2014-12-08','1990',93,4),(4286,42,2,'2015-01-08','1990',93,4),(4287,43,2,'2015-02-09','1990',93,4),(4288,44,2,'2015-03-09','1990',93,4),(4289,45,2,'2015-04-08','1990',93,4),(4290,46,2,'2015-05-08','1990',93,4),(4291,47,2,'2015-06-08','1990',93,4),(4292,48,2,'2015-07-08','1990',93,4),(4293,1,2,'2011-08-31','1990',94,4),(4294,2,2,'2011-09-08','1990',94,4),(4295,3,2,'2011-10-10','1990',94,4),(4296,4,2,'2011-11-08','1990',94,4),(4297,5,2,'2011-12-08','1990',94,4),(4298,6,2,'2012-01-09','1990',94,4),(4299,7,2,'2012-02-08','1990',94,4),(4300,8,2,'2012-03-08','1990',94,4),(4301,9,2,'2012-04-11','1990',94,4),(4302,10,2,'2012-05-08','1990',94,4),(4303,11,2,'2012-06-08','1990',94,4),(4304,12,2,'2012-07-09','1990',94,4),(4305,13,2,'2012-08-08','1990',94,4),(4306,14,2,'2012-09-10','1990',94,4),(4307,15,2,'2012-10-08','1990',94,4),(4308,16,2,'2012-11-08','1990',94,4),(4309,17,2,'2012-12-10','1990',94,4),(4310,18,2,'2013-01-08','1990',94,4),(4311,19,2,'2013-02-08','1990',94,4),(4312,20,2,'2013-03-08','1990',94,4),(4313,21,2,'2013-04-08','1990',94,4),(4314,22,2,'2013-05-08','1990',94,4),(4315,23,2,'2013-06-10','1990',94,4),(4316,24,2,'2013-07-08','1990',94,4),(4317,25,2,'2013-08-08','1990',94,4),(4318,26,2,'2013-09-09','1990',94,4),(4319,27,2,'2013-10-08','1990',94,4),(4320,28,2,'2013-11-08','1990',94,4),(4321,29,2,'2013-12-09','1990',94,4),(4322,30,2,'2014-01-08','1990',94,4),(4323,31,2,'2014-02-10','1990',94,4),(4324,32,2,'2014-03-10','1990',94,4),(4325,33,2,'2014-04-08','1990',94,4),(4326,34,2,'2014-05-08','1990',94,4),(4327,35,2,'2014-06-09','1990',94,4),(4328,36,2,'2014-07-08','1990',94,4),(4329,37,2,'2014-08-08','1990',94,4),(4330,38,2,'2014-09-08','1990',94,4),(4331,39,2,'2014-10-08','1990',94,4),(4332,40,2,'2014-11-10','1990',94,4),(4333,41,2,'2014-12-08','1990',94,4),(4334,42,2,'2015-01-08','1990',94,4),(4335,43,2,'2015-02-09','1990',94,4),(4336,44,2,'2015-03-09','1990',94,4),(4337,45,2,'2015-04-08','1990',94,4),(4338,46,2,'2015-05-08','1990',94,4),(4339,47,2,'2015-06-08','1990',94,4),(4340,48,2,'2015-07-08','1990',94,4),(4341,1,2,'2011-08-31','1990',95,4),(4342,2,2,'2011-09-08','1990',95,4),(4343,3,2,'2011-10-10','1990',95,4),(4344,4,2,'2011-11-08','1990',95,4),(4345,5,2,'2011-12-08','1990',95,4),(4346,6,2,'2012-01-09','1990',95,4),(4347,7,2,'2012-02-08','1990',95,4),(4348,8,2,'2012-03-08','1990',95,4),(4349,9,2,'2012-04-11','1990',95,4),(4350,10,2,'2012-05-08','1990',95,4),(4351,11,2,'2012-06-08','1990',95,4),(4352,12,2,'2012-07-09','1990',95,4),(4353,13,2,'2012-08-08','1990',95,4),(4354,14,2,'2012-09-10','1990',95,4),(4355,15,2,'2012-10-08','1990',95,4),(4356,16,2,'2012-11-08','1990',95,4),(4357,17,2,'2012-12-10','1990',95,4),(4358,18,2,'2013-01-08','1990',95,4),(4359,19,2,'2013-02-08','1990',95,4),(4360,20,2,'2013-03-08','1990',95,4),(4361,21,2,'2013-04-08','1990',95,4),(4362,22,2,'2013-05-08','1990',95,4),(4363,23,2,'2013-06-10','1990',95,4),(4364,24,2,'2013-07-08','1990',95,4),(4365,25,2,'2013-08-08','1990',95,4),(4366,26,2,'2013-09-09','1990',95,4),(4367,27,2,'2013-10-08','1990',95,4),(4368,28,2,'2013-11-08','1990',95,4),(4369,29,2,'2013-12-09','1990',95,4),(4370,30,2,'2014-01-08','1990',95,4),(4371,31,2,'2014-02-10','1990',95,4),(4372,32,2,'2014-03-10','1990',95,4),(4373,33,2,'2014-04-08','1990',95,4),(4374,34,2,'2014-05-08','1990',95,4),(4375,35,2,'2014-06-09','1990',95,4),(4376,36,2,'2014-07-08','1990',95,4),(4377,37,2,'2014-08-08','1990',95,4),(4378,38,2,'2014-09-08','1990',95,4),(4379,39,2,'2014-10-08','1990',95,4),(4380,40,2,'2014-11-10','1990',95,4),(4381,41,2,'2014-12-08','1990',95,4),(4382,42,2,'2015-01-08','1990',95,4),(4383,43,2,'2015-02-09','1990',95,4),(4384,44,2,'2015-03-09','1990',95,4),(4385,45,2,'2015-04-08','1990',95,4),(4386,46,2,'2015-05-08','1990',95,4),(4387,47,2,'2015-06-08','1990',95,4),(4388,48,2,'2015-07-08','1990',95,4),(4389,1,2,'2011-08-31','1990',96,4),(4390,2,2,'2011-09-08','1990',96,4),(4391,3,2,'2011-10-10','1990',96,4),(4392,4,2,'2011-11-08','1990',96,4),(4393,5,2,'2011-12-08','1990',96,4),(4394,6,2,'2012-01-09','1990',96,4),(4395,7,2,'2012-02-08','1990',96,4),(4396,8,2,'2012-03-08','1990',96,4),(4397,9,2,'2012-04-11','1990',96,4),(4398,10,2,'2012-05-08','1990',96,4),(4399,11,2,'2012-06-08','1990',96,4),(4400,12,2,'2012-07-09','1990',96,4),(4401,13,2,'2012-08-08','1990',96,4),(4402,14,2,'2012-09-10','1990',96,4),(4403,15,2,'2012-10-08','1990',96,4),(4404,16,2,'2012-11-08','1990',96,4),(4405,17,2,'2012-12-10','1990',96,4),(4406,18,2,'2013-01-08','1990',96,4),(4407,19,2,'2013-02-08','1990',96,4),(4408,20,2,'2013-03-08','1990',96,4),(4409,21,2,'2013-04-08','1990',96,4),(4410,22,2,'2013-05-08','1990',96,4),(4411,23,2,'2013-06-10','1990',96,4),(4412,24,2,'2013-07-08','1990',96,4),(4413,25,2,'2013-08-08','1990',96,4),(4414,26,2,'2013-09-09','1990',96,4),(4415,27,2,'2013-10-08','1990',96,4),(4416,28,2,'2013-11-08','1990',96,4),(4417,29,2,'2013-12-09','1990',96,4),(4418,30,2,'2014-01-08','1990',96,4),(4419,31,2,'2014-02-10','1990',96,4),(4420,32,2,'2014-03-10','1990',96,4),(4421,33,2,'2014-04-08','1990',96,4),(4422,34,2,'2014-05-08','1990',96,4),(4423,35,2,'2014-06-09','1990',96,4),(4424,36,2,'2014-07-08','1990',96,4),(4425,37,2,'2014-08-08','1990',96,4),(4426,38,2,'2014-09-08','1990',96,4),(4427,39,2,'2014-10-08','1990',96,4),(4428,40,2,'2014-11-10','1990',96,4),(4429,41,2,'2014-12-08','1990',96,4),(4430,42,2,'2015-01-08','1990',96,4),(4431,43,2,'2015-02-09','1990',96,4),(4432,44,2,'2015-03-09','1990',96,4),(4433,45,2,'2015-04-08','1990',96,4),(4434,46,2,'2015-05-08','1990',96,4),(4435,47,2,'2015-06-08','1990',96,4),(4436,48,2,'2015-07-08','1990',96,4),(4437,1,2,'2011-08-31','1990',97,4),(4438,2,2,'2011-09-08','1990',97,4),(4439,3,2,'2011-10-10','1990',97,4),(4440,4,2,'2011-11-08','1990',97,4),(4441,5,2,'2011-12-08','1990',97,4),(4442,6,2,'2012-01-09','1990',97,4),(4443,7,2,'2012-02-08','1990',97,4),(4444,8,2,'2012-03-08','1990',97,4),(4445,9,2,'2012-04-11','1990',97,4),(4446,10,2,'2012-05-08','1990',97,4),(4447,11,2,'2012-06-08','1990',97,4),(4448,12,2,'2012-07-09','1990',97,4),(4449,13,2,'2012-08-08','1990',97,4),(4450,14,2,'2012-09-10','1990',97,4),(4451,15,2,'2012-10-08','1990',97,4),(4452,16,2,'2012-11-08','1990',97,4),(4453,17,2,'2012-12-10','1990',97,4),(4454,18,2,'2013-01-08','1990',97,4),(4455,19,2,'2013-02-08','1990',97,4),(4456,20,2,'2013-03-08','1990',97,4),(4457,21,2,'2013-04-08','1990',97,4),(4458,22,2,'2013-05-08','1990',97,4),(4459,23,2,'2013-06-10','1990',97,4),(4460,24,2,'2013-07-08','1990',97,4),(4461,25,2,'2013-08-08','1990',97,4),(4462,26,2,'2013-09-09','1990',97,4),(4463,27,2,'2013-10-08','1990',97,4),(4464,28,2,'2013-11-08','1990',97,4),(4465,29,2,'2013-12-09','1990',97,4),(4466,30,2,'2014-01-08','1990',97,4),(4467,31,2,'2014-02-10','1990',97,4),(4468,32,2,'2014-03-10','1990',97,4),(4469,33,2,'2014-04-08','1990',97,4),(4470,34,2,'2014-05-08','1990',97,4),(4471,35,2,'2014-06-09','1990',97,4),(4472,36,2,'2014-07-08','1990',97,4),(4473,37,2,'2014-08-08','1990',97,4),(4474,38,2,'2014-09-08','1990',97,4),(4475,39,2,'2014-10-08','1990',97,4),(4476,40,2,'2014-11-10','1990',97,4),(4477,41,2,'2014-12-08','1990',97,4),(4478,42,2,'2015-01-08','1990',97,4),(4479,43,2,'2015-02-09','1990',97,4),(4480,44,2,'2015-03-09','1990',97,4),(4481,45,2,'2015-04-08','1990',97,4),(4482,46,2,'2015-05-08','1990',97,4),(4483,47,2,'2015-06-08','1990',97,4),(4484,48,2,'2015-07-08','1990',97,4),(4485,1,2,'2011-08-31','1990',98,4),(4486,2,2,'2011-09-08','1990',98,4),(4487,3,2,'2011-10-10','1990',98,4),(4488,4,2,'2011-11-08','1990',98,4),(4489,5,2,'2011-12-08','1990',98,4),(4490,6,2,'2012-01-09','1990',98,4),(4491,7,2,'2012-02-08','1990',98,4),(4492,8,2,'2012-03-08','1990',98,4),(4493,9,2,'2012-04-11','1990',98,4),(4494,10,2,'2012-05-08','1990',98,4),(4495,11,2,'2012-06-08','1990',98,4),(4496,12,2,'2012-07-09','1990',98,4),(4497,13,2,'2012-08-08','1990',98,4),(4498,14,2,'2012-09-10','1990',98,4),(4499,15,2,'2012-10-08','1990',98,4),(4500,16,2,'2012-11-08','1990',98,4),(4501,17,2,'2012-12-10','1990',98,4),(4502,18,2,'2013-01-08','1990',98,4),(4503,19,2,'2013-02-08','1990',98,4),(4504,20,2,'2013-03-08','1990',98,4),(4505,21,2,'2013-04-08','1990',98,4),(4506,22,2,'2013-05-08','1990',98,4),(4507,23,2,'2013-06-10','1990',98,4),(4508,24,2,'2013-07-08','1990',98,4),(4509,25,2,'2013-08-08','1990',98,4),(4510,26,2,'2013-09-09','1990',98,4),(4511,27,2,'2013-10-08','1990',98,4),(4512,28,2,'2013-11-08','1990',98,4),(4513,29,2,'2013-12-09','1990',98,4),(4514,30,2,'2014-01-08','1990',98,4),(4515,31,2,'2014-02-10','1990',98,4),(4516,32,2,'2014-03-10','1990',98,4),(4517,33,2,'2014-04-08','1990',98,4),(4518,34,2,'2014-05-08','1990',98,4),(4519,35,2,'2014-06-09','1990',98,4),(4520,36,2,'2014-07-08','1990',98,4),(4521,37,2,'2014-08-08','1990',98,4),(4522,38,2,'2014-09-08','1990',98,4),(4523,39,2,'2014-10-08','1990',98,4),(4524,40,2,'2014-11-10','1990',98,4),(4525,41,2,'2014-12-08','1990',98,4),(4526,42,2,'2015-01-08','1990',98,4),(4527,43,2,'2015-02-09','1990',98,4),(4528,44,2,'2015-03-09','1990',98,4),(4529,45,2,'2015-04-08','1990',98,4),(4530,46,2,'2015-05-08','1990',98,4),(4531,47,2,'2015-06-08','1990',98,4),(4532,48,2,'2015-07-08','1990',98,4),(4533,1,2,'2011-08-31','1990',99,4),(4534,2,2,'2011-09-08','1990',99,4),(4535,3,2,'2011-10-10','1990',99,4),(4536,4,2,'2011-11-08','1990',99,4),(4537,5,2,'2011-12-08','1990',99,4),(4538,6,2,'2012-01-09','1990',99,4),(4539,7,2,'2012-02-08','1990',99,4),(4540,8,2,'2012-03-08','1990',99,4),(4541,9,2,'2012-04-11','1990',99,4),(4542,10,2,'2012-05-08','1990',99,4),(4543,11,2,'2012-06-08','1990',99,4),(4544,12,2,'2012-07-09','1990',99,4),(4545,13,2,'2012-08-08','1990',99,4),(4546,14,2,'2012-09-10','1990',99,4),(4547,15,2,'2012-10-08','1990',99,4),(4548,16,2,'2012-11-08','1990',99,4),(4549,17,2,'2012-12-10','1990',99,4),(4550,18,2,'2013-01-08','1990',99,4),(4551,19,2,'2013-02-08','1990',99,4),(4552,20,2,'2013-03-08','1990',99,4),(4553,21,2,'2013-04-08','1990',99,4),(4554,22,2,'2013-05-08','1990',99,4),(4555,23,2,'2013-06-10','1990',99,4),(4556,24,2,'2013-07-08','1990',99,4),(4557,25,2,'2013-08-08','1990',99,4),(4558,26,2,'2013-09-09','1990',99,4),(4559,27,2,'2013-10-08','1990',99,4),(4560,28,2,'2013-11-08','1990',99,4),(4561,29,2,'2013-12-09','1990',99,4),(4562,30,2,'2014-01-08','1990',99,4),(4563,31,2,'2014-02-10','1990',99,4),(4564,32,2,'2014-03-10','1990',99,4),(4565,33,2,'2014-04-08','1990',99,4),(4566,34,2,'2014-05-08','1990',99,4),(4567,35,2,'2014-06-09','1990',99,4),(4568,36,2,'2014-07-08','1990',99,4),(4569,37,2,'2014-08-08','1990',99,4),(4570,38,2,'2014-09-08','1990',99,4),(4571,39,2,'2014-10-08','1990',99,4),(4572,40,2,'2014-11-10','1990',99,4),(4573,41,2,'2014-12-08','1990',99,4),(4574,42,2,'2015-01-08','1990',99,4),(4575,43,2,'2015-02-09','1990',99,4),(4576,44,2,'2015-03-09','1990',99,4),(4577,45,2,'2015-04-08','1990',99,4),(4578,46,2,'2015-05-08','1990',99,4),(4579,47,2,'2015-06-08','1990',99,4),(4580,48,2,'2015-07-08','1990',99,4),(4581,1,2,'2011-08-31','1990',100,4),(4582,2,2,'2011-09-08','1990',100,4),(4583,3,2,'2011-10-10','1990',100,4),(4584,4,2,'2011-11-08','1990',100,4),(4585,5,2,'2011-12-08','1990',100,4),(4586,6,2,'2012-01-09','1990',100,4),(4587,7,2,'2012-02-08','1990',100,4),(4588,8,2,'2012-03-08','1990',100,4),(4589,9,2,'2012-04-11','1990',100,4),(4590,10,2,'2012-05-08','1990',100,4),(4591,11,2,'2012-06-08','1990',100,4),(4592,12,2,'2012-07-09','1990',100,4),(4593,13,2,'2012-08-08','1990',100,4),(4594,14,2,'2012-09-10','1990',100,4),(4595,15,2,'2012-10-08','1990',100,4),(4596,16,2,'2012-11-08','1990',100,4),(4597,17,2,'2012-12-10','1990',100,4),(4598,18,2,'2013-01-08','1990',100,4),(4599,19,2,'2013-02-08','1990',100,4),(4600,20,2,'2013-03-08','1990',100,4),(4601,21,2,'2013-04-08','1990',100,4),(4602,22,2,'2013-05-08','1990',100,4),(4603,23,2,'2013-06-10','1990',100,4),(4604,24,2,'2013-07-08','1990',100,4),(4605,25,2,'2013-08-08','1990',100,4),(4606,26,2,'2013-09-09','1990',100,4),(4607,27,2,'2013-10-08','1990',100,4),(4608,28,2,'2013-11-08','1990',100,4),(4609,29,2,'2013-12-09','1990',100,4),(4610,30,2,'2014-01-08','1990',100,4),(4611,31,2,'2014-02-10','1990',100,4),(4612,32,2,'2014-03-10','1990',100,4),(4613,33,2,'2014-04-08','1990',100,4),(4614,34,2,'2014-05-08','1990',100,4),(4615,35,2,'2014-06-09','1990',100,4),(4616,36,2,'2014-07-08','1990',100,4),(4617,37,2,'2014-08-08','1990',100,4),(4618,38,2,'2014-09-08','1990',100,4),(4619,39,2,'2014-10-08','1990',100,4),(4620,40,2,'2014-11-10','1990',100,4),(4621,41,2,'2014-12-08','1990',100,4),(4622,42,2,'2015-01-08','1990',100,4),(4623,43,2,'2015-02-09','1990',100,4),(4624,44,2,'2015-03-09','1990',100,4),(4625,45,2,'2015-04-08','1990',100,4),(4626,46,2,'2015-05-08','1990',100,4),(4627,47,2,'2015-06-08','1990',100,4),(4628,48,2,'2015-07-08','1990',100,4),(4629,1,2,'2011-08-31','1990',101,4),(4630,2,2,'2011-09-08','1990',101,4),(4631,3,2,'2011-10-10','1990',101,4),(4632,4,2,'2011-11-08','1990',101,4),(4633,5,2,'2011-12-08','1990',101,4),(4634,6,2,'2012-01-09','1990',101,4),(4635,7,2,'2012-02-08','1990',101,4),(4636,8,2,'2012-03-08','1990',101,4),(4637,9,2,'2012-04-11','1990',101,4),(4638,10,2,'2012-05-08','1990',101,4),(4639,11,2,'2012-06-08','1990',101,4),(4640,12,2,'2012-07-09','1990',101,4),(4641,13,2,'2012-08-08','1990',101,4),(4642,14,2,'2012-09-10','1990',101,4),(4643,15,2,'2012-10-08','1990',101,4),(4644,16,2,'2012-11-08','1990',101,4),(4645,17,2,'2012-12-10','1990',101,4),(4646,18,2,'2013-01-08','1990',101,4),(4647,19,2,'2013-02-08','1990',101,4),(4648,20,2,'2013-03-08','1990',101,4),(4649,21,2,'2013-04-08','1990',101,4),(4650,22,2,'2013-05-08','1990',101,4),(4651,23,2,'2013-06-10','1990',101,4),(4652,24,2,'2013-07-08','1990',101,4),(4653,25,2,'2013-08-08','1990',101,4),(4654,26,2,'2013-09-09','1990',101,4),(4655,27,2,'2013-10-08','1990',101,4),(4656,28,2,'2013-11-08','1990',101,4),(4657,29,2,'2013-12-09','1990',101,4),(4658,30,2,'2014-01-08','1990',101,4),(4659,31,2,'2014-02-10','1990',101,4),(4660,32,2,'2014-03-10','1990',101,4),(4661,33,2,'2014-04-08','1990',101,4),(4662,34,2,'2014-05-08','1990',101,4),(4663,35,2,'2014-06-09','1990',101,4),(4664,36,2,'2014-07-08','1990',101,4),(4665,37,2,'2014-08-08','1990',101,4),(4666,38,2,'2014-09-08','1990',101,4),(4667,39,2,'2014-10-08','1990',101,4),(4668,40,2,'2014-11-10','1990',101,4),(4669,41,2,'2014-12-08','1990',101,4),(4670,42,2,'2015-01-08','1990',101,4),(4671,43,2,'2015-02-09','1990',101,4),(4672,44,2,'2015-03-09','1990',101,4),(4673,45,2,'2015-04-08','1990',101,4),(4674,46,2,'2015-05-08','1990',101,4),(4675,47,2,'2015-06-08','1990',101,4),(4676,48,2,'2015-07-08','1990',101,4),(4677,1,2,'2011-08-31','1990',102,4),(4678,2,2,'2011-09-08','1990',102,4),(4679,3,2,'2011-10-10','1990',102,4),(4680,4,2,'2011-11-08','1990',102,4),(4681,5,2,'2011-12-08','1990',102,4),(4682,6,2,'2012-01-09','1990',102,4),(4683,7,2,'2012-02-08','1990',102,4),(4684,8,2,'2012-03-08','1990',102,4),(4685,9,2,'2012-04-11','1990',102,4),(4686,10,2,'2012-05-08','1990',102,4),(4687,11,2,'2012-06-08','1990',102,4),(4688,12,2,'2012-07-09','1990',102,4),(4689,13,2,'2012-08-08','1990',102,4),(4690,14,2,'2012-09-10','1990',102,4),(4691,15,2,'2012-10-08','1990',102,4),(4692,16,2,'2012-11-08','1990',102,4),(4693,17,2,'2012-12-10','1990',102,4),(4694,18,2,'2013-01-08','1990',102,4),(4695,19,2,'2013-02-08','1990',102,4),(4696,20,2,'2013-03-08','1990',102,4),(4697,21,2,'2013-04-08','1990',102,4),(4698,22,2,'2013-05-08','1990',102,4),(4699,23,2,'2013-06-10','1990',102,4),(4700,24,2,'2013-07-08','1990',102,4),(4701,25,2,'2013-08-08','1990',102,4),(4702,26,2,'2013-09-09','1990',102,4),(4703,27,2,'2013-10-08','1990',102,4),(4704,28,2,'2013-11-08','1990',102,4),(4705,29,2,'2013-12-09','1990',102,4),(4706,30,2,'2014-01-08','1990',102,4),(4707,31,2,'2014-02-10','1990',102,4),(4708,32,2,'2014-03-10','1990',102,4),(4709,33,2,'2014-04-08','1990',102,4),(4710,34,2,'2014-05-08','1990',102,4),(4711,35,2,'2014-06-09','1990',102,4),(4712,36,2,'2014-07-08','1990',102,4),(4713,37,2,'2014-08-08','1990',102,4),(4714,38,2,'2014-09-08','1990',102,4),(4715,39,2,'2014-10-08','1990',102,4),(4716,40,2,'2014-11-10','1990',102,4),(4717,41,2,'2014-12-08','1990',102,4),(4718,42,2,'2015-01-08','1990',102,4),(4719,43,2,'2015-02-09','1990',102,4),(4720,44,2,'2015-03-09','1990',102,4),(4721,45,2,'2015-04-08','1990',102,4),(4722,46,2,'2015-05-08','1990',102,4),(4723,47,2,'2015-06-08','1990',102,4),(4724,48,2,'2015-07-08','1990',102,4),(4725,1,2,'2011-08-31','1990',103,4),(4726,2,2,'2011-09-08','1990',103,4),(4727,3,2,'2011-10-10','1990',103,4),(4728,4,2,'2011-11-08','1990',103,4),(4729,5,2,'2011-12-08','1990',103,4),(4730,6,2,'2012-01-09','1990',103,4),(4731,7,2,'2012-02-08','1990',103,4),(4732,8,2,'2012-03-08','1990',103,4),(4733,9,2,'2012-04-11','1990',103,4),(4734,10,2,'2012-05-08','1990',103,4),(4735,11,2,'2012-06-08','1990',103,4),(4736,12,2,'2012-07-09','1990',103,4),(4737,13,2,'2012-08-08','1990',103,4),(4738,14,2,'2012-09-10','1990',103,4),(4739,15,2,'2012-10-08','1990',103,4),(4740,16,2,'2012-11-08','1990',103,4),(4741,17,2,'2012-12-10','1990',103,4),(4742,18,2,'2013-01-08','1990',103,4),(4743,19,2,'2013-02-08','1990',103,4),(4744,20,2,'2013-03-08','1990',103,4),(4745,21,2,'2013-04-08','1990',103,4),(4746,22,2,'2013-05-08','1990',103,4),(4747,23,2,'2013-06-10','1990',103,4),(4748,24,2,'2013-07-08','1990',103,4),(4749,25,2,'2013-08-08','1990',103,4),(4750,26,2,'2013-09-09','1990',103,4),(4751,27,2,'2013-10-08','1990',103,4),(4752,28,2,'2013-11-08','1990',103,4),(4753,29,2,'2013-12-09','1990',103,4),(4754,30,2,'2014-01-08','1990',103,4),(4755,31,2,'2014-02-10','1990',103,4),(4756,32,2,'2014-03-10','1990',103,4),(4757,33,2,'2014-04-08','1990',103,4),(4758,34,2,'2014-05-08','1990',103,4),(4759,35,2,'2014-06-09','1990',103,4),(4760,36,2,'2014-07-08','1990',103,4),(4761,37,2,'2014-08-08','1990',103,4),(4762,38,2,'2014-09-08','1990',103,4),(4763,39,2,'2014-10-08','1990',103,4),(4764,40,2,'2014-11-10','1990',103,4),(4765,41,2,'2014-12-08','1990',103,4),(4766,42,2,'2015-01-08','1990',103,4),(4767,43,2,'2015-02-09','1990',103,4),(4768,44,2,'2015-03-09','1990',103,4),(4769,45,2,'2015-04-08','1990',103,4),(4770,46,2,'2015-05-08','1990',103,4),(4771,47,2,'2015-06-08','1990',103,4),(4772,48,2,'2015-07-08','1990',103,4),(4773,1,2,'2011-08-31','1990',104,4),(4774,2,2,'2011-09-08','1990',104,4),(4775,3,2,'2011-10-10','1990',104,4),(4776,4,2,'2011-11-08','1990',104,4),(4777,5,2,'2011-12-08','1990',104,4),(4778,6,2,'2012-01-09','1990',104,4),(4779,7,2,'2012-02-08','1990',104,4),(4780,8,2,'2012-03-08','1990',104,4),(4781,9,2,'2012-04-11','1990',104,4),(4782,10,2,'2012-05-08','1990',104,4),(4783,11,2,'2012-06-08','1990',104,4),(4784,12,2,'2012-07-09','1990',104,4),(4785,13,2,'2012-08-08','1990',104,4),(4786,14,2,'2012-09-10','1990',104,4),(4787,15,2,'2012-10-08','1990',104,4),(4788,16,2,'2012-11-08','1990',104,4),(4789,17,2,'2012-12-10','1990',104,4),(4790,18,2,'2013-01-08','1990',104,4),(4791,19,2,'2013-02-08','1990',104,4),(4792,20,2,'2013-03-08','1990',104,4),(4793,21,2,'2013-04-08','1990',104,4),(4794,22,2,'2013-05-08','1990',104,4),(4795,23,2,'2013-06-10','1990',104,4),(4796,24,2,'2013-07-08','1990',104,4),(4797,25,2,'2013-08-08','1990',104,4),(4798,26,2,'2013-09-09','1990',104,4),(4799,27,2,'2013-10-08','1990',104,4),(4800,28,2,'2013-11-08','1990',104,4),(4801,29,2,'2013-12-09','1990',104,4),(4802,30,2,'2014-01-08','1990',104,4),(4803,31,2,'2014-02-10','1990',104,4),(4804,32,2,'2014-03-10','1990',104,4),(4805,33,2,'2014-04-08','1990',104,4),(4806,34,2,'2014-05-08','1990',104,4),(4807,35,2,'2014-06-09','1990',104,4),(4808,36,2,'2014-07-08','1990',104,4),(4809,37,2,'2014-08-08','1990',104,4),(4810,38,2,'2014-09-08','1990',104,4),(4811,39,2,'2014-10-08','1990',104,4),(4812,40,2,'2014-11-10','1990',104,4),(4813,41,2,'2014-12-08','1990',104,4),(4814,42,2,'2015-01-08','1990',104,4),(4815,43,2,'2015-02-09','1990',104,4),(4816,44,2,'2015-03-09','1990',104,4),(4817,45,2,'2015-04-08','1990',104,4),(4818,46,2,'2015-05-08','1990',104,4),(4819,47,2,'2015-06-08','1990',104,4),(4820,48,2,'2015-07-08','1990',104,4),(4821,1,2,'2011-08-31','1990',105,4),(4822,2,2,'2011-09-08','1990',105,4),(4823,3,2,'2011-10-10','1990',105,4),(4824,4,2,'2011-11-08','1990',105,4),(4825,5,2,'2011-12-08','1990',105,4),(4826,6,2,'2012-01-09','1990',105,4),(4827,7,2,'2012-02-08','1990',105,4),(4828,8,2,'2012-03-08','1990',105,4),(4829,9,2,'2012-04-11','1990',105,4),(4830,10,2,'2012-05-08','1990',105,4),(4831,11,2,'2012-06-08','1990',105,4),(4832,12,2,'2012-07-09','1990',105,4),(4833,13,2,'2012-08-08','1990',105,4),(4834,14,2,'2012-09-10','1990',105,4),(4835,15,2,'2012-10-08','1990',105,4),(4836,16,2,'2012-11-08','1990',105,4),(4837,17,2,'2012-12-10','1990',105,4),(4838,18,2,'2013-01-08','1990',105,4),(4839,19,2,'2013-02-08','1990',105,4),(4840,20,2,'2013-03-08','1990',105,4),(4841,21,2,'2013-04-08','1990',105,4),(4842,22,2,'2013-05-08','1990',105,4),(4843,23,2,'2013-06-10','1990',105,4),(4844,24,2,'2013-07-08','1990',105,4),(4845,25,2,'2013-08-08','1990',105,4),(4846,26,2,'2013-09-09','1990',105,4),(4847,27,2,'2013-10-08','1990',105,4),(4848,28,2,'2013-11-08','1990',105,4),(4849,29,2,'2013-12-09','1990',105,4),(4850,30,2,'2014-01-08','1990',105,4),(4851,31,2,'2014-02-10','1990',105,4),(4852,32,2,'2014-03-10','1990',105,4),(4853,33,2,'2014-04-08','1990',105,4),(4854,34,2,'2014-05-08','1990',105,4),(4855,35,2,'2014-06-09','1990',105,4),(4856,36,2,'2014-07-08','1990',105,4),(4857,37,2,'2014-08-08','1990',105,4),(4858,38,2,'2014-09-08','1990',105,4),(4859,39,2,'2014-10-08','1990',105,4),(4860,40,2,'2014-11-10','1990',105,4),(4861,41,2,'2014-12-08','1990',105,4),(4862,42,2,'2015-01-08','1990',105,4),(4863,43,2,'2015-02-09','1990',105,4),(4864,44,2,'2015-03-09','1990',105,4),(4865,45,2,'2015-04-08','1990',105,4),(4866,46,2,'2015-05-08','1990',105,4),(4867,47,2,'2015-06-08','1990',105,4),(4868,48,2,'2015-07-08','1990',105,4),(4869,1,2,'2011-08-31','1990',106,4),(4870,2,2,'2011-09-08','1990',106,4),(4871,3,2,'2011-10-10','1990',106,4),(4872,4,2,'2011-11-08','1990',106,4),(4873,5,2,'2011-12-08','1990',106,4),(4874,6,2,'2012-01-09','1990',106,4),(4875,7,2,'2012-02-08','1990',106,4),(4876,8,2,'2012-03-08','1990',106,4),(4877,9,2,'2012-04-11','1990',106,4),(4878,10,2,'2012-05-08','1990',106,4),(4879,11,2,'2012-06-08','1990',106,4),(4880,12,2,'2012-07-09','1990',106,4),(4881,13,2,'2012-08-08','1990',106,4),(4882,14,2,'2012-09-10','1990',106,4),(4883,15,2,'2012-10-08','1990',106,4),(4884,16,2,'2012-11-08','1990',106,4),(4885,17,2,'2012-12-10','1990',106,4),(4886,18,2,'2013-01-08','1990',106,4),(4887,19,2,'2013-02-08','1990',106,4),(4888,20,2,'2013-03-08','1990',106,4),(4889,21,2,'2013-04-08','1990',106,4),(4890,22,2,'2013-05-08','1990',106,4),(4891,23,2,'2013-06-10','1990',106,4),(4892,24,2,'2013-07-08','1990',106,4),(4893,25,2,'2013-08-08','1990',106,4),(4894,26,2,'2013-09-09','1990',106,4),(4895,27,2,'2013-10-08','1990',106,4),(4896,28,2,'2013-11-08','1990',106,4),(4897,29,2,'2013-12-09','1990',106,4),(4898,30,2,'2014-01-08','1990',106,4),(4899,31,2,'2014-02-10','1990',106,4),(4900,32,2,'2014-03-10','1990',106,4),(4901,33,2,'2014-04-08','1990',106,4),(4902,34,2,'2014-05-08','1990',106,4),(4903,35,2,'2014-06-09','1990',106,4),(4904,36,2,'2014-07-08','1990',106,4),(4905,37,2,'2014-08-08','1990',106,4),(4906,38,2,'2014-09-08','1990',106,4),(4907,39,2,'2014-10-08','1990',106,4),(4908,40,2,'2014-11-10','1990',106,4),(4909,41,2,'2014-12-08','1990',106,4),(4910,42,2,'2015-01-08','1990',106,4),(4911,43,2,'2015-02-09','1990',106,4),(4912,44,2,'2015-03-09','1990',106,4),(4913,45,2,'2015-04-08','1990',106,4),(4914,46,2,'2015-05-08','1990',106,4),(4915,47,2,'2015-06-08','1990',106,4),(4916,48,2,'2015-07-08','1990',106,4),(4917,1,2,'2011-08-31','1990',107,4),(4918,2,2,'2011-09-08','1990',107,4),(4919,3,2,'2011-10-10','1990',107,4),(4920,4,2,'2011-11-08','1990',107,4),(4921,5,2,'2011-12-08','1990',107,4),(4922,6,2,'2012-01-09','1990',107,4),(4923,7,2,'2012-02-08','1990',107,4),(4924,8,2,'2012-03-08','1990',107,4),(4925,9,2,'2012-04-11','1990',107,4),(4926,10,2,'2012-05-08','1990',107,4),(4927,11,2,'2012-06-08','1990',107,4),(4928,12,2,'2012-07-09','1990',107,4),(4929,13,2,'2012-08-08','1990',107,4),(4930,14,2,'2012-09-10','1990',107,4),(4931,15,2,'2012-10-08','1990',107,4),(4932,16,2,'2012-11-08','1990',107,4),(4933,17,2,'2012-12-10','1990',107,4),(4934,18,2,'2013-01-08','1990',107,4),(4935,19,2,'2013-02-08','1990',107,4),(4936,20,2,'2013-03-08','1990',107,4),(4937,21,2,'2013-04-08','1990',107,4),(4938,22,2,'2013-05-08','1990',107,4),(4939,23,2,'2013-06-10','1990',107,4),(4940,24,2,'2013-07-08','1990',107,4),(4941,25,2,'2013-08-08','1990',107,4),(4942,26,2,'2013-09-09','1990',107,4),(4943,27,2,'2013-10-08','1990',107,4),(4944,28,2,'2013-11-08','1990',107,4),(4945,29,2,'2013-12-09','1990',107,4),(4946,30,2,'2014-01-08','1990',107,4),(4947,31,2,'2014-02-10','1990',107,4),(4948,32,2,'2014-03-10','1990',107,4),(4949,33,2,'2014-04-08','1990',107,4),(4950,34,2,'2014-05-08','1990',107,4),(4951,35,2,'2014-06-09','1990',107,4),(4952,36,2,'2014-07-08','1990',107,4),(4953,37,2,'2014-08-08','1990',107,4),(4954,38,2,'2014-09-08','1990',107,4),(4955,39,2,'2014-10-08','1990',107,4),(4956,40,2,'2014-11-10','1990',107,4),(4957,41,2,'2014-12-08','1990',107,4),(4958,42,2,'2015-01-08','1990',107,4),(4959,43,2,'2015-02-09','1990',107,4),(4960,44,2,'2015-03-09','1990',107,4),(4961,45,2,'2015-04-08','1990',107,4),(4962,46,2,'2015-05-08','1990',107,4),(4963,47,2,'2015-06-08','1990',107,4),(4964,48,2,'2015-07-08','1990',107,4),(4965,1,2,'2011-08-31','1990',108,4),(4966,2,2,'2011-09-08','1990',108,4),(4967,3,2,'2011-10-10','1990',108,4),(4968,4,2,'2011-11-08','1990',108,4),(4969,5,2,'2011-12-08','1990',108,4),(4970,6,2,'2012-01-09','1990',108,4),(4971,7,2,'2012-02-08','1990',108,4),(4972,8,2,'2012-03-08','1990',108,4),(4973,9,2,'2012-04-11','1990',108,4),(4974,10,2,'2012-05-08','1990',108,4),(4975,11,2,'2012-06-08','1990',108,4),(4976,12,2,'2012-07-09','1990',108,4),(4977,13,2,'2012-08-08','1990',108,4),(4978,14,2,'2012-09-10','1990',108,4),(4979,15,2,'2012-10-08','1990',108,4),(4980,16,2,'2012-11-08','1990',108,4),(4981,17,2,'2012-12-10','1990',108,4),(4982,18,2,'2013-01-08','1990',108,4),(4983,19,2,'2013-02-08','1990',108,4),(4984,20,2,'2013-03-08','1990',108,4),(4985,21,2,'2013-04-08','1990',108,4),(4986,22,2,'2013-05-08','1990',108,4),(4987,23,2,'2013-06-10','1990',108,4),(4988,24,2,'2013-07-08','1990',108,4),(4989,25,2,'2013-08-08','1990',108,4),(4990,26,2,'2013-09-09','1990',108,4),(4991,27,2,'2013-10-08','1990',108,4),(4992,28,2,'2013-11-08','1990',108,4),(4993,29,2,'2013-12-09','1990',108,4),(4994,30,2,'2014-01-08','1990',108,4),(4995,31,2,'2014-02-10','1990',108,4),(4996,32,2,'2014-03-10','1990',108,4),(4997,33,2,'2014-04-08','1990',108,4),(4998,34,2,'2014-05-08','1990',108,4),(4999,35,2,'2014-06-09','1990',108,4),(5000,36,2,'2014-07-08','1990',108,4),(5001,37,2,'2014-08-08','1990',108,4),(5002,38,2,'2014-09-08','1990',108,4),(5003,39,2,'2014-10-08','1990',108,4),(5004,40,2,'2014-11-10','1990',108,4),(5005,41,2,'2014-12-08','1990',108,4),(5006,42,2,'2015-01-08','1990',108,4),(5007,43,2,'2015-02-09','1990',108,4),(5008,44,2,'2015-03-09','1990',108,4),(5009,45,2,'2015-04-08','1990',108,4),(5010,46,2,'2015-05-08','1990',108,4),(5011,47,2,'2015-06-08','1990',108,4),(5012,48,2,'2015-07-08','1990',108,4),(5013,1,2,'2011-08-31','1990',109,4),(5014,2,2,'2011-09-08','1990',109,4),(5015,3,2,'2011-10-10','1990',109,4),(5016,4,2,'2011-11-08','1990',109,4),(5017,5,2,'2011-12-08','1990',109,4),(5018,6,2,'2012-01-09','1990',109,4),(5019,7,2,'2012-02-08','1990',109,4),(5020,8,2,'2012-03-08','1990',109,4),(5021,9,2,'2012-04-11','1990',109,4),(5022,10,2,'2012-05-08','1990',109,4),(5023,11,2,'2012-06-08','1990',109,4),(5024,12,2,'2012-07-09','1990',109,4),(5025,13,2,'2012-08-08','1990',109,4),(5026,14,2,'2012-09-10','1990',109,4),(5027,15,2,'2012-10-08','1990',109,4),(5028,16,2,'2012-11-08','1990',109,4),(5029,17,2,'2012-12-10','1990',109,4),(5030,18,2,'2013-01-08','1990',109,4),(5031,19,2,'2013-02-08','1990',109,4),(5032,20,2,'2013-03-08','1990',109,4),(5033,21,2,'2013-04-08','1990',109,4),(5034,22,2,'2013-05-08','1990',109,4),(5035,23,2,'2013-06-10','1990',109,4),(5036,24,2,'2013-07-08','1990',109,4),(5037,25,2,'2013-08-08','1990',109,4),(5038,26,2,'2013-09-09','1990',109,4),(5039,27,2,'2013-10-08','1990',109,4),(5040,28,2,'2013-11-08','1990',109,4),(5041,29,2,'2013-12-09','1990',109,4),(5042,30,2,'2014-01-08','1990',109,4),(5043,31,2,'2014-02-10','1990',109,4),(5044,32,2,'2014-03-10','1990',109,4),(5045,33,2,'2014-04-08','1990',109,4),(5046,34,2,'2014-05-08','1990',109,4),(5047,35,2,'2014-06-09','1990',109,4),(5048,36,2,'2014-07-08','1990',109,4),(5049,37,2,'2014-08-08','1990',109,4),(5050,38,2,'2014-09-08','1990',109,4),(5051,39,2,'2014-10-08','1990',109,4),(5052,40,2,'2014-11-10','1990',109,4),(5053,41,2,'2014-12-08','1990',109,4),(5054,42,2,'2015-01-08','1990',109,4),(5055,43,2,'2015-02-09','1990',109,4),(5056,44,2,'2015-03-09','1990',109,4),(5057,45,2,'2015-04-08','1990',109,4),(5058,46,2,'2015-05-08','1990',109,4),(5059,47,2,'2015-06-08','1990',109,4),(5060,48,2,'2015-07-08','1990',109,4),(5061,1,2,'2011-08-31','1990',110,4),(5062,2,2,'2011-09-08','1990',110,4),(5063,3,2,'2011-10-10','1990',110,4),(5064,4,2,'2011-11-08','1990',110,4),(5065,5,2,'2011-12-08','1990',110,4),(5066,6,2,'2012-01-09','1990',110,4),(5067,7,2,'2012-02-08','1990',110,4),(5068,8,2,'2012-03-08','1990',110,4),(5069,9,2,'2012-04-11','1990',110,4),(5070,10,2,'2012-05-08','1990',110,4),(5071,11,2,'2012-06-08','1990',110,4),(5072,12,2,'2012-07-09','1990',110,4),(5073,13,2,'2012-08-08','1990',110,4),(5074,14,2,'2012-09-10','1990',110,4),(5075,15,2,'2012-10-08','1990',110,4),(5076,16,2,'2012-11-08','1990',110,4),(5077,17,2,'2012-12-10','1990',110,4),(5078,18,2,'2013-01-08','1990',110,4),(5079,19,2,'2013-02-08','1990',110,4),(5080,20,2,'2013-03-08','1990',110,4),(5081,21,2,'2013-04-08','1990',110,4),(5082,22,2,'2013-05-08','1990',110,4),(5083,23,2,'2013-06-10','1990',110,4),(5084,24,2,'2013-07-08','1990',110,4),(5085,25,2,'2013-08-08','1990',110,4),(5086,26,2,'2013-09-09','1990',110,4),(5087,27,2,'2013-10-08','1990',110,4),(5088,28,2,'2013-11-08','1990',110,4),(5089,29,2,'2013-12-09','1990',110,4),(5090,30,2,'2014-01-08','1990',110,4),(5091,31,2,'2014-02-10','1990',110,4),(5092,32,2,'2014-03-10','1990',110,4),(5093,33,2,'2014-04-08','1990',110,4),(5094,34,2,'2014-05-08','1990',110,4),(5095,35,2,'2014-06-09','1990',110,4),(5096,36,2,'2014-07-08','1990',110,4),(5097,37,2,'2014-08-08','1990',110,4),(5098,38,2,'2014-09-08','1990',110,4),(5099,39,2,'2014-10-08','1990',110,4),(5100,40,2,'2014-11-10','1990',110,4),(5101,41,2,'2014-12-08','1990',110,4),(5102,42,2,'2015-01-08','1990',110,4),(5103,43,2,'2015-02-09','1990',110,4),(5104,44,2,'2015-03-09','1990',110,4),(5105,45,2,'2015-04-08','1990',110,4),(5106,46,2,'2015-05-08','1990',110,4),(5107,47,2,'2015-06-08','1990',110,4),(5108,48,2,'2015-07-08','1990',110,4),(5109,1,2,'2011-08-31','1990',111,4),(5110,2,2,'2011-09-08','1990',111,4),(5111,3,2,'2011-10-10','1990',111,4),(5112,4,2,'2011-11-08','1990',111,4),(5113,5,2,'2011-12-08','1990',111,4),(5114,6,2,'2012-01-09','1990',111,4),(5115,7,2,'2012-02-08','1990',111,4),(5116,8,2,'2012-03-08','1990',111,4),(5117,9,2,'2012-04-11','1990',111,4),(5118,10,2,'2012-05-08','1990',111,4),(5119,11,2,'2012-06-08','1990',111,4),(5120,12,2,'2012-07-09','1990',111,4),(5121,13,2,'2012-08-08','1990',111,4),(5122,14,2,'2012-09-10','1990',111,4),(5123,15,2,'2012-10-08','1990',111,4),(5124,16,2,'2012-11-08','1990',111,4),(5125,17,2,'2012-12-10','1990',111,4),(5126,18,2,'2013-01-08','1990',111,4),(5127,19,2,'2013-02-08','1990',111,4),(5128,20,2,'2013-03-08','1990',111,4),(5129,21,2,'2013-04-08','1990',111,4),(5130,22,2,'2013-05-08','1990',111,4),(5131,23,2,'2013-06-10','1990',111,4),(5132,24,2,'2013-07-08','1990',111,4),(5133,25,2,'2013-08-08','1990',111,4),(5134,26,2,'2013-09-09','1990',111,4),(5135,27,2,'2013-10-08','1990',111,4),(5136,28,2,'2013-11-08','1990',111,4),(5137,29,2,'2013-12-09','1990',111,4),(5138,30,2,'2014-01-08','1990',111,4),(5139,31,2,'2014-02-10','1990',111,4),(5140,32,2,'2014-03-10','1990',111,4),(5141,33,2,'2014-04-08','1990',111,4),(5142,34,2,'2014-05-08','1990',111,4),(5143,35,2,'2014-06-09','1990',111,4),(5144,36,2,'2014-07-08','1990',111,4),(5145,37,2,'2014-08-08','1990',111,4),(5146,38,2,'2014-09-08','1990',111,4),(5147,39,2,'2014-10-08','1990',111,4),(5148,40,2,'2014-11-10','1990',111,4),(5149,41,2,'2014-12-08','1990',111,4),(5150,42,2,'2015-01-08','1990',111,4),(5151,43,2,'2015-02-09','1990',111,4),(5152,44,2,'2015-03-09','1990',111,4),(5153,45,2,'2015-04-08','1990',111,4),(5154,46,2,'2015-05-08','1990',111,4),(5155,47,2,'2015-06-08','1990',111,4),(5156,48,2,'2015-07-08','1990',111,4),(5157,1,2,'2011-08-31','1990',112,4),(5158,2,2,'2011-09-08','1990',112,4),(5159,3,2,'2011-10-10','1990',112,4),(5160,4,2,'2011-11-08','1990',112,4),(5161,5,2,'2011-12-08','1990',112,4),(5162,6,2,'2012-01-09','1990',112,4),(5163,7,2,'2012-02-08','1990',112,4),(5164,8,2,'2012-03-08','1990',112,4),(5165,9,2,'2012-04-11','1990',112,4),(5166,10,2,'2012-05-08','1990',112,4),(5167,11,2,'2012-06-08','1990',112,4),(5168,12,2,'2012-07-09','1990',112,4),(5169,13,2,'2012-08-08','1990',112,4),(5170,14,2,'2012-09-10','1990',112,4),(5171,15,2,'2012-10-08','1990',112,4),(5172,16,2,'2012-11-08','1990',112,4),(5173,17,2,'2012-12-10','1990',112,4),(5174,18,2,'2013-01-08','1990',112,4),(5175,19,2,'2013-02-08','1990',112,4),(5176,20,2,'2013-03-08','1990',112,4),(5177,21,2,'2013-04-08','1990',112,4),(5178,22,2,'2013-05-08','1990',112,4),(5179,23,2,'2013-06-10','1990',112,4),(5180,24,2,'2013-07-08','1990',112,4),(5181,25,2,'2013-08-08','1990',112,4),(5182,26,2,'2013-09-09','1990',112,4),(5183,27,2,'2013-10-08','1990',112,4),(5184,28,2,'2013-11-08','1990',112,4),(5185,29,2,'2013-12-09','1990',112,4),(5186,30,2,'2014-01-08','1990',112,4),(5187,31,2,'2014-02-10','1990',112,4),(5188,32,2,'2014-03-10','1990',112,4),(5189,33,2,'2014-04-08','1990',112,4),(5190,34,2,'2014-05-08','1990',112,4),(5191,35,2,'2014-06-09','1990',112,4),(5192,36,2,'2014-07-08','1990',112,4),(5193,37,2,'2014-08-08','1990',112,4),(5194,38,2,'2014-09-08','1990',112,4),(5195,39,2,'2014-10-08','1990',112,4),(5196,40,2,'2014-11-10','1990',112,4),(5197,41,2,'2014-12-08','1990',112,4),(5198,42,2,'2015-01-08','1990',112,4),(5199,43,2,'2015-02-09','1990',112,4),(5200,44,2,'2015-03-09','1990',112,4),(5201,45,2,'2015-04-08','1990',112,4),(5202,46,2,'2015-05-08','1990',112,4),(5203,47,2,'2015-06-08','1990',112,4),(5204,48,2,'2015-07-08','1990',112,4),(5205,1,2,'2011-08-31','1990',113,4),(5206,2,2,'2011-09-08','1990',113,4),(5207,3,2,'2011-10-10','1990',113,4),(5208,4,2,'2011-11-08','1990',113,4),(5209,5,2,'2011-12-08','1990',113,4),(5210,6,2,'2012-01-09','1990',113,4),(5211,7,2,'2012-02-08','1990',113,4),(5212,8,2,'2012-03-08','1990',113,4),(5213,9,2,'2012-04-11','1990',113,4),(5214,10,2,'2012-05-08','1990',113,4),(5215,11,2,'2012-06-08','1990',113,4),(5216,12,2,'2012-07-09','1990',113,4),(5217,13,2,'2012-08-08','1990',113,4),(5218,14,2,'2012-09-10','1990',113,4),(5219,15,2,'2012-10-08','1990',113,4),(5220,16,2,'2012-11-08','1990',113,4),(5221,17,2,'2012-12-10','1990',113,4),(5222,18,2,'2013-01-08','1990',113,4),(5223,19,2,'2013-02-08','1990',113,4),(5224,20,2,'2013-03-08','1990',113,4),(5225,21,2,'2013-04-08','1990',113,4),(5226,22,2,'2013-05-08','1990',113,4),(5227,23,2,'2013-06-10','1990',113,4),(5228,24,2,'2013-07-08','1990',113,4),(5229,25,2,'2013-08-08','1990',113,4),(5230,26,2,'2013-09-09','1990',113,4),(5231,27,2,'2013-10-08','1990',113,4),(5232,28,2,'2013-11-08','1990',113,4),(5233,29,2,'2013-12-09','1990',113,4),(5234,30,2,'2014-01-08','1990',113,4),(5235,31,2,'2014-02-10','1990',113,4),(5236,32,2,'2014-03-10','1990',113,4),(5237,33,2,'2014-04-08','1990',113,4),(5238,34,2,'2014-05-08','1990',113,4),(5239,35,2,'2014-06-09','1990',113,4),(5240,36,2,'2014-07-08','1990',113,4),(5241,37,2,'2014-08-08','1990',113,4),(5242,38,2,'2014-09-08','1990',113,4),(5243,39,2,'2014-10-08','1990',113,4),(5244,40,2,'2014-11-10','1990',113,4),(5245,41,2,'2014-12-08','1990',113,4),(5246,42,2,'2015-01-08','1990',113,4),(5247,43,2,'2015-02-09','1990',113,4),(5248,44,2,'2015-03-09','1990',113,4),(5249,45,2,'2015-04-08','1990',113,4),(5250,46,2,'2015-05-08','1990',113,4),(5251,47,2,'2015-06-08','1990',113,4),(5252,48,2,'2015-07-08','1990',113,4),(5253,1,2,'2011-08-31','1990',114,4),(5254,2,2,'2011-09-08','1990',114,4),(5255,3,2,'2011-10-10','1990',114,4),(5256,4,2,'2011-11-08','1990',114,4),(5257,5,2,'2011-12-08','1990',114,4),(5258,6,2,'2012-01-09','1990',114,4),(5259,7,2,'2012-02-08','1990',114,4),(5260,8,2,'2012-03-08','1990',114,4),(5261,9,2,'2012-04-11','1990',114,4),(5262,10,2,'2012-05-08','1990',114,4),(5263,11,2,'2012-06-08','1990',114,4),(5264,12,2,'2012-07-09','1990',114,4),(5265,13,2,'2012-08-08','1990',114,4),(5266,14,2,'2012-09-10','1990',114,4),(5267,15,2,'2012-10-08','1990',114,4),(5268,16,2,'2012-11-08','1990',114,4),(5269,17,2,'2012-12-10','1990',114,4),(5270,18,2,'2013-01-08','1990',114,4),(5271,19,2,'2013-02-08','1990',114,4),(5272,20,2,'2013-03-08','1990',114,4),(5273,21,2,'2013-04-08','1990',114,4),(5274,22,2,'2013-05-08','1990',114,4),(5275,23,2,'2013-06-10','1990',114,4),(5276,24,2,'2013-07-08','1990',114,4),(5277,25,2,'2013-08-08','1990',114,4),(5278,26,2,'2013-09-09','1990',114,4),(5279,27,2,'2013-10-08','1990',114,4),(5280,28,2,'2013-11-08','1990',114,4),(5281,29,2,'2013-12-09','1990',114,4),(5282,30,2,'2014-01-08','1990',114,4),(5283,31,2,'2014-02-10','1990',114,4),(5284,32,2,'2014-03-10','1990',114,4),(5285,33,2,'2014-04-08','1990',114,4),(5286,34,2,'2014-05-08','1990',114,4),(5287,35,2,'2014-06-09','1990',114,4),(5288,36,2,'2014-07-08','1990',114,4),(5289,37,2,'2014-08-08','1990',114,4),(5290,38,2,'2014-09-08','1990',114,4),(5291,39,2,'2014-10-08','1990',114,4),(5292,40,2,'2014-11-10','1990',114,4),(5293,41,2,'2014-12-08','1990',114,4),(5294,42,2,'2015-01-08','1990',114,4),(5295,43,2,'2015-02-09','1990',114,4),(5296,44,2,'2015-03-09','1990',114,4),(5297,45,2,'2015-04-08','1990',114,4),(5298,46,2,'2015-05-08','1990',114,4),(5299,47,2,'2015-06-08','1990',114,4),(5300,48,2,'2015-07-08','1990',114,4),(5301,1,2,'2011-08-31','1990',115,4),(5302,2,2,'2011-09-08','1990',115,4),(5303,3,2,'2011-10-10','1990',115,4),(5304,4,2,'2011-11-08','1990',115,4),(5305,5,2,'2011-12-08','1990',115,4),(5306,6,2,'2012-01-09','1990',115,4),(5307,7,2,'2012-02-08','1990',115,4),(5308,8,2,'2012-03-08','1990',115,4),(5309,9,2,'2012-04-11','1990',115,4),(5310,10,2,'2012-05-08','1990',115,4),(5311,11,2,'2012-06-08','1990',115,4),(5312,12,2,'2012-07-09','1990',115,4),(5313,13,2,'2012-08-08','1990',115,4),(5314,14,2,'2012-09-10','1990',115,4),(5315,15,2,'2012-10-08','1990',115,4),(5316,16,2,'2012-11-08','1990',115,4),(5317,17,2,'2012-12-10','1990',115,4),(5318,18,2,'2013-01-08','1990',115,4),(5319,19,2,'2013-02-08','1990',115,4),(5320,20,2,'2013-03-08','1990',115,4),(5321,21,2,'2013-04-08','1990',115,4),(5322,22,2,'2013-05-08','1990',115,4),(5323,23,2,'2013-06-10','1990',115,4),(5324,24,2,'2013-07-08','1990',115,4),(5325,25,2,'2013-08-08','1990',115,4),(5326,26,2,'2013-09-09','1990',115,4),(5327,27,2,'2013-10-08','1990',115,4),(5328,28,2,'2013-11-08','1990',115,4),(5329,29,2,'2013-12-09','1990',115,4),(5330,30,2,'2014-01-08','1990',115,4),(5331,31,2,'2014-02-10','1990',115,4),(5332,32,2,'2014-03-10','1990',115,4),(5333,33,2,'2014-04-08','1990',115,4),(5334,34,2,'2014-05-08','1990',115,4),(5335,35,2,'2014-06-09','1990',115,4),(5336,36,2,'2014-07-08','1990',115,4),(5337,37,2,'2014-08-08','1990',115,4),(5338,38,2,'2014-09-08','1990',115,4),(5339,39,2,'2014-10-08','1990',115,4),(5340,40,2,'2014-11-10','1990',115,4),(5341,41,2,'2014-12-08','1990',115,4),(5342,42,2,'2015-01-08','1990',115,4),(5343,43,2,'2015-02-09','1990',115,4),(5344,44,2,'2015-03-09','1990',115,4),(5345,45,2,'2015-04-08','1990',115,4),(5346,46,2,'2015-05-08','1990',115,4),(5347,47,2,'2015-06-08','1990',115,4),(5348,48,2,'2015-07-08','1990',115,4),(5349,1,2,'2011-08-31','1990',116,4),(5350,2,2,'2011-09-08','1990',116,4),(5351,3,2,'2011-10-10','1990',116,4),(5352,4,2,'2011-11-08','1990',116,4),(5353,5,2,'2011-12-08','1990',116,4),(5354,6,2,'2012-01-09','1990',116,4),(5355,7,2,'2012-02-08','1990',116,4),(5356,8,2,'2012-03-08','1990',116,4),(5357,9,2,'2012-04-11','1990',116,4),(5358,10,2,'2012-05-08','1990',116,4),(5359,11,2,'2012-06-08','1990',116,4),(5360,12,2,'2012-07-09','1990',116,4),(5361,13,2,'2012-08-08','1990',116,4),(5362,14,2,'2012-09-10','1990',116,4),(5363,15,2,'2012-10-08','1990',116,4),(5364,16,2,'2012-11-08','1990',116,4),(5365,17,2,'2012-12-10','1990',116,4),(5366,18,2,'2013-01-08','1990',116,4),(5367,19,2,'2013-02-08','1990',116,4),(5368,20,2,'2013-03-08','1990',116,4),(5369,21,2,'2013-04-08','1990',116,4),(5370,22,2,'2013-05-08','1990',116,4),(5371,23,2,'2013-06-10','1990',116,4),(5372,24,2,'2013-07-08','1990',116,4),(5373,25,2,'2013-08-08','1990',116,4),(5374,26,2,'2013-09-09','1990',116,4),(5375,27,2,'2013-10-08','1990',116,4),(5376,28,2,'2013-11-08','1990',116,4),(5377,29,2,'2013-12-09','1990',116,4),(5378,30,2,'2014-01-08','1990',116,4),(5379,31,2,'2014-02-10','1990',116,4),(5380,32,2,'2014-03-10','1990',116,4),(5381,33,2,'2014-04-08','1990',116,4),(5382,34,2,'2014-05-08','1990',116,4),(5383,35,2,'2014-06-09','1990',116,4),(5384,36,2,'2014-07-08','1990',116,4),(5385,37,2,'2014-08-08','1990',116,4),(5386,38,2,'2014-09-08','1990',116,4),(5387,39,2,'2014-10-08','1990',116,4),(5388,40,2,'2014-11-10','1990',116,4),(5389,41,2,'2014-12-08','1990',116,4),(5390,42,2,'2015-01-08','1990',116,4),(5391,43,2,'2015-02-09','1990',116,4),(5392,44,2,'2015-03-09','1990',116,4),(5393,45,2,'2015-04-08','1990',116,4),(5394,46,2,'2015-05-08','1990',116,4),(5395,47,2,'2015-06-08','1990',116,4),(5396,48,2,'2015-07-08','1990',116,4),(5397,1,2,'2011-08-31','1990',117,4),(5398,2,2,'2011-09-08','1990',117,4),(5399,3,2,'2011-10-10','1990',117,4),(5400,4,2,'2011-11-08','1990',117,4),(5401,5,2,'2011-12-08','1990',117,4),(5402,6,2,'2012-01-09','1990',117,4),(5403,7,2,'2012-02-08','1990',117,4),(5404,8,2,'2012-03-08','1990',117,4),(5405,9,2,'2012-04-11','1990',117,4),(5406,10,2,'2012-05-08','1990',117,4),(5407,11,2,'2012-06-08','1990',117,4),(5408,12,2,'2012-07-09','1990',117,4),(5409,13,2,'2012-08-08','1990',117,4),(5410,14,2,'2012-09-10','1990',117,4),(5411,15,2,'2012-10-08','1990',117,4),(5412,16,2,'2012-11-08','1990',117,4),(5413,17,2,'2012-12-10','1990',117,4),(5414,18,2,'2013-01-08','1990',117,4),(5415,19,2,'2013-02-08','1990',117,4),(5416,20,2,'2013-03-08','1990',117,4),(5417,21,2,'2013-04-08','1990',117,4),(5418,22,2,'2013-05-08','1990',117,4),(5419,23,2,'2013-06-10','1990',117,4),(5420,24,2,'2013-07-08','1990',117,4),(5421,25,2,'2013-08-08','1990',117,4),(5422,26,2,'2013-09-09','1990',117,4),(5423,27,2,'2013-10-08','1990',117,4),(5424,28,2,'2013-11-08','1990',117,4),(5425,29,2,'2013-12-09','1990',117,4),(5426,30,2,'2014-01-08','1990',117,4),(5427,31,2,'2014-02-10','1990',117,4),(5428,32,2,'2014-03-10','1990',117,4),(5429,33,2,'2014-04-08','1990',117,4),(5430,34,2,'2014-05-08','1990',117,4),(5431,35,2,'2014-06-09','1990',117,4),(5432,36,2,'2014-07-08','1990',117,4),(5433,37,2,'2014-08-08','1990',117,4),(5434,38,2,'2014-09-08','1990',117,4),(5435,39,2,'2014-10-08','1990',117,4),(5436,40,2,'2014-11-10','1990',117,4),(5437,41,2,'2014-12-08','1990',117,4),(5438,42,2,'2015-01-08','1990',117,4),(5439,43,2,'2015-02-09','1990',117,4),(5440,44,2,'2015-03-09','1990',117,4),(5441,45,2,'2015-04-08','1990',117,4),(5442,46,2,'2015-05-08','1990',117,4),(5443,47,2,'2015-06-08','1990',117,4),(5444,48,2,'2015-07-08','1990',117,4),(5445,1,2,'2011-08-31','1990',118,4),(5446,2,2,'2011-09-08','1990',118,4),(5447,3,2,'2011-10-10','1990',118,4),(5448,4,2,'2011-11-08','1990',118,4),(5449,5,2,'2011-12-08','1990',118,4),(5450,6,2,'2012-01-09','1990',118,4),(5451,7,2,'2012-02-08','1990',118,4),(5452,8,2,'2012-03-08','1990',118,4),(5453,9,2,'2012-04-11','1990',118,4),(5454,10,2,'2012-05-08','1990',118,4),(5455,11,2,'2012-06-08','1990',118,4),(5456,12,2,'2012-07-09','1990',118,4),(5457,13,2,'2012-08-08','1990',118,4),(5458,14,2,'2012-09-10','1990',118,4),(5459,15,2,'2012-10-08','1990',118,4),(5460,16,2,'2012-11-08','1990',118,4),(5461,17,2,'2012-12-10','1990',118,4),(5462,18,2,'2013-01-08','1990',118,4),(5463,19,2,'2013-02-08','1990',118,4),(5464,20,2,'2013-03-08','1990',118,4),(5465,21,2,'2013-04-08','1990',118,4),(5466,22,2,'2013-05-08','1990',118,4),(5467,23,2,'2013-06-10','1990',118,4),(5468,24,2,'2013-07-08','1990',118,4),(5469,25,2,'2013-08-08','1990',118,4),(5470,26,2,'2013-09-09','1990',118,4),(5471,27,2,'2013-10-08','1990',118,4),(5472,28,2,'2013-11-08','1990',118,4),(5473,29,2,'2013-12-09','1990',118,4),(5474,30,2,'2014-01-08','1990',118,4),(5475,31,2,'2014-02-10','1990',118,4),(5476,32,2,'2014-03-10','1990',118,4),(5477,33,2,'2014-04-08','1990',118,4),(5478,34,2,'2014-05-08','1990',118,4),(5479,35,2,'2014-06-09','1990',118,4),(5480,36,2,'2014-07-08','1990',118,4),(5481,37,2,'2014-08-08','1990',118,4),(5482,38,2,'2014-09-08','1990',118,4),(5483,39,2,'2014-10-08','1990',118,4),(5484,40,2,'2014-11-10','1990',118,4),(5485,41,2,'2014-12-08','1990',118,4),(5486,42,2,'2015-01-08','1990',118,4),(5487,43,2,'2015-02-09','1990',118,4),(5488,44,2,'2015-03-09','1990',118,4),(5489,45,2,'2015-04-08','1990',118,4),(5490,46,2,'2015-05-08','1990',118,4),(5491,47,2,'2015-06-08','1990',118,4),(5492,48,2,'2015-07-08','1990',118,4),(5493,1,2,'2011-08-31','1990',119,4),(5494,2,2,'2011-09-08','1990',119,4),(5495,3,2,'2011-10-10','1990',119,4),(5496,4,2,'2011-11-08','1990',119,4),(5497,5,2,'2011-12-08','1990',119,4),(5498,6,2,'2012-01-09','1990',119,4),(5499,7,2,'2012-02-08','1990',119,4),(5500,8,2,'2012-03-08','1990',119,4),(5501,9,2,'2012-04-11','1990',119,4),(5502,10,2,'2012-05-08','1990',119,4),(5503,11,2,'2012-06-08','1990',119,4),(5504,12,2,'2012-07-09','1990',119,4),(5505,13,2,'2012-08-08','1990',119,4),(5506,14,2,'2012-09-10','1990',119,4),(5507,15,2,'2012-10-08','1990',119,4),(5508,16,2,'2012-11-08','1990',119,4),(5509,17,2,'2012-12-10','1990',119,4),(5510,18,2,'2013-01-08','1990',119,4),(5511,19,2,'2013-02-08','1990',119,4),(5512,20,2,'2013-03-08','1990',119,4),(5513,21,2,'2013-04-08','1990',119,4),(5514,22,2,'2013-05-08','1990',119,4),(5515,23,2,'2013-06-10','1990',119,4),(5516,24,2,'2013-07-08','1990',119,4),(5517,25,2,'2013-08-08','1990',119,4),(5518,26,2,'2013-09-09','1990',119,4),(5519,27,2,'2013-10-08','1990',119,4),(5520,28,2,'2013-11-08','1990',119,4),(5521,29,2,'2013-12-09','1990',119,4),(5522,30,2,'2014-01-08','1990',119,4),(5523,31,2,'2014-02-10','1990',119,4),(5524,32,2,'2014-03-10','1990',119,4),(5525,33,2,'2014-04-08','1990',119,4),(5526,34,2,'2014-05-08','1990',119,4),(5527,35,2,'2014-06-09','1990',119,4),(5528,36,2,'2014-07-08','1990',119,4),(5529,37,2,'2014-08-08','1990',119,4),(5530,38,2,'2014-09-08','1990',119,4),(5531,39,2,'2014-10-08','1990',119,4),(5532,40,2,'2014-11-10','1990',119,4),(5533,41,2,'2014-12-08','1990',119,4),(5534,42,2,'2015-01-08','1990',119,4),(5535,43,2,'2015-02-09','1990',119,4),(5536,44,2,'2015-03-09','1990',119,4),(5537,45,2,'2015-04-08','1990',119,4),(5538,46,2,'2015-05-08','1990',119,4),(5539,47,2,'2015-06-08','1990',119,4),(5540,48,2,'2015-07-08','1990',119,4),(5541,1,2,'2011-08-31','1990',120,4),(5542,2,2,'2011-09-08','1990',120,4),(5543,3,2,'2011-10-10','1990',120,4),(5544,4,2,'2011-11-08','1990',120,4),(5545,5,2,'2011-12-08','1990',120,4),(5546,6,2,'2012-01-09','1990',120,4),(5547,7,2,'2012-02-08','1990',120,4),(5548,8,2,'2012-03-08','1990',120,4),(5549,9,2,'2012-04-11','1990',120,4),(5550,10,2,'2012-05-08','1990',120,4),(5551,11,2,'2012-06-08','1990',120,4),(5552,12,2,'2012-07-09','1990',120,4),(5553,13,2,'2012-08-08','1990',120,4),(5554,14,2,'2012-09-10','1990',120,4),(5555,15,2,'2012-10-08','1990',120,4),(5556,16,2,'2012-11-08','1990',120,4),(5557,17,2,'2012-12-10','1990',120,4),(5558,18,2,'2013-01-08','1990',120,4),(5559,19,2,'2013-02-08','1990',120,4),(5560,20,2,'2013-03-08','1990',120,4),(5561,21,2,'2013-04-08','1990',120,4),(5562,22,2,'2013-05-08','1990',120,4),(5563,23,2,'2013-06-10','1990',120,4),(5564,24,2,'2013-07-08','1990',120,4),(5565,25,2,'2013-08-08','1990',120,4),(5566,26,2,'2013-09-09','1990',120,4),(5567,27,2,'2013-10-08','1990',120,4),(5568,28,2,'2013-11-08','1990',120,4),(5569,29,2,'2013-12-09','1990',120,4),(5570,30,2,'2014-01-08','1990',120,4),(5571,31,2,'2014-02-10','1990',120,4),(5572,32,2,'2014-03-10','1990',120,4),(5573,33,2,'2014-04-08','1990',120,4),(5574,34,2,'2014-05-08','1990',120,4),(5575,35,2,'2014-06-09','1990',120,4),(5576,36,2,'2014-07-08','1990',120,4),(5577,37,2,'2014-08-08','1990',120,4),(5578,38,2,'2014-09-08','1990',120,4),(5579,39,2,'2014-10-08','1990',120,4),(5580,40,2,'2014-11-10','1990',120,4),(5581,41,2,'2014-12-08','1990',120,4),(5582,42,2,'2015-01-08','1990',120,4),(5583,43,2,'2015-02-09','1990',120,4),(5584,44,2,'2015-03-09','1990',120,4),(5585,45,2,'2015-04-08','1990',120,4),(5586,46,2,'2015-05-08','1990',120,4),(5587,47,2,'2015-06-08','1990',120,4),(5588,48,2,'2015-07-08','1990',120,4),(5589,1,2,'2011-08-31','1990',121,4),(5590,2,2,'2011-09-08','1990',121,4),(5591,3,2,'2011-10-10','1990',121,4),(5592,4,2,'2011-11-08','1990',121,4),(5593,5,2,'2011-12-08','1990',121,4),(5594,6,2,'2012-01-09','1990',121,4),(5595,7,2,'2012-02-08','1990',121,4),(5596,8,2,'2012-03-08','1990',121,4),(5597,9,2,'2012-04-11','1990',121,4),(5598,10,2,'2012-05-08','1990',121,4),(5599,11,2,'2012-06-08','1990',121,4),(5600,12,2,'2012-07-09','1990',121,4),(5601,13,2,'2012-08-08','1990',121,4),(5602,14,2,'2012-09-10','1990',121,4),(5603,15,2,'2012-10-08','1990',121,4),(5604,16,2,'2012-11-08','1990',121,4),(5605,17,2,'2012-12-10','1990',121,4),(5606,18,2,'2013-01-08','1990',121,4),(5607,19,2,'2013-02-08','1990',121,4),(5608,20,2,'2013-03-08','1990',121,4),(5609,21,2,'2013-04-08','1990',121,4),(5610,22,2,'2013-05-08','1990',121,4),(5611,23,2,'2013-06-10','1990',121,4),(5612,24,2,'2013-07-08','1990',121,4),(5613,25,2,'2013-08-08','1990',121,4),(5614,26,2,'2013-09-09','1990',121,4),(5615,27,2,'2013-10-08','1990',121,4),(5616,28,2,'2013-11-08','1990',121,4),(5617,29,2,'2013-12-09','1990',121,4),(5618,30,2,'2014-01-08','1990',121,4),(5619,31,2,'2014-02-10','1990',121,4),(5620,32,2,'2014-03-10','1990',121,4),(5621,33,2,'2014-04-08','1990',121,4),(5622,34,2,'2014-05-08','1990',121,4),(5623,35,2,'2014-06-09','1990',121,4),(5624,36,2,'2014-07-08','1990',121,4),(5625,37,2,'2014-08-08','1990',121,4),(5626,38,2,'2014-09-08','1990',121,4),(5627,39,2,'2014-10-08','1990',121,4),(5628,40,2,'2014-11-10','1990',121,4),(5629,41,2,'2014-12-08','1990',121,4),(5630,42,2,'2015-01-08','1990',121,4),(5631,43,2,'2015-02-09','1990',121,4),(5632,44,2,'2015-03-09','1990',121,4),(5633,45,2,'2015-04-08','1990',121,4),(5634,46,2,'2015-05-08','1990',121,4),(5635,47,2,'2015-06-08','1990',121,4),(5636,48,2,'2015-07-08','1990',121,4),(5637,1,2,'2011-08-31','1990',122,4),(5638,2,2,'2011-09-08','1990',122,4),(5639,3,2,'2011-10-10','1990',122,4),(5640,4,2,'2011-11-08','1990',122,4),(5641,5,2,'2011-12-08','1990',122,4),(5642,6,2,'2012-01-09','1990',122,4),(5643,7,2,'2012-02-08','1990',122,4),(5644,8,2,'2012-03-08','1990',122,4),(5645,9,2,'2012-04-11','1990',122,4),(5646,10,2,'2012-05-08','1990',122,4),(5647,11,2,'2012-06-08','1990',122,4),(5648,12,2,'2012-07-09','1990',122,4),(5649,13,2,'2012-08-08','1990',122,4),(5650,14,2,'2012-09-10','1990',122,4),(5651,15,2,'2012-10-08','1990',122,4),(5652,16,2,'2012-11-08','1990',122,4),(5653,17,2,'2012-12-10','1990',122,4),(5654,18,2,'2013-01-08','1990',122,4),(5655,19,2,'2013-02-08','1990',122,4),(5656,20,2,'2013-03-08','1990',122,4),(5657,21,2,'2013-04-08','1990',122,4),(5658,22,2,'2013-05-08','1990',122,4),(5659,23,2,'2013-06-10','1990',122,4),(5660,24,2,'2013-07-08','1990',122,4),(5661,25,2,'2013-08-08','1990',122,4),(5662,26,2,'2013-09-09','1990',122,4),(5663,27,2,'2013-10-08','1990',122,4),(5664,28,2,'2013-11-08','1990',122,4),(5665,29,2,'2013-12-09','1990',122,4),(5666,30,2,'2014-01-08','1990',122,4),(5667,31,2,'2014-02-10','1990',122,4),(5668,32,2,'2014-03-10','1990',122,4),(5669,33,2,'2014-04-08','1990',122,4),(5670,34,2,'2014-05-08','1990',122,4),(5671,35,2,'2014-06-09','1990',122,4),(5672,36,2,'2014-07-08','1990',122,4),(5673,37,2,'2014-08-08','1990',122,4),(5674,38,2,'2014-09-08','1990',122,4),(5675,39,2,'2014-10-08','1990',122,4),(5676,40,2,'2014-11-10','1990',122,4),(5677,41,2,'2014-12-08','1990',122,4),(5678,42,2,'2015-01-08','1990',122,4),(5679,43,2,'2015-02-09','1990',122,4),(5680,44,2,'2015-03-09','1990',122,4),(5681,45,2,'2015-04-08','1990',122,4),(5682,46,2,'2015-05-08','1990',122,4),(5683,47,2,'2015-06-08','1990',122,4),(5684,48,2,'2015-07-08','1990',122,4),(5685,1,2,'2011-08-31','1990',123,4),(5686,2,2,'2011-09-08','1990',123,4),(5687,3,2,'2011-10-10','1990',123,4),(5688,4,2,'2011-11-08','1990',123,4),(5689,5,2,'2011-12-08','1990',123,4),(5690,6,2,'2012-01-09','1990',123,4),(5691,7,2,'2012-02-08','1990',123,4),(5692,8,2,'2012-03-08','1990',123,4),(5693,9,2,'2012-04-11','1990',123,4),(5694,10,2,'2012-05-08','1990',123,4),(5695,11,2,'2012-06-08','1990',123,4),(5696,12,2,'2012-07-09','1990',123,4),(5697,13,2,'2012-08-08','1990',123,4),(5698,14,2,'2012-09-10','1990',123,4),(5699,15,2,'2012-10-08','1990',123,4),(5700,16,2,'2012-11-08','1990',123,4),(5701,17,2,'2012-12-10','1990',123,4),(5702,18,2,'2013-01-08','1990',123,4),(5703,19,2,'2013-02-08','1990',123,4),(5704,20,2,'2013-03-08','1990',123,4),(5705,21,2,'2013-04-08','1990',123,4),(5706,22,2,'2013-05-08','1990',123,4),(5707,23,2,'2013-06-10','1990',123,4),(5708,24,2,'2013-07-08','1990',123,4),(5709,25,2,'2013-08-08','1990',123,4),(5710,26,2,'2013-09-09','1990',123,4),(5711,27,2,'2013-10-08','1990',123,4),(5712,28,2,'2013-11-08','1990',123,4),(5713,29,2,'2013-12-09','1990',123,4),(5714,30,2,'2014-01-08','1990',123,4),(5715,31,2,'2014-02-10','1990',123,4),(5716,32,2,'2014-03-10','1990',123,4),(5717,33,2,'2014-04-08','1990',123,4),(5718,34,2,'2014-05-08','1990',123,4),(5719,35,2,'2014-06-09','1990',123,4),(5720,36,2,'2014-07-08','1990',123,4),(5721,37,2,'2014-08-08','1990',123,4),(5722,38,2,'2014-09-08','1990',123,4),(5723,39,2,'2014-10-08','1990',123,4),(5724,40,2,'2014-11-10','1990',123,4),(5725,41,2,'2014-12-08','1990',123,4),(5726,42,2,'2015-01-08','1990',123,4),(5727,43,2,'2015-02-09','1990',123,4),(5728,44,2,'2015-03-09','1990',123,4),(5729,45,2,'2015-04-08','1990',123,4),(5730,46,2,'2015-05-08','1990',123,4),(5731,47,2,'2015-06-08','1990',123,4),(5732,48,2,'2015-07-08','1990',123,4),(5733,1,2,'2011-08-31','1990',124,4),(5734,2,2,'2011-09-08','1990',124,4),(5735,3,2,'2011-10-10','1990',124,4),(5736,4,2,'2011-11-08','1990',124,4),(5737,5,2,'2011-12-08','1990',124,4),(5738,6,2,'2012-01-09','1990',124,4),(5739,7,2,'2012-02-08','1990',124,4),(5740,8,2,'2012-03-08','1990',124,4),(5741,9,2,'2012-04-11','1990',124,4),(5742,10,2,'2012-05-08','1990',124,4),(5743,11,2,'2012-06-08','1990',124,4),(5744,12,2,'2012-07-09','1990',124,4),(5745,13,2,'2012-08-08','1990',124,4),(5746,14,2,'2012-09-10','1990',124,4),(5747,15,2,'2012-10-08','1990',124,4),(5748,16,2,'2012-11-08','1990',124,4),(5749,17,2,'2012-12-10','1990',124,4),(5750,18,2,'2013-01-08','1990',124,4),(5751,19,2,'2013-02-08','1990',124,4),(5752,20,2,'2013-03-08','1990',124,4),(5753,21,2,'2013-04-08','1990',124,4),(5754,22,2,'2013-05-08','1990',124,4),(5755,23,2,'2013-06-10','1990',124,4),(5756,24,2,'2013-07-08','1990',124,4),(5757,25,2,'2013-08-08','1990',124,4),(5758,26,2,'2013-09-09','1990',124,4),(5759,27,2,'2013-10-08','1990',124,4),(5760,28,2,'2013-11-08','1990',124,4),(5761,29,2,'2013-12-09','1990',124,4),(5762,30,2,'2014-01-08','1990',124,4),(5763,31,2,'2014-02-10','1990',124,4),(5764,32,2,'2014-03-10','1990',124,4),(5765,33,2,'2014-04-08','1990',124,4),(5766,34,2,'2014-05-08','1990',124,4),(5767,35,2,'2014-06-09','1990',124,4),(5768,36,2,'2014-07-08','1990',124,4),(5769,37,2,'2014-08-08','1990',124,4),(5770,38,2,'2014-09-08','1990',124,4),(5771,39,2,'2014-10-08','1990',124,4),(5772,40,2,'2014-11-10','1990',124,4),(5773,41,2,'2014-12-08','1990',124,4),(5774,42,2,'2015-01-08','1990',124,4),(5775,43,2,'2015-02-09','1990',124,4),(5776,44,2,'2015-03-09','1990',124,4),(5777,45,2,'2015-04-08','1990',124,4),(5778,46,2,'2015-05-08','1990',124,4),(5779,47,2,'2015-06-08','1990',124,4),(5780,48,2,'2015-07-08','1990',124,4),(5781,1,2,'2011-08-31','1990',125,4),(5782,2,2,'2011-09-08','1990',125,4),(5783,3,2,'2011-10-10','1990',125,4),(5784,4,2,'2011-11-08','1990',125,4),(5785,5,2,'2011-12-08','1990',125,4),(5786,6,2,'2012-01-09','1990',125,4),(5787,7,2,'2012-02-08','1990',125,4),(5788,8,2,'2012-03-08','1990',125,4),(5789,9,2,'2012-04-11','1990',125,4),(5790,10,2,'2012-05-08','1990',125,4),(5791,11,2,'2012-06-08','1990',125,4),(5792,12,2,'2012-07-09','1990',125,4),(5793,13,2,'2012-08-08','1990',125,4),(5794,14,2,'2012-09-10','1990',125,4),(5795,15,2,'2012-10-08','1990',125,4),(5796,16,2,'2012-11-08','1990',125,4),(5797,17,2,'2012-12-10','1990',125,4),(5798,18,2,'2013-01-08','1990',125,4),(5799,19,2,'2013-02-08','1990',125,4),(5800,20,2,'2013-03-08','1990',125,4),(5801,21,2,'2013-04-08','1990',125,4),(5802,22,2,'2013-05-08','1990',125,4),(5803,23,2,'2013-06-10','1990',125,4),(5804,24,2,'2013-07-08','1990',125,4),(5805,25,2,'2013-08-08','1990',125,4),(5806,26,2,'2013-09-09','1990',125,4),(5807,27,2,'2013-10-08','1990',125,4),(5808,28,2,'2013-11-08','1990',125,4),(5809,29,2,'2013-12-09','1990',125,4),(5810,30,2,'2014-01-08','1990',125,4),(5811,31,2,'2014-02-10','1990',125,4),(5812,32,2,'2014-03-10','1990',125,4),(5813,33,2,'2014-04-08','1990',125,4),(5814,34,2,'2014-05-08','1990',125,4),(5815,35,2,'2014-06-09','1990',125,4),(5816,36,2,'2014-07-08','1990',125,4),(5817,37,2,'2014-08-08','1990',125,4),(5818,38,2,'2014-09-08','1990',125,4),(5819,39,2,'2014-10-08','1990',125,4),(5820,40,2,'2014-11-10','1990',125,4),(5821,41,2,'2014-12-08','1990',125,4),(5822,42,2,'2015-01-08','1990',125,4),(5823,43,2,'2015-02-09','1990',125,4),(5824,44,2,'2015-03-09','1990',125,4),(5825,45,2,'2015-04-08','1990',125,4),(5826,46,2,'2015-05-08','1990',125,4),(5827,47,2,'2015-06-08','1990',125,4),(5828,48,2,'2015-07-08','1990',125,4),(5829,1,2,'2011-08-31','1990',126,4),(5830,2,2,'2011-09-08','1990',126,4),(5831,3,2,'2011-10-10','1990',126,4),(5832,4,2,'2011-11-08','1990',126,4),(5833,5,2,'2011-12-08','1990',126,4),(5834,6,2,'2012-01-09','1990',126,4),(5835,7,2,'2012-02-08','1990',126,4),(5836,8,2,'2012-03-08','1990',126,4),(5837,9,2,'2012-04-11','1990',126,4),(5838,10,2,'2012-05-08','1990',126,4),(5839,11,2,'2012-06-08','1990',126,4),(5840,12,2,'2012-07-09','1990',126,4),(5841,13,2,'2012-08-08','1990',126,4),(5842,14,2,'2012-09-10','1990',126,4),(5843,15,2,'2012-10-08','1990',126,4),(5844,16,2,'2012-11-08','1990',126,4),(5845,17,2,'2012-12-10','1990',126,4),(5846,18,2,'2013-01-08','1990',126,4),(5847,19,2,'2013-02-08','1990',126,4),(5848,20,2,'2013-03-08','1990',126,4),(5849,21,2,'2013-04-08','1990',126,4),(5850,22,2,'2013-05-08','1990',126,4),(5851,23,2,'2013-06-10','1990',126,4),(5852,24,2,'2013-07-08','1990',126,4),(5853,25,2,'2013-08-08','1990',126,4),(5854,26,2,'2013-09-09','1990',126,4),(5855,27,2,'2013-10-08','1990',126,4),(5856,28,2,'2013-11-08','1990',126,4),(5857,29,2,'2013-12-09','1990',126,4),(5858,30,2,'2014-01-08','1990',126,4),(5859,31,2,'2014-02-10','1990',126,4),(5860,32,2,'2014-03-10','1990',126,4),(5861,33,2,'2014-04-08','1990',126,4),(5862,34,2,'2014-05-08','1990',126,4),(5863,35,2,'2014-06-09','1990',126,4),(5864,36,2,'2014-07-08','1990',126,4),(5865,37,2,'2014-08-08','1990',126,4),(5866,38,2,'2014-09-08','1990',126,4),(5867,39,2,'2014-10-08','1990',126,4),(5868,40,2,'2014-11-10','1990',126,4),(5869,41,2,'2014-12-08','1990',126,4),(5870,42,2,'2015-01-08','1990',126,4),(5871,43,2,'2015-02-09','1990',126,4),(5872,44,2,'2015-03-09','1990',126,4),(5873,45,2,'2015-04-08','1990',126,4),(5874,46,2,'2015-05-08','1990',126,4),(5875,47,2,'2015-06-08','1990',126,4),(5876,48,2,'2015-07-08','1990',126,4),(5877,1,2,'2011-08-31','1990',127,4),(5878,2,2,'2011-09-08','1990',127,4),(5879,3,2,'2011-10-10','1990',127,4),(5880,4,2,'2011-11-08','1990',127,4),(5881,5,2,'2011-12-08','1990',127,4),(5882,6,2,'2012-01-09','1990',127,4),(5883,7,2,'2012-02-08','1990',127,4),(5884,8,2,'2012-03-08','1990',127,4),(5885,9,2,'2012-04-11','1990',127,4),(5886,10,2,'2012-05-08','1990',127,4),(5887,11,2,'2012-06-08','1990',127,4),(5888,12,2,'2012-07-09','1990',127,4),(5889,13,2,'2012-08-08','1990',127,4),(5890,14,2,'2012-09-10','1990',127,4),(5891,15,2,'2012-10-08','1990',127,4),(5892,16,2,'2012-11-08','1990',127,4),(5893,17,2,'2012-12-10','1990',127,4),(5894,18,2,'2013-01-08','1990',127,4),(5895,19,2,'2013-02-08','1990',127,4),(5896,20,2,'2013-03-08','1990',127,4),(5897,21,2,'2013-04-08','1990',127,4),(5898,22,2,'2013-05-08','1990',127,4),(5899,23,2,'2013-06-10','1990',127,4),(5900,24,2,'2013-07-08','1990',127,4),(5901,25,2,'2013-08-08','1990',127,4),(5902,26,2,'2013-09-09','1990',127,4),(5903,27,2,'2013-10-08','1990',127,4),(5904,28,2,'2013-11-08','1990',127,4),(5905,29,2,'2013-12-09','1990',127,4),(5906,30,2,'2014-01-08','1990',127,4),(5907,31,2,'2014-02-10','1990',127,4),(5908,32,2,'2014-03-10','1990',127,4),(5909,33,2,'2014-04-08','1990',127,4),(5910,34,2,'2014-05-08','1990',127,4),(5911,35,2,'2014-06-09','1990',127,4),(5912,36,2,'2014-07-08','1990',127,4),(5913,37,2,'2014-08-08','1990',127,4),(5914,38,2,'2014-09-08','1990',127,4),(5915,39,2,'2014-10-08','1990',127,4),(5916,40,2,'2014-11-10','1990',127,4),(5917,41,2,'2014-12-08','1990',127,4),(5918,42,2,'2015-01-08','1990',127,4),(5919,43,2,'2015-02-09','1990',127,4),(5920,44,2,'2015-03-09','1990',127,4),(5921,45,2,'2015-04-08','1990',127,4),(5922,46,2,'2015-05-08','1990',127,4),(5923,47,2,'2015-06-08','1990',127,4),(5924,48,2,'2015-07-08','1990',127,4),(5925,1,2,'2011-08-31','1990',128,4),(5926,2,2,'2011-09-08','1990',128,4),(5927,3,2,'2011-10-10','1990',128,4),(5928,4,2,'2011-11-08','1990',128,4),(5929,5,2,'2011-12-08','1990',128,4),(5930,6,2,'2012-01-09','1990',128,4),(5931,7,2,'2012-02-08','1990',128,4),(5932,8,2,'2012-03-08','1990',128,4),(5933,9,2,'2012-04-11','1990',128,4),(5934,10,2,'2012-05-08','1990',128,4),(5935,11,2,'2012-06-08','1990',128,4),(5936,12,2,'2012-07-09','1990',128,4),(5937,13,2,'2012-08-08','1990',128,4),(5938,14,2,'2012-09-10','1990',128,4),(5939,15,2,'2012-10-08','1990',128,4),(5940,16,2,'2012-11-08','1990',128,4),(5941,17,2,'2012-12-10','1990',128,4),(5942,18,2,'2013-01-08','1990',128,4),(5943,19,2,'2013-02-08','1990',128,4),(5944,20,2,'2013-03-08','1990',128,4),(5945,21,2,'2013-04-08','1990',128,4),(5946,22,2,'2013-05-08','1990',128,4),(5947,23,2,'2013-06-10','1990',128,4),(5948,24,2,'2013-07-08','1990',128,4),(5949,25,2,'2013-08-08','1990',128,4),(5950,26,2,'2013-09-09','1990',128,4),(5951,27,2,'2013-10-08','1990',128,4),(5952,28,2,'2013-11-08','1990',128,4),(5953,29,2,'2013-12-09','1990',128,4),(5954,30,2,'2014-01-08','1990',128,4),(5955,31,2,'2014-02-10','1990',128,4),(5956,32,2,'2014-03-10','1990',128,4),(5957,33,2,'2014-04-08','1990',128,4),(5958,34,2,'2014-05-08','1990',128,4),(5959,35,2,'2014-06-09','1990',128,4),(5960,36,2,'2014-07-08','1990',128,4),(5961,37,2,'2014-08-08','1990',128,4),(5962,38,2,'2014-09-08','1990',128,4),(5963,39,2,'2014-10-08','1990',128,4),(5964,40,2,'2014-11-10','1990',128,4),(5965,41,2,'2014-12-08','1990',128,4),(5966,42,2,'2015-01-08','1990',128,4),(5967,43,2,'2015-02-09','1990',128,4),(5968,44,2,'2015-03-09','1990',128,4),(5969,45,2,'2015-04-08','1990',128,4),(5970,46,2,'2015-05-08','1990',128,4),(5971,47,2,'2015-06-08','1990',128,4),(5972,48,2,'2015-07-08','1990',128,4),(5973,1,2,'2011-08-31','1990',129,4),(5974,2,2,'2011-09-08','1990',129,4),(5975,3,2,'2011-10-10','1990',129,4),(5976,4,2,'2011-11-08','1990',129,4),(5977,5,2,'2011-12-08','1990',129,4),(5978,6,2,'2012-01-09','1990',129,4),(5979,7,2,'2012-02-08','1990',129,4),(5980,8,2,'2012-03-08','1990',129,4),(5981,9,2,'2012-04-11','1990',129,4),(5982,10,2,'2012-05-08','1990',129,4),(5983,11,2,'2012-06-08','1990',129,4),(5984,12,2,'2012-07-09','1990',129,4),(5985,13,2,'2012-08-08','1990',129,4),(5986,14,2,'2012-09-10','1990',129,4),(5987,15,2,'2012-10-08','1990',129,4),(5988,16,2,'2012-11-08','1990',129,4),(5989,17,2,'2012-12-10','1990',129,4),(5990,18,2,'2013-01-08','1990',129,4),(5991,19,2,'2013-02-08','1990',129,4),(5992,20,2,'2013-03-08','1990',129,4),(5993,21,2,'2013-04-08','1990',129,4),(5994,22,2,'2013-05-08','1990',129,4),(5995,23,2,'2013-06-10','1990',129,4),(5996,24,2,'2013-07-08','1990',129,4),(5997,25,2,'2013-08-08','1990',129,4),(5998,26,2,'2013-09-09','1990',129,4),(5999,27,2,'2013-10-08','1990',129,4),(6000,28,2,'2013-11-08','1990',129,4),(6001,29,2,'2013-12-09','1990',129,4),(6002,30,2,'2014-01-08','1990',129,4),(6003,31,2,'2014-02-10','1990',129,4),(6004,32,2,'2014-03-10','1990',129,4),(6005,33,2,'2014-04-08','1990',129,4),(6006,34,2,'2014-05-08','1990',129,4),(6007,35,2,'2014-06-09','1990',129,4),(6008,36,2,'2014-07-08','1990',129,4),(6009,37,2,'2014-08-08','1990',129,4),(6010,38,2,'2014-09-08','1990',129,4),(6011,39,2,'2014-10-08','1990',129,4),(6012,40,2,'2014-11-10','1990',129,4),(6013,41,2,'2014-12-08','1990',129,4),(6014,42,2,'2015-01-08','1990',129,4),(6015,43,2,'2015-02-09','1990',129,4),(6016,44,2,'2015-03-09','1990',129,4),(6017,45,2,'2015-04-08','1990',129,4),(6018,46,2,'2015-05-08','1990',129,4),(6019,47,2,'2015-06-08','1990',129,4),(6020,48,2,'2015-07-08','1990',129,4),(6021,1,2,'2011-08-31','1990',130,4),(6022,2,2,'2011-09-08','1990',130,4),(6023,3,2,'2011-10-10','1990',130,4),(6024,4,2,'2011-11-08','1990',130,4),(6025,5,2,'2011-12-08','1990',130,4),(6026,6,2,'2012-01-09','1990',130,4),(6027,7,2,'2012-02-08','1990',130,4),(6028,8,2,'2012-03-08','1990',130,4),(6029,9,2,'2012-04-11','1990',130,4),(6030,10,2,'2012-05-08','1990',130,4),(6031,11,2,'2012-06-08','1990',130,4),(6032,12,2,'2012-07-09','1990',130,4),(6033,13,2,'2012-08-08','1990',130,4),(6034,14,2,'2012-09-10','1990',130,4),(6035,15,2,'2012-10-08','1990',130,4),(6036,16,2,'2012-11-08','1990',130,4),(6037,17,2,'2012-12-10','1990',130,4),(6038,18,2,'2013-01-08','1990',130,4),(6039,19,2,'2013-02-08','1990',130,4),(6040,20,2,'2013-03-08','1990',130,4),(6041,21,2,'2013-04-08','1990',130,4),(6042,22,2,'2013-05-08','1990',130,4),(6043,23,2,'2013-06-10','1990',130,4),(6044,24,2,'2013-07-08','1990',130,4),(6045,25,2,'2013-08-08','1990',130,4),(6046,26,2,'2013-09-09','1990',130,4),(6047,27,2,'2013-10-08','1990',130,4),(6048,28,2,'2013-11-08','1990',130,4),(6049,29,2,'2013-12-09','1990',130,4),(6050,30,2,'2014-01-08','1990',130,4),(6051,31,2,'2014-02-10','1990',130,4),(6052,32,2,'2014-03-10','1990',130,4),(6053,33,2,'2014-04-08','1990',130,4),(6054,34,2,'2014-05-08','1990',130,4),(6055,35,2,'2014-06-09','1990',130,4),(6056,36,2,'2014-07-08','1990',130,4),(6057,37,2,'2014-08-08','1990',130,4),(6058,38,2,'2014-09-08','1990',130,4),(6059,39,2,'2014-10-08','1990',130,4),(6060,40,2,'2014-11-10','1990',130,4),(6061,41,2,'2014-12-08','1990',130,4),(6062,42,2,'2015-01-08','1990',130,4),(6063,43,2,'2015-02-09','1990',130,4),(6064,44,2,'2015-03-09','1990',130,4),(6065,45,2,'2015-04-08','1990',130,4),(6066,46,2,'2015-05-08','1990',130,4),(6067,47,2,'2015-06-08','1990',130,4),(6068,48,2,'2015-07-08','1990',130,4),(6069,1,2,'2011-08-31','1990',131,4),(6070,2,2,'2011-09-08','1990',131,4),(6071,3,2,'2011-10-10','1990',131,4),(6072,4,2,'2011-11-08','1990',131,4),(6073,5,2,'2011-12-08','1990',131,4),(6074,6,2,'2012-01-09','1990',131,4),(6075,7,2,'2012-02-08','1990',131,4),(6076,8,2,'2012-03-08','1990',131,4),(6077,9,2,'2012-04-11','1990',131,4),(6078,10,2,'2012-05-08','1990',131,4),(6079,11,2,'2012-06-08','1990',131,4),(6080,12,2,'2012-07-09','1990',131,4),(6081,13,2,'2012-08-08','1990',131,4),(6082,14,2,'2012-09-10','1990',131,4),(6083,15,2,'2012-10-08','1990',131,4),(6084,16,2,'2012-11-08','1990',131,4),(6085,17,2,'2012-12-10','1990',131,4),(6086,18,2,'2013-01-08','1990',131,4),(6087,19,2,'2013-02-08','1990',131,4),(6088,20,2,'2013-03-08','1990',131,4),(6089,21,2,'2013-04-08','1990',131,4),(6090,22,2,'2013-05-08','1990',131,4),(6091,23,2,'2013-06-10','1990',131,4),(6092,24,2,'2013-07-08','1990',131,4),(6093,25,2,'2013-08-08','1990',131,4),(6094,26,2,'2013-09-09','1990',131,4),(6095,27,2,'2013-10-08','1990',131,4),(6096,28,2,'2013-11-08','1990',131,4),(6097,29,2,'2013-12-09','1990',131,4),(6098,30,2,'2014-01-08','1990',131,4),(6099,31,2,'2014-02-10','1990',131,4),(6100,32,2,'2014-03-10','1990',131,4),(6101,33,2,'2014-04-08','1990',131,4),(6102,34,2,'2014-05-08','1990',131,4),(6103,35,2,'2014-06-09','1990',131,4),(6104,36,2,'2014-07-08','1990',131,4),(6105,37,2,'2014-08-08','1990',131,4),(6106,38,2,'2014-09-08','1990',131,4),(6107,39,2,'2014-10-08','1990',131,4),(6108,40,2,'2014-11-10','1990',131,4),(6109,41,2,'2014-12-08','1990',131,4),(6110,42,2,'2015-01-08','1990',131,4),(6111,43,2,'2015-02-09','1990',131,4),(6112,44,2,'2015-03-09','1990',131,4),(6113,45,2,'2015-04-08','1990',131,4),(6114,46,2,'2015-05-08','1990',131,4),(6115,47,2,'2015-06-08','1990',131,4),(6116,48,2,'2015-07-08','1990',131,4),(6117,1,2,'2011-08-31','1990',132,4),(6118,2,2,'2011-09-08','1990',132,4),(6119,3,2,'2011-10-10','1990',132,4),(6120,4,2,'2011-11-08','1990',132,4),(6121,5,2,'2011-12-08','1990',132,4),(6122,6,2,'2012-01-09','1990',132,4),(6123,7,2,'2012-02-08','1990',132,4),(6124,8,2,'2012-03-08','1990',132,4),(6125,9,2,'2012-04-11','1990',132,4),(6126,10,2,'2012-05-08','1990',132,4),(6127,11,2,'2012-06-08','1990',132,4),(6128,12,2,'2012-07-09','1990',132,4),(6129,13,2,'2012-08-08','1990',132,4),(6130,14,2,'2012-09-10','1990',132,4),(6131,15,2,'2012-10-08','1990',132,4),(6132,16,2,'2012-11-08','1990',132,4),(6133,17,2,'2012-12-10','1990',132,4),(6134,18,2,'2013-01-08','1990',132,4),(6135,19,2,'2013-02-08','1990',132,4),(6136,20,2,'2013-03-08','1990',132,4),(6137,21,2,'2013-04-08','1990',132,4),(6138,22,2,'2013-05-08','1990',132,4),(6139,23,2,'2013-06-10','1990',132,4),(6140,24,2,'2013-07-08','1990',132,4),(6141,25,2,'2013-08-08','1990',132,4),(6142,26,2,'2013-09-09','1990',132,4),(6143,27,2,'2013-10-08','1990',132,4),(6144,28,2,'2013-11-08','1990',132,4),(6145,29,2,'2013-12-09','1990',132,4),(6146,30,2,'2014-01-08','1990',132,4),(6147,31,2,'2014-02-10','1990',132,4),(6148,32,2,'2014-03-10','1990',132,4),(6149,33,2,'2014-04-08','1990',132,4),(6150,34,2,'2014-05-08','1990',132,4),(6151,35,2,'2014-06-09','1990',132,4),(6152,36,2,'2014-07-08','1990',132,4),(6153,37,2,'2014-08-08','1990',132,4),(6154,38,2,'2014-09-08','1990',132,4),(6155,39,2,'2014-10-08','1990',132,4),(6156,40,2,'2014-11-10','1990',132,4),(6157,41,2,'2014-12-08','1990',132,4),(6158,42,2,'2015-01-08','1990',132,4),(6159,43,2,'2015-02-09','1990',132,4),(6160,44,2,'2015-03-09','1990',132,4),(6161,45,2,'2015-04-08','1990',132,4),(6162,46,2,'2015-05-08','1990',132,4),(6163,47,2,'2015-06-08','1990',132,4),(6164,48,2,'2015-07-08','1990',132,4),(6165,1,2,'2011-08-31','1990',133,4),(6166,2,2,'2011-09-08','1990',133,4),(6167,3,2,'2011-10-10','1990',133,4),(6168,4,2,'2011-11-08','1990',133,4),(6169,5,2,'2011-12-08','1990',133,4),(6170,6,2,'2012-01-09','1990',133,4),(6171,7,2,'2012-02-08','1990',133,4),(6172,8,2,'2012-03-08','1990',133,4),(6173,9,2,'2012-04-11','1990',133,4),(6174,10,2,'2012-05-08','1990',133,4),(6175,11,2,'2012-06-08','1990',133,4),(6176,12,2,'2012-07-09','1990',133,4),(6177,13,2,'2012-08-08','1990',133,4),(6178,14,2,'2012-09-10','1990',133,4),(6179,15,2,'2012-10-08','1990',133,4),(6180,16,2,'2012-11-08','1990',133,4),(6181,17,2,'2012-12-10','1990',133,4),(6182,18,2,'2013-01-08','1990',133,4),(6183,19,2,'2013-02-08','1990',133,4),(6184,20,2,'2013-03-08','1990',133,4),(6185,21,2,'2013-04-08','1990',133,4),(6186,22,2,'2013-05-08','1990',133,4),(6187,23,2,'2013-06-10','1990',133,4),(6188,24,2,'2013-07-08','1990',133,4),(6189,25,2,'2013-08-08','1990',133,4),(6190,26,2,'2013-09-09','1990',133,4),(6191,27,2,'2013-10-08','1990',133,4),(6192,28,2,'2013-11-08','1990',133,4),(6193,29,2,'2013-12-09','1990',133,4),(6194,30,2,'2014-01-08','1990',133,4),(6195,31,2,'2014-02-10','1990',133,4),(6196,32,2,'2014-03-10','1990',133,4),(6197,33,2,'2014-04-08','1990',133,4),(6198,34,2,'2014-05-08','1990',133,4),(6199,35,2,'2014-06-09','1990',133,4),(6200,36,2,'2014-07-08','1990',133,4),(6201,37,2,'2014-08-08','1990',133,4),(6202,38,2,'2014-09-08','1990',133,4),(6203,39,2,'2014-10-08','1990',133,4),(6204,40,2,'2014-11-10','1990',133,4),(6205,41,2,'2014-12-08','1990',133,4),(6206,42,2,'2015-01-08','1990',133,4),(6207,43,2,'2015-02-09','1990',133,4),(6208,44,2,'2015-03-09','1990',133,4),(6209,45,2,'2015-04-08','1990',133,4),(6210,46,2,'2015-05-08','1990',133,4),(6211,47,2,'2015-06-08','1990',133,4),(6212,48,2,'2015-07-08','1990',133,4),(6213,1,2,'2011-08-31','1990',134,4),(6214,2,2,'2011-09-08','1990',134,4),(6215,3,2,'2011-10-10','1990',134,4),(6216,4,2,'2011-11-08','1990',134,4),(6217,5,2,'2011-12-08','1990',134,4),(6218,6,2,'2012-01-09','1990',134,4),(6219,7,2,'2012-02-08','1990',134,4),(6220,8,2,'2012-03-08','1990',134,4),(6221,9,2,'2012-04-11','1990',134,4),(6222,10,2,'2012-05-08','1990',134,4),(6223,11,2,'2012-06-08','1990',134,4),(6224,12,2,'2012-07-09','1990',134,4),(6225,13,2,'2012-08-08','1990',134,4),(6226,14,2,'2012-09-10','1990',134,4),(6227,15,2,'2012-10-08','1990',134,4),(6228,16,2,'2012-11-08','1990',134,4),(6229,17,2,'2012-12-10','1990',134,4),(6230,18,2,'2013-01-08','1990',134,4),(6231,19,2,'2013-02-08','1990',134,4),(6232,20,2,'2013-03-08','1990',134,4),(6233,21,2,'2013-04-08','1990',134,4),(6234,22,2,'2013-05-08','1990',134,4),(6235,23,2,'2013-06-10','1990',134,4),(6236,24,2,'2013-07-08','1990',134,4),(6237,25,2,'2013-08-08','1990',134,4),(6238,26,2,'2013-09-09','1990',134,4),(6239,27,2,'2013-10-08','1990',134,4),(6240,28,2,'2013-11-08','1990',134,4),(6241,29,2,'2013-12-09','1990',134,4),(6242,30,2,'2014-01-08','1990',134,4),(6243,31,2,'2014-02-10','1990',134,4),(6244,32,2,'2014-03-10','1990',134,4),(6245,33,2,'2014-04-08','1990',134,4),(6246,34,2,'2014-05-08','1990',134,4),(6247,35,2,'2014-06-09','1990',134,4),(6248,36,2,'2014-07-08','1990',134,4),(6249,37,2,'2014-08-08','1990',134,4),(6250,38,2,'2014-09-08','1990',134,4),(6251,39,2,'2014-10-08','1990',134,4),(6252,40,2,'2014-11-10','1990',134,4),(6253,41,2,'2014-12-08','1990',134,4),(6254,42,2,'2015-01-08','1990',134,4),(6255,43,2,'2015-02-09','1990',134,4),(6256,44,2,'2015-03-09','1990',134,4),(6257,45,2,'2015-04-08','1990',134,4),(6258,46,2,'2015-05-08','1990',134,4),(6259,47,2,'2015-06-08','1990',134,4),(6260,48,2,'2015-07-08','1990',134,4),(6261,1,2,'2011-08-31','1990',135,1),(6262,2,2,'2011-09-08','1990',135,1),(6263,3,2,'2011-10-10','1990',135,1),(6264,4,2,'2011-11-08','1990',135,1),(6265,5,2,'2011-12-08','1990',135,1),(6266,6,2,'2012-01-09','1990',135,1),(6267,7,2,'2012-02-08','1990',135,1),(6268,8,2,'2012-03-08','1990',135,1),(6269,9,2,'2012-04-11','1990',135,1),(6270,10,2,'2012-05-08','1990',135,1),(6271,11,2,'2012-06-08','1990',135,1),(6272,12,2,'2012-07-09','1990',135,1),(6273,13,2,'2012-08-08','1990',135,1),(6274,14,2,'2012-09-10','1990',135,1),(6275,15,2,'2012-10-08','1990',135,1),(6276,16,2,'2012-11-08','1990',135,1),(6277,17,2,'2012-12-10','1990',135,1),(6278,18,2,'2013-01-08','1990',135,1),(6279,19,2,'2013-02-08','1990',135,1),(6280,20,2,'2013-03-08','1990',135,1),(6281,21,2,'2013-04-08','1990',135,1),(6282,22,2,'2013-05-08','1990',135,1),(6283,23,2,'2013-06-10','1990',135,1),(6284,24,2,'2013-07-08','1990',135,1),(6285,25,2,'2013-08-08','1990',135,1),(6286,26,2,'2013-09-09','1990',135,1),(6287,27,2,'2013-10-08','1990',135,1),(6288,28,2,'2013-11-08','1990',135,1),(6289,29,2,'2013-12-09','1990',135,1),(6290,30,2,'2014-01-08','1990',135,1),(6291,31,2,'2014-02-10','1990',135,1),(6292,32,2,'2014-03-10','1990',135,1),(6293,33,2,'2014-04-08','1990',135,1),(6294,34,2,'2014-05-08','1990',135,1),(6295,35,2,'2014-06-09','1990',135,1),(6296,36,2,'2014-07-08','1990',135,1),(6297,37,2,'2014-08-08','1990',135,1),(6298,38,2,'2014-09-08','1990',135,1),(6299,39,2,'2014-10-08','1990',135,1),(6300,40,2,'2014-11-10','1990',135,1),(6301,41,2,'2014-12-08','1990',135,1),(6302,42,2,'2015-01-08','1990',135,1),(6303,43,2,'2015-02-09','1990',135,1),(6304,44,2,'2015-03-09','1990',135,1),(6305,45,2,'2015-04-08','1990',135,1),(6306,46,2,'2015-05-08','1990',135,1),(6307,47,2,'2015-06-08','1990',135,1),(6308,48,2,'2015-07-08','1990',135,1),(6309,1,2,'2011-08-31','1990',136,1),(6310,2,2,'2011-09-08','1990',136,1),(6311,3,2,'2011-10-10','1990',136,1),(6312,4,2,'2011-11-08','1990',136,1),(6313,5,2,'2011-12-08','1990',136,1),(6314,6,2,'2012-01-09','1990',136,1),(6315,7,2,'2012-02-08','1990',136,1),(6316,8,2,'2012-03-08','1990',136,1),(6317,9,2,'2012-04-11','1990',136,1),(6318,10,2,'2012-05-08','1990',136,1),(6319,11,2,'2012-06-08','1990',136,1),(6320,12,2,'2012-07-09','1990',136,1),(6321,13,2,'2012-08-08','1990',136,1),(6322,14,2,'2012-09-10','1990',136,1),(6323,15,2,'2012-10-08','1990',136,1),(6324,16,2,'2012-11-08','1990',136,1),(6325,17,2,'2012-12-10','1990',136,1),(6326,18,2,'2013-01-08','1990',136,1),(6327,19,2,'2013-02-08','1990',136,1),(6328,20,2,'2013-03-08','1990',136,1),(6329,21,2,'2013-04-08','1990',136,1),(6330,22,2,'2013-05-08','1990',136,1),(6331,23,2,'2013-06-10','1990',136,1),(6332,24,2,'2013-07-08','1990',136,1),(6333,25,2,'2013-08-08','1990',136,1),(6334,26,2,'2013-09-09','1990',136,1),(6335,27,2,'2013-10-08','1990',136,1),(6336,28,2,'2013-11-08','1990',136,1),(6337,29,2,'2013-12-09','1990',136,1),(6338,30,2,'2014-01-08','1990',136,1),(6339,31,2,'2014-02-10','1990',136,1),(6340,32,2,'2014-03-10','1990',136,1),(6341,33,2,'2014-04-08','1990',136,1),(6342,34,2,'2014-05-08','1990',136,1),(6343,35,2,'2014-06-09','1990',136,1),(6344,36,2,'2014-07-08','1990',136,1),(6345,37,2,'2014-08-08','1990',136,1),(6346,38,2,'2014-09-08','1990',136,1),(6347,39,2,'2014-10-08','1990',136,1),(6348,40,2,'2014-11-10','1990',136,1),(6349,41,2,'2014-12-08','1990',136,1),(6350,42,2,'2015-01-08','1990',136,1),(6351,43,2,'2015-02-09','1990',136,1),(6352,44,2,'2015-03-09','1990',136,1),(6353,45,2,'2015-04-08','1990',136,1),(6354,46,2,'2015-05-08','1990',136,1),(6355,47,2,'2015-06-08','1990',136,1),(6356,48,2,'2015-07-08','1990',136,1),(6357,1,2,'2011-08-31','1990',137,1),(6358,2,2,'2011-09-08','1990',137,1),(6359,3,2,'2011-10-10','1990',137,1),(6360,4,2,'2011-11-08','1990',137,1),(6361,5,2,'2011-12-08','1990',137,1),(6362,6,2,'2012-01-09','1990',137,1),(6363,7,2,'2012-02-08','1990',137,1),(6364,8,2,'2012-03-08','1990',137,1),(6365,9,2,'2012-04-11','1990',137,1),(6366,10,2,'2012-05-08','1990',137,1),(6367,11,2,'2012-06-08','1990',137,1),(6368,12,2,'2012-07-09','1990',137,1),(6369,13,2,'2012-08-08','1990',137,1),(6370,14,2,'2012-09-10','1990',137,1),(6371,15,2,'2012-10-08','1990',137,1),(6372,16,2,'2012-11-08','1990',137,1),(6373,17,2,'2012-12-10','1990',137,1),(6374,18,2,'2013-01-08','1990',137,1),(6375,19,2,'2013-02-08','1990',137,1),(6376,20,2,'2013-03-08','1990',137,1),(6377,21,2,'2013-04-08','1990',137,1),(6378,22,2,'2013-05-08','1990',137,1),(6379,23,2,'2013-06-10','1990',137,1),(6380,24,2,'2013-07-08','1990',137,1),(6381,25,2,'2013-08-08','1990',137,1),(6382,26,2,'2013-09-09','1990',137,1),(6383,27,2,'2013-10-08','1990',137,1),(6384,28,2,'2013-11-08','1990',137,1),(6385,29,2,'2013-12-09','1990',137,1),(6386,30,2,'2014-01-08','1990',137,1),(6387,31,2,'2014-02-10','1990',137,1),(6388,32,2,'2014-03-10','1990',137,1),(6389,33,2,'2014-04-08','1990',137,1),(6390,34,2,'2014-05-08','1990',137,1),(6391,35,2,'2014-06-09','1990',137,1),(6392,36,2,'2014-07-08','1990',137,1),(6393,37,2,'2014-08-08','1990',137,1),(6394,38,2,'2014-09-08','1990',137,1),(6395,39,2,'2014-10-08','1990',137,1),(6396,40,2,'2014-11-10','1990',137,1),(6397,41,2,'2014-12-08','1990',137,1),(6398,42,2,'2015-01-08','1990',137,1),(6399,43,2,'2015-02-09','1990',137,1),(6400,44,2,'2015-03-09','1990',137,1),(6401,45,2,'2015-04-08','1990',137,1),(6402,46,2,'2015-05-08','1990',137,1),(6403,47,2,'2015-06-08','1990',137,1),(6404,48,2,'2015-07-08','1990',137,1),(6405,1,2,'2011-08-31','1990',138,1),(6406,2,2,'2011-09-08','1990',138,1),(6407,3,2,'2011-10-10','1990',138,1),(6408,4,2,'2011-11-08','1990',138,1),(6409,5,2,'2011-12-08','1990',138,1),(6410,6,2,'2012-01-09','1990',138,1),(6411,7,2,'2012-02-08','1990',138,1),(6412,8,2,'2012-03-08','1990',138,1),(6413,9,2,'2012-04-11','1990',138,1),(6414,10,2,'2012-05-08','1990',138,1),(6415,11,2,'2012-06-08','1990',138,1),(6416,12,2,'2012-07-09','1990',138,1),(6417,13,2,'2012-08-08','1990',138,1),(6418,14,2,'2012-09-10','1990',138,1),(6419,15,2,'2012-10-08','1990',138,1),(6420,16,2,'2012-11-08','1990',138,1),(6421,17,2,'2012-12-10','1990',138,1),(6422,18,2,'2013-01-08','1990',138,1),(6423,19,2,'2013-02-08','1990',138,1),(6424,20,2,'2013-03-08','1990',138,1),(6425,21,2,'2013-04-08','1990',138,1),(6426,22,2,'2013-05-08','1990',138,1),(6427,23,2,'2013-06-10','1990',138,1),(6428,24,2,'2013-07-08','1990',138,1),(6429,25,2,'2013-08-08','1990',138,1),(6430,26,2,'2013-09-09','1990',138,1),(6431,27,2,'2013-10-08','1990',138,1),(6432,28,2,'2013-11-08','1990',138,1),(6433,29,2,'2013-12-09','1990',138,1),(6434,30,2,'2014-01-08','1990',138,1),(6435,31,2,'2014-02-10','1990',138,1),(6436,32,2,'2014-03-10','1990',138,1),(6437,33,2,'2014-04-08','1990',138,1),(6438,34,2,'2014-05-08','1990',138,1),(6439,35,2,'2014-06-09','1990',138,1),(6440,36,2,'2014-07-08','1990',138,1),(6441,37,2,'2014-08-08','1990',138,1),(6442,38,2,'2014-09-08','1990',138,1),(6443,39,2,'2014-10-08','1990',138,1),(6444,40,2,'2014-11-10','1990',138,1),(6445,41,2,'2014-12-08','1990',138,1),(6446,42,2,'2015-01-08','1990',138,1),(6447,43,2,'2015-02-09','1990',138,1),(6448,44,2,'2015-03-09','1990',138,1),(6449,45,2,'2015-04-08','1990',138,1),(6450,46,2,'2015-05-08','1990',138,1),(6451,47,2,'2015-06-08','1990',138,1),(6452,48,2,'2015-07-08','1990',138,1),(6453,1,2,'2011-08-31','1990',139,1),(6454,2,2,'2011-09-08','1990',139,1),(6455,3,2,'2011-10-10','1990',139,1),(6456,4,2,'2011-11-08','1990',139,1),(6457,5,2,'2011-12-08','1990',139,1),(6458,6,2,'2012-01-09','1990',139,1),(6459,7,2,'2012-02-08','1990',139,1),(6460,8,2,'2012-03-08','1990',139,1),(6461,9,2,'2012-04-11','1990',139,1),(6462,10,2,'2012-05-08','1990',139,1),(6463,11,2,'2012-06-08','1990',139,1),(6464,12,2,'2012-07-09','1990',139,1),(6465,13,2,'2012-08-08','1990',139,1),(6466,14,2,'2012-09-10','1990',139,1),(6467,15,2,'2012-10-08','1990',139,1),(6468,16,2,'2012-11-08','1990',139,1),(6469,17,2,'2012-12-10','1990',139,1),(6470,18,2,'2013-01-08','1990',139,1),(6471,19,2,'2013-02-08','1990',139,1),(6472,20,2,'2013-03-08','1990',139,1),(6473,21,2,'2013-04-08','1990',139,1),(6474,22,2,'2013-05-08','1990',139,1),(6475,23,2,'2013-06-10','1990',139,1),(6476,24,2,'2013-07-08','1990',139,1),(6477,25,2,'2013-08-08','1990',139,1),(6478,26,2,'2013-09-09','1990',139,1),(6479,27,2,'2013-10-08','1990',139,1),(6480,28,2,'2013-11-08','1990',139,1),(6481,29,2,'2013-12-09','1990',139,1),(6482,30,2,'2014-01-08','1990',139,1),(6483,31,2,'2014-02-10','1990',139,1),(6484,32,2,'2014-03-10','1990',139,1),(6485,33,2,'2014-04-08','1990',139,1),(6486,34,2,'2014-05-08','1990',139,1),(6487,35,2,'2014-06-09','1990',139,1),(6488,36,2,'2014-07-08','1990',139,1),(6489,37,2,'2014-08-08','1990',139,1),(6490,38,2,'2014-09-08','1990',139,1),(6491,39,2,'2014-10-08','1990',139,1),(6492,40,2,'2014-11-10','1990',139,1),(6493,41,2,'2014-12-08','1990',139,1),(6494,42,2,'2015-01-08','1990',139,1),(6495,43,2,'2015-02-09','1990',139,1),(6496,44,2,'2015-03-09','1990',139,1),(6497,45,2,'2015-04-08','1990',139,1),(6498,46,2,'2015-05-08','1990',139,1),(6499,47,2,'2015-06-08','1990',139,1),(6500,48,2,'2015-07-08','1990',139,1),(6501,1,2,'2011-08-31','1990',140,1),(6502,2,2,'2011-09-08','1990',140,1),(6503,3,2,'2011-10-10','1990',140,1),(6504,4,2,'2011-11-08','1990',140,1),(6505,5,2,'2011-12-08','1990',140,1),(6506,6,2,'2012-01-09','1990',140,1),(6507,7,2,'2012-02-08','1990',140,1),(6508,8,2,'2012-03-08','1990',140,1),(6509,9,2,'2012-04-11','1990',140,1),(6510,10,2,'2012-05-08','1990',140,1),(6511,11,2,'2012-06-08','1990',140,1),(6512,12,2,'2012-07-09','1990',140,1),(6513,13,2,'2012-08-08','1990',140,1),(6514,14,2,'2012-09-10','1990',140,1),(6515,15,2,'2012-10-08','1990',140,1),(6516,16,2,'2012-11-08','1990',140,1),(6517,17,2,'2012-12-10','1990',140,1),(6518,18,2,'2013-01-08','1990',140,1),(6519,19,2,'2013-02-08','1990',140,1),(6520,20,2,'2013-03-08','1990',140,1),(6521,21,2,'2013-04-08','1990',140,1),(6522,22,2,'2013-05-08','1990',140,1),(6523,23,2,'2013-06-10','1990',140,1),(6524,24,2,'2013-07-08','1990',140,1),(6525,25,2,'2013-08-08','1990',140,1),(6526,26,2,'2013-09-09','1990',140,1),(6527,27,2,'2013-10-08','1990',140,1),(6528,28,2,'2013-11-08','1990',140,1),(6529,29,2,'2013-12-09','1990',140,1),(6530,30,2,'2014-01-08','1990',140,1),(6531,31,2,'2014-02-10','1990',140,1),(6532,32,2,'2014-03-10','1990',140,1),(6533,33,2,'2014-04-08','1990',140,1),(6534,34,2,'2014-05-08','1990',140,1),(6535,35,2,'2014-06-09','1990',140,1),(6536,36,2,'2014-07-08','1990',140,1),(6537,37,2,'2014-08-08','1990',140,1),(6538,38,2,'2014-09-08','1990',140,1),(6539,39,2,'2014-10-08','1990',140,1),(6540,40,2,'2014-11-10','1990',140,1),(6541,41,2,'2014-12-08','1990',140,1),(6542,42,2,'2015-01-08','1990',140,1),(6543,43,2,'2015-02-09','1990',140,1),(6544,44,2,'2015-03-09','1990',140,1),(6545,45,2,'2015-04-08','1990',140,1),(6546,46,2,'2015-05-08','1990',140,1),(6547,47,2,'2015-06-08','1990',140,1),(6548,48,2,'2015-07-08','1990',140,1),(6549,1,2,'2011-08-31','1990',141,1),(6550,2,2,'2011-09-08','1990',141,1),(6551,3,2,'2011-10-10','1990',141,1),(6552,4,2,'2011-11-08','1990',141,1),(6553,5,2,'2011-12-08','1990',141,1),(6554,6,2,'2012-01-09','1990',141,1),(6555,7,2,'2012-02-08','1990',141,1),(6556,8,2,'2012-03-08','1990',141,1),(6557,9,2,'2012-04-11','1990',141,1),(6558,10,2,'2012-05-08','1990',141,1),(6559,11,2,'2012-06-08','1990',141,1),(6560,12,2,'2012-07-09','1990',141,1),(6561,13,2,'2012-08-08','1990',141,1),(6562,14,2,'2012-09-10','1990',141,1),(6563,15,2,'2012-10-08','1990',141,1),(6564,16,2,'2012-11-08','1990',141,1),(6565,17,2,'2012-12-10','1990',141,1),(6566,18,2,'2013-01-08','1990',141,1),(6567,19,2,'2013-02-08','1990',141,1),(6568,20,2,'2013-03-08','1990',141,1),(6569,21,2,'2013-04-08','1990',141,1),(6570,22,2,'2013-05-08','1990',141,1),(6571,23,2,'2013-06-10','1990',141,1),(6572,24,2,'2013-07-08','1990',141,1),(6573,25,2,'2013-08-08','1990',141,1),(6574,26,2,'2013-09-09','1990',141,1),(6575,27,2,'2013-10-08','1990',141,1),(6576,28,2,'2013-11-08','1990',141,1),(6577,29,2,'2013-12-09','1990',141,1),(6578,30,2,'2014-01-08','1990',141,1),(6579,31,2,'2014-02-10','1990',141,1),(6580,32,2,'2014-03-10','1990',141,1),(6581,33,2,'2014-04-08','1990',141,1),(6582,34,2,'2014-05-08','1990',141,1),(6583,35,2,'2014-06-09','1990',141,1),(6584,36,2,'2014-07-08','1990',141,1),(6585,37,2,'2014-08-08','1990',141,1),(6586,38,2,'2014-09-08','1990',141,1),(6587,39,2,'2014-10-08','1990',141,1),(6588,40,2,'2014-11-10','1990',141,1),(6589,41,2,'2014-12-08','1990',141,1),(6590,42,2,'2015-01-08','1990',141,1),(6591,43,2,'2015-02-09','1990',141,1),(6592,44,2,'2015-03-09','1990',141,1),(6593,45,2,'2015-04-08','1990',141,1),(6594,46,2,'2015-05-08','1990',141,1),(6595,47,2,'2015-06-08','1990',141,1),(6596,48,2,'2015-07-08','1990',141,1),(6597,1,2,'2011-08-31','1990',142,1),(6598,2,2,'2011-09-08','1990',142,1),(6599,3,2,'2011-10-10','1990',142,1),(6600,4,2,'2011-11-08','1990',142,1),(6601,5,2,'2011-12-08','1990',142,1),(6602,6,2,'2012-01-09','1990',142,1),(6603,7,2,'2012-02-08','1990',142,1),(6604,8,2,'2012-03-08','1990',142,1),(6605,9,2,'2012-04-11','1990',142,1),(6606,10,2,'2012-05-08','1990',142,1),(6607,11,2,'2012-06-08','1990',142,1),(6608,12,2,'2012-07-09','1990',142,1),(6609,13,2,'2012-08-08','1990',142,1),(6610,14,2,'2012-09-10','1990',142,1),(6611,15,2,'2012-10-08','1990',142,1),(6612,16,2,'2012-11-08','1990',142,1),(6613,17,2,'2012-12-10','1990',142,1),(6614,18,2,'2013-01-08','1990',142,1),(6615,19,2,'2013-02-08','1990',142,1),(6616,20,2,'2013-03-08','1990',142,1),(6617,21,2,'2013-04-08','1990',142,1),(6618,22,2,'2013-05-08','1990',142,1),(6619,23,2,'2013-06-10','1990',142,1),(6620,24,2,'2013-07-08','1990',142,1),(6621,25,2,'2013-08-08','1990',142,1),(6622,26,2,'2013-09-09','1990',142,1),(6623,27,2,'2013-10-08','1990',142,1),(6624,28,2,'2013-11-08','1990',142,1),(6625,29,2,'2013-12-09','1990',142,1),(6626,30,2,'2014-01-08','1990',142,1),(6627,31,2,'2014-02-10','1990',142,1),(6628,32,2,'2014-03-10','1990',142,1),(6629,33,2,'2014-04-08','1990',142,1),(6630,34,2,'2014-05-08','1990',142,1),(6631,35,2,'2014-06-09','1990',142,1),(6632,36,2,'2014-07-08','1990',142,1),(6633,37,2,'2014-08-08','1990',142,1),(6634,38,2,'2014-09-08','1990',142,1),(6635,39,2,'2014-10-08','1990',142,1),(6636,40,2,'2014-11-10','1990',142,1),(6637,41,2,'2014-12-08','1990',142,1),(6638,42,2,'2015-01-08','1990',142,1),(6639,43,2,'2015-02-09','1990',142,1),(6640,44,2,'2015-03-09','1990',142,1),(6641,45,2,'2015-04-08','1990',142,1),(6642,46,2,'2015-05-08','1990',142,1),(6643,47,2,'2015-06-08','1990',142,1),(6644,48,2,'2015-07-08','1990',142,1),(6645,1,2,'2011-08-31','1990',143,1),(6646,2,2,'2011-09-08','1990',143,1),(6647,3,2,'2011-10-10','1990',143,1),(6648,4,2,'2011-11-08','1990',143,1),(6649,5,2,'2011-12-08','1990',143,1),(6650,6,2,'2012-01-09','1990',143,1),(6651,7,2,'2012-02-08','1990',143,1),(6652,8,2,'2012-03-08','1990',143,1),(6653,9,2,'2012-04-11','1990',143,1),(6654,10,2,'2012-05-08','1990',143,1),(6655,11,2,'2012-06-08','1990',143,1),(6656,12,2,'2012-07-09','1990',143,1),(6657,13,2,'2012-08-08','1990',143,1),(6658,14,2,'2012-09-10','1990',143,1),(6659,15,2,'2012-10-08','1990',143,1),(6660,16,2,'2012-11-08','1990',143,1),(6661,17,2,'2012-12-10','1990',143,1),(6662,18,2,'2013-01-08','1990',143,1),(6663,19,2,'2013-02-08','1990',143,1),(6664,20,2,'2013-03-08','1990',143,1),(6665,21,2,'2013-04-08','1990',143,1),(6666,22,2,'2013-05-08','1990',143,1),(6667,23,2,'2013-06-10','1990',143,1),(6668,24,2,'2013-07-08','1990',143,1),(6669,25,2,'2013-08-08','1990',143,1),(6670,26,2,'2013-09-09','1990',143,1),(6671,27,2,'2013-10-08','1990',143,1),(6672,28,2,'2013-11-08','1990',143,1),(6673,29,2,'2013-12-09','1990',143,1),(6674,30,2,'2014-01-08','1990',143,1),(6675,31,2,'2014-02-10','1990',143,1),(6676,32,2,'2014-03-10','1990',143,1),(6677,33,2,'2014-04-08','1990',143,1),(6678,34,2,'2014-05-08','1990',143,1),(6679,35,2,'2014-06-09','1990',143,1),(6680,36,2,'2014-07-08','1990',143,1),(6681,37,2,'2014-08-08','1990',143,1),(6682,38,2,'2014-09-08','1990',143,1),(6683,39,2,'2014-10-08','1990',143,1),(6684,40,2,'2014-11-10','1990',143,1),(6685,41,2,'2014-12-08','1990',143,1),(6686,42,2,'2015-01-08','1990',143,1),(6687,43,2,'2015-02-09','1990',143,1),(6688,44,2,'2015-03-09','1990',143,1),(6689,45,2,'2015-04-08','1990',143,1),(6690,46,2,'2015-05-08','1990',143,1),(6691,47,2,'2015-06-08','1990',143,1),(6692,48,2,'2015-07-08','1990',143,1),(6693,1,2,'2011-08-31','1990',144,1),(6694,2,2,'2011-09-08','1990',144,1),(6695,3,2,'2011-10-10','1990',144,1),(6696,4,2,'2011-11-08','1990',144,1),(6697,5,2,'2011-12-08','1990',144,1),(6698,6,2,'2012-01-09','1990',144,1),(6699,7,2,'2012-02-08','1990',144,1),(6700,8,2,'2012-03-08','1990',144,1),(6701,9,2,'2012-04-11','1990',144,1),(6702,10,2,'2012-05-08','1990',144,1),(6703,11,2,'2012-06-08','1990',144,1),(6704,12,2,'2012-07-09','1990',144,1),(6705,13,2,'2012-08-08','1990',144,1),(6706,14,2,'2012-09-10','1990',144,1),(6707,15,2,'2012-10-08','1990',144,1),(6708,16,2,'2012-11-08','1990',144,1),(6709,17,2,'2012-12-10','1990',144,1),(6710,18,2,'2013-01-08','1990',144,1),(6711,19,2,'2013-02-08','1990',144,1),(6712,20,2,'2013-03-08','1990',144,1),(6713,21,2,'2013-04-08','1990',144,1),(6714,22,2,'2013-05-08','1990',144,1),(6715,23,2,'2013-06-10','1990',144,1),(6716,24,2,'2013-07-08','1990',144,1),(6717,25,2,'2013-08-08','1990',144,1),(6718,26,2,'2013-09-09','1990',144,1),(6719,27,2,'2013-10-08','1990',144,1),(6720,28,2,'2013-11-08','1990',144,1),(6721,29,2,'2013-12-09','1990',144,1),(6722,30,2,'2014-01-08','1990',144,1),(6723,31,2,'2014-02-10','1990',144,1),(6724,32,2,'2014-03-10','1990',144,1),(6725,33,2,'2014-04-08','1990',144,1),(6726,34,2,'2014-05-08','1990',144,1),(6727,35,2,'2014-06-09','1990',144,1),(6728,36,2,'2014-07-08','1990',144,1),(6729,37,2,'2014-08-08','1990',144,1),(6730,38,2,'2014-09-08','1990',144,1),(6731,39,2,'2014-10-08','1990',144,1),(6732,40,2,'2014-11-10','1990',144,1),(6733,41,2,'2014-12-08','1990',144,1),(6734,42,2,'2015-01-08','1990',144,1),(6735,43,2,'2015-02-09','1990',144,1),(6736,44,2,'2015-03-09','1990',144,1),(6737,45,2,'2015-04-08','1990',144,1),(6738,46,2,'2015-05-08','1990',144,1),(6739,47,2,'2015-06-08','1990',144,1),(6740,48,2,'2015-07-08','1990',144,1),(6741,1,2,'2011-08-31','1990',145,1),(6742,2,2,'2011-09-08','1990',145,1),(6743,3,2,'2011-10-10','1990',145,1),(6744,4,2,'2011-11-08','1990',145,1),(6745,5,2,'2011-12-08','1990',145,1),(6746,6,2,'2012-01-09','1990',145,1),(6747,7,2,'2012-02-08','1990',145,1),(6748,8,2,'2012-03-08','1990',145,1),(6749,9,2,'2012-04-11','1990',145,1),(6750,10,2,'2012-05-08','1990',145,1),(6751,11,2,'2012-06-08','1990',145,1),(6752,12,2,'2012-07-09','1990',145,1),(6753,13,2,'2012-08-08','1990',145,1),(6754,14,2,'2012-09-10','1990',145,1),(6755,15,2,'2012-10-08','1990',145,1),(6756,16,2,'2012-11-08','1990',145,1),(6757,17,2,'2012-12-10','1990',145,1),(6758,18,2,'2013-01-08','1990',145,1),(6759,19,2,'2013-02-08','1990',145,1),(6760,20,2,'2013-03-08','1990',145,1),(6761,21,2,'2013-04-08','1990',145,1),(6762,22,2,'2013-05-08','1990',145,1),(6763,23,2,'2013-06-10','1990',145,1),(6764,24,2,'2013-07-08','1990',145,1),(6765,25,2,'2013-08-08','1990',145,1),(6766,26,2,'2013-09-09','1990',145,1),(6767,27,2,'2013-10-08','1990',145,1),(6768,28,2,'2013-11-08','1990',145,1),(6769,29,2,'2013-12-09','1990',145,1),(6770,30,2,'2014-01-08','1990',145,1),(6771,31,2,'2014-02-10','1990',145,1),(6772,32,2,'2014-03-10','1990',145,1),(6773,33,2,'2014-04-08','1990',145,1),(6774,34,2,'2014-05-08','1990',145,1),(6775,35,2,'2014-06-09','1990',145,1),(6776,36,2,'2014-07-08','1990',145,1),(6777,37,2,'2014-08-08','1990',145,1),(6778,38,2,'2014-09-08','1990',145,1),(6779,39,2,'2014-10-08','1990',145,1),(6780,40,2,'2014-11-10','1990',145,1),(6781,41,2,'2014-12-08','1990',145,1),(6782,42,2,'2015-01-08','1990',145,1),(6783,43,2,'2015-02-09','1990',145,1),(6784,44,2,'2015-03-09','1990',145,1),(6785,45,2,'2015-04-08','1990',145,1),(6786,46,2,'2015-05-08','1990',145,1),(6787,47,2,'2015-06-08','1990',145,1),(6788,48,2,'2015-07-08','1990',145,1),(6789,1,2,'2011-08-31','1990',146,1),(6790,2,2,'2011-09-08','1990',146,1),(6791,3,2,'2011-10-10','1990',146,1),(6792,4,2,'2011-11-08','1990',146,1),(6793,5,2,'2011-12-08','1990',146,1),(6794,6,2,'2012-01-09','1990',146,1),(6795,7,2,'2012-02-08','1990',146,1),(6796,8,2,'2012-03-08','1990',146,1),(6797,9,2,'2012-04-11','1990',146,1),(6798,10,2,'2012-05-08','1990',146,1),(6799,11,2,'2012-06-08','1990',146,1),(6800,12,2,'2012-07-09','1990',146,1),(6801,13,2,'2012-08-08','1990',146,1),(6802,14,2,'2012-09-10','1990',146,1),(6803,15,2,'2012-10-08','1990',146,1),(6804,16,2,'2012-11-08','1990',146,1),(6805,17,2,'2012-12-10','1990',146,1),(6806,18,2,'2013-01-08','1990',146,1),(6807,19,2,'2013-02-08','1990',146,1),(6808,20,2,'2013-03-08','1990',146,1),(6809,21,2,'2013-04-08','1990',146,1),(6810,22,2,'2013-05-08','1990',146,1),(6811,23,2,'2013-06-10','1990',146,1),(6812,24,2,'2013-07-08','1990',146,1),(6813,25,2,'2013-08-08','1990',146,1),(6814,26,2,'2013-09-09','1990',146,1),(6815,27,2,'2013-10-08','1990',146,1),(6816,28,2,'2013-11-08','1990',146,1),(6817,29,2,'2013-12-09','1990',146,1),(6818,30,2,'2014-01-08','1990',146,1),(6819,31,2,'2014-02-10','1990',146,1),(6820,32,2,'2014-03-10','1990',146,1),(6821,33,2,'2014-04-08','1990',146,1),(6822,34,2,'2014-05-08','1990',146,1),(6823,35,2,'2014-06-09','1990',146,1),(6824,36,2,'2014-07-08','1990',146,1),(6825,37,2,'2014-08-08','1990',146,1),(6826,38,2,'2014-09-08','1990',146,1),(6827,39,2,'2014-10-08','1990',146,1),(6828,40,2,'2014-11-10','1990',146,1),(6829,41,2,'2014-12-08','1990',146,1),(6830,42,2,'2015-01-08','1990',146,1),(6831,43,2,'2015-02-09','1990',146,1),(6832,44,2,'2015-03-09','1990',146,1),(6833,45,2,'2015-04-08','1990',146,1),(6834,46,2,'2015-05-08','1990',146,1),(6835,47,2,'2015-06-08','1990',146,1),(6836,48,2,'2015-07-08','1990',146,1),(6837,1,2,'2011-08-31','1990',147,1),(6838,2,2,'2011-09-08','1990',147,1),(6839,3,2,'2011-10-10','1990',147,1),(6840,4,2,'2011-11-08','1990',147,1),(6841,5,2,'2011-12-08','1990',147,1),(6842,6,2,'2012-01-09','1990',147,1),(6843,7,2,'2012-02-08','1990',147,1),(6844,8,2,'2012-03-08','1990',147,1),(6845,9,2,'2012-04-11','1990',147,1),(6846,10,2,'2012-05-08','1990',147,1),(6847,11,2,'2012-06-08','1990',147,1),(6848,12,2,'2012-07-09','1990',147,1),(6849,13,2,'2012-08-08','1990',147,1),(6850,14,2,'2012-09-10','1990',147,1),(6851,15,2,'2012-10-08','1990',147,1),(6852,16,2,'2012-11-08','1990',147,1),(6853,17,2,'2012-12-10','1990',147,1),(6854,18,2,'2013-01-08','1990',147,1),(6855,19,2,'2013-02-08','1990',147,1),(6856,20,2,'2013-03-08','1990',147,1),(6857,21,2,'2013-04-08','1990',147,1),(6858,22,2,'2013-05-08','1990',147,1),(6859,23,2,'2013-06-10','1990',147,1),(6860,24,2,'2013-07-08','1990',147,1),(6861,25,2,'2013-08-08','1990',147,1),(6862,26,2,'2013-09-09','1990',147,1),(6863,27,2,'2013-10-08','1990',147,1),(6864,28,2,'2013-11-08','1990',147,1),(6865,29,2,'2013-12-09','1990',147,1),(6866,30,2,'2014-01-08','1990',147,1),(6867,31,2,'2014-02-10','1990',147,1),(6868,32,2,'2014-03-10','1990',147,1),(6869,33,2,'2014-04-08','1990',147,1),(6870,34,2,'2014-05-08','1990',147,1),(6871,35,2,'2014-06-09','1990',147,1),(6872,36,2,'2014-07-08','1990',147,1),(6873,37,2,'2014-08-08','1990',147,1),(6874,38,2,'2014-09-08','1990',147,1),(6875,39,2,'2014-10-08','1990',147,1),(6876,40,2,'2014-11-10','1990',147,1),(6877,41,2,'2014-12-08','1990',147,1),(6878,42,2,'2015-01-08','1990',147,1),(6879,43,2,'2015-02-09','1990',147,1),(6880,44,2,'2015-03-09','1990',147,1),(6881,45,2,'2015-04-08','1990',147,1),(6882,46,2,'2015-05-08','1990',147,1),(6883,47,2,'2015-06-08','1990',147,1),(6884,48,2,'2015-07-08','1990',147,1),(6885,1,2,'2011-08-31','1990',148,1),(6886,2,2,'2011-09-08','1990',148,1),(6887,3,2,'2011-10-10','1990',148,1),(6888,4,2,'2011-11-08','1990',148,1),(6889,5,2,'2011-12-08','1990',148,1),(6890,6,2,'2012-01-09','1990',148,1),(6891,7,2,'2012-02-08','1990',148,1),(6892,8,2,'2012-03-08','1990',148,1),(6893,9,2,'2012-04-11','1990',148,1),(6894,10,2,'2012-05-08','1990',148,1),(6895,11,2,'2012-06-08','1990',148,1),(6896,12,2,'2012-07-09','1990',148,1),(6897,13,2,'2012-08-08','1990',148,1),(6898,14,2,'2012-09-10','1990',148,1),(6899,15,2,'2012-10-08','1990',148,1),(6900,16,2,'2012-11-08','1990',148,1),(6901,17,2,'2012-12-10','1990',148,1),(6902,18,2,'2013-01-08','1990',148,1),(6903,19,2,'2013-02-08','1990',148,1),(6904,20,2,'2013-03-08','1990',148,1),(6905,21,2,'2013-04-08','1990',148,1),(6906,22,2,'2013-05-08','1990',148,1),(6907,23,2,'2013-06-10','1990',148,1),(6908,24,2,'2013-07-08','1990',148,1),(6909,25,2,'2013-08-08','1990',148,1),(6910,26,2,'2013-09-09','1990',148,1),(6911,27,2,'2013-10-08','1990',148,1),(6912,28,2,'2013-11-08','1990',148,1),(6913,29,2,'2013-12-09','1990',148,1),(6914,30,2,'2014-01-08','1990',148,1),(6915,31,2,'2014-02-10','1990',148,1),(6916,32,2,'2014-03-10','1990',148,1),(6917,33,2,'2014-04-08','1990',148,1),(6918,34,2,'2014-05-08','1990',148,1),(6919,35,2,'2014-06-09','1990',148,1),(6920,36,2,'2014-07-08','1990',148,1),(6921,37,2,'2014-08-08','1990',148,1),(6922,38,2,'2014-09-08','1990',148,1),(6923,39,2,'2014-10-08','1990',148,1),(6924,40,2,'2014-11-10','1990',148,1),(6925,41,2,'2014-12-08','1990',148,1),(6926,42,2,'2015-01-08','1990',148,1),(6927,43,2,'2015-02-09','1990',148,1),(6928,44,2,'2015-03-09','1990',148,1),(6929,45,2,'2015-04-08','1990',148,1),(6930,46,2,'2015-05-08','1990',148,1),(6931,47,2,'2015-06-08','1990',148,1),(6932,48,2,'2015-07-08','1990',148,1),(6933,1,2,'2011-08-31','1990',149,1),(6934,2,2,'2011-09-08','1990',149,1),(6935,3,2,'2011-10-10','1990',149,1),(6936,4,2,'2011-11-08','1990',149,1),(6937,5,2,'2011-12-08','1990',149,1),(6938,6,2,'2012-01-09','1990',149,1),(6939,7,2,'2012-02-08','1990',149,1),(6940,8,2,'2012-03-08','1990',149,1),(6941,9,2,'2012-04-11','1990',149,1),(6942,10,2,'2012-05-08','1990',149,1),(6943,11,2,'2012-06-08','1990',149,1),(6944,12,2,'2012-07-09','1990',149,1),(6945,13,2,'2012-08-08','1990',149,1),(6946,14,2,'2012-09-10','1990',149,1),(6947,15,2,'2012-10-08','1990',149,1),(6948,16,2,'2012-11-08','1990',149,1),(6949,17,2,'2012-12-10','1990',149,1),(6950,18,2,'2013-01-08','1990',149,1),(6951,19,2,'2013-02-08','1990',149,1),(6952,20,2,'2013-03-08','1990',149,1),(6953,21,2,'2013-04-08','1990',149,1),(6954,22,2,'2013-05-08','1990',149,1),(6955,23,2,'2013-06-10','1990',149,1),(6956,24,2,'2013-07-08','1990',149,1),(6957,25,2,'2013-08-08','1990',149,1),(6958,26,2,'2013-09-09','1990',149,1),(6959,27,2,'2013-10-08','1990',149,1),(6960,28,2,'2013-11-08','1990',149,1),(6961,29,2,'2013-12-09','1990',149,1),(6962,30,2,'2014-01-08','1990',149,1),(6963,31,2,'2014-02-10','1990',149,1),(6964,32,2,'2014-03-10','1990',149,1),(6965,33,2,'2014-04-08','1990',149,1),(6966,34,2,'2014-05-08','1990',149,1),(6967,35,2,'2014-06-09','1990',149,1),(6968,36,2,'2014-07-08','1990',149,1),(6969,37,2,'2014-08-08','1990',149,1),(6970,38,2,'2014-09-08','1990',149,1),(6971,39,2,'2014-10-08','1990',149,1),(6972,40,2,'2014-11-10','1990',149,1),(6973,41,2,'2014-12-08','1990',149,1),(6974,42,2,'2015-01-08','1990',149,1),(6975,43,2,'2015-02-09','1990',149,1),(6976,44,2,'2015-03-09','1990',149,1),(6977,45,2,'2015-04-08','1990',149,1),(6978,46,2,'2015-05-08','1990',149,1),(6979,47,2,'2015-06-08','1990',149,1),(6980,48,2,'2015-07-08','1990',149,1),(6981,1,2,'2011-08-31','1990',150,1),(6982,2,2,'2011-09-08','1990',150,1),(6983,3,2,'2011-10-10','1990',150,1),(6984,4,2,'2011-11-08','1990',150,1),(6985,5,2,'2011-12-08','1990',150,1),(6986,6,2,'2012-01-09','1990',150,1),(6987,7,2,'2012-02-08','1990',150,1),(6988,8,2,'2012-03-08','1990',150,1),(6989,9,2,'2012-04-11','1990',150,1),(6990,10,2,'2012-05-08','1990',150,1),(6991,11,2,'2012-06-08','1990',150,1),(6992,12,2,'2012-07-09','1990',150,1),(6993,13,2,'2012-08-08','1990',150,1),(6994,14,2,'2012-09-10','1990',150,1),(6995,15,2,'2012-10-08','1990',150,1),(6996,16,2,'2012-11-08','1990',150,1),(6997,17,2,'2012-12-10','1990',150,1),(6998,18,2,'2013-01-08','1990',150,1),(6999,19,2,'2013-02-08','1990',150,1),(7000,20,2,'2013-03-08','1990',150,1),(7001,21,2,'2013-04-08','1990',150,1),(7002,22,2,'2013-05-08','1990',150,1),(7003,23,2,'2013-06-10','1990',150,1),(7004,24,2,'2013-07-08','1990',150,1),(7005,25,2,'2013-08-08','1990',150,1),(7006,26,2,'2013-09-09','1990',150,1),(7007,27,2,'2013-10-08','1990',150,1),(7008,28,2,'2013-11-08','1990',150,1),(7009,29,2,'2013-12-09','1990',150,1),(7010,30,2,'2014-01-08','1990',150,1),(7011,31,2,'2014-02-10','1990',150,1),(7012,32,2,'2014-03-10','1990',150,1),(7013,33,2,'2014-04-08','1990',150,1),(7014,34,2,'2014-05-08','1990',150,1),(7015,35,2,'2014-06-09','1990',150,1),(7016,36,2,'2014-07-08','1990',150,1),(7017,37,2,'2014-08-08','1990',150,1),(7018,38,2,'2014-09-08','1990',150,1),(7019,39,2,'2014-10-08','1990',150,1),(7020,40,2,'2014-11-10','1990',150,1),(7021,41,2,'2014-12-08','1990',150,1),(7022,42,2,'2015-01-08','1990',150,1),(7023,43,2,'2015-02-09','1990',150,1),(7024,44,2,'2015-03-09','1990',150,1),(7025,45,2,'2015-04-08','1990',150,1),(7026,46,2,'2015-05-08','1990',150,1),(7027,47,2,'2015-06-08','1990',150,1),(7028,48,2,'2015-07-08','1990',150,1),(7029,1,2,'2011-08-31','1990',151,1),(7030,2,2,'2011-09-08','1990',151,1),(7031,3,2,'2011-10-10','1990',151,1),(7032,4,2,'2011-11-08','1990',151,1),(7033,5,2,'2011-12-08','1990',151,1),(7034,6,2,'2012-01-09','1990',151,1),(7035,7,2,'2012-02-08','1990',151,1),(7036,8,2,'2012-03-08','1990',151,1),(7037,9,2,'2012-04-11','1990',151,1),(7038,10,2,'2012-05-08','1990',151,1),(7039,11,2,'2012-06-08','1990',151,1),(7040,12,2,'2012-07-09','1990',151,1),(7041,13,2,'2012-08-08','1990',151,1),(7042,14,2,'2012-09-10','1990',151,1),(7043,15,2,'2012-10-08','1990',151,1),(7044,16,2,'2012-11-08','1990',151,1),(7045,17,2,'2012-12-10','1990',151,1),(7046,18,2,'2013-01-08','1990',151,1),(7047,19,2,'2013-02-08','1990',151,1),(7048,20,2,'2013-03-08','1990',151,1),(7049,21,2,'2013-04-08','1990',151,1),(7050,22,2,'2013-05-08','1990',151,1),(7051,23,2,'2013-06-10','1990',151,1),(7052,24,2,'2013-07-08','1990',151,1),(7053,25,2,'2013-08-08','1990',151,1),(7054,26,2,'2013-09-09','1990',151,1),(7055,27,2,'2013-10-08','1990',151,1),(7056,28,2,'2013-11-08','1990',151,1),(7057,29,2,'2013-12-09','1990',151,1),(7058,30,2,'2014-01-08','1990',151,1),(7059,31,2,'2014-02-10','1990',151,1),(7060,32,2,'2014-03-10','1990',151,1),(7061,33,2,'2014-04-08','1990',151,1),(7062,34,2,'2014-05-08','1990',151,1),(7063,35,2,'2014-06-09','1990',151,1),(7064,36,2,'2014-07-08','1990',151,1),(7065,37,2,'2014-08-08','1990',151,1),(7066,38,2,'2014-09-08','1990',151,1),(7067,39,2,'2014-10-08','1990',151,1),(7068,40,2,'2014-11-10','1990',151,1),(7069,41,2,'2014-12-08','1990',151,1),(7070,42,2,'2015-01-08','1990',151,1),(7071,43,2,'2015-02-09','1990',151,1),(7072,44,2,'2015-03-09','1990',151,1),(7073,45,2,'2015-04-08','1990',151,1),(7074,46,2,'2015-05-08','1990',151,1),(7075,47,2,'2015-06-08','1990',151,1),(7076,48,2,'2015-07-08','1990',151,1),(7077,1,2,'2011-08-31','1990',152,1),(7078,2,2,'2011-09-08','1990',152,1),(7079,3,2,'2011-10-10','1990',152,1),(7080,4,2,'2011-11-08','1990',152,1),(7081,5,2,'2011-12-08','1990',152,1),(7082,6,2,'2012-01-09','1990',152,1),(7083,7,2,'2012-02-08','1990',152,1),(7084,8,2,'2012-03-08','1990',152,1),(7085,9,2,'2012-04-11','1990',152,1),(7086,10,2,'2012-05-08','1990',152,1),(7087,11,2,'2012-06-08','1990',152,1),(7088,12,2,'2012-07-09','1990',152,1),(7089,13,2,'2012-08-08','1990',152,1),(7090,14,2,'2012-09-10','1990',152,1),(7091,15,2,'2012-10-08','1990',152,1),(7092,16,2,'2012-11-08','1990',152,1),(7093,17,2,'2012-12-10','1990',152,1),(7094,18,2,'2013-01-08','1990',152,1),(7095,19,2,'2013-02-08','1990',152,1),(7096,20,2,'2013-03-08','1990',152,1),(7097,21,2,'2013-04-08','1990',152,1),(7098,22,2,'2013-05-08','1990',152,1),(7099,23,2,'2013-06-10','1990',152,1),(7100,24,2,'2013-07-08','1990',152,1),(7101,25,2,'2013-08-08','1990',152,1),(7102,26,2,'2013-09-09','1990',152,1),(7103,27,2,'2013-10-08','1990',152,1),(7104,28,2,'2013-11-08','1990',152,1),(7105,29,2,'2013-12-09','1990',152,1),(7106,30,2,'2014-01-08','1990',152,1),(7107,31,2,'2014-02-10','1990',152,1),(7108,32,2,'2014-03-10','1990',152,1),(7109,33,2,'2014-04-08','1990',152,1),(7110,34,2,'2014-05-08','1990',152,1),(7111,35,2,'2014-06-09','1990',152,1),(7112,36,2,'2014-07-08','1990',152,1),(7113,37,2,'2014-08-08','1990',152,1),(7114,38,2,'2014-09-08','1990',152,1),(7115,39,2,'2014-10-08','1990',152,1),(7116,40,2,'2014-11-10','1990',152,1),(7117,41,2,'2014-12-08','1990',152,1),(7118,42,2,'2015-01-08','1990',152,1),(7119,43,2,'2015-02-09','1990',152,1),(7120,44,2,'2015-03-09','1990',152,1),(7121,45,2,'2015-04-08','1990',152,1),(7122,46,2,'2015-05-08','1990',152,1),(7123,47,2,'2015-06-08','1990',152,1),(7124,48,2,'2015-07-08','1990',152,1),(7125,1,2,'2011-08-31','1990',153,1),(7126,2,2,'2011-09-08','1990',153,1),(7127,3,2,'2011-10-10','1990',153,1),(7128,4,2,'2011-11-08','1990',153,1),(7129,5,2,'2011-12-08','1990',153,1),(7130,6,2,'2012-01-09','1990',153,1),(7131,7,2,'2012-02-08','1990',153,1),(7132,8,2,'2012-03-08','1990',153,1),(7133,9,2,'2012-04-11','1990',153,1),(7134,10,2,'2012-05-08','1990',153,1),(7135,11,2,'2012-06-08','1990',153,1),(7136,12,2,'2012-07-09','1990',153,1),(7137,13,2,'2012-08-08','1990',153,1),(7138,14,2,'2012-09-10','1990',153,1),(7139,15,2,'2012-10-08','1990',153,1),(7140,16,2,'2012-11-08','1990',153,1),(7141,17,2,'2012-12-10','1990',153,1),(7142,18,2,'2013-01-08','1990',153,1),(7143,19,2,'2013-02-08','1990',153,1),(7144,20,2,'2013-03-08','1990',153,1),(7145,21,2,'2013-04-08','1990',153,1),(7146,22,2,'2013-05-08','1990',153,1),(7147,23,2,'2013-06-10','1990',153,1),(7148,24,2,'2013-07-08','1990',153,1),(7149,25,2,'2013-08-08','1990',153,1),(7150,26,2,'2013-09-09','1990',153,1),(7151,27,2,'2013-10-08','1990',153,1),(7152,28,2,'2013-11-08','1990',153,1),(7153,29,2,'2013-12-09','1990',153,1),(7154,30,2,'2014-01-08','1990',153,1),(7155,31,2,'2014-02-10','1990',153,1),(7156,32,2,'2014-03-10','1990',153,1),(7157,33,2,'2014-04-08','1990',153,1),(7158,34,2,'2014-05-08','1990',153,1),(7159,35,2,'2014-06-09','1990',153,1),(7160,36,2,'2014-07-08','1990',153,1),(7161,37,2,'2014-08-08','1990',153,1),(7162,38,2,'2014-09-08','1990',153,1),(7163,39,2,'2014-10-08','1990',153,1),(7164,40,2,'2014-11-10','1990',153,1),(7165,41,2,'2014-12-08','1990',153,1),(7166,42,2,'2015-01-08','1990',153,1),(7167,43,2,'2015-02-09','1990',153,1),(7168,44,2,'2015-03-09','1990',153,1),(7169,45,2,'2015-04-08','1990',153,1),(7170,46,2,'2015-05-08','1990',153,1),(7171,47,2,'2015-06-08','1990',153,1),(7172,48,2,'2015-07-08','1990',153,1),(7173,1,2,'2011-08-31','1990',154,1),(7174,2,2,'2011-09-08','1990',154,1),(7175,3,2,'2011-10-10','1990',154,1),(7176,4,2,'2011-11-08','1990',154,1),(7177,5,2,'2011-12-08','1990',154,1),(7178,6,2,'2012-01-09','1990',154,1),(7179,7,2,'2012-02-08','1990',154,1),(7180,8,2,'2012-03-08','1990',154,1),(7181,9,2,'2012-04-11','1990',154,1),(7182,10,2,'2012-05-08','1990',154,1),(7183,11,2,'2012-06-08','1990',154,1),(7184,12,2,'2012-07-09','1990',154,1),(7185,13,2,'2012-08-08','1990',154,1),(7186,14,2,'2012-09-10','1990',154,1),(7187,15,2,'2012-10-08','1990',154,1),(7188,16,2,'2012-11-08','1990',154,1),(7189,17,2,'2012-12-10','1990',154,1),(7190,18,2,'2013-01-08','1990',154,1),(7191,19,2,'2013-02-08','1990',154,1),(7192,20,2,'2013-03-08','1990',154,1),(7193,21,2,'2013-04-08','1990',154,1),(7194,22,2,'2013-05-08','1990',154,1),(7195,23,2,'2013-06-10','1990',154,1),(7196,24,2,'2013-07-08','1990',154,1),(7197,25,2,'2013-08-08','1990',154,1),(7198,26,2,'2013-09-09','1990',154,1),(7199,27,2,'2013-10-08','1990',154,1),(7200,28,2,'2013-11-08','1990',154,1),(7201,29,2,'2013-12-09','1990',154,1),(7202,30,2,'2014-01-08','1990',154,1),(7203,31,2,'2014-02-10','1990',154,1),(7204,32,2,'2014-03-10','1990',154,1),(7205,33,2,'2014-04-08','1990',154,1),(7206,34,2,'2014-05-08','1990',154,1),(7207,35,2,'2014-06-09','1990',154,1),(7208,36,2,'2014-07-08','1990',154,1),(7209,37,2,'2014-08-08','1990',154,1),(7210,38,2,'2014-09-08','1990',154,1),(7211,39,2,'2014-10-08','1990',154,1),(7212,40,2,'2014-11-10','1990',154,1),(7213,41,2,'2014-12-08','1990',154,1),(7214,42,2,'2015-01-08','1990',154,1),(7215,43,2,'2015-02-09','1990',154,1),(7216,44,2,'2015-03-09','1990',154,1),(7217,45,2,'2015-04-08','1990',154,1),(7218,46,2,'2015-05-08','1990',154,1),(7219,47,2,'2015-06-08','1990',154,1),(7220,48,2,'2015-07-08','1990',154,1),(7221,1,2,'2011-08-31','1990',155,1),(7222,2,2,'2011-09-08','1990',155,1),(7223,3,2,'2011-10-10','1990',155,1),(7224,4,2,'2011-11-08','1990',155,1),(7225,5,2,'2011-12-08','1990',155,1),(7226,6,2,'2012-01-09','1990',155,1),(7227,7,2,'2012-02-08','1990',155,1),(7228,8,2,'2012-03-08','1990',155,1),(7229,9,2,'2012-04-11','1990',155,1),(7230,10,2,'2012-05-08','1990',155,1),(7231,11,2,'2012-06-08','1990',155,1),(7232,12,2,'2012-07-09','1990',155,1),(7233,13,2,'2012-08-08','1990',155,1),(7234,14,2,'2012-09-10','1990',155,1),(7235,15,2,'2012-10-08','1990',155,1),(7236,16,2,'2012-11-08','1990',155,1),(7237,17,2,'2012-12-10','1990',155,1),(7238,18,2,'2013-01-08','1990',155,1),(7239,19,2,'2013-02-08','1990',155,1),(7240,20,2,'2013-03-08','1990',155,1),(7241,21,2,'2013-04-08','1990',155,1),(7242,22,2,'2013-05-08','1990',155,1),(7243,23,2,'2013-06-10','1990',155,1),(7244,24,2,'2013-07-08','1990',155,1),(7245,25,2,'2013-08-08','1990',155,1),(7246,26,2,'2013-09-09','1990',155,1),(7247,27,2,'2013-10-08','1990',155,1),(7248,28,2,'2013-11-08','1990',155,1),(7249,29,2,'2013-12-09','1990',155,1),(7250,30,2,'2014-01-08','1990',155,1),(7251,31,2,'2014-02-10','1990',155,1),(7252,32,2,'2014-03-10','1990',155,1),(7253,33,2,'2014-04-08','1990',155,1),(7254,34,2,'2014-05-08','1990',155,1),(7255,35,2,'2014-06-09','1990',155,1),(7256,36,2,'2014-07-08','1990',155,1),(7257,37,2,'2014-08-08','1990',155,1),(7258,38,2,'2014-09-08','1990',155,1),(7259,39,2,'2014-10-08','1990',155,1),(7260,40,2,'2014-11-10','1990',155,1),(7261,41,2,'2014-12-08','1990',155,1),(7262,42,2,'2015-01-08','1990',155,1),(7263,43,2,'2015-02-09','1990',155,1),(7264,44,2,'2015-03-09','1990',155,1),(7265,45,2,'2015-04-08','1990',155,1),(7266,46,2,'2015-05-08','1990',155,1),(7267,47,2,'2015-06-08','1990',155,1),(7268,48,2,'2015-07-08','1990',155,1),(7269,1,2,'2011-08-31','1990',156,1),(7270,2,2,'2011-09-08','1990',156,1),(7271,3,2,'2011-10-10','1990',156,1),(7272,4,2,'2011-11-08','1990',156,1),(7273,5,2,'2011-12-08','1990',156,1),(7274,6,2,'2012-01-09','1990',156,1),(7275,7,2,'2012-02-08','1990',156,1),(7276,8,2,'2012-03-08','1990',156,1),(7277,9,2,'2012-04-11','1990',156,1),(7278,10,2,'2012-05-08','1990',156,1),(7279,11,2,'2012-06-08','1990',156,1),(7280,12,2,'2012-07-09','1990',156,1),(7281,13,2,'2012-08-08','1990',156,1),(7282,14,2,'2012-09-10','1990',156,1),(7283,15,2,'2012-10-08','1990',156,1),(7284,16,2,'2012-11-08','1990',156,1),(7285,17,2,'2012-12-10','1990',156,1),(7286,18,2,'2013-01-08','1990',156,1),(7287,19,2,'2013-02-08','1990',156,1),(7288,20,2,'2013-03-08','1990',156,1),(7289,21,2,'2013-04-08','1990',156,1),(7290,22,2,'2013-05-08','1990',156,1),(7291,23,2,'2013-06-10','1990',156,1),(7292,24,2,'2013-07-08','1990',156,1),(7293,25,2,'2013-08-08','1990',156,1),(7294,26,2,'2013-09-09','1990',156,1),(7295,27,2,'2013-10-08','1990',156,1),(7296,28,2,'2013-11-08','1990',156,1),(7297,29,2,'2013-12-09','1990',156,1),(7298,30,2,'2014-01-08','1990',156,1),(7299,31,2,'2014-02-10','1990',156,1),(7300,32,2,'2014-03-10','1990',156,1),(7301,33,2,'2014-04-08','1990',156,1),(7302,34,2,'2014-05-08','1990',156,1),(7303,35,2,'2014-06-09','1990',156,1),(7304,36,2,'2014-07-08','1990',156,1),(7305,37,2,'2014-08-08','1990',156,1),(7306,38,2,'2014-09-08','1990',156,1),(7307,39,2,'2014-10-08','1990',156,1),(7308,40,2,'2014-11-10','1990',156,1),(7309,41,2,'2014-12-08','1990',156,1),(7310,42,2,'2015-01-08','1990',156,1),(7311,43,2,'2015-02-09','1990',156,1),(7312,44,2,'2015-03-09','1990',156,1),(7313,45,2,'2015-04-08','1990',156,1),(7314,46,2,'2015-05-08','1990',156,1),(7315,47,2,'2015-06-08','1990',156,1),(7316,48,2,'2015-07-08','1990',156,1),(7317,1,2,'2011-08-31','1990',157,1),(7318,2,2,'2011-09-08','1990',157,1),(7319,3,2,'2011-10-10','1990',157,1),(7320,4,2,'2011-11-08','1990',157,1),(7321,5,2,'2011-12-08','1990',157,1),(7322,6,2,'2012-01-09','1990',157,1),(7323,7,2,'2012-02-08','1990',157,1),(7324,8,2,'2012-03-08','1990',157,1),(7325,9,2,'2012-04-11','1990',157,1),(7326,10,2,'2012-05-08','1990',157,1),(7327,11,2,'2012-06-08','1990',157,1),(7328,12,2,'2012-07-09','1990',157,1),(7329,13,2,'2012-08-08','1990',157,1),(7330,14,2,'2012-09-10','1990',157,1),(7331,15,2,'2012-10-08','1990',157,1),(7332,16,2,'2012-11-08','1990',157,1),(7333,17,2,'2012-12-10','1990',157,1),(7334,18,2,'2013-01-08','1990',157,1),(7335,19,2,'2013-02-08','1990',157,1),(7336,20,2,'2013-03-08','1990',157,1),(7337,21,2,'2013-04-08','1990',157,1),(7338,22,2,'2013-05-08','1990',157,1),(7339,23,2,'2013-06-10','1990',157,1),(7340,24,2,'2013-07-08','1990',157,1),(7341,25,2,'2013-08-08','1990',157,1),(7342,26,2,'2013-09-09','1990',157,1),(7343,27,2,'2013-10-08','1990',157,1),(7344,28,2,'2013-11-08','1990',157,1),(7345,29,2,'2013-12-09','1990',157,1),(7346,30,2,'2014-01-08','1990',157,1),(7347,31,2,'2014-02-10','1990',157,1),(7348,32,2,'2014-03-10','1990',157,1),(7349,33,2,'2014-04-08','1990',157,1),(7350,34,2,'2014-05-08','1990',157,1),(7351,35,2,'2014-06-09','1990',157,1),(7352,36,2,'2014-07-08','1990',157,1),(7353,37,2,'2014-08-08','1990',157,1),(7354,38,2,'2014-09-08','1990',157,1),(7355,39,2,'2014-10-08','1990',157,1),(7356,40,2,'2014-11-10','1990',157,1),(7357,41,2,'2014-12-08','1990',157,1),(7358,42,2,'2015-01-08','1990',157,1),(7359,43,2,'2015-02-09','1990',157,1),(7360,44,2,'2015-03-09','1990',157,1),(7361,45,2,'2015-04-08','1990',157,1),(7362,46,2,'2015-05-08','1990',157,1),(7363,47,2,'2015-06-08','1990',157,1),(7364,48,2,'2015-07-08','1990',157,1),(7365,1,2,'2011-08-31','1990',158,1),(7366,2,2,'2011-09-08','1990',158,1),(7367,3,2,'2011-10-10','1990',158,1),(7368,4,2,'2011-11-08','1990',158,1),(7369,5,2,'2011-12-08','1990',158,1),(7370,6,2,'2012-01-09','1990',158,1),(7371,7,2,'2012-02-08','1990',158,1),(7372,8,2,'2012-03-08','1990',158,1),(7373,9,2,'2012-04-11','1990',158,1),(7374,10,2,'2012-05-08','1990',158,1),(7375,11,2,'2012-06-08','1990',158,1),(7376,12,2,'2012-07-09','1990',158,1),(7377,13,2,'2012-08-08','1990',158,1),(7378,14,2,'2012-09-10','1990',158,1),(7379,15,2,'2012-10-08','1990',158,1),(7380,16,2,'2012-11-08','1990',158,1),(7381,17,2,'2012-12-10','1990',158,1),(7382,18,2,'2013-01-08','1990',158,1),(7383,19,2,'2013-02-08','1990',158,1),(7384,20,2,'2013-03-08','1990',158,1),(7385,21,2,'2013-04-08','1990',158,1),(7386,22,2,'2013-05-08','1990',158,1),(7387,23,2,'2013-06-10','1990',158,1),(7388,24,2,'2013-07-08','1990',158,1),(7389,25,2,'2013-08-08','1990',158,1),(7390,26,2,'2013-09-09','1990',158,1),(7391,27,2,'2013-10-08','1990',158,1),(7392,28,2,'2013-11-08','1990',158,1),(7393,29,2,'2013-12-09','1990',158,1),(7394,30,2,'2014-01-08','1990',158,1),(7395,31,2,'2014-02-10','1990',158,1),(7396,32,2,'2014-03-10','1990',158,1),(7397,33,2,'2014-04-08','1990',158,1),(7398,34,2,'2014-05-08','1990',158,1),(7399,35,2,'2014-06-09','1990',158,1),(7400,36,2,'2014-07-08','1990',158,1),(7401,37,2,'2014-08-08','1990',158,1),(7402,38,2,'2014-09-08','1990',158,1),(7403,39,2,'2014-10-08','1990',158,1),(7404,40,2,'2014-11-10','1990',158,1),(7405,41,2,'2014-12-08','1990',158,1),(7406,42,2,'2015-01-08','1990',158,1),(7407,43,2,'2015-02-09','1990',158,1),(7408,44,2,'2015-03-09','1990',158,1),(7409,45,2,'2015-04-08','1990',158,1),(7410,46,2,'2015-05-08','1990',158,1),(7411,47,2,'2015-06-08','1990',158,1),(7412,48,2,'2015-07-08','1990',158,1),(7413,1,2,'2011-08-31','1990',159,1),(7414,2,2,'2011-09-08','1990',159,1),(7415,3,2,'2011-10-10','1990',159,1),(7416,4,2,'2011-11-08','1990',159,1),(7417,5,2,'2011-12-08','1990',159,1),(7418,6,2,'2012-01-09','1990',159,1),(7419,7,2,'2012-02-08','1990',159,1),(7420,8,2,'2012-03-08','1990',159,1),(7421,9,2,'2012-04-11','1990',159,1),(7422,10,2,'2012-05-08','1990',159,1),(7423,11,2,'2012-06-08','1990',159,1),(7424,12,2,'2012-07-09','1990',159,1),(7425,13,2,'2012-08-08','1990',159,1),(7426,14,2,'2012-09-10','1990',159,1),(7427,15,2,'2012-10-08','1990',159,1),(7428,16,2,'2012-11-08','1990',159,1),(7429,17,2,'2012-12-10','1990',159,1),(7430,18,2,'2013-01-08','1990',159,1),(7431,19,2,'2013-02-08','1990',159,1),(7432,20,2,'2013-03-08','1990',159,1),(7433,21,2,'2013-04-08','1990',159,1),(7434,22,2,'2013-05-08','1990',159,1),(7435,23,2,'2013-06-10','1990',159,1),(7436,24,2,'2013-07-08','1990',159,1),(7437,25,2,'2013-08-08','1990',159,1),(7438,26,2,'2013-09-09','1990',159,1),(7439,27,2,'2013-10-08','1990',159,1),(7440,28,2,'2013-11-08','1990',159,1),(7441,29,2,'2013-12-09','1990',159,1),(7442,30,2,'2014-01-08','1990',159,1),(7443,31,2,'2014-02-10','1990',159,1),(7444,32,2,'2014-03-10','1990',159,1),(7445,33,2,'2014-04-08','1990',159,1),(7446,34,2,'2014-05-08','1990',159,1),(7447,35,2,'2014-06-09','1990',159,1),(7448,36,2,'2014-07-08','1990',159,1),(7449,37,2,'2014-08-08','1990',159,1),(7450,38,2,'2014-09-08','1990',159,1),(7451,39,2,'2014-10-08','1990',159,1),(7452,40,2,'2014-11-10','1990',159,1),(7453,41,2,'2014-12-08','1990',159,1),(7454,42,2,'2015-01-08','1990',159,1),(7455,43,2,'2015-02-09','1990',159,1),(7456,44,2,'2015-03-09','1990',159,1),(7457,45,2,'2015-04-08','1990',159,1),(7458,46,2,'2015-05-08','1990',159,1),(7459,47,2,'2015-06-08','1990',159,1),(7460,48,2,'2015-07-08','1990',159,1),(7461,1,2,'2011-08-31','1990',160,1),(7462,2,2,'2011-09-08','1990',160,1),(7463,3,2,'2011-10-10','1990',160,1),(7464,4,2,'2011-11-08','1990',160,1),(7465,5,2,'2011-12-08','1990',160,1),(7466,6,2,'2012-01-09','1990',160,1),(7467,7,2,'2012-02-08','1990',160,1),(7468,8,2,'2012-03-08','1990',160,1),(7469,9,2,'2012-04-11','1990',160,1),(7470,10,2,'2012-05-08','1990',160,1),(7471,11,2,'2012-06-08','1990',160,1),(7472,12,2,'2012-07-09','1990',160,1),(7473,13,2,'2012-08-08','1990',160,1),(7474,14,2,'2012-09-10','1990',160,1),(7475,15,2,'2012-10-08','1990',160,1),(7476,16,2,'2012-11-08','1990',160,1),(7477,17,2,'2012-12-10','1990',160,1),(7478,18,2,'2013-01-08','1990',160,1),(7479,19,2,'2013-02-08','1990',160,1),(7480,20,2,'2013-03-08','1990',160,1),(7481,21,2,'2013-04-08','1990',160,1),(7482,22,2,'2013-05-08','1990',160,1),(7483,23,2,'2013-06-10','1990',160,1),(7484,24,2,'2013-07-08','1990',160,1),(7485,25,2,'2013-08-08','1990',160,1),(7486,26,2,'2013-09-09','1990',160,1),(7487,27,2,'2013-10-08','1990',160,1),(7488,28,2,'2013-11-08','1990',160,1),(7489,29,2,'2013-12-09','1990',160,1),(7490,30,2,'2014-01-08','1990',160,1),(7491,31,2,'2014-02-10','1990',160,1),(7492,32,2,'2014-03-10','1990',160,1),(7493,33,2,'2014-04-08','1990',160,1),(7494,34,2,'2014-05-08','1990',160,1),(7495,35,2,'2014-06-09','1990',160,1),(7496,36,2,'2014-07-08','1990',160,1),(7497,37,2,'2014-08-08','1990',160,1),(7498,38,2,'2014-09-08','1990',160,1),(7499,39,2,'2014-10-08','1990',160,1),(7500,40,2,'2014-11-10','1990',160,1),(7501,41,2,'2014-12-08','1990',160,1),(7502,42,2,'2015-01-08','1990',160,1),(7503,43,2,'2015-02-09','1990',160,1),(7504,44,2,'2015-03-09','1990',160,1),(7505,45,2,'2015-04-08','1990',160,1),(7506,46,2,'2015-05-08','1990',160,1),(7507,47,2,'2015-06-08','1990',160,1),(7508,48,2,'2015-07-08','1990',160,1),(7509,1,2,'2011-08-31','1990',161,1),(7510,2,2,'2011-09-08','1990',161,1),(7511,3,2,'2011-10-10','1990',161,1),(7512,4,2,'2011-11-08','1990',161,1),(7513,5,2,'2011-12-08','1990',161,1),(7514,6,2,'2012-01-09','1990',161,1),(7515,7,2,'2012-02-08','1990',161,1),(7516,8,2,'2012-03-08','1990',161,1),(7517,9,2,'2012-04-11','1990',161,1),(7518,10,2,'2012-05-08','1990',161,1),(7519,11,2,'2012-06-08','1990',161,1),(7520,12,2,'2012-07-09','1990',161,1),(7521,13,2,'2012-08-08','1990',161,1),(7522,14,2,'2012-09-10','1990',161,1),(7523,15,2,'2012-10-08','1990',161,1),(7524,16,2,'2012-11-08','1990',161,1),(7525,17,2,'2012-12-10','1990',161,1),(7526,18,2,'2013-01-08','1990',161,1),(7527,19,2,'2013-02-08','1990',161,1),(7528,20,2,'2013-03-08','1990',161,1),(7529,21,2,'2013-04-08','1990',161,1),(7530,22,2,'2013-05-08','1990',161,1),(7531,23,2,'2013-06-10','1990',161,1),(7532,24,2,'2013-07-08','1990',161,1),(7533,25,2,'2013-08-08','1990',161,1),(7534,26,2,'2013-09-09','1990',161,1),(7535,27,2,'2013-10-08','1990',161,1),(7536,28,2,'2013-11-08','1990',161,1),(7537,29,2,'2013-12-09','1990',161,1),(7538,30,2,'2014-01-08','1990',161,1),(7539,31,2,'2014-02-10','1990',161,1),(7540,32,2,'2014-03-10','1990',161,1),(7541,33,2,'2014-04-08','1990',161,1),(7542,34,2,'2014-05-08','1990',161,1),(7543,35,2,'2014-06-09','1990',161,1),(7544,36,2,'2014-07-08','1990',161,1),(7545,37,2,'2014-08-08','1990',161,1),(7546,38,2,'2014-09-08','1990',161,1),(7547,39,2,'2014-10-08','1990',161,1),(7548,40,2,'2014-11-10','1990',161,1),(7549,41,2,'2014-12-08','1990',161,1),(7550,42,2,'2015-01-08','1990',161,1),(7551,43,2,'2015-02-09','1990',161,1),(7552,44,2,'2015-03-09','1990',161,1),(7553,45,2,'2015-04-08','1990',161,1),(7554,46,2,'2015-05-08','1990',161,1),(7555,47,2,'2015-06-08','1990',161,1),(7556,48,2,'2015-07-08','1990',161,1),(7557,1,2,'2011-08-31','1990',162,1),(7558,2,2,'2011-09-08','1990',162,1),(7559,3,2,'2011-10-10','1990',162,1),(7560,4,2,'2011-11-08','1990',162,1),(7561,5,2,'2011-12-08','1990',162,1),(7562,6,2,'2012-01-09','1990',162,1),(7563,7,2,'2012-02-08','1990',162,1),(7564,8,2,'2012-03-08','1990',162,1),(7565,9,2,'2012-04-11','1990',162,1),(7566,10,2,'2012-05-08','1990',162,1),(7567,11,2,'2012-06-08','1990',162,1),(7568,12,2,'2012-07-09','1990',162,1),(7569,13,2,'2012-08-08','1990',162,1),(7570,14,2,'2012-09-10','1990',162,1),(7571,15,2,'2012-10-08','1990',162,1),(7572,16,2,'2012-11-08','1990',162,1),(7573,17,2,'2012-12-10','1990',162,1),(7574,18,2,'2013-01-08','1990',162,1),(7575,19,2,'2013-02-08','1990',162,1),(7576,20,2,'2013-03-08','1990',162,1),(7577,21,2,'2013-04-08','1990',162,1),(7578,22,2,'2013-05-08','1990',162,1),(7579,23,2,'2013-06-10','1990',162,1),(7580,24,2,'2013-07-08','1990',162,1),(7581,25,2,'2013-08-08','1990',162,1),(7582,26,2,'2013-09-09','1990',162,1),(7583,27,2,'2013-10-08','1990',162,1),(7584,28,2,'2013-11-08','1990',162,1),(7585,29,2,'2013-12-09','1990',162,1),(7586,30,2,'2014-01-08','1990',162,1),(7587,31,2,'2014-02-10','1990',162,1),(7588,32,2,'2014-03-10','1990',162,1),(7589,33,2,'2014-04-08','1990',162,1),(7590,34,2,'2014-05-08','1990',162,1),(7591,35,2,'2014-06-09','1990',162,1),(7592,36,2,'2014-07-08','1990',162,1),(7593,37,2,'2014-08-08','1990',162,1),(7594,38,2,'2014-09-08','1990',162,1),(7595,39,2,'2014-10-08','1990',162,1),(7596,40,2,'2014-11-10','1990',162,1),(7597,41,2,'2014-12-08','1990',162,1),(7598,42,2,'2015-01-08','1990',162,1),(7599,43,2,'2015-02-09','1990',162,1),(7600,44,2,'2015-03-09','1990',162,1),(7601,45,2,'2015-04-08','1990',162,1),(7602,46,2,'2015-05-08','1990',162,1),(7603,47,2,'2015-06-08','1990',162,1),(7604,48,2,'2015-07-08','1990',162,1),(7605,1,2,'2011-08-31','1990',163,1),(7606,2,2,'2011-09-08','1990',163,1),(7607,3,2,'2011-10-10','1990',163,1),(7608,4,2,'2011-11-08','1990',163,1),(7609,5,2,'2011-12-08','1990',163,1),(7610,6,2,'2012-01-09','1990',163,1),(7611,7,2,'2012-02-08','1990',163,1),(7612,8,2,'2012-03-08','1990',163,1),(7613,9,2,'2012-04-11','1990',163,1),(7614,10,2,'2012-05-08','1990',163,1),(7615,11,2,'2012-06-08','1990',163,1),(7616,12,2,'2012-07-09','1990',163,1),(7617,13,2,'2012-08-08','1990',163,1),(7618,14,2,'2012-09-10','1990',163,1),(7619,15,2,'2012-10-08','1990',163,1),(7620,16,2,'2012-11-08','1990',163,1),(7621,17,2,'2012-12-10','1990',163,1),(7622,18,2,'2013-01-08','1990',163,1),(7623,19,2,'2013-02-08','1990',163,1),(7624,20,2,'2013-03-08','1990',163,1),(7625,21,2,'2013-04-08','1990',163,1),(7626,22,2,'2013-05-08','1990',163,1),(7627,23,2,'2013-06-10','1990',163,1),(7628,24,2,'2013-07-08','1990',163,1),(7629,25,2,'2013-08-08','1990',163,1),(7630,26,2,'2013-09-09','1990',163,1),(7631,27,2,'2013-10-08','1990',163,1),(7632,28,2,'2013-11-08','1990',163,1),(7633,29,2,'2013-12-09','1990',163,1),(7634,30,2,'2014-01-08','1990',163,1),(7635,31,2,'2014-02-10','1990',163,1),(7636,32,2,'2014-03-10','1990',163,1),(7637,33,2,'2014-04-08','1990',163,1),(7638,34,2,'2014-05-08','1990',163,1),(7639,35,2,'2014-06-09','1990',163,1),(7640,36,2,'2014-07-08','1990',163,1),(7641,37,2,'2014-08-08','1990',163,1),(7642,38,2,'2014-09-08','1990',163,1),(7643,39,2,'2014-10-08','1990',163,1),(7644,40,2,'2014-11-10','1990',163,1),(7645,41,2,'2014-12-08','1990',163,1),(7646,42,2,'2015-01-08','1990',163,1),(7647,43,2,'2015-02-09','1990',163,1),(7648,44,2,'2015-03-09','1990',163,1),(7649,45,2,'2015-04-08','1990',163,1),(7650,46,2,'2015-05-08','1990',163,1),(7651,47,2,'2015-06-08','1990',163,1),(7652,48,2,'2015-07-08','1990',163,1),(7653,1,2,'2011-08-31','1990',164,1),(7654,2,2,'2011-09-08','1990',164,1),(7655,3,2,'2011-10-10','1990',164,1),(7656,4,2,'2011-11-08','1990',164,1),(7657,5,2,'2011-12-08','1990',164,1),(7658,6,2,'2012-01-09','1990',164,1),(7659,7,2,'2012-02-08','1990',164,1),(7660,8,2,'2012-03-08','1990',164,1),(7661,9,2,'2012-04-11','1990',164,1),(7662,10,2,'2012-05-08','1990',164,1),(7663,11,2,'2012-06-08','1990',164,1),(7664,12,2,'2012-07-09','1990',164,1),(7665,13,2,'2012-08-08','1990',164,1),(7666,14,2,'2012-09-10','1990',164,1),(7667,15,2,'2012-10-08','1990',164,1),(7668,16,2,'2012-11-08','1990',164,1),(7669,17,2,'2012-12-10','1990',164,1),(7670,18,2,'2013-01-08','1990',164,1),(7671,19,2,'2013-02-08','1990',164,1),(7672,20,2,'2013-03-08','1990',164,1),(7673,21,2,'2013-04-08','1990',164,1),(7674,22,2,'2013-05-08','1990',164,1),(7675,23,2,'2013-06-10','1990',164,1),(7676,24,2,'2013-07-08','1990',164,1),(7677,25,2,'2013-08-08','1990',164,1),(7678,26,2,'2013-09-09','1990',164,1),(7679,27,2,'2013-10-08','1990',164,1),(7680,28,2,'2013-11-08','1990',164,1),(7681,29,2,'2013-12-09','1990',164,1),(7682,30,2,'2014-01-08','1990',164,1),(7683,31,2,'2014-02-10','1990',164,1),(7684,32,2,'2014-03-10','1990',164,1),(7685,33,2,'2014-04-08','1990',164,1),(7686,34,2,'2014-05-08','1990',164,1),(7687,35,2,'2014-06-09','1990',164,1),(7688,36,2,'2014-07-08','1990',164,1),(7689,37,2,'2014-08-08','1990',164,1),(7690,38,2,'2014-09-08','1990',164,1),(7691,39,2,'2014-10-08','1990',164,1),(7692,40,2,'2014-11-10','1990',164,1),(7693,41,2,'2014-12-08','1990',164,1),(7694,42,2,'2015-01-08','1990',164,1),(7695,43,2,'2015-02-09','1990',164,1),(7696,44,2,'2015-03-09','1990',164,1),(7697,45,2,'2015-04-08','1990',164,1),(7698,46,2,'2015-05-08','1990',164,1),(7699,47,2,'2015-06-08','1990',164,1),(7700,48,2,'2015-07-08','1990',164,1),(7701,1,2,'2011-08-31','1990',165,1),(7702,2,2,'2011-09-08','1990',165,1),(7703,3,2,'2011-10-10','1990',165,1),(7704,4,2,'2011-11-08','1990',165,1),(7705,5,2,'2011-12-08','1990',165,1),(7706,6,2,'2012-01-09','1990',165,1),(7707,7,2,'2012-02-08','1990',165,1),(7708,8,2,'2012-03-08','1990',165,1),(7709,9,2,'2012-04-11','1990',165,1),(7710,10,2,'2012-05-08','1990',165,1),(7711,11,2,'2012-06-08','1990',165,1),(7712,12,2,'2012-07-09','1990',165,1),(7713,13,2,'2012-08-08','1990',165,1),(7714,14,2,'2012-09-10','1990',165,1),(7715,15,2,'2012-10-08','1990',165,1),(7716,16,2,'2012-11-08','1990',165,1),(7717,17,2,'2012-12-10','1990',165,1),(7718,18,2,'2013-01-08','1990',165,1),(7719,19,2,'2013-02-08','1990',165,1),(7720,20,2,'2013-03-08','1990',165,1),(7721,21,2,'2013-04-08','1990',165,1),(7722,22,2,'2013-05-08','1990',165,1),(7723,23,2,'2013-06-10','1990',165,1),(7724,24,2,'2013-07-08','1990',165,1),(7725,25,2,'2013-08-08','1990',165,1),(7726,26,2,'2013-09-09','1990',165,1),(7727,27,2,'2013-10-08','1990',165,1),(7728,28,2,'2013-11-08','1990',165,1),(7729,29,2,'2013-12-09','1990',165,1),(7730,30,2,'2014-01-08','1990',165,1),(7731,31,2,'2014-02-10','1990',165,1),(7732,32,2,'2014-03-10','1990',165,1),(7733,33,2,'2014-04-08','1990',165,1),(7734,34,2,'2014-05-08','1990',165,1),(7735,35,2,'2014-06-09','1990',165,1),(7736,36,2,'2014-07-08','1990',165,1),(7737,37,2,'2014-08-08','1990',165,1),(7738,38,2,'2014-09-08','1990',165,1),(7739,39,2,'2014-10-08','1990',165,1),(7740,40,2,'2014-11-10','1990',165,1),(7741,41,2,'2014-12-08','1990',165,1),(7742,42,2,'2015-01-08','1990',165,1),(7743,43,2,'2015-02-09','1990',165,1),(7744,44,2,'2015-03-09','1990',165,1),(7745,45,2,'2015-04-08','1990',165,1),(7746,46,2,'2015-05-08','1990',165,1),(7747,47,2,'2015-06-08','1990',165,1),(7748,48,2,'2015-07-08','1990',165,1),(7749,1,2,'2011-08-31','1990',166,1),(7750,2,2,'2011-09-08','1990',166,1),(7751,3,2,'2011-10-10','1990',166,1),(7752,4,2,'2011-11-08','1990',166,1),(7753,5,2,'2011-12-08','1990',166,1),(7754,6,2,'2012-01-09','1990',166,1),(7755,7,2,'2012-02-08','1990',166,1),(7756,8,2,'2012-03-08','1990',166,1),(7757,9,2,'2012-04-11','1990',166,1),(7758,10,2,'2012-05-08','1990',166,1),(7759,11,2,'2012-06-08','1990',166,1),(7760,12,2,'2012-07-09','1990',166,1),(7761,13,2,'2012-08-08','1990',166,1),(7762,14,2,'2012-09-10','1990',166,1),(7763,15,2,'2012-10-08','1990',166,1),(7764,16,2,'2012-11-08','1990',166,1),(7765,17,2,'2012-12-10','1990',166,1),(7766,18,2,'2013-01-08','1990',166,1),(7767,19,2,'2013-02-08','1990',166,1),(7768,20,2,'2013-03-08','1990',166,1),(7769,21,2,'2013-04-08','1990',166,1),(7770,22,2,'2013-05-08','1990',166,1),(7771,23,2,'2013-06-10','1990',166,1),(7772,24,2,'2013-07-08','1990',166,1),(7773,25,2,'2013-08-08','1990',166,1),(7774,26,2,'2013-09-09','1990',166,1),(7775,27,2,'2013-10-08','1990',166,1),(7776,28,2,'2013-11-08','1990',166,1),(7777,29,2,'2013-12-09','1990',166,1),(7778,30,2,'2014-01-08','1990',166,1),(7779,31,2,'2014-02-10','1990',166,1),(7780,32,2,'2014-03-10','1990',166,1),(7781,33,2,'2014-04-08','1990',166,1),(7782,34,2,'2014-05-08','1990',166,1),(7783,35,2,'2014-06-09','1990',166,1),(7784,36,2,'2014-07-08','1990',166,1),(7785,37,2,'2014-08-08','1990',166,1),(7786,38,2,'2014-09-08','1990',166,1),(7787,39,2,'2014-10-08','1990',166,1),(7788,40,2,'2014-11-10','1990',166,1),(7789,41,2,'2014-12-08','1990',166,1),(7790,42,2,'2015-01-08','1990',166,1),(7791,43,2,'2015-02-09','1990',166,1),(7792,44,2,'2015-03-09','1990',166,1),(7793,45,2,'2015-04-08','1990',166,1),(7794,46,2,'2015-05-08','1990',166,1),(7795,47,2,'2015-06-08','1990',166,1),(7796,48,2,'2015-07-08','1990',166,1),(7797,1,2,'2011-08-31','1990',167,1),(7798,2,2,'2011-09-08','1990',167,1),(7799,3,2,'2011-10-10','1990',167,1),(7800,4,2,'2011-11-08','1990',167,1),(7801,5,2,'2011-12-08','1990',167,1),(7802,6,2,'2012-01-09','1990',167,1),(7803,7,2,'2012-02-08','1990',167,1),(7804,8,2,'2012-03-08','1990',167,1),(7805,9,2,'2012-04-11','1990',167,1),(7806,10,2,'2012-05-08','1990',167,1),(7807,11,2,'2012-06-08','1990',167,1),(7808,12,2,'2012-07-09','1990',167,1),(7809,13,2,'2012-08-08','1990',167,1),(7810,14,2,'2012-09-10','1990',167,1),(7811,15,2,'2012-10-08','1990',167,1),(7812,16,2,'2012-11-08','1990',167,1),(7813,17,2,'2012-12-10','1990',167,1),(7814,18,2,'2013-01-08','1990',167,1),(7815,19,2,'2013-02-08','1990',167,1),(7816,20,2,'2013-03-08','1990',167,1),(7817,21,2,'2013-04-08','1990',167,1),(7818,22,2,'2013-05-08','1990',167,1),(7819,23,2,'2013-06-10','1990',167,1),(7820,24,2,'2013-07-08','1990',167,1),(7821,25,2,'2013-08-08','1990',167,1),(7822,26,2,'2013-09-09','1990',167,1),(7823,27,2,'2013-10-08','1990',167,1),(7824,28,2,'2013-11-08','1990',167,1),(7825,29,2,'2013-12-09','1990',167,1),(7826,30,2,'2014-01-08','1990',167,1),(7827,31,2,'2014-02-10','1990',167,1),(7828,32,2,'2014-03-10','1990',167,1),(7829,33,2,'2014-04-08','1990',167,1),(7830,34,2,'2014-05-08','1990',167,1),(7831,35,2,'2014-06-09','1990',167,1),(7832,36,2,'2014-07-08','1990',167,1),(7833,37,2,'2014-08-08','1990',167,1),(7834,38,2,'2014-09-08','1990',167,1),(7835,39,2,'2014-10-08','1990',167,1),(7836,40,2,'2014-11-10','1990',167,1),(7837,41,2,'2014-12-08','1990',167,1),(7838,42,2,'2015-01-08','1990',167,1),(7839,43,2,'2015-02-09','1990',167,1),(7840,44,2,'2015-03-09','1990',167,1),(7841,45,2,'2015-04-08','1990',167,1),(7842,46,2,'2015-05-08','1990',167,1),(7843,47,2,'2015-06-08','1990',167,1),(7844,48,2,'2015-07-08','1990',167,1),(7845,1,2,'2011-08-31','1990',168,1),(7846,2,2,'2011-09-08','1990',168,1),(7847,3,2,'2011-10-10','1990',168,1),(7848,4,2,'2011-11-08','1990',168,1),(7849,5,2,'2011-12-08','1990',168,1),(7850,6,2,'2012-01-09','1990',168,1),(7851,7,2,'2012-02-08','1990',168,1),(7852,8,2,'2012-03-08','1990',168,1),(7853,9,2,'2012-04-11','1990',168,1),(7854,10,2,'2012-05-08','1990',168,1),(7855,11,2,'2012-06-08','1990',168,1),(7856,12,2,'2012-07-09','1990',168,1),(7857,13,2,'2012-08-08','1990',168,1),(7858,14,2,'2012-09-10','1990',168,1),(7859,15,2,'2012-10-08','1990',168,1),(7860,16,2,'2012-11-08','1990',168,1),(7861,17,2,'2012-12-10','1990',168,1),(7862,18,2,'2013-01-08','1990',168,1),(7863,19,2,'2013-02-08','1990',168,1),(7864,20,2,'2013-03-08','1990',168,1),(7865,21,2,'2013-04-08','1990',168,1),(7866,22,2,'2013-05-08','1990',168,1),(7867,23,2,'2013-06-10','1990',168,1),(7868,24,2,'2013-07-08','1990',168,1),(7869,25,2,'2013-08-08','1990',168,1),(7870,26,2,'2013-09-09','1990',168,1),(7871,27,2,'2013-10-08','1990',168,1),(7872,28,2,'2013-11-08','1990',168,1),(7873,29,2,'2013-12-09','1990',168,1),(7874,30,2,'2014-01-08','1990',168,1),(7875,31,2,'2014-02-10','1990',168,1),(7876,32,2,'2014-03-10','1990',168,1),(7877,33,2,'2014-04-08','1990',168,1),(7878,34,2,'2014-05-08','1990',168,1),(7879,35,2,'2014-06-09','1990',168,1),(7880,36,2,'2014-07-08','1990',168,1),(7881,37,2,'2014-08-08','1990',168,1),(7882,38,2,'2014-09-08','1990',168,1),(7883,39,2,'2014-10-08','1990',168,1),(7884,40,2,'2014-11-10','1990',168,1),(7885,41,2,'2014-12-08','1990',168,1),(7886,42,2,'2015-01-08','1990',168,1),(7887,43,2,'2015-02-09','1990',168,1),(7888,44,2,'2015-03-09','1990',168,1),(7889,45,2,'2015-04-08','1990',168,1),(7890,46,2,'2015-05-08','1990',168,1),(7891,47,2,'2015-06-08','1990',168,1),(7892,48,2,'2015-07-08','1990',168,1),(7893,1,2,'2011-08-31','1990',169,1),(7894,2,2,'2011-09-08','1990',169,1),(7895,3,2,'2011-10-10','1990',169,1),(7896,4,2,'2011-11-08','1990',169,1),(7897,5,2,'2011-12-08','1990',169,1),(7898,6,2,'2012-01-09','1990',169,1),(7899,7,2,'2012-02-08','1990',169,1),(7900,8,2,'2012-03-08','1990',169,1),(7901,9,2,'2012-04-11','1990',169,1),(7902,10,2,'2012-05-08','1990',169,1),(7903,11,2,'2012-06-08','1990',169,1),(7904,12,2,'2012-07-09','1990',169,1),(7905,13,2,'2012-08-08','1990',169,1),(7906,14,2,'2012-09-10','1990',169,1),(7907,15,2,'2012-10-08','1990',169,1),(7908,16,2,'2012-11-08','1990',169,1),(7909,17,2,'2012-12-10','1990',169,1),(7910,18,2,'2013-01-08','1990',169,1),(7911,19,2,'2013-02-08','1990',169,1),(7912,20,2,'2013-03-08','1990',169,1),(7913,21,2,'2013-04-08','1990',169,1),(7914,22,2,'2013-05-08','1990',169,1),(7915,23,2,'2013-06-10','1990',169,1),(7916,24,2,'2013-07-08','1990',169,1),(7917,25,2,'2013-08-08','1990',169,1),(7918,26,2,'2013-09-09','1990',169,1),(7919,27,2,'2013-10-08','1990',169,1),(7920,28,2,'2013-11-08','1990',169,1),(7921,29,2,'2013-12-09','1990',169,1),(7922,30,2,'2014-01-08','1990',169,1),(7923,31,2,'2014-02-10','1990',169,1),(7924,32,2,'2014-03-10','1990',169,1),(7925,33,2,'2014-04-08','1990',169,1),(7926,34,2,'2014-05-08','1990',169,1),(7927,35,2,'2014-06-09','1990',169,1),(7928,36,2,'2014-07-08','1990',169,1),(7929,37,2,'2014-08-08','1990',169,1),(7930,38,2,'2014-09-08','1990',169,1),(7931,39,2,'2014-10-08','1990',169,1),(7932,40,2,'2014-11-10','1990',169,1),(7933,41,2,'2014-12-08','1990',169,1),(7934,42,2,'2015-01-08','1990',169,1),(7935,43,2,'2015-02-09','1990',169,1),(7936,44,2,'2015-03-09','1990',169,1),(7937,45,2,'2015-04-08','1990',169,1),(7938,46,2,'2015-05-08','1990',169,1),(7939,47,2,'2015-06-08','1990',169,1),(7940,48,2,'2015-07-08','1990',169,1),(7941,1,2,'2011-08-31','1990',170,1),(7942,2,2,'2011-09-08','1990',170,1),(7943,3,2,'2011-10-10','1990',170,1),(7944,4,2,'2011-11-08','1990',170,1),(7945,5,2,'2011-12-08','1990',170,1),(7946,6,2,'2012-01-09','1990',170,1),(7947,7,2,'2012-02-08','1990',170,1),(7948,8,2,'2012-03-08','1990',170,1),(7949,9,2,'2012-04-11','1990',170,1),(7950,10,2,'2012-05-08','1990',170,1),(7951,11,2,'2012-06-08','1990',170,1),(7952,12,2,'2012-07-09','1990',170,1),(7953,13,2,'2012-08-08','1990',170,1),(7954,14,2,'2012-09-10','1990',170,1),(7955,15,2,'2012-10-08','1990',170,1),(7956,16,2,'2012-11-08','1990',170,1),(7957,17,2,'2012-12-10','1990',170,1),(7958,18,2,'2013-01-08','1990',170,1),(7959,19,2,'2013-02-08','1990',170,1),(7960,20,2,'2013-03-08','1990',170,1),(7961,21,2,'2013-04-08','1990',170,1),(7962,22,2,'2013-05-08','1990',170,1),(7963,23,2,'2013-06-10','1990',170,1),(7964,24,2,'2013-07-08','1990',170,1),(7965,25,2,'2013-08-08','1990',170,1),(7966,26,2,'2013-09-09','1990',170,1),(7967,27,2,'2013-10-08','1990',170,1),(7968,28,2,'2013-11-08','1990',170,1),(7969,29,2,'2013-12-09','1990',170,1),(7970,30,2,'2014-01-08','1990',170,1),(7971,31,2,'2014-02-10','1990',170,1),(7972,32,2,'2014-03-10','1990',170,1),(7973,33,2,'2014-04-08','1990',170,1),(7974,34,2,'2014-05-08','1990',170,1),(7975,35,2,'2014-06-09','1990',170,1),(7976,36,2,'2014-07-08','1990',170,1),(7977,37,2,'2014-08-08','1990',170,1),(7978,38,2,'2014-09-08','1990',170,1),(7979,39,2,'2014-10-08','1990',170,1),(7980,40,2,'2014-11-10','1990',170,1),(7981,41,2,'2014-12-08','1990',170,1),(7982,42,2,'2015-01-08','1990',170,1),(7983,43,2,'2015-02-09','1990',170,1),(7984,44,2,'2015-03-09','1990',170,1),(7985,45,2,'2015-04-08','1990',170,1),(7986,46,2,'2015-05-08','1990',170,1),(7987,47,2,'2015-06-08','1990',170,1),(7988,48,2,'2015-07-08','1990',170,1),(7989,1,2,'2011-08-31','1990',171,1),(7990,2,2,'2011-09-08','1990',171,1),(7991,3,2,'2011-10-10','1990',171,1),(7992,4,2,'2011-11-08','1990',171,1),(7993,5,2,'2011-12-08','1990',171,1),(7994,6,2,'2012-01-09','1990',171,1),(7995,7,2,'2012-02-08','1990',171,1),(7996,8,2,'2012-03-08','1990',171,1),(7997,9,2,'2012-04-11','1990',171,1),(7998,10,2,'2012-05-08','1990',171,1),(7999,11,2,'2012-06-08','1990',171,1),(8000,12,2,'2012-07-09','1990',171,1),(8001,13,2,'2012-08-08','1990',171,1),(8002,14,2,'2012-09-10','1990',171,1),(8003,15,2,'2012-10-08','1990',171,1),(8004,16,2,'2012-11-08','1990',171,1),(8005,17,2,'2012-12-10','1990',171,1),(8006,18,2,'2013-01-08','1990',171,1),(8007,19,2,'2013-02-08','1990',171,1),(8008,20,2,'2013-03-08','1990',171,1),(8009,21,2,'2013-04-08','1990',171,1),(8010,22,2,'2013-05-08','1990',171,1),(8011,23,2,'2013-06-10','1990',171,1),(8012,24,2,'2013-07-08','1990',171,1),(8013,25,2,'2013-08-08','1990',171,1),(8014,26,2,'2013-09-09','1990',171,1),(8015,27,2,'2013-10-08','1990',171,1),(8016,28,2,'2013-11-08','1990',171,1),(8017,29,2,'2013-12-09','1990',171,1),(8018,30,2,'2014-01-08','1990',171,1),(8019,31,2,'2014-02-10','1990',171,1),(8020,32,2,'2014-03-10','1990',171,1),(8021,33,2,'2014-04-08','1990',171,1),(8022,34,2,'2014-05-08','1990',171,1),(8023,35,2,'2014-06-09','1990',171,1),(8024,36,2,'2014-07-08','1990',171,1),(8025,37,2,'2014-08-08','1990',171,1),(8026,38,2,'2014-09-08','1990',171,1),(8027,39,2,'2014-10-08','1990',171,1),(8028,40,2,'2014-11-10','1990',171,1),(8029,41,2,'2014-12-08','1990',171,1),(8030,42,2,'2015-01-08','1990',171,1),(8031,43,2,'2015-02-09','1990',171,1),(8032,44,2,'2015-03-09','1990',171,1),(8033,45,2,'2015-04-08','1990',171,1),(8034,46,2,'2015-05-08','1990',171,1),(8035,47,2,'2015-06-08','1990',171,1),(8036,48,2,'2015-07-08','1990',171,1),(8037,1,2,'2011-08-31','1990',172,1),(8038,2,2,'2011-09-08','1990',172,1),(8039,3,2,'2011-10-10','1990',172,1),(8040,4,2,'2011-11-08','1990',172,1),(8041,5,2,'2011-12-08','1990',172,1),(8042,6,2,'2012-01-09','1990',172,1),(8043,7,2,'2012-02-08','1990',172,1),(8044,8,2,'2012-03-08','1990',172,1),(8045,9,2,'2012-04-11','1990',172,1),(8046,10,2,'2012-05-08','1990',172,1),(8047,11,2,'2012-06-08','1990',172,1),(8048,12,2,'2012-07-09','1990',172,1),(8049,13,2,'2012-08-08','1990',172,1),(8050,14,2,'2012-09-10','1990',172,1),(8051,15,2,'2012-10-08','1990',172,1),(8052,16,2,'2012-11-08','1990',172,1),(8053,17,2,'2012-12-10','1990',172,1),(8054,18,2,'2013-01-08','1990',172,1),(8055,19,2,'2013-02-08','1990',172,1),(8056,20,2,'2013-03-08','1990',172,1),(8057,21,2,'2013-04-08','1990',172,1),(8058,22,2,'2013-05-08','1990',172,1),(8059,23,2,'2013-06-10','1990',172,1),(8060,24,2,'2013-07-08','1990',172,1),(8061,25,2,'2013-08-08','1990',172,1),(8062,26,2,'2013-09-09','1990',172,1),(8063,27,2,'2013-10-08','1990',172,1),(8064,28,2,'2013-11-08','1990',172,1),(8065,29,2,'2013-12-09','1990',172,1),(8066,30,2,'2014-01-08','1990',172,1),(8067,31,2,'2014-02-10','1990',172,1),(8068,32,2,'2014-03-10','1990',172,1),(8069,33,2,'2014-04-08','1990',172,1),(8070,34,2,'2014-05-08','1990',172,1),(8071,35,2,'2014-06-09','1990',172,1),(8072,36,2,'2014-07-08','1990',172,1),(8073,37,2,'2014-08-08','1990',172,1),(8074,38,2,'2014-09-08','1990',172,1),(8075,39,2,'2014-10-08','1990',172,1),(8076,40,2,'2014-11-10','1990',172,1),(8077,41,2,'2014-12-08','1990',172,1),(8078,42,2,'2015-01-08','1990',172,1),(8079,43,2,'2015-02-09','1990',172,1),(8080,44,2,'2015-03-09','1990',172,1),(8081,45,2,'2015-04-08','1990',172,1),(8082,46,2,'2015-05-08','1990',172,1),(8083,47,2,'2015-06-08','1990',172,1),(8084,48,2,'2015-07-08','1990',172,1),(8085,1,2,'2011-08-31','1990',173,1),(8086,2,2,'2011-09-08','1990',173,1),(8087,3,2,'2011-10-10','1990',173,1),(8088,4,2,'2011-11-08','1990',173,1),(8089,5,2,'2011-12-08','1990',173,1),(8090,6,2,'2012-01-09','1990',173,1),(8091,7,2,'2012-02-08','1990',173,1),(8092,8,2,'2012-03-08','1990',173,1),(8093,9,2,'2012-04-11','1990',173,1),(8094,10,2,'2012-05-08','1990',173,1),(8095,11,2,'2012-06-08','1990',173,1),(8096,12,2,'2012-07-09','1990',173,1),(8097,13,2,'2012-08-08','1990',173,1),(8098,14,2,'2012-09-10','1990',173,1),(8099,15,2,'2012-10-08','1990',173,1),(8100,16,2,'2012-11-08','1990',173,1),(8101,17,2,'2012-12-10','1990',173,1),(8102,18,2,'2013-01-08','1990',173,1),(8103,19,2,'2013-02-08','1990',173,1),(8104,20,2,'2013-03-08','1990',173,1),(8105,21,2,'2013-04-08','1990',173,1),(8106,22,2,'2013-05-08','1990',173,1),(8107,23,2,'2013-06-10','1990',173,1),(8108,24,2,'2013-07-08','1990',173,1),(8109,25,2,'2013-08-08','1990',173,1),(8110,26,2,'2013-09-09','1990',173,1),(8111,27,2,'2013-10-08','1990',173,1),(8112,28,2,'2013-11-08','1990',173,1),(8113,29,2,'2013-12-09','1990',173,1),(8114,30,2,'2014-01-08','1990',173,1),(8115,31,2,'2014-02-10','1990',173,1),(8116,32,2,'2014-03-10','1990',173,1),(8117,33,2,'2014-04-08','1990',173,1),(8118,34,2,'2014-05-08','1990',173,1),(8119,35,2,'2014-06-09','1990',173,1),(8120,36,2,'2014-07-08','1990',173,1),(8121,37,2,'2014-08-08','1990',173,1),(8122,38,2,'2014-09-08','1990',173,1),(8123,39,2,'2014-10-08','1990',173,1),(8124,40,2,'2014-11-10','1990',173,1),(8125,41,2,'2014-12-08','1990',173,1),(8126,42,2,'2015-01-08','1990',173,1),(8127,43,2,'2015-02-09','1990',173,1),(8128,44,2,'2015-03-09','1990',173,1),(8129,45,2,'2015-04-08','1990',173,1),(8130,46,2,'2015-05-08','1990',173,1),(8131,47,2,'2015-06-08','1990',173,1),(8132,48,2,'2015-07-08','1990',173,1),(8133,1,2,'2011-08-31','1990',174,1),(8134,2,2,'2011-09-08','1990',174,1),(8135,3,2,'2011-10-10','1990',174,1),(8136,4,2,'2011-11-08','1990',174,1),(8137,5,2,'2011-12-08','1990',174,1),(8138,6,2,'2012-01-09','1990',174,1),(8139,7,2,'2012-02-08','1990',174,1),(8140,8,2,'2012-03-08','1990',174,1),(8141,9,2,'2012-04-11','1990',174,1),(8142,10,2,'2012-05-08','1990',174,1),(8143,11,2,'2012-06-08','1990',174,1),(8144,12,2,'2012-07-09','1990',174,1),(8145,13,2,'2012-08-08','1990',174,1),(8146,14,2,'2012-09-10','1990',174,1),(8147,15,2,'2012-10-08','1990',174,1),(8148,16,2,'2012-11-08','1990',174,1),(8149,17,2,'2012-12-10','1990',174,1),(8150,18,2,'2013-01-08','1990',174,1),(8151,19,2,'2013-02-08','1990',174,1),(8152,20,2,'2013-03-08','1990',174,1),(8153,21,2,'2013-04-08','1990',174,1),(8154,22,2,'2013-05-08','1990',174,1),(8155,23,2,'2013-06-10','1990',174,1),(8156,24,2,'2013-07-08','1990',174,1),(8157,25,2,'2013-08-08','1990',174,1),(8158,26,2,'2013-09-09','1990',174,1),(8159,27,2,'2013-10-08','1990',174,1),(8160,28,2,'2013-11-08','1990',174,1),(8161,29,2,'2013-12-09','1990',174,1),(8162,30,2,'2014-01-08','1990',174,1),(8163,31,2,'2014-02-10','1990',174,1),(8164,32,2,'2014-03-10','1990',174,1),(8165,33,2,'2014-04-08','1990',174,1),(8166,34,2,'2014-05-08','1990',174,1),(8167,35,2,'2014-06-09','1990',174,1),(8168,36,2,'2014-07-08','1990',174,1),(8169,37,2,'2014-08-08','1990',174,1),(8170,38,2,'2014-09-08','1990',174,1),(8171,39,2,'2014-10-08','1990',174,1),(8172,40,2,'2014-11-10','1990',174,1),(8173,41,2,'2014-12-08','1990',174,1),(8174,42,2,'2015-01-08','1990',174,1),(8175,43,2,'2015-02-09','1990',174,1),(8176,44,2,'2015-03-09','1990',174,1),(8177,45,2,'2015-04-08','1990',174,1),(8178,46,2,'2015-05-08','1990',174,1),(8179,47,2,'2015-06-08','1990',174,1),(8180,48,2,'2015-07-08','1990',174,1),(8181,1,2,'2011-08-31','1990',175,1),(8182,2,2,'2011-09-08','1990',175,1),(8183,3,2,'2011-10-10','1990',175,1),(8184,4,2,'2011-11-08','1990',175,1),(8185,5,2,'2011-12-08','1990',175,1),(8186,6,2,'2012-01-09','1990',175,1),(8187,7,2,'2012-02-08','1990',175,1),(8188,8,2,'2012-03-08','1990',175,1),(8189,9,2,'2012-04-11','1990',175,1),(8190,10,2,'2012-05-08','1990',175,1),(8191,11,2,'2012-06-08','1990',175,1),(8192,12,2,'2012-07-09','1990',175,1),(8193,13,2,'2012-08-08','1990',175,1),(8194,14,2,'2012-09-10','1990',175,1),(8195,15,2,'2012-10-08','1990',175,1),(8196,16,2,'2012-11-08','1990',175,1),(8197,17,2,'2012-12-10','1990',175,1),(8198,18,2,'2013-01-08','1990',175,1),(8199,19,2,'2013-02-08','1990',175,1),(8200,20,2,'2013-03-08','1990',175,1),(8201,21,2,'2013-04-08','1990',175,1),(8202,22,2,'2013-05-08','1990',175,1),(8203,23,2,'2013-06-10','1990',175,1),(8204,24,2,'2013-07-08','1990',175,1),(8205,25,2,'2013-08-08','1990',175,1),(8206,26,2,'2013-09-09','1990',175,1),(8207,27,2,'2013-10-08','1990',175,1),(8208,28,2,'2013-11-08','1990',175,1),(8209,29,2,'2013-12-09','1990',175,1),(8210,30,2,'2014-01-08','1990',175,1),(8211,31,2,'2014-02-10','1990',175,1),(8212,32,2,'2014-03-10','1990',175,1),(8213,33,2,'2014-04-08','1990',175,1),(8214,34,2,'2014-05-08','1990',175,1),(8215,35,2,'2014-06-09','1990',175,1),(8216,36,2,'2014-07-08','1990',175,1),(8217,37,2,'2014-08-08','1990',175,1),(8218,38,2,'2014-09-08','1990',175,1),(8219,39,2,'2014-10-08','1990',175,1),(8220,40,2,'2014-11-10','1990',175,1),(8221,41,2,'2014-12-08','1990',175,1),(8222,42,2,'2015-01-08','1990',175,1),(8223,43,2,'2015-02-09','1990',175,1),(8224,44,2,'2015-03-09','1990',175,1),(8225,45,2,'2015-04-08','1990',175,1),(8226,46,2,'2015-05-08','1990',175,1),(8227,47,2,'2015-06-08','1990',175,1),(8228,48,2,'2015-07-08','1990',175,1),(8229,1,2,'2011-08-31','1990',176,1),(8230,2,2,'2011-09-08','1990',176,1),(8231,3,2,'2011-10-10','1990',176,1),(8232,4,2,'2011-11-08','1990',176,1),(8233,5,2,'2011-12-08','1990',176,1),(8234,6,2,'2012-01-09','1990',176,1),(8235,7,2,'2012-02-08','1990',176,1),(8236,8,2,'2012-03-08','1990',176,1),(8237,9,2,'2012-04-11','1990',176,1),(8238,10,2,'2012-05-08','1990',176,1),(8239,11,2,'2012-06-08','1990',176,1),(8240,12,2,'2012-07-09','1990',176,1),(8241,13,2,'2012-08-08','1990',176,1),(8242,14,2,'2012-09-10','1990',176,1),(8243,15,2,'2012-10-08','1990',176,1),(8244,16,2,'2012-11-08','1990',176,1),(8245,17,2,'2012-12-10','1990',176,1),(8246,18,2,'2013-01-08','1990',176,1),(8247,19,2,'2013-02-08','1990',176,1),(8248,20,2,'2013-03-08','1990',176,1),(8249,21,2,'2013-04-08','1990',176,1),(8250,22,2,'2013-05-08','1990',176,1),(8251,23,2,'2013-06-10','1990',176,1),(8252,24,2,'2013-07-08','1990',176,1),(8253,25,2,'2013-08-08','1990',176,1),(8254,26,2,'2013-09-09','1990',176,1),(8255,27,2,'2013-10-08','1990',176,1),(8256,28,2,'2013-11-08','1990',176,1),(8257,29,2,'2013-12-09','1990',176,1),(8258,30,2,'2014-01-08','1990',176,1),(8259,31,2,'2014-02-10','1990',176,1),(8260,32,2,'2014-03-10','1990',176,1),(8261,33,2,'2014-04-08','1990',176,1),(8262,34,2,'2014-05-08','1990',176,1),(8263,35,2,'2014-06-09','1990',176,1),(8264,36,2,'2014-07-08','1990',176,1),(8265,37,2,'2014-08-08','1990',176,1),(8266,38,2,'2014-09-08','1990',176,1),(8267,39,2,'2014-10-08','1990',176,1),(8268,40,2,'2014-11-10','1990',176,1),(8269,41,2,'2014-12-08','1990',176,1),(8270,42,2,'2015-01-08','1990',176,1),(8271,43,2,'2015-02-09','1990',176,1),(8272,44,2,'2015-03-09','1990',176,1),(8273,45,2,'2015-04-08','1990',176,1),(8274,46,2,'2015-05-08','1990',176,1),(8275,47,2,'2015-06-08','1990',176,1),(8276,48,2,'2015-07-08','1990',176,1),(8277,1,2,'2011-08-31','1990',177,1),(8278,2,2,'2011-09-08','1990',177,1),(8279,3,2,'2011-10-10','1990',177,1),(8280,4,2,'2011-11-08','1990',177,1),(8281,5,2,'2011-12-08','1990',177,1),(8282,6,2,'2012-01-09','1990',177,1),(8283,7,2,'2012-02-08','1990',177,1),(8284,8,2,'2012-03-08','1990',177,1),(8285,9,2,'2012-04-11','1990',177,1),(8286,10,2,'2012-05-08','1990',177,1),(8287,11,2,'2012-06-08','1990',177,1),(8288,12,2,'2012-07-09','1990',177,1),(8289,13,2,'2012-08-08','1990',177,1),(8290,14,2,'2012-09-10','1990',177,1),(8291,15,2,'2012-10-08','1990',177,1),(8292,16,2,'2012-11-08','1990',177,1),(8293,17,2,'2012-12-10','1990',177,1),(8294,18,2,'2013-01-08','1990',177,1),(8295,19,2,'2013-02-08','1990',177,1),(8296,20,2,'2013-03-08','1990',177,1),(8297,21,2,'2013-04-08','1990',177,1),(8298,22,2,'2013-05-08','1990',177,1),(8299,23,2,'2013-06-10','1990',177,1),(8300,24,2,'2013-07-08','1990',177,1),(8301,25,2,'2013-08-08','1990',177,1),(8302,26,2,'2013-09-09','1990',177,1),(8303,27,2,'2013-10-08','1990',177,1),(8304,28,2,'2013-11-08','1990',177,1),(8305,29,2,'2013-12-09','1990',177,1),(8306,30,2,'2014-01-08','1990',177,1),(8307,31,2,'2014-02-10','1990',177,1),(8308,32,2,'2014-03-10','1990',177,1),(8309,33,2,'2014-04-08','1990',177,1),(8310,34,2,'2014-05-08','1990',177,1),(8311,35,2,'2014-06-09','1990',177,1),(8312,36,2,'2014-07-08','1990',177,1),(8313,37,2,'2014-08-08','1990',177,1),(8314,38,2,'2014-09-08','1990',177,1),(8315,39,2,'2014-10-08','1990',177,1),(8316,40,2,'2014-11-10','1990',177,1),(8317,41,2,'2014-12-08','1990',177,1),(8318,42,2,'2015-01-08','1990',177,1),(8319,43,2,'2015-02-09','1990',177,1),(8320,44,2,'2015-03-09','1990',177,1),(8321,45,2,'2015-04-08','1990',177,1),(8322,46,2,'2015-05-08','1990',177,1),(8323,47,2,'2015-06-08','1990',177,1),(8324,48,2,'2015-07-08','1990',177,1),(8325,1,2,'2011-08-31','1990',178,1),(8326,2,2,'2011-09-08','1990',178,1),(8327,3,2,'2011-10-10','1990',178,1),(8328,4,2,'2011-11-08','1990',178,1),(8329,5,2,'2011-12-08','1990',178,1),(8330,6,2,'2012-01-09','1990',178,1),(8331,7,2,'2012-02-08','1990',178,1),(8332,8,2,'2012-03-08','1990',178,1),(8333,9,2,'2012-04-11','1990',178,1),(8334,10,2,'2012-05-08','1990',178,1),(8335,11,2,'2012-06-08','1990',178,1),(8336,12,2,'2012-07-09','1990',178,1),(8337,13,2,'2012-08-08','1990',178,1),(8338,14,2,'2012-09-10','1990',178,1),(8339,15,2,'2012-10-08','1990',178,1),(8340,16,2,'2012-11-08','1990',178,1),(8341,17,2,'2012-12-10','1990',178,1),(8342,18,2,'2013-01-08','1990',178,1),(8343,19,2,'2013-02-08','1990',178,1),(8344,20,2,'2013-03-08','1990',178,1),(8345,21,2,'2013-04-08','1990',178,1),(8346,22,2,'2013-05-08','1990',178,1),(8347,23,2,'2013-06-10','1990',178,1),(8348,24,2,'2013-07-08','1990',178,1),(8349,25,2,'2013-08-08','1990',178,1),(8350,26,2,'2013-09-09','1990',178,1),(8351,27,2,'2013-10-08','1990',178,1),(8352,28,2,'2013-11-08','1990',178,1),(8353,29,2,'2013-12-09','1990',178,1),(8354,30,2,'2014-01-08','1990',178,1),(8355,31,2,'2014-02-10','1990',178,1),(8356,32,2,'2014-03-10','1990',178,1),(8357,33,2,'2014-04-08','1990',178,1),(8358,34,2,'2014-05-08','1990',178,1),(8359,35,2,'2014-06-09','1990',178,1),(8360,36,2,'2014-07-08','1990',178,1),(8361,37,2,'2014-08-08','1990',178,1),(8362,38,2,'2014-09-08','1990',178,1),(8363,39,2,'2014-10-08','1990',178,1),(8364,40,2,'2014-11-10','1990',178,1),(8365,41,2,'2014-12-08','1990',178,1),(8366,42,2,'2015-01-08','1990',178,1),(8367,43,2,'2015-02-09','1990',178,1),(8368,44,2,'2015-03-09','1990',178,1),(8369,45,2,'2015-04-08','1990',178,1),(8370,46,2,'2015-05-08','1990',178,1),(8371,47,2,'2015-06-08','1990',178,1),(8372,48,2,'2015-07-08','1990',178,1),(8373,1,2,'2011-08-31','1990',179,1),(8374,2,2,'2011-09-08','1990',179,1),(8375,3,2,'2011-10-10','1990',179,1),(8376,4,2,'2011-11-08','1990',179,1),(8377,5,2,'2011-12-08','1990',179,1),(8378,6,2,'2012-01-09','1990',179,1),(8379,7,2,'2012-02-08','1990',179,1),(8380,8,2,'2012-03-08','1990',179,1),(8381,9,2,'2012-04-11','1990',179,1),(8382,10,2,'2012-05-08','1990',179,1),(8383,11,2,'2012-06-08','1990',179,1),(8384,12,2,'2012-07-09','1990',179,1),(8385,13,2,'2012-08-08','1990',179,1),(8386,14,2,'2012-09-10','1990',179,1),(8387,15,2,'2012-10-08','1990',179,1),(8388,16,2,'2012-11-08','1990',179,1),(8389,17,2,'2012-12-10','1990',179,1),(8390,18,2,'2013-01-08','1990',179,1),(8391,19,2,'2013-02-08','1990',179,1),(8392,20,2,'2013-03-08','1990',179,1),(8393,21,2,'2013-04-08','1990',179,1),(8394,22,2,'2013-05-08','1990',179,1),(8395,23,2,'2013-06-10','1990',179,1),(8396,24,2,'2013-07-08','1990',179,1),(8397,25,2,'2013-08-08','1990',179,1),(8398,26,2,'2013-09-09','1990',179,1),(8399,27,2,'2013-10-08','1990',179,1),(8400,28,2,'2013-11-08','1990',179,1),(8401,29,2,'2013-12-09','1990',179,1),(8402,30,2,'2014-01-08','1990',179,1),(8403,31,2,'2014-02-10','1990',179,1),(8404,32,2,'2014-03-10','1990',179,1),(8405,33,2,'2014-04-08','1990',179,1),(8406,34,2,'2014-05-08','1990',179,1),(8407,35,2,'2014-06-09','1990',179,1),(8408,36,2,'2014-07-08','1990',179,1),(8409,37,2,'2014-08-08','1990',179,1),(8410,38,2,'2014-09-08','1990',179,1),(8411,39,2,'2014-10-08','1990',179,1),(8412,40,2,'2014-11-10','1990',179,1),(8413,41,2,'2014-12-08','1990',179,1),(8414,42,2,'2015-01-08','1990',179,1),(8415,43,2,'2015-02-09','1990',179,1),(8416,44,2,'2015-03-09','1990',179,1),(8417,45,2,'2015-04-08','1990',179,1),(8418,46,2,'2015-05-08','1990',179,1),(8419,47,2,'2015-06-08','1990',179,1),(8420,48,2,'2015-07-08','1990',179,1),(8421,1,2,'2011-08-31','1990',180,1),(8422,2,2,'2011-09-08','1990',180,1),(8423,3,2,'2011-10-10','1990',180,1),(8424,4,2,'2011-11-08','1990',180,1),(8425,5,2,'2011-12-08','1990',180,1),(8426,6,2,'2012-01-09','1990',180,1),(8427,7,2,'2012-02-08','1990',180,1),(8428,8,2,'2012-03-08','1990',180,1),(8429,9,2,'2012-04-11','1990',180,1),(8430,10,2,'2012-05-08','1990',180,1),(8431,11,2,'2012-06-08','1990',180,1),(8432,12,2,'2012-07-09','1990',180,1),(8433,13,2,'2012-08-08','1990',180,1),(8434,14,2,'2012-09-10','1990',180,1),(8435,15,2,'2012-10-08','1990',180,1),(8436,16,2,'2012-11-08','1990',180,1),(8437,17,2,'2012-12-10','1990',180,1),(8438,18,2,'2013-01-08','1990',180,1),(8439,19,2,'2013-02-08','1990',180,1),(8440,20,2,'2013-03-08','1990',180,1),(8441,21,2,'2013-04-08','1990',180,1),(8442,22,2,'2013-05-08','1990',180,1),(8443,23,2,'2013-06-10','1990',180,1),(8444,24,2,'2013-07-08','1990',180,1),(8445,25,2,'2013-08-08','1990',180,1),(8446,26,2,'2013-09-09','1990',180,1),(8447,27,2,'2013-10-08','1990',180,1),(8448,28,2,'2013-11-08','1990',180,1),(8449,29,2,'2013-12-09','1990',180,1),(8450,30,2,'2014-01-08','1990',180,1),(8451,31,2,'2014-02-10','1990',180,1),(8452,32,2,'2014-03-10','1990',180,1),(8453,33,2,'2014-04-08','1990',180,1),(8454,34,2,'2014-05-08','1990',180,1),(8455,35,2,'2014-06-09','1990',180,1),(8456,36,2,'2014-07-08','1990',180,1),(8457,37,2,'2014-08-08','1990',180,1),(8458,38,2,'2014-09-08','1990',180,1),(8459,39,2,'2014-10-08','1990',180,1),(8460,40,2,'2014-11-10','1990',180,1),(8461,41,2,'2014-12-08','1990',180,1),(8462,42,2,'2015-01-08','1990',180,1),(8463,43,2,'2015-02-09','1990',180,1),(8464,44,2,'2015-03-09','1990',180,1),(8465,45,2,'2015-04-08','1990',180,1),(8466,46,2,'2015-05-08','1990',180,1),(8467,47,2,'2015-06-08','1990',180,1),(8468,48,2,'2015-07-08','1990',180,1),(8469,1,2,'2011-08-31','1990',181,1),(8470,2,2,'2011-09-08','1990',181,1),(8471,3,2,'2011-10-10','1990',181,1),(8472,4,2,'2011-11-08','1990',181,1),(8473,5,2,'2011-12-08','1990',181,1),(8474,6,2,'2012-01-09','1990',181,1),(8475,7,2,'2012-02-08','1990',181,1),(8476,8,2,'2012-03-08','1990',181,1),(8477,9,2,'2012-04-11','1990',181,1),(8478,10,2,'2012-05-08','1990',181,1),(8479,11,2,'2012-06-08','1990',181,1),(8480,12,2,'2012-07-09','1990',181,1),(8481,13,2,'2012-08-08','1990',181,1),(8482,14,2,'2012-09-10','1990',181,1),(8483,15,2,'2012-10-08','1990',181,1),(8484,16,2,'2012-11-08','1990',181,1),(8485,17,2,'2012-12-10','1990',181,1),(8486,18,2,'2013-01-08','1990',181,1),(8487,19,2,'2013-02-08','1990',181,1),(8488,20,2,'2013-03-08','1990',181,1),(8489,21,2,'2013-04-08','1990',181,1),(8490,22,2,'2013-05-08','1990',181,1),(8491,23,2,'2013-06-10','1990',181,1),(8492,24,2,'2013-07-08','1990',181,1),(8493,25,2,'2013-08-08','1990',181,1),(8494,26,2,'2013-09-09','1990',181,1),(8495,27,2,'2013-10-08','1990',181,1),(8496,28,2,'2013-11-08','1990',181,1),(8497,29,2,'2013-12-09','1990',181,1),(8498,30,2,'2014-01-08','1990',181,1),(8499,31,2,'2014-02-10','1990',181,1),(8500,32,2,'2014-03-10','1990',181,1),(8501,33,2,'2014-04-08','1990',181,1),(8502,34,2,'2014-05-08','1990',181,1),(8503,35,2,'2014-06-09','1990',181,1),(8504,36,2,'2014-07-08','1990',181,1),(8505,37,2,'2014-08-08','1990',181,1),(8506,38,2,'2014-09-08','1990',181,1),(8507,39,2,'2014-10-08','1990',181,1),(8508,40,2,'2014-11-10','1990',181,1),(8509,41,2,'2014-12-08','1990',181,1),(8510,42,2,'2015-01-08','1990',181,1),(8511,43,2,'2015-02-09','1990',181,1),(8512,44,2,'2015-03-09','1990',181,1),(8513,45,2,'2015-04-08','1990',181,1),(8514,46,2,'2015-05-08','1990',181,1),(8515,47,2,'2015-06-08','1990',181,1),(8516,48,2,'2015-07-08','1990',181,1),(8517,1,2,'2011-08-31','1990',182,1),(8518,2,2,'2011-09-08','1990',182,1),(8519,3,2,'2011-10-10','1990',182,1),(8520,4,2,'2011-11-08','1990',182,1),(8521,5,2,'2011-12-08','1990',182,1),(8522,6,2,'2012-01-09','1990',182,1),(8523,7,2,'2012-02-08','1990',182,1),(8524,8,2,'2012-03-08','1990',182,1),(8525,9,2,'2012-04-11','1990',182,1),(8526,10,2,'2012-05-08','1990',182,1),(8527,11,2,'2012-06-08','1990',182,1),(8528,12,2,'2012-07-09','1990',182,1),(8529,13,2,'2012-08-08','1990',182,1),(8530,14,2,'2012-09-10','1990',182,1),(8531,15,2,'2012-10-08','1990',182,1),(8532,16,2,'2012-11-08','1990',182,1),(8533,17,2,'2012-12-10','1990',182,1),(8534,18,2,'2013-01-08','1990',182,1),(8535,19,2,'2013-02-08','1990',182,1),(8536,20,2,'2013-03-08','1990',182,1),(8537,21,2,'2013-04-08','1990',182,1),(8538,22,2,'2013-05-08','1990',182,1),(8539,23,2,'2013-06-10','1990',182,1),(8540,24,2,'2013-07-08','1990',182,1),(8541,25,2,'2013-08-08','1990',182,1),(8542,26,2,'2013-09-09','1990',182,1),(8543,27,2,'2013-10-08','1990',182,1),(8544,28,2,'2013-11-08','1990',182,1),(8545,29,2,'2013-12-09','1990',182,1),(8546,30,2,'2014-01-08','1990',182,1),(8547,31,2,'2014-02-10','1990',182,1),(8548,32,2,'2014-03-10','1990',182,1),(8549,33,2,'2014-04-08','1990',182,1),(8550,34,2,'2014-05-08','1990',182,1),(8551,35,2,'2014-06-09','1990',182,1),(8552,36,2,'2014-07-08','1990',182,1),(8553,37,2,'2014-08-08','1990',182,1),(8554,38,2,'2014-09-08','1990',182,1),(8555,39,2,'2014-10-08','1990',182,1),(8556,40,2,'2014-11-10','1990',182,1),(8557,41,2,'2014-12-08','1990',182,1),(8558,42,2,'2015-01-08','1990',182,1),(8559,43,2,'2015-02-09','1990',182,1),(8560,44,2,'2015-03-09','1990',182,1),(8561,45,2,'2015-04-08','1990',182,1),(8562,46,2,'2015-05-08','1990',182,1),(8563,47,2,'2015-06-08','1990',182,1),(8564,48,2,'2015-07-08','1990',182,1),(8565,1,2,'2011-08-31','1990',183,1),(8566,2,2,'2011-09-08','1990',183,1),(8567,3,2,'2011-10-10','1990',183,1),(8568,4,2,'2011-11-08','1990',183,1),(8569,5,2,'2011-12-08','1990',183,1),(8570,6,2,'2012-01-09','1990',183,1),(8571,7,2,'2012-02-08','1990',183,1),(8572,8,2,'2012-03-08','1990',183,1),(8573,9,2,'2012-04-11','1990',183,1),(8574,10,2,'2012-05-08','1990',183,1),(8575,11,2,'2012-06-08','1990',183,1),(8576,12,2,'2012-07-09','1990',183,1),(8577,13,2,'2012-08-08','1990',183,1),(8578,14,2,'2012-09-10','1990',183,1),(8579,15,2,'2012-10-08','1990',183,1),(8580,16,2,'2012-11-08','1990',183,1),(8581,17,2,'2012-12-10','1990',183,1),(8582,18,2,'2013-01-08','1990',183,1),(8583,19,2,'2013-02-08','1990',183,1),(8584,20,2,'2013-03-08','1990',183,1),(8585,21,2,'2013-04-08','1990',183,1),(8586,22,2,'2013-05-08','1990',183,1),(8587,23,2,'2013-06-10','1990',183,1),(8588,24,2,'2013-07-08','1990',183,1),(8589,25,2,'2013-08-08','1990',183,1),(8590,26,2,'2013-09-09','1990',183,1),(8591,27,2,'2013-10-08','1990',183,1),(8592,28,2,'2013-11-08','1990',183,1),(8593,29,2,'2013-12-09','1990',183,1),(8594,30,2,'2014-01-08','1990',183,1),(8595,31,2,'2014-02-10','1990',183,1),(8596,32,2,'2014-03-10','1990',183,1),(8597,33,2,'2014-04-08','1990',183,1),(8598,34,2,'2014-05-08','1990',183,1),(8599,35,2,'2014-06-09','1990',183,1),(8600,36,2,'2014-07-08','1990',183,1),(8601,37,2,'2014-08-08','1990',183,1),(8602,38,2,'2014-09-08','1990',183,1),(8603,39,2,'2014-10-08','1990',183,1),(8604,40,2,'2014-11-10','1990',183,1),(8605,41,2,'2014-12-08','1990',183,1),(8606,42,2,'2015-01-08','1990',183,1),(8607,43,2,'2015-02-09','1990',183,1),(8608,44,2,'2015-03-09','1990',183,1),(8609,45,2,'2015-04-08','1990',183,1),(8610,46,2,'2015-05-08','1990',183,1),(8611,47,2,'2015-06-08','1990',183,1),(8612,48,2,'2015-07-08','1990',183,1),(8613,1,2,'2011-08-31','1990',184,1),(8614,2,2,'2011-09-08','1990',184,1),(8615,3,2,'2011-10-10','1990',184,1),(8616,4,2,'2011-11-08','1990',184,1),(8617,5,2,'2011-12-08','1990',184,1),(8618,6,2,'2012-01-09','1990',184,1),(8619,7,2,'2012-02-08','1990',184,1),(8620,8,2,'2012-03-08','1990',184,1),(8621,9,2,'2012-04-11','1990',184,1),(8622,10,2,'2012-05-08','1990',184,1),(8623,11,2,'2012-06-08','1990',184,1),(8624,12,2,'2012-07-09','1990',184,1),(8625,13,2,'2012-08-08','1990',184,1),(8626,14,2,'2012-09-10','1990',184,1),(8627,15,2,'2012-10-08','1990',184,1),(8628,16,2,'2012-11-08','1990',184,1),(8629,17,2,'2012-12-10','1990',184,1),(8630,18,2,'2013-01-08','1990',184,1),(8631,19,2,'2013-02-08','1990',184,1),(8632,20,2,'2013-03-08','1990',184,1),(8633,21,2,'2013-04-08','1990',184,1),(8634,22,2,'2013-05-08','1990',184,1),(8635,23,2,'2013-06-10','1990',184,1),(8636,24,2,'2013-07-08','1990',184,1),(8637,25,2,'2013-08-08','1990',184,1),(8638,26,2,'2013-09-09','1990',184,1),(8639,27,2,'2013-10-08','1990',184,1),(8640,28,2,'2013-11-08','1990',184,1),(8641,29,2,'2013-12-09','1990',184,1),(8642,30,2,'2014-01-08','1990',184,1),(8643,31,2,'2014-02-10','1990',184,1),(8644,32,2,'2014-03-10','1990',184,1),(8645,33,2,'2014-04-08','1990',184,1),(8646,34,2,'2014-05-08','1990',184,1),(8647,35,2,'2014-06-09','1990',184,1),(8648,36,2,'2014-07-08','1990',184,1),(8649,37,2,'2014-08-08','1990',184,1),(8650,38,2,'2014-09-08','1990',184,1),(8651,39,2,'2014-10-08','1990',184,1),(8652,40,2,'2014-11-10','1990',184,1),(8653,41,2,'2014-12-08','1990',184,1),(8654,42,2,'2015-01-08','1990',184,1),(8655,43,2,'2015-02-09','1990',184,1),(8656,44,2,'2015-03-09','1990',184,1),(8657,45,2,'2015-04-08','1990',184,1),(8658,46,2,'2015-05-08','1990',184,1),(8659,47,2,'2015-06-08','1990',184,1),(8660,48,2,'2015-07-08','1990',184,1),(8661,1,2,'2011-08-31','1990',185,1),(8662,2,2,'2011-09-08','1990',185,1),(8663,3,2,'2011-10-10','1990',185,1),(8664,4,2,'2011-11-08','1990',185,1),(8665,5,2,'2011-12-08','1990',185,1),(8666,6,2,'2012-01-09','1990',185,1),(8667,7,2,'2012-02-08','1990',185,1),(8668,8,2,'2012-03-08','1990',185,1),(8669,9,2,'2012-04-11','1990',185,1),(8670,10,2,'2012-05-08','1990',185,1),(8671,11,2,'2012-06-08','1990',185,1),(8672,12,2,'2012-07-09','1990',185,1),(8673,13,2,'2012-08-08','1990',185,1),(8674,14,2,'2012-09-10','1990',185,1),(8675,15,2,'2012-10-08','1990',185,1),(8676,16,2,'2012-11-08','1990',185,1),(8677,17,2,'2012-12-10','1990',185,1),(8678,18,2,'2013-01-08','1990',185,1),(8679,19,2,'2013-02-08','1990',185,1),(8680,20,2,'2013-03-08','1990',185,1),(8681,21,2,'2013-04-08','1990',185,1),(8682,22,2,'2013-05-08','1990',185,1),(8683,23,2,'2013-06-10','1990',185,1),(8684,24,2,'2013-07-08','1990',185,1),(8685,25,2,'2013-08-08','1990',185,1),(8686,26,2,'2013-09-09','1990',185,1),(8687,27,2,'2013-10-08','1990',185,1),(8688,28,2,'2013-11-08','1990',185,1),(8689,29,2,'2013-12-09','1990',185,1),(8690,30,2,'2014-01-08','1990',185,1),(8691,31,2,'2014-02-10','1990',185,1),(8692,32,2,'2014-03-10','1990',185,1),(8693,33,2,'2014-04-08','1990',185,1),(8694,34,2,'2014-05-08','1990',185,1),(8695,35,2,'2014-06-09','1990',185,1),(8696,36,2,'2014-07-08','1990',185,1),(8697,37,2,'2014-08-08','1990',185,1),(8698,38,2,'2014-09-08','1990',185,1),(8699,39,2,'2014-10-08','1990',185,1),(8700,40,2,'2014-11-10','1990',185,1),(8701,41,2,'2014-12-08','1990',185,1),(8702,42,2,'2015-01-08','1990',185,1),(8703,43,2,'2015-02-09','1990',185,1),(8704,44,2,'2015-03-09','1990',185,1),(8705,45,2,'2015-04-08','1990',185,1),(8706,46,2,'2015-05-08','1990',185,1),(8707,47,2,'2015-06-08','1990',185,1),(8708,48,2,'2015-07-08','1990',185,1),(8709,1,2,'2011-08-31','1990',186,1),(8710,2,2,'2011-09-08','1990',186,1),(8711,3,2,'2011-10-10','1990',186,1),(8712,4,2,'2011-11-08','1990',186,1),(8713,5,2,'2011-12-08','1990',186,1),(8714,6,2,'2012-01-09','1990',186,1),(8715,7,2,'2012-02-08','1990',186,1),(8716,8,2,'2012-03-08','1990',186,1),(8717,9,2,'2012-04-11','1990',186,1),(8718,10,2,'2012-05-08','1990',186,1),(8719,11,2,'2012-06-08','1990',186,1),(8720,12,2,'2012-07-09','1990',186,1),(8721,13,2,'2012-08-08','1990',186,1),(8722,14,2,'2012-09-10','1990',186,1),(8723,15,2,'2012-10-08','1990',186,1),(8724,16,2,'2012-11-08','1990',186,1),(8725,17,2,'2012-12-10','1990',186,1),(8726,18,2,'2013-01-08','1990',186,1),(8727,19,2,'2013-02-08','1990',186,1),(8728,20,2,'2013-03-08','1990',186,1),(8729,21,2,'2013-04-08','1990',186,1),(8730,22,2,'2013-05-08','1990',186,1),(8731,23,2,'2013-06-10','1990',186,1),(8732,24,2,'2013-07-08','1990',186,1),(8733,25,2,'2013-08-08','1990',186,1),(8734,26,2,'2013-09-09','1990',186,1),(8735,27,2,'2013-10-08','1990',186,1),(8736,28,2,'2013-11-08','1990',186,1),(8737,29,2,'2013-12-09','1990',186,1),(8738,30,2,'2014-01-08','1990',186,1),(8739,31,2,'2014-02-10','1990',186,1),(8740,32,2,'2014-03-10','1990',186,1),(8741,33,2,'2014-04-08','1990',186,1),(8742,34,2,'2014-05-08','1990',186,1),(8743,35,2,'2014-06-09','1990',186,1),(8744,36,2,'2014-07-08','1990',186,1),(8745,37,2,'2014-08-08','1990',186,1),(8746,38,2,'2014-09-08','1990',186,1),(8747,39,2,'2014-10-08','1990',186,1),(8748,40,2,'2014-11-10','1990',186,1),(8749,41,2,'2014-12-08','1990',186,1),(8750,42,2,'2015-01-08','1990',186,1),(8751,43,2,'2015-02-09','1990',186,1),(8752,44,2,'2015-03-09','1990',186,1),(8753,45,2,'2015-04-08','1990',186,1),(8754,46,2,'2015-05-08','1990',186,1),(8755,47,2,'2015-06-08','1990',186,1),(8756,48,2,'2015-07-08','1990',186,1),(8757,1,2,'2011-08-31','1990',187,1),(8758,2,2,'2011-09-08','1990',187,1),(8759,3,2,'2011-10-10','1990',187,1),(8760,4,2,'2011-11-08','1990',187,1),(8761,5,2,'2011-12-08','1990',187,1),(8762,6,2,'2012-01-09','1990',187,1),(8763,7,2,'2012-02-08','1990',187,1),(8764,8,2,'2012-03-08','1990',187,1),(8765,9,2,'2012-04-11','1990',187,1),(8766,10,2,'2012-05-08','1990',187,1),(8767,11,2,'2012-06-08','1990',187,1),(8768,12,2,'2012-07-09','1990',187,1),(8769,13,2,'2012-08-08','1990',187,1),(8770,14,2,'2012-09-10','1990',187,1),(8771,15,2,'2012-10-08','1990',187,1),(8772,16,2,'2012-11-08','1990',187,1),(8773,17,2,'2012-12-10','1990',187,1),(8774,18,2,'2013-01-08','1990',187,1),(8775,19,2,'2013-02-08','1990',187,1),(8776,20,2,'2013-03-08','1990',187,1),(8777,21,2,'2013-04-08','1990',187,1),(8778,22,2,'2013-05-08','1990',187,1),(8779,23,2,'2013-06-10','1990',187,1),(8780,24,2,'2013-07-08','1990',187,1),(8781,25,2,'2013-08-08','1990',187,1),(8782,26,2,'2013-09-09','1990',187,1),(8783,27,2,'2013-10-08','1990',187,1),(8784,28,2,'2013-11-08','1990',187,1),(8785,29,2,'2013-12-09','1990',187,1),(8786,30,2,'2014-01-08','1990',187,1),(8787,31,2,'2014-02-10','1990',187,1),(8788,32,2,'2014-03-10','1990',187,1),(8789,33,2,'2014-04-08','1990',187,1),(8790,34,2,'2014-05-08','1990',187,1),(8791,35,2,'2014-06-09','1990',187,1),(8792,36,2,'2014-07-08','1990',187,1),(8793,37,2,'2014-08-08','1990',187,1),(8794,38,2,'2014-09-08','1990',187,1),(8795,39,2,'2014-10-08','1990',187,1),(8796,40,2,'2014-11-10','1990',187,1),(8797,41,2,'2014-12-08','1990',187,1),(8798,42,2,'2015-01-08','1990',187,1),(8799,43,2,'2015-02-09','1990',187,1),(8800,44,2,'2015-03-09','1990',187,1),(8801,45,2,'2015-04-08','1990',187,1),(8802,46,2,'2015-05-08','1990',187,1),(8803,47,2,'2015-06-08','1990',187,1),(8804,48,2,'2015-07-08','1990',187,1),(8805,1,2,'2011-08-31','1990',188,1),(8806,2,2,'2011-09-08','1990',188,1),(8807,3,2,'2011-10-10','1990',188,1),(8808,4,2,'2011-11-08','1990',188,1),(8809,5,2,'2011-12-08','1990',188,1),(8810,6,2,'2012-01-09','1990',188,1),(8811,7,2,'2012-02-08','1990',188,1),(8812,8,2,'2012-03-08','1990',188,1),(8813,9,2,'2012-04-11','1990',188,1),(8814,10,2,'2012-05-08','1990',188,1),(8815,11,2,'2012-06-08','1990',188,1),(8816,12,2,'2012-07-09','1990',188,1),(8817,13,2,'2012-08-08','1990',188,1),(8818,14,2,'2012-09-10','1990',188,1),(8819,15,2,'2012-10-08','1990',188,1),(8820,16,2,'2012-11-08','1990',188,1),(8821,17,2,'2012-12-10','1990',188,1),(8822,18,2,'2013-01-08','1990',188,1),(8823,19,2,'2013-02-08','1990',188,1),(8824,20,2,'2013-03-08','1990',188,1),(8825,21,2,'2013-04-08','1990',188,1),(8826,22,2,'2013-05-08','1990',188,1),(8827,23,2,'2013-06-10','1990',188,1),(8828,24,2,'2013-07-08','1990',188,1),(8829,25,2,'2013-08-08','1990',188,1),(8830,26,2,'2013-09-09','1990',188,1),(8831,27,2,'2013-10-08','1990',188,1),(8832,28,2,'2013-11-08','1990',188,1),(8833,29,2,'2013-12-09','1990',188,1),(8834,30,2,'2014-01-08','1990',188,1),(8835,31,2,'2014-02-10','1990',188,1),(8836,32,2,'2014-03-10','1990',188,1),(8837,33,2,'2014-04-08','1990',188,1),(8838,34,2,'2014-05-08','1990',188,1),(8839,35,2,'2014-06-09','1990',188,1),(8840,36,2,'2014-07-08','1990',188,1),(8841,37,2,'2014-08-08','1990',188,1),(8842,38,2,'2014-09-08','1990',188,1),(8843,39,2,'2014-10-08','1990',188,1),(8844,40,2,'2014-11-10','1990',188,1),(8845,41,2,'2014-12-08','1990',188,1),(8846,42,2,'2015-01-08','1990',188,1),(8847,43,2,'2015-02-09','1990',188,1),(8848,44,2,'2015-03-09','1990',188,1),(8849,45,2,'2015-04-08','1990',188,1),(8850,46,2,'2015-05-08','1990',188,1),(8851,47,2,'2015-06-08','1990',188,1),(8852,48,2,'2015-07-08','1990',188,1),(8853,1,2,'2011-08-31','1990',189,1),(8854,2,2,'2011-09-08','1990',189,1),(8855,3,2,'2011-10-10','1990',189,1),(8856,4,2,'2011-11-08','1990',189,1),(8857,5,2,'2011-12-08','1990',189,1),(8858,6,2,'2012-01-09','1990',189,1),(8859,7,2,'2012-02-08','1990',189,1),(8860,8,2,'2012-03-08','1990',189,1),(8861,9,2,'2012-04-11','1990',189,1),(8862,10,2,'2012-05-08','1990',189,1),(8863,11,2,'2012-06-08','1990',189,1),(8864,12,2,'2012-07-09','1990',189,1),(8865,13,2,'2012-08-08','1990',189,1),(8866,14,2,'2012-09-10','1990',189,1),(8867,15,2,'2012-10-08','1990',189,1),(8868,16,2,'2012-11-08','1990',189,1),(8869,17,2,'2012-12-10','1990',189,1),(8870,18,2,'2013-01-08','1990',189,1),(8871,19,2,'2013-02-08','1990',189,1),(8872,20,2,'2013-03-08','1990',189,1),(8873,21,2,'2013-04-08','1990',189,1),(8874,22,2,'2013-05-08','1990',189,1),(8875,23,2,'2013-06-10','1990',189,1),(8876,24,2,'2013-07-08','1990',189,1),(8877,25,2,'2013-08-08','1990',189,1),(8878,26,2,'2013-09-09','1990',189,1),(8879,27,2,'2013-10-08','1990',189,1),(8880,28,2,'2013-11-08','1990',189,1),(8881,29,2,'2013-12-09','1990',189,1),(8882,30,2,'2014-01-08','1990',189,1),(8883,31,2,'2014-02-10','1990',189,1),(8884,32,2,'2014-03-10','1990',189,1),(8885,33,2,'2014-04-08','1990',189,1),(8886,34,2,'2014-05-08','1990',189,1),(8887,35,2,'2014-06-09','1990',189,1),(8888,36,2,'2014-07-08','1990',189,1),(8889,37,2,'2014-08-08','1990',189,1),(8890,38,2,'2014-09-08','1990',189,1),(8891,39,2,'2014-10-08','1990',189,1),(8892,40,2,'2014-11-10','1990',189,1),(8893,41,2,'2014-12-08','1990',189,1),(8894,42,2,'2015-01-08','1990',189,1),(8895,43,2,'2015-02-09','1990',189,1),(8896,44,2,'2015-03-09','1990',189,1),(8897,45,2,'2015-04-08','1990',189,1),(8898,46,2,'2015-05-08','1990',189,1),(8899,47,2,'2015-06-08','1990',189,1),(8900,48,2,'2015-07-08','1990',189,1),(8901,1,2,'2011-08-31','1990',190,1),(8902,2,2,'2011-09-08','1990',190,1),(8903,3,2,'2011-10-10','1990',190,1),(8904,4,2,'2011-11-08','1990',190,1),(8905,5,2,'2011-12-08','1990',190,1),(8906,6,2,'2012-01-09','1990',190,1),(8907,7,2,'2012-02-08','1990',190,1),(8908,8,2,'2012-03-08','1990',190,1),(8909,9,2,'2012-04-11','1990',190,1),(8910,10,2,'2012-05-08','1990',190,1),(8911,11,2,'2012-06-08','1990',190,1),(8912,12,2,'2012-07-09','1990',190,1),(8913,13,2,'2012-08-08','1990',190,1),(8914,14,2,'2012-09-10','1990',190,1),(8915,15,2,'2012-10-08','1990',190,1),(8916,16,2,'2012-11-08','1990',190,1),(8917,17,2,'2012-12-10','1990',190,1),(8918,18,2,'2013-01-08','1990',190,1),(8919,19,2,'2013-02-08','1990',190,1),(8920,20,2,'2013-03-08','1990',190,1),(8921,21,2,'2013-04-08','1990',190,1),(8922,22,2,'2013-05-08','1990',190,1),(8923,23,2,'2013-06-10','1990',190,1),(8924,24,2,'2013-07-08','1990',190,1),(8925,25,2,'2013-08-08','1990',190,1),(8926,26,2,'2013-09-09','1990',190,1),(8927,27,2,'2013-10-08','1990',190,1),(8928,28,2,'2013-11-08','1990',190,1),(8929,29,2,'2013-12-09','1990',190,1),(8930,30,2,'2014-01-08','1990',190,1),(8931,31,2,'2014-02-10','1990',190,1),(8932,32,2,'2014-03-10','1990',190,1),(8933,33,2,'2014-04-08','1990',190,1),(8934,34,2,'2014-05-08','1990',190,1),(8935,35,2,'2014-06-09','1990',190,1),(8936,36,2,'2014-07-08','1990',190,1),(8937,37,2,'2014-08-08','1990',190,1),(8938,38,2,'2014-09-08','1990',190,1),(8939,39,2,'2014-10-08','1990',190,1),(8940,40,2,'2014-11-10','1990',190,1),(8941,41,2,'2014-12-08','1990',190,1),(8942,42,2,'2015-01-08','1990',190,1),(8943,43,2,'2015-02-09','1990',190,1),(8944,44,2,'2015-03-09','1990',190,1),(8945,45,2,'2015-04-08','1990',190,1),(8946,46,2,'2015-05-08','1990',190,1),(8947,47,2,'2015-06-08','1990',190,1),(8948,48,2,'2015-07-08','1990',190,1),(8949,1,2,'2011-08-31','1990',191,1),(8950,2,2,'2011-09-08','1990',191,1),(8951,3,2,'2011-10-10','1990',191,1),(8952,4,2,'2011-11-08','1990',191,1),(8953,5,2,'2011-12-08','1990',191,1),(8954,6,2,'2012-01-09','1990',191,1),(8955,7,2,'2012-02-08','1990',191,1),(8956,8,2,'2012-03-08','1990',191,1),(8957,9,2,'2012-04-11','1990',191,1),(8958,10,2,'2012-05-08','1990',191,1),(8959,11,2,'2012-06-08','1990',191,1),(8960,12,2,'2012-07-09','1990',191,1),(8961,13,2,'2012-08-08','1990',191,1),(8962,14,2,'2012-09-10','1990',191,1),(8963,15,2,'2012-10-08','1990',191,1),(8964,16,2,'2012-11-08','1990',191,1),(8965,17,2,'2012-12-10','1990',191,1),(8966,18,2,'2013-01-08','1990',191,1),(8967,19,2,'2013-02-08','1990',191,1),(8968,20,2,'2013-03-08','1990',191,1),(8969,21,2,'2013-04-08','1990',191,1),(8970,22,2,'2013-05-08','1990',191,1),(8971,23,2,'2013-06-10','1990',191,1),(8972,24,2,'2013-07-08','1990',191,1),(8973,25,2,'2013-08-08','1990',191,1),(8974,26,2,'2013-09-09','1990',191,1),(8975,27,2,'2013-10-08','1990',191,1),(8976,28,2,'2013-11-08','1990',191,1),(8977,29,2,'2013-12-09','1990',191,1),(8978,30,2,'2014-01-08','1990',191,1),(8979,31,2,'2014-02-10','1990',191,1),(8980,32,2,'2014-03-10','1990',191,1),(8981,33,2,'2014-04-08','1990',191,1),(8982,34,2,'2014-05-08','1990',191,1),(8983,35,2,'2014-06-09','1990',191,1),(8984,36,2,'2014-07-08','1990',191,1),(8985,37,2,'2014-08-08','1990',191,1),(8986,38,2,'2014-09-08','1990',191,1),(8987,39,2,'2014-10-08','1990',191,1),(8988,40,2,'2014-11-10','1990',191,1),(8989,41,2,'2014-12-08','1990',191,1),(8990,42,2,'2015-01-08','1990',191,1),(8991,43,2,'2015-02-09','1990',191,1),(8992,44,2,'2015-03-09','1990',191,1),(8993,45,2,'2015-04-08','1990',191,1),(8994,46,2,'2015-05-08','1990',191,1),(8995,47,2,'2015-06-08','1990',191,1),(8996,48,2,'2015-07-08','1990',191,1),(8997,1,2,'2011-08-31','1990',192,1),(8998,2,2,'2011-09-08','1990',192,1),(8999,3,2,'2011-10-10','1990',192,1),(9000,4,2,'2011-11-08','1990',192,1),(9001,5,2,'2011-12-08','1990',192,1),(9002,6,2,'2012-01-09','1990',192,1),(9003,7,2,'2012-02-08','1990',192,1),(9004,8,2,'2012-03-08','1990',192,1),(9005,9,2,'2012-04-11','1990',192,1),(9006,10,2,'2012-05-08','1990',192,1),(9007,11,2,'2012-06-08','1990',192,1),(9008,12,2,'2012-07-09','1990',192,1),(9009,13,2,'2012-08-08','1990',192,1),(9010,14,2,'2012-09-10','1990',192,1),(9011,15,2,'2012-10-08','1990',192,1),(9012,16,2,'2012-11-08','1990',192,1),(9013,17,2,'2012-12-10','1990',192,1),(9014,18,2,'2013-01-08','1990',192,1),(9015,19,2,'2013-02-08','1990',192,1),(9016,20,2,'2013-03-08','1990',192,1),(9017,21,2,'2013-04-08','1990',192,1),(9018,22,2,'2013-05-08','1990',192,1),(9019,23,2,'2013-06-10','1990',192,1),(9020,24,2,'2013-07-08','1990',192,1),(9021,25,2,'2013-08-08','1990',192,1),(9022,26,2,'2013-09-09','1990',192,1),(9023,27,2,'2013-10-08','1990',192,1),(9024,28,2,'2013-11-08','1990',192,1),(9025,29,2,'2013-12-09','1990',192,1),(9026,30,2,'2014-01-08','1990',192,1),(9027,31,2,'2014-02-10','1990',192,1),(9028,32,2,'2014-03-10','1990',192,1),(9029,33,2,'2014-04-08','1990',192,1),(9030,34,2,'2014-05-08','1990',192,1),(9031,35,2,'2014-06-09','1990',192,1),(9032,36,2,'2014-07-08','1990',192,1),(9033,37,2,'2014-08-08','1990',192,1),(9034,38,2,'2014-09-08','1990',192,1),(9035,39,2,'2014-10-08','1990',192,1),(9036,40,2,'2014-11-10','1990',192,1),(9037,41,2,'2014-12-08','1990',192,1),(9038,42,2,'2015-01-08','1990',192,1),(9039,43,2,'2015-02-09','1990',192,1),(9040,44,2,'2015-03-09','1990',192,1),(9041,45,2,'2015-04-08','1990',192,1),(9042,46,2,'2015-05-08','1990',192,1),(9043,47,2,'2015-06-08','1990',192,1),(9044,48,2,'2015-07-08','1990',192,1),(9045,1,2,'2011-08-31','1990',193,1),(9046,2,2,'2011-09-08','1990',193,1),(9047,3,2,'2011-10-10','1990',193,1),(9048,4,2,'2011-11-08','1990',193,1),(9049,5,2,'2011-12-08','1990',193,1),(9050,6,2,'2012-01-09','1990',193,1),(9051,7,2,'2012-02-08','1990',193,1),(9052,8,2,'2012-03-08','1990',193,1),(9053,9,2,'2012-04-11','1990',193,1),(9054,10,2,'2012-05-08','1990',193,1),(9055,11,2,'2012-06-08','1990',193,1),(9056,12,2,'2012-07-09','1990',193,1),(9057,13,2,'2012-08-08','1990',193,1),(9058,14,2,'2012-09-10','1990',193,1),(9059,15,2,'2012-10-08','1990',193,1),(9060,16,2,'2012-11-08','1990',193,1),(9061,17,2,'2012-12-10','1990',193,1),(9062,18,2,'2013-01-08','1990',193,1),(9063,19,2,'2013-02-08','1990',193,1),(9064,20,2,'2013-03-08','1990',193,1),(9065,21,2,'2013-04-08','1990',193,1),(9066,22,2,'2013-05-08','1990',193,1),(9067,23,2,'2013-06-10','1990',193,1),(9068,24,2,'2013-07-08','1990',193,1),(9069,25,2,'2013-08-08','1990',193,1),(9070,26,2,'2013-09-09','1990',193,1),(9071,27,2,'2013-10-08','1990',193,1),(9072,28,2,'2013-11-08','1990',193,1),(9073,29,2,'2013-12-09','1990',193,1),(9074,30,2,'2014-01-08','1990',193,1),(9075,31,2,'2014-02-10','1990',193,1),(9076,32,2,'2014-03-10','1990',193,1),(9077,33,2,'2014-04-08','1990',193,1),(9078,34,2,'2014-05-08','1990',193,1),(9079,35,2,'2014-06-09','1990',193,1),(9080,36,2,'2014-07-08','1990',193,1),(9081,37,2,'2014-08-08','1990',193,1),(9082,38,2,'2014-09-08','1990',193,1),(9083,39,2,'2014-10-08','1990',193,1),(9084,40,2,'2014-11-10','1990',193,1),(9085,41,2,'2014-12-08','1990',193,1),(9086,42,2,'2015-01-08','1990',193,1),(9087,43,2,'2015-02-09','1990',193,1),(9088,44,2,'2015-03-09','1990',193,1),(9089,45,2,'2015-04-08','1990',193,1),(9090,46,2,'2015-05-08','1990',193,1),(9091,47,2,'2015-06-08','1990',193,1),(9092,48,2,'2015-07-08','1990',193,1),(9093,1,2,'2011-08-31','1990',194,1),(9094,2,2,'2011-09-08','1990',194,1),(9095,3,2,'2011-10-10','1990',194,1),(9096,4,2,'2011-11-08','1990',194,1),(9097,5,2,'2011-12-08','1990',194,1),(9098,6,2,'2012-01-09','1990',194,1),(9099,7,2,'2012-02-08','1990',194,1),(9100,8,2,'2012-03-08','1990',194,1),(9101,9,2,'2012-04-11','1990',194,1),(9102,10,2,'2012-05-08','1990',194,1),(9103,11,2,'2012-06-08','1990',194,1),(9104,12,2,'2012-07-09','1990',194,1),(9105,13,2,'2012-08-08','1990',194,1),(9106,14,2,'2012-09-10','1990',194,1),(9107,15,2,'2012-10-08','1990',194,1),(9108,16,2,'2012-11-08','1990',194,1),(9109,17,2,'2012-12-10','1990',194,1),(9110,18,2,'2013-01-08','1990',194,1),(9111,19,2,'2013-02-08','1990',194,1),(9112,20,2,'2013-03-08','1990',194,1),(9113,21,2,'2013-04-08','1990',194,1),(9114,22,2,'2013-05-08','1990',194,1),(9115,23,2,'2013-06-10','1990',194,1),(9116,24,2,'2013-07-08','1990',194,1),(9117,25,2,'2013-08-08','1990',194,1),(9118,26,2,'2013-09-09','1990',194,1),(9119,27,2,'2013-10-08','1990',194,1),(9120,28,2,'2013-11-08','1990',194,1),(9121,29,2,'2013-12-09','1990',194,1),(9122,30,2,'2014-01-08','1990',194,1),(9123,31,2,'2014-02-10','1990',194,1),(9124,32,2,'2014-03-10','1990',194,1),(9125,33,2,'2014-04-08','1990',194,1),(9126,34,2,'2014-05-08','1990',194,1),(9127,35,2,'2014-06-09','1990',194,1),(9128,36,2,'2014-07-08','1990',194,1),(9129,37,2,'2014-08-08','1990',194,1),(9130,38,2,'2014-09-08','1990',194,1),(9131,39,2,'2014-10-08','1990',194,1),(9132,40,2,'2014-11-10','1990',194,1),(9133,41,2,'2014-12-08','1990',194,1),(9134,42,2,'2015-01-08','1990',194,1),(9135,43,2,'2015-02-09','1990',194,1),(9136,44,2,'2015-03-09','1990',194,1),(9137,45,2,'2015-04-08','1990',194,1),(9138,46,2,'2015-05-08','1990',194,1),(9139,47,2,'2015-06-08','1990',194,1),(9140,48,2,'2015-07-08','1990',194,1),(9141,1,2,'2011-08-31','1990',195,1),(9142,2,2,'2011-09-08','1990',195,1),(9143,3,2,'2011-10-10','1990',195,1),(9144,4,2,'2011-11-08','1990',195,1),(9145,5,2,'2011-12-08','1990',195,1),(9146,6,2,'2012-01-09','1990',195,1),(9147,7,2,'2012-02-08','1990',195,1),(9148,8,2,'2012-03-08','1990',195,1),(9149,9,2,'2012-04-11','1990',195,1),(9150,10,2,'2012-05-08','1990',195,1),(9151,11,2,'2012-06-08','1990',195,1),(9152,12,2,'2012-07-09','1990',195,1),(9153,13,2,'2012-08-08','1990',195,1),(9154,14,2,'2012-09-10','1990',195,1),(9155,15,2,'2012-10-08','1990',195,1),(9156,16,2,'2012-11-08','1990',195,1),(9157,17,2,'2012-12-10','1990',195,1),(9158,18,2,'2013-01-08','1990',195,1),(9159,19,2,'2013-02-08','1990',195,1),(9160,20,2,'2013-03-08','1990',195,1),(9161,21,2,'2013-04-08','1990',195,1),(9162,22,2,'2013-05-08','1990',195,1),(9163,23,2,'2013-06-10','1990',195,1),(9164,24,2,'2013-07-08','1990',195,1),(9165,25,2,'2013-08-08','1990',195,1),(9166,26,2,'2013-09-09','1990',195,1),(9167,27,2,'2013-10-08','1990',195,1),(9168,28,2,'2013-11-08','1990',195,1),(9169,29,2,'2013-12-09','1990',195,1),(9170,30,2,'2014-01-08','1990',195,1),(9171,31,2,'2014-02-10','1990',195,1),(9172,32,2,'2014-03-10','1990',195,1),(9173,33,2,'2014-04-08','1990',195,1),(9174,34,2,'2014-05-08','1990',195,1),(9175,35,2,'2014-06-09','1990',195,1),(9176,36,2,'2014-07-08','1990',195,1),(9177,37,2,'2014-08-08','1990',195,1),(9178,38,2,'2014-09-08','1990',195,1),(9179,39,2,'2014-10-08','1990',195,1),(9180,40,2,'2014-11-10','1990',195,1),(9181,41,2,'2014-12-08','1990',195,1),(9182,42,2,'2015-01-08','1990',195,1),(9183,43,2,'2015-02-09','1990',195,1),(9184,44,2,'2015-03-09','1990',195,1),(9185,45,2,'2015-04-08','1990',195,1),(9186,46,2,'2015-05-08','1990',195,1),(9187,47,2,'2015-06-08','1990',195,1),(9188,48,2,'2015-07-08','1990',195,1),(9189,1,2,'2011-08-31','1990',196,1),(9190,2,2,'2011-09-08','1990',196,1),(9191,3,2,'2011-10-10','1990',196,1),(9192,4,2,'2011-11-08','1990',196,1),(9193,5,2,'2011-12-08','1990',196,1),(9194,6,2,'2012-01-09','1990',196,1),(9195,7,2,'2012-02-08','1990',196,1),(9196,8,2,'2012-03-08','1990',196,1),(9197,9,2,'2012-04-11','1990',196,1),(9198,10,2,'2012-05-08','1990',196,1),(9199,11,2,'2012-06-08','1990',196,1),(9200,12,2,'2012-07-09','1990',196,1),(9201,13,2,'2012-08-08','1990',196,1),(9202,14,2,'2012-09-10','1990',196,1),(9203,15,2,'2012-10-08','1990',196,1),(9204,16,2,'2012-11-08','1990',196,1),(9205,17,2,'2012-12-10','1990',196,1),(9206,18,2,'2013-01-08','1990',196,1),(9207,19,2,'2013-02-08','1990',196,1),(9208,20,2,'2013-03-08','1990',196,1),(9209,21,2,'2013-04-08','1990',196,1),(9210,22,2,'2013-05-08','1990',196,1),(9211,23,2,'2013-06-10','1990',196,1),(9212,24,2,'2013-07-08','1990',196,1),(9213,25,2,'2013-08-08','1990',196,1),(9214,26,2,'2013-09-09','1990',196,1),(9215,27,2,'2013-10-08','1990',196,1),(9216,28,2,'2013-11-08','1990',196,1),(9217,29,2,'2013-12-09','1990',196,1),(9218,30,2,'2014-01-08','1990',196,1),(9219,31,2,'2014-02-10','1990',196,1),(9220,32,2,'2014-03-10','1990',196,1),(9221,33,2,'2014-04-08','1990',196,1),(9222,34,2,'2014-05-08','1990',196,1),(9223,35,2,'2014-06-09','1990',196,1),(9224,36,2,'2014-07-08','1990',196,1),(9225,37,2,'2014-08-08','1990',196,1),(9226,38,2,'2014-09-08','1990',196,1),(9227,39,2,'2014-10-08','1990',196,1),(9228,40,2,'2014-11-10','1990',196,1),(9229,41,2,'2014-12-08','1990',196,1),(9230,42,2,'2015-01-08','1990',196,1),(9231,43,2,'2015-02-09','1990',196,1),(9232,44,2,'2015-03-09','1990',196,1),(9233,45,2,'2015-04-08','1990',196,1),(9234,46,2,'2015-05-08','1990',196,1),(9235,47,2,'2015-06-08','1990',196,1),(9236,48,2,'2015-07-08','1990',196,1),(9237,1,2,'2011-08-31','1990',197,1),(9238,2,2,'2011-09-08','1990',197,1),(9239,3,2,'2011-10-10','1990',197,1),(9240,4,2,'2011-11-08','1990',197,1),(9241,5,2,'2011-12-08','1990',197,1),(9242,6,2,'2012-01-09','1990',197,1),(9243,7,2,'2012-02-08','1990',197,1),(9244,8,2,'2012-03-08','1990',197,1),(9245,9,2,'2012-04-11','1990',197,1),(9246,10,2,'2012-05-08','1990',197,1),(9247,11,2,'2012-06-08','1990',197,1),(9248,12,2,'2012-07-09','1990',197,1),(9249,13,2,'2012-08-08','1990',197,1),(9250,14,2,'2012-09-10','1990',197,1),(9251,15,2,'2012-10-08','1990',197,1),(9252,16,2,'2012-11-08','1990',197,1),(9253,17,2,'2012-12-10','1990',197,1),(9254,18,2,'2013-01-08','1990',197,1),(9255,19,2,'2013-02-08','1990',197,1),(9256,20,2,'2013-03-08','1990',197,1),(9257,21,2,'2013-04-08','1990',197,1),(9258,22,2,'2013-05-08','1990',197,1),(9259,23,2,'2013-06-10','1990',197,1),(9260,24,2,'2013-07-08','1990',197,1),(9261,25,2,'2013-08-08','1990',197,1),(9262,26,2,'2013-09-09','1990',197,1),(9263,27,2,'2013-10-08','1990',197,1),(9264,28,2,'2013-11-08','1990',197,1),(9265,29,2,'2013-12-09','1990',197,1),(9266,30,2,'2014-01-08','1990',197,1),(9267,31,2,'2014-02-10','1990',197,1),(9268,32,2,'2014-03-10','1990',197,1),(9269,33,2,'2014-04-08','1990',197,1),(9270,34,2,'2014-05-08','1990',197,1),(9271,35,2,'2014-06-09','1990',197,1),(9272,36,2,'2014-07-08','1990',197,1),(9273,37,2,'2014-08-08','1990',197,1),(9274,38,2,'2014-09-08','1990',197,1),(9275,39,2,'2014-10-08','1990',197,1),(9276,40,2,'2014-11-10','1990',197,1),(9277,41,2,'2014-12-08','1990',197,1),(9278,42,2,'2015-01-08','1990',197,1),(9279,43,2,'2015-02-09','1990',197,1),(9280,44,2,'2015-03-09','1990',197,1),(9281,45,2,'2015-04-08','1990',197,1),(9282,46,2,'2015-05-08','1990',197,1),(9283,47,2,'2015-06-08','1990',197,1),(9284,48,2,'2015-07-08','1990',197,1),(9285,1,2,'2011-08-31','1990',198,1),(9286,2,2,'2011-09-08','1990',198,1),(9287,3,2,'2011-10-10','1990',198,1),(9288,4,2,'2011-11-08','1990',198,1),(9289,5,2,'2011-12-08','1990',198,1),(9290,6,2,'2012-01-09','1990',198,1),(9291,7,2,'2012-02-08','1990',198,1),(9292,8,2,'2012-03-08','1990',198,1),(9293,9,2,'2012-04-11','1990',198,1),(9294,10,2,'2012-05-08','1990',198,1),(9295,11,2,'2012-06-08','1990',198,1),(9296,12,2,'2012-07-09','1990',198,1),(9297,13,2,'2012-08-08','1990',198,1),(9298,14,2,'2012-09-10','1990',198,1),(9299,15,2,'2012-10-08','1990',198,1),(9300,16,2,'2012-11-08','1990',198,1),(9301,17,2,'2012-12-10','1990',198,1),(9302,18,2,'2013-01-08','1990',198,1),(9303,19,2,'2013-02-08','1990',198,1),(9304,20,2,'2013-03-08','1990',198,1),(9305,21,2,'2013-04-08','1990',198,1),(9306,22,2,'2013-05-08','1990',198,1),(9307,23,2,'2013-06-10','1990',198,1),(9308,24,2,'2013-07-08','1990',198,1),(9309,25,2,'2013-08-08','1990',198,1),(9310,26,2,'2013-09-09','1990',198,1),(9311,27,2,'2013-10-08','1990',198,1),(9312,28,2,'2013-11-08','1990',198,1),(9313,29,2,'2013-12-09','1990',198,1),(9314,30,2,'2014-01-08','1990',198,1),(9315,31,2,'2014-02-10','1990',198,1),(9316,32,2,'2014-03-10','1990',198,1),(9317,33,2,'2014-04-08','1990',198,1),(9318,34,2,'2014-05-08','1990',198,1),(9319,35,2,'2014-06-09','1990',198,1),(9320,36,2,'2014-07-08','1990',198,1),(9321,37,2,'2014-08-08','1990',198,1),(9322,38,2,'2014-09-08','1990',198,1),(9323,39,2,'2014-10-08','1990',198,1),(9324,40,2,'2014-11-10','1990',198,1),(9325,41,2,'2014-12-08','1990',198,1),(9326,42,2,'2015-01-08','1990',198,1),(9327,43,2,'2015-02-09','1990',198,1),(9328,44,2,'2015-03-09','1990',198,1),(9329,45,2,'2015-04-08','1990',198,1),(9330,46,2,'2015-05-08','1990',198,1),(9331,47,2,'2015-06-08','1990',198,1),(9332,48,2,'2015-07-08','1990',198,1),(9333,1,2,'2011-08-31','1990',199,1),(9334,2,2,'2011-09-08','1990',199,1),(9335,3,2,'2011-10-10','1990',199,1),(9336,4,2,'2011-11-08','1990',199,1),(9337,5,2,'2011-12-08','1990',199,1),(9338,6,2,'2012-01-09','1990',199,1),(9339,7,2,'2012-02-08','1990',199,1),(9340,8,2,'2012-03-08','1990',199,1),(9341,9,2,'2012-04-11','1990',199,1),(9342,10,2,'2012-05-08','1990',199,1),(9343,11,2,'2012-06-08','1990',199,1),(9344,12,2,'2012-07-09','1990',199,1),(9345,13,2,'2012-08-08','1990',199,1),(9346,14,2,'2012-09-10','1990',199,1),(9347,15,2,'2012-10-08','1990',199,1),(9348,16,2,'2012-11-08','1990',199,1),(9349,17,2,'2012-12-10','1990',199,1),(9350,18,2,'2013-01-08','1990',199,1),(9351,19,2,'2013-02-08','1990',199,1),(9352,20,2,'2013-03-08','1990',199,1),(9353,21,2,'2013-04-08','1990',199,1),(9354,22,2,'2013-05-08','1990',199,1),(9355,23,2,'2013-06-10','1990',199,1),(9356,24,2,'2013-07-08','1990',199,1),(9357,25,2,'2013-08-08','1990',199,1),(9358,26,2,'2013-09-09','1990',199,1),(9359,27,2,'2013-10-08','1990',199,1),(9360,28,2,'2013-11-08','1990',199,1),(9361,29,2,'2013-12-09','1990',199,1),(9362,30,2,'2014-01-08','1990',199,1),(9363,31,2,'2014-02-10','1990',199,1),(9364,32,2,'2014-03-10','1990',199,1),(9365,33,2,'2014-04-08','1990',199,1),(9366,34,2,'2014-05-08','1990',199,1),(9367,35,2,'2014-06-09','1990',199,1),(9368,36,2,'2014-07-08','1990',199,1),(9369,37,2,'2014-08-08','1990',199,1),(9370,38,2,'2014-09-08','1990',199,1),(9371,39,2,'2014-10-08','1990',199,1),(9372,40,2,'2014-11-10','1990',199,1),(9373,41,2,'2014-12-08','1990',199,1),(9374,42,2,'2015-01-08','1990',199,1),(9375,43,2,'2015-02-09','1990',199,1),(9376,44,2,'2015-03-09','1990',199,1),(9377,45,2,'2015-04-08','1990',199,1),(9378,46,2,'2015-05-08','1990',199,1),(9379,47,2,'2015-06-08','1990',199,1),(9380,48,2,'2015-07-08','1990',199,1),(9381,1,2,'2011-08-31','1990',200,1),(9382,2,2,'2011-09-08','1990',200,1),(9383,3,2,'2011-10-10','1990',200,1),(9384,4,2,'2011-11-08','1990',200,1),(9385,5,2,'2011-12-08','1990',200,1),(9386,6,2,'2012-01-09','1990',200,1),(9387,7,2,'2012-02-08','1990',200,1),(9388,8,2,'2012-03-08','1990',200,1),(9389,9,2,'2012-04-11','1990',200,1),(9390,10,2,'2012-05-08','1990',200,1),(9391,11,2,'2012-06-08','1990',200,1),(9392,12,2,'2012-07-09','1990',200,1),(9393,13,2,'2012-08-08','1990',200,1),(9394,14,2,'2012-09-10','1990',200,1),(9395,15,2,'2012-10-08','1990',200,1),(9396,16,2,'2012-11-08','1990',200,1),(9397,17,2,'2012-12-10','1990',200,1),(9398,18,2,'2013-01-08','1990',200,1),(9399,19,2,'2013-02-08','1990',200,1),(9400,20,2,'2013-03-08','1990',200,1),(9401,21,2,'2013-04-08','1990',200,1),(9402,22,2,'2013-05-08','1990',200,1),(9403,23,2,'2013-06-10','1990',200,1),(9404,24,2,'2013-07-08','1990',200,1),(9405,25,2,'2013-08-08','1990',200,1),(9406,26,2,'2013-09-09','1990',200,1),(9407,27,2,'2013-10-08','1990',200,1),(9408,28,2,'2013-11-08','1990',200,1),(9409,29,2,'2013-12-09','1990',200,1),(9410,30,2,'2014-01-08','1990',200,1),(9411,31,2,'2014-02-10','1990',200,1),(9412,32,2,'2014-03-10','1990',200,1),(9413,33,2,'2014-04-08','1990',200,1),(9414,34,2,'2014-05-08','1990',200,1),(9415,35,2,'2014-06-09','1990',200,1),(9416,36,2,'2014-07-08','1990',200,1),(9417,37,2,'2014-08-08','1990',200,1),(9418,38,2,'2014-09-08','1990',200,1),(9419,39,2,'2014-10-08','1990',200,1),(9420,40,2,'2014-11-10','1990',200,1),(9421,41,2,'2014-12-08','1990',200,1),(9422,42,2,'2015-01-08','1990',200,1),(9423,43,2,'2015-02-09','1990',200,1),(9424,44,2,'2015-03-09','1990',200,1),(9425,45,2,'2015-04-08','1990',200,1),(9426,46,2,'2015-05-08','1990',200,1),(9427,47,2,'2015-06-08','1990',200,1),(9428,48,2,'2015-07-08','1990',200,1),(9429,1,2,'2011-08-31','1990',201,1),(9430,2,2,'2011-09-08','1990',201,1),(9431,3,2,'2011-10-10','1990',201,1),(9432,4,2,'2011-11-08','1990',201,1),(9433,5,2,'2011-12-08','1990',201,1),(9434,6,2,'2012-01-09','1990',201,1),(9435,7,2,'2012-02-08','1990',201,1),(9436,8,2,'2012-03-08','1990',201,1),(9437,9,2,'2012-04-11','1990',201,1),(9438,10,2,'2012-05-08','1990',201,1),(9439,11,2,'2012-06-08','1990',201,1),(9440,12,2,'2012-07-09','1990',201,1),(9441,13,2,'2012-08-08','1990',201,1),(9442,14,2,'2012-09-10','1990',201,1),(9443,15,2,'2012-10-08','1990',201,1),(9444,16,2,'2012-11-08','1990',201,1),(9445,17,2,'2012-12-10','1990',201,1),(9446,18,2,'2013-01-08','1990',201,1),(9447,19,2,'2013-02-08','1990',201,1),(9448,20,2,'2013-03-08','1990',201,1),(9449,21,2,'2013-04-08','1990',201,1),(9450,22,2,'2013-05-08','1990',201,1),(9451,23,2,'2013-06-10','1990',201,1),(9452,24,2,'2013-07-08','1990',201,1),(9453,25,2,'2013-08-08','1990',201,1),(9454,26,2,'2013-09-09','1990',201,1),(9455,27,2,'2013-10-08','1990',201,1),(9456,28,2,'2013-11-08','1990',201,1),(9457,29,2,'2013-12-09','1990',201,1),(9458,30,2,'2014-01-08','1990',201,1),(9459,31,2,'2014-02-10','1990',201,1),(9460,32,2,'2014-03-10','1990',201,1),(9461,33,2,'2014-04-08','1990',201,1),(9462,34,2,'2014-05-08','1990',201,1),(9463,35,2,'2014-06-09','1990',201,1),(9464,36,2,'2014-07-08','1990',201,1),(9465,37,2,'2014-08-08','1990',201,1),(9466,38,2,'2014-09-08','1990',201,1),(9467,39,2,'2014-10-08','1990',201,1),(9468,40,2,'2014-11-10','1990',201,1),(9469,41,2,'2014-12-08','1990',201,1),(9470,42,2,'2015-01-08','1990',201,1),(9471,43,2,'2015-02-09','1990',201,1),(9472,44,2,'2015-03-09','1990',201,1),(9473,45,2,'2015-04-08','1990',201,1),(9474,46,2,'2015-05-08','1990',201,1),(9475,47,2,'2015-06-08','1990',201,1),(9476,48,2,'2015-07-08','1990',201,1),(9477,1,2,'2011-08-31','1990',202,1),(9478,2,2,'2011-09-08','1990',202,1),(9479,3,2,'2011-10-10','1990',202,1),(9480,4,2,'2011-11-08','1990',202,1),(9481,5,2,'2011-12-08','1990',202,1),(9482,6,2,'2012-01-09','1990',202,1),(9483,7,2,'2012-02-08','1990',202,1),(9484,8,2,'2012-03-08','1990',202,1),(9485,9,2,'2012-04-11','1990',202,1),(9486,10,2,'2012-05-08','1990',202,1),(9487,11,2,'2012-06-08','1990',202,1),(9488,12,2,'2012-07-09','1990',202,1),(9489,13,2,'2012-08-08','1990',202,1),(9490,14,2,'2012-09-10','1990',202,1),(9491,15,2,'2012-10-08','1990',202,1),(9492,16,2,'2012-11-08','1990',202,1),(9493,17,2,'2012-12-10','1990',202,1),(9494,18,2,'2013-01-08','1990',202,1),(9495,19,2,'2013-02-08','1990',202,1),(9496,20,2,'2013-03-08','1990',202,1),(9497,21,2,'2013-04-08','1990',202,1),(9498,22,2,'2013-05-08','1990',202,1),(9499,23,2,'2013-06-10','1990',202,1),(9500,24,2,'2013-07-08','1990',202,1),(9501,25,2,'2013-08-08','1990',202,1),(9502,26,2,'2013-09-09','1990',202,1),(9503,27,2,'2013-10-08','1990',202,1),(9504,28,2,'2013-11-08','1990',202,1),(9505,29,2,'2013-12-09','1990',202,1),(9506,30,2,'2014-01-08','1990',202,1),(9507,31,2,'2014-02-10','1990',202,1),(9508,32,2,'2014-03-10','1990',202,1),(9509,33,2,'2014-04-08','1990',202,1),(9510,34,2,'2014-05-08','1990',202,1),(9511,35,2,'2014-06-09','1990',202,1),(9512,36,2,'2014-07-08','1990',202,1),(9513,37,2,'2014-08-08','1990',202,1),(9514,38,2,'2014-09-08','1990',202,1),(9515,39,2,'2014-10-08','1990',202,1),(9516,40,2,'2014-11-10','1990',202,1),(9517,41,2,'2014-12-08','1990',202,1),(9518,42,2,'2015-01-08','1990',202,1),(9519,43,2,'2015-02-09','1990',202,1),(9520,44,2,'2015-03-09','1990',202,1),(9521,45,2,'2015-04-08','1990',202,1),(9522,46,2,'2015-05-08','1990',202,1),(9523,47,2,'2015-06-08','1990',202,1),(9524,48,2,'2015-07-08','1990',202,1),(9525,1,2,'2011-08-31','1990',203,1),(9526,2,2,'2011-09-08','1990',203,1),(9527,3,2,'2011-10-10','1990',203,1),(9528,4,2,'2011-11-08','1990',203,1),(9529,5,2,'2011-12-08','1990',203,1),(9530,6,2,'2012-01-09','1990',203,1),(9531,7,2,'2012-02-08','1990',203,1),(9532,8,2,'2012-03-08','1990',203,1),(9533,9,2,'2012-04-11','1990',203,1),(9534,10,2,'2012-05-08','1990',203,1),(9535,11,2,'2012-06-08','1990',203,1),(9536,12,2,'2012-07-09','1990',203,1),(9537,13,2,'2012-08-08','1990',203,1),(9538,14,2,'2012-09-10','1990',203,1),(9539,15,2,'2012-10-08','1990',203,1),(9540,16,2,'2012-11-08','1990',203,1),(9541,17,2,'2012-12-10','1990',203,1),(9542,18,2,'2013-01-08','1990',203,1),(9543,19,2,'2013-02-08','1990',203,1),(9544,20,2,'2013-03-08','1990',203,1),(9545,21,2,'2013-04-08','1990',203,1),(9546,22,2,'2013-05-08','1990',203,1),(9547,23,2,'2013-06-10','1990',203,1),(9548,24,2,'2013-07-08','1990',203,1),(9549,25,2,'2013-08-08','1990',203,1),(9550,26,2,'2013-09-09','1990',203,1),(9551,27,2,'2013-10-08','1990',203,1),(9552,28,2,'2013-11-08','1990',203,1),(9553,29,2,'2013-12-09','1990',203,1),(9554,30,2,'2014-01-08','1990',203,1),(9555,31,2,'2014-02-10','1990',203,1),(9556,32,2,'2014-03-10','1990',203,1),(9557,33,2,'2014-04-08','1990',203,1),(9558,34,2,'2014-05-08','1990',203,1),(9559,35,2,'2014-06-09','1990',203,1),(9560,36,2,'2014-07-08','1990',203,1),(9561,37,2,'2014-08-08','1990',203,1),(9562,38,2,'2014-09-08','1990',203,1),(9563,39,2,'2014-10-08','1990',203,1),(9564,40,2,'2014-11-10','1990',203,1),(9565,41,2,'2014-12-08','1990',203,1),(9566,42,2,'2015-01-08','1990',203,1),(9567,43,2,'2015-02-09','1990',203,1),(9568,44,2,'2015-03-09','1990',203,1),(9569,45,2,'2015-04-08','1990',203,1),(9570,46,2,'2015-05-08','1990',203,1),(9571,47,2,'2015-06-08','1990',203,1),(9572,48,2,'2015-07-08','1990',203,1),(9573,1,2,'2011-08-31','1990',204,1),(9574,2,2,'2011-09-08','1990',204,1),(9575,3,2,'2011-10-10','1990',204,1),(9576,4,2,'2011-11-08','1990',204,1),(9577,5,2,'2011-12-08','1990',204,1),(9578,6,2,'2012-01-09','1990',204,1),(9579,7,2,'2012-02-08','1990',204,1),(9580,8,2,'2012-03-08','1990',204,1),(9581,9,2,'2012-04-11','1990',204,1),(9582,10,2,'2012-05-08','1990',204,1),(9583,11,2,'2012-06-08','1990',204,1),(9584,12,2,'2012-07-09','1990',204,1),(9585,13,2,'2012-08-08','1990',204,1),(9586,14,2,'2012-09-10','1990',204,1),(9587,15,2,'2012-10-08','1990',204,1),(9588,16,2,'2012-11-08','1990',204,1),(9589,17,2,'2012-12-10','1990',204,1),(9590,18,2,'2013-01-08','1990',204,1),(9591,19,2,'2013-02-08','1990',204,1),(9592,20,2,'2013-03-08','1990',204,1),(9593,21,2,'2013-04-08','1990',204,1),(9594,22,2,'2013-05-08','1990',204,1),(9595,23,2,'2013-06-10','1990',204,1),(9596,24,2,'2013-07-08','1990',204,1),(9597,25,2,'2013-08-08','1990',204,1),(9598,26,2,'2013-09-09','1990',204,1),(9599,27,2,'2013-10-08','1990',204,1),(9600,28,2,'2013-11-08','1990',204,1),(9601,29,2,'2013-12-09','1990',204,1),(9602,30,2,'2014-01-08','1990',204,1),(9603,31,2,'2014-02-10','1990',204,1),(9604,32,2,'2014-03-10','1990',204,1),(9605,33,2,'2014-04-08','1990',204,1),(9606,34,2,'2014-05-08','1990',204,1),(9607,35,2,'2014-06-09','1990',204,1),(9608,36,2,'2014-07-08','1990',204,1),(9609,37,2,'2014-08-08','1990',204,1),(9610,38,2,'2014-09-08','1990',204,1),(9611,39,2,'2014-10-08','1990',204,1),(9612,40,2,'2014-11-10','1990',204,1),(9613,41,2,'2014-12-08','1990',204,1),(9614,42,2,'2015-01-08','1990',204,1),(9615,43,2,'2015-02-09','1990',204,1),(9616,44,2,'2015-03-09','1990',204,1),(9617,45,2,'2015-04-08','1990',204,1),(9618,46,2,'2015-05-08','1990',204,1),(9619,47,2,'2015-06-08','1990',204,1),(9620,48,2,'2015-07-08','1990',204,1),(9621,1,2,'2011-08-31','1990',205,1),(9622,2,2,'2011-09-08','1990',205,1),(9623,3,2,'2011-10-10','1990',205,1),(9624,4,2,'2011-11-08','1990',205,1),(9625,5,2,'2011-12-08','1990',205,1),(9626,6,2,'2012-01-09','1990',205,1),(9627,7,2,'2012-02-08','1990',205,1),(9628,8,2,'2012-03-08','1990',205,1),(9629,9,2,'2012-04-11','1990',205,1),(9630,10,2,'2012-05-08','1990',205,1),(9631,11,2,'2012-06-08','1990',205,1),(9632,12,2,'2012-07-09','1990',205,1),(9633,13,2,'2012-08-08','1990',205,1),(9634,14,2,'2012-09-10','1990',205,1),(9635,15,2,'2012-10-08','1990',205,1),(9636,16,2,'2012-11-08','1990',205,1),(9637,17,2,'2012-12-10','1990',205,1),(9638,18,2,'2013-01-08','1990',205,1),(9639,19,2,'2013-02-08','1990',205,1),(9640,20,2,'2013-03-08','1990',205,1),(9641,21,2,'2013-04-08','1990',205,1),(9642,22,2,'2013-05-08','1990',205,1),(9643,23,2,'2013-06-10','1990',205,1),(9644,24,2,'2013-07-08','1990',205,1),(9645,25,2,'2013-08-08','1990',205,1),(9646,26,2,'2013-09-09','1990',205,1),(9647,27,2,'2013-10-08','1990',205,1),(9648,28,2,'2013-11-08','1990',205,1),(9649,29,2,'2013-12-09','1990',205,1),(9650,30,2,'2014-01-08','1990',205,1),(9651,31,2,'2014-02-10','1990',205,1),(9652,32,2,'2014-03-10','1990',205,1),(9653,33,2,'2014-04-08','1990',205,1),(9654,34,2,'2014-05-08','1990',205,1),(9655,35,2,'2014-06-09','1990',205,1),(9656,36,2,'2014-07-08','1990',205,1),(9657,37,2,'2014-08-08','1990',205,1),(9658,38,2,'2014-09-08','1990',205,1),(9659,39,2,'2014-10-08','1990',205,1),(9660,40,2,'2014-11-10','1990',205,1),(9661,41,2,'2014-12-08','1990',205,1),(9662,42,2,'2015-01-08','1990',205,1),(9663,43,2,'2015-02-09','1990',205,1),(9664,44,2,'2015-03-09','1990',205,1),(9665,45,2,'2015-04-08','1990',205,1),(9666,46,2,'2015-05-08','1990',205,1),(9667,47,2,'2015-06-08','1990',205,1),(9668,48,2,'2015-07-08','1990',205,1),(9669,1,2,'2011-08-31','1990',206,1),(9670,2,2,'2011-09-08','1990',206,1),(9671,3,2,'2011-10-10','1990',206,1),(9672,4,2,'2011-11-08','1990',206,1),(9673,5,2,'2011-12-08','1990',206,1),(9674,6,2,'2012-01-09','1990',206,1),(9675,7,2,'2012-02-08','1990',206,1),(9676,8,2,'2012-03-08','1990',206,1),(9677,9,2,'2012-04-11','1990',206,1),(9678,10,2,'2012-05-08','1990',206,1),(9679,11,2,'2012-06-08','1990',206,1),(9680,12,2,'2012-07-09','1990',206,1),(9681,13,2,'2012-08-08','1990',206,1),(9682,14,2,'2012-09-10','1990',206,1),(9683,15,2,'2012-10-08','1990',206,1),(9684,16,2,'2012-11-08','1990',206,1),(9685,17,2,'2012-12-10','1990',206,1),(9686,18,2,'2013-01-08','1990',206,1),(9687,19,2,'2013-02-08','1990',206,1),(9688,20,2,'2013-03-08','1990',206,1),(9689,21,2,'2013-04-08','1990',206,1),(9690,22,2,'2013-05-08','1990',206,1),(9691,23,2,'2013-06-10','1990',206,1),(9692,24,2,'2013-07-08','1990',206,1),(9693,25,2,'2013-08-08','1990',206,1),(9694,26,2,'2013-09-09','1990',206,1),(9695,27,2,'2013-10-08','1990',206,1),(9696,28,2,'2013-11-08','1990',206,1),(9697,29,2,'2013-12-09','1990',206,1),(9698,30,2,'2014-01-08','1990',206,1),(9699,31,2,'2014-02-10','1990',206,1),(9700,32,2,'2014-03-10','1990',206,1),(9701,33,2,'2014-04-08','1990',206,1),(9702,34,2,'2014-05-08','1990',206,1),(9703,35,2,'2014-06-09','1990',206,1),(9704,36,2,'2014-07-08','1990',206,1),(9705,37,2,'2014-08-08','1990',206,1),(9706,38,2,'2014-09-08','1990',206,1),(9707,39,2,'2014-10-08','1990',206,1),(9708,40,2,'2014-11-10','1990',206,1),(9709,41,2,'2014-12-08','1990',206,1),(9710,42,2,'2015-01-08','1990',206,1),(9711,43,2,'2015-02-09','1990',206,1),(9712,44,2,'2015-03-09','1990',206,1),(9713,45,2,'2015-04-08','1990',206,1),(9714,46,2,'2015-05-08','1990',206,1),(9715,47,2,'2015-06-08','1990',206,1),(9716,48,2,'2015-07-08','1990',206,1),(9717,1,2,'2011-08-31','1990',207,1),(9718,2,2,'2011-09-08','1990',207,1),(9719,3,2,'2011-10-10','1990',207,1),(9720,4,2,'2011-11-08','1990',207,1),(9721,5,2,'2011-12-08','1990',207,1),(9722,6,2,'2012-01-09','1990',207,1),(9723,7,2,'2012-02-08','1990',207,1),(9724,8,2,'2012-03-08','1990',207,1),(9725,9,2,'2012-04-11','1990',207,1),(9726,10,2,'2012-05-08','1990',207,1),(9727,11,2,'2012-06-08','1990',207,1),(9728,12,2,'2012-07-09','1990',207,1),(9729,13,2,'2012-08-08','1990',207,1),(9730,14,2,'2012-09-10','1990',207,1),(9731,15,2,'2012-10-08','1990',207,1),(9732,16,2,'2012-11-08','1990',207,1),(9733,17,2,'2012-12-10','1990',207,1),(9734,18,2,'2013-01-08','1990',207,1),(9735,19,2,'2013-02-08','1990',207,1),(9736,20,2,'2013-03-08','1990',207,1),(9737,21,2,'2013-04-08','1990',207,1),(9738,22,2,'2013-05-08','1990',207,1),(9739,23,2,'2013-06-10','1990',207,1),(9740,24,2,'2013-07-08','1990',207,1),(9741,25,2,'2013-08-08','1990',207,1),(9742,26,2,'2013-09-09','1990',207,1),(9743,27,2,'2013-10-08','1990',207,1),(9744,28,2,'2013-11-08','1990',207,1),(9745,29,2,'2013-12-09','1990',207,1),(9746,30,2,'2014-01-08','1990',207,1),(9747,31,2,'2014-02-10','1990',207,1),(9748,32,2,'2014-03-10','1990',207,1),(9749,33,2,'2014-04-08','1990',207,1),(9750,34,2,'2014-05-08','1990',207,1),(9751,35,2,'2014-06-09','1990',207,1),(9752,36,2,'2014-07-08','1990',207,1),(9753,37,2,'2014-08-08','1990',207,1),(9754,38,2,'2014-09-08','1990',207,1),(9755,39,2,'2014-10-08','1990',207,1),(9756,40,2,'2014-11-10','1990',207,1),(9757,41,2,'2014-12-08','1990',207,1),(9758,42,2,'2015-01-08','1990',207,1),(9759,43,2,'2015-02-09','1990',207,1),(9760,44,2,'2015-03-09','1990',207,1),(9761,45,2,'2015-04-08','1990',207,1),(9762,46,2,'2015-05-08','1990',207,1),(9763,47,2,'2015-06-08','1990',207,1),(9764,48,2,'2015-07-08','1990',207,1),(9765,1,2,'2011-08-31','1990',208,1),(9766,2,2,'2011-09-08','1990',208,1),(9767,3,2,'2011-10-10','1990',208,1),(9768,4,2,'2011-11-08','1990',208,1),(9769,5,2,'2011-12-08','1990',208,1),(9770,6,2,'2012-01-09','1990',208,1),(9771,7,2,'2012-02-08','1990',208,1),(9772,8,2,'2012-03-08','1990',208,1),(9773,9,2,'2012-04-11','1990',208,1),(9774,10,2,'2012-05-08','1990',208,1),(9775,11,2,'2012-06-08','1990',208,1),(9776,12,2,'2012-07-09','1990',208,1),(9777,13,2,'2012-08-08','1990',208,1),(9778,14,2,'2012-09-10','1990',208,1),(9779,15,2,'2012-10-08','1990',208,1),(9780,16,2,'2012-11-08','1990',208,1),(9781,17,2,'2012-12-10','1990',208,1),(9782,18,2,'2013-01-08','1990',208,1),(9783,19,2,'2013-02-08','1990',208,1),(9784,20,2,'2013-03-08','1990',208,1),(9785,21,2,'2013-04-08','1990',208,1),(9786,22,2,'2013-05-08','1990',208,1),(9787,23,2,'2013-06-10','1990',208,1),(9788,24,2,'2013-07-08','1990',208,1),(9789,25,2,'2013-08-08','1990',208,1),(9790,26,2,'2013-09-09','1990',208,1),(9791,27,2,'2013-10-08','1990',208,1),(9792,28,2,'2013-11-08','1990',208,1),(9793,29,2,'2013-12-09','1990',208,1),(9794,30,2,'2014-01-08','1990',208,1),(9795,31,2,'2014-02-10','1990',208,1),(9796,32,2,'2014-03-10','1990',208,1),(9797,33,2,'2014-04-08','1990',208,1),(9798,34,2,'2014-05-08','1990',208,1),(9799,35,2,'2014-06-09','1990',208,1),(9800,36,2,'2014-07-08','1990',208,1),(9801,37,2,'2014-08-08','1990',208,1),(9802,38,2,'2014-09-08','1990',208,1),(9803,39,2,'2014-10-08','1990',208,1),(9804,40,2,'2014-11-10','1990',208,1),(9805,41,2,'2014-12-08','1990',208,1),(9806,42,2,'2015-01-08','1990',208,1),(9807,43,2,'2015-02-09','1990',208,1),(9808,44,2,'2015-03-09','1990',208,1),(9809,45,2,'2015-04-08','1990',208,1),(9810,46,2,'2015-05-08','1990',208,1),(9811,47,2,'2015-06-08','1990',208,1),(9812,48,2,'2015-07-08','1990',208,1),(9813,1,2,'2011-08-31','1990',209,1),(9814,2,2,'2011-09-08','1990',209,1),(9815,3,2,'2011-10-10','1990',209,1),(9816,4,2,'2011-11-08','1990',209,1),(9817,5,2,'2011-12-08','1990',209,1),(9818,6,2,'2012-01-09','1990',209,1),(9819,7,2,'2012-02-08','1990',209,1),(9820,8,2,'2012-03-08','1990',209,1),(9821,9,2,'2012-04-11','1990',209,1),(9822,10,2,'2012-05-08','1990',209,1),(9823,11,2,'2012-06-08','1990',209,1),(9824,12,2,'2012-07-09','1990',209,1),(9825,13,2,'2012-08-08','1990',209,1),(9826,14,2,'2012-09-10','1990',209,1),(9827,15,2,'2012-10-08','1990',209,1),(9828,16,2,'2012-11-08','1990',209,1),(9829,17,2,'2012-12-10','1990',209,1),(9830,18,2,'2013-01-08','1990',209,1),(9831,19,2,'2013-02-08','1990',209,1),(9832,20,2,'2013-03-08','1990',209,1),(9833,21,2,'2013-04-08','1990',209,1),(9834,22,2,'2013-05-08','1990',209,1),(9835,23,2,'2013-06-10','1990',209,1),(9836,24,2,'2013-07-08','1990',209,1),(9837,25,2,'2013-08-08','1990',209,1),(9838,26,2,'2013-09-09','1990',209,1),(9839,27,2,'2013-10-08','1990',209,1),(9840,28,2,'2013-11-08','1990',209,1),(9841,29,2,'2013-12-09','1990',209,1),(9842,30,2,'2014-01-08','1990',209,1),(9843,31,2,'2014-02-10','1990',209,1),(9844,32,2,'2014-03-10','1990',209,1),(9845,33,2,'2014-04-08','1990',209,1),(9846,34,2,'2014-05-08','1990',209,1),(9847,35,2,'2014-06-09','1990',209,1),(9848,36,2,'2014-07-08','1990',209,1),(9849,37,2,'2014-08-08','1990',209,1),(9850,38,2,'2014-09-08','1990',209,1),(9851,39,2,'2014-10-08','1990',209,1),(9852,40,2,'2014-11-10','1990',209,1),(9853,41,2,'2014-12-08','1990',209,1),(9854,42,2,'2015-01-08','1990',209,1),(9855,43,2,'2015-02-09','1990',209,1),(9856,44,2,'2015-03-09','1990',209,1),(9857,45,2,'2015-04-08','1990',209,1),(9858,46,2,'2015-05-08','1990',209,1),(9859,47,2,'2015-06-08','1990',209,1),(9860,48,2,'2015-07-08','1990',209,1),(9861,1,2,'2011-08-31','1990',210,1),(9862,2,2,'2011-09-08','1990',210,1),(9863,3,2,'2011-10-10','1990',210,1),(9864,4,2,'2011-11-08','1990',210,1),(9865,5,2,'2011-12-08','1990',210,1),(9866,6,2,'2012-01-09','1990',210,1),(9867,7,2,'2012-02-08','1990',210,1),(9868,8,2,'2012-03-08','1990',210,1),(9869,9,2,'2012-04-11','1990',210,1),(9870,10,2,'2012-05-08','1990',210,1),(9871,11,2,'2012-06-08','1990',210,1),(9872,12,2,'2012-07-09','1990',210,1),(9873,13,2,'2012-08-08','1990',210,1),(9874,14,2,'2012-09-10','1990',210,1),(9875,15,2,'2012-10-08','1990',210,1),(9876,16,2,'2012-11-08','1990',210,1),(9877,17,2,'2012-12-10','1990',210,1),(9878,18,2,'2013-01-08','1990',210,1),(9879,19,2,'2013-02-08','1990',210,1),(9880,20,2,'2013-03-08','1990',210,1),(9881,21,2,'2013-04-08','1990',210,1),(9882,22,2,'2013-05-08','1990',210,1),(9883,23,2,'2013-06-10','1990',210,1),(9884,24,2,'2013-07-08','1990',210,1),(9885,25,2,'2013-08-08','1990',210,1),(9886,26,2,'2013-09-09','1990',210,1),(9887,27,2,'2013-10-08','1990',210,1),(9888,28,2,'2013-11-08','1990',210,1),(9889,29,2,'2013-12-09','1990',210,1),(9890,30,2,'2014-01-08','1990',210,1),(9891,31,2,'2014-02-10','1990',210,1),(9892,32,2,'2014-03-10','1990',210,1),(9893,33,2,'2014-04-08','1990',210,1),(9894,34,2,'2014-05-08','1990',210,1),(9895,35,2,'2014-06-09','1990',210,1),(9896,36,2,'2014-07-08','1990',210,1),(9897,37,2,'2014-08-08','1990',210,1),(9898,38,2,'2014-09-08','1990',210,1),(9899,39,2,'2014-10-08','1990',210,1),(9900,40,2,'2014-11-10','1990',210,1),(9901,41,2,'2014-12-08','1990',210,1),(9902,42,2,'2015-01-08','1990',210,1),(9903,43,2,'2015-02-09','1990',210,1),(9904,44,2,'2015-03-09','1990',210,1),(9905,45,2,'2015-04-08','1990',210,1),(9906,46,2,'2015-05-08','1990',210,1),(9907,47,2,'2015-06-08','1990',210,1),(9908,48,2,'2015-07-08','1990',210,1),(9909,1,2,'2011-08-31','1990',211,1),(9910,2,2,'2011-09-08','1990',211,1),(9911,3,2,'2011-10-10','1990',211,1),(9912,4,2,'2011-11-08','1990',211,1),(9913,5,2,'2011-12-08','1990',211,1),(9914,6,2,'2012-01-09','1990',211,1),(9915,7,2,'2012-02-08','1990',211,1),(9916,8,2,'2012-03-08','1990',211,1),(9917,9,2,'2012-04-11','1990',211,1),(9918,10,2,'2012-05-08','1990',211,1),(9919,11,2,'2012-06-08','1990',211,1),(9920,12,2,'2012-07-09','1990',211,1),(9921,13,2,'2012-08-08','1990',211,1),(9922,14,2,'2012-09-10','1990',211,1),(9923,15,2,'2012-10-08','1990',211,1),(9924,16,2,'2012-11-08','1990',211,1),(9925,17,2,'2012-12-10','1990',211,1),(9926,18,2,'2013-01-08','1990',211,1),(9927,19,2,'2013-02-08','1990',211,1),(9928,20,2,'2013-03-08','1990',211,1),(9929,21,2,'2013-04-08','1990',211,1),(9930,22,2,'2013-05-08','1990',211,1),(9931,23,2,'2013-06-10','1990',211,1),(9932,24,2,'2013-07-08','1990',211,1),(9933,25,2,'2013-08-08','1990',211,1),(9934,26,2,'2013-09-09','1990',211,1),(9935,27,2,'2013-10-08','1990',211,1),(9936,28,2,'2013-11-08','1990',211,1),(9937,29,2,'2013-12-09','1990',211,1),(9938,30,2,'2014-01-08','1990',211,1),(9939,31,2,'2014-02-10','1990',211,1),(9940,32,2,'2014-03-10','1990',211,1),(9941,33,2,'2014-04-08','1990',211,1),(9942,34,2,'2014-05-08','1990',211,1),(9943,35,2,'2014-06-09','1990',211,1),(9944,36,2,'2014-07-08','1990',211,1),(9945,37,2,'2014-08-08','1990',211,1),(9946,38,2,'2014-09-08','1990',211,1),(9947,39,2,'2014-10-08','1990',211,1),(9948,40,2,'2014-11-10','1990',211,1),(9949,41,2,'2014-12-08','1990',211,1),(9950,42,2,'2015-01-08','1990',211,1),(9951,43,2,'2015-02-09','1990',211,1),(9952,44,2,'2015-03-09','1990',211,1),(9953,45,2,'2015-04-08','1990',211,1),(9954,46,2,'2015-05-08','1990',211,1),(9955,47,2,'2015-06-08','1990',211,1),(9956,48,2,'2015-07-08','1990',211,1),(9957,1,2,'2011-08-31','1990',212,1),(9958,2,2,'2011-09-08','1990',212,1),(9959,3,2,'2011-10-10','1990',212,1),(9960,4,2,'2011-11-08','1990',212,1),(9961,5,2,'2011-12-08','1990',212,1),(9962,6,2,'2012-01-09','1990',212,1),(9963,7,2,'2012-02-08','1990',212,1),(9964,8,2,'2012-03-08','1990',212,1),(9965,9,2,'2012-04-11','1990',212,1),(9966,10,2,'2012-05-08','1990',212,1),(9967,11,2,'2012-06-08','1990',212,1),(9968,12,2,'2012-07-09','1990',212,1),(9969,13,2,'2012-08-08','1990',212,1),(9970,14,2,'2012-09-10','1990',212,1),(9971,15,2,'2012-10-08','1990',212,1),(9972,16,2,'2012-11-08','1990',212,1),(9973,17,2,'2012-12-10','1990',212,1),(9974,18,2,'2013-01-08','1990',212,1),(9975,19,2,'2013-02-08','1990',212,1),(9976,20,2,'2013-03-08','1990',212,1),(9977,21,2,'2013-04-08','1990',212,1),(9978,22,2,'2013-05-08','1990',212,1),(9979,23,2,'2013-06-10','1990',212,1),(9980,24,2,'2013-07-08','1990',212,1),(9981,25,2,'2013-08-08','1990',212,1),(9982,26,2,'2013-09-09','1990',212,1),(9983,27,2,'2013-10-08','1990',212,1),(9984,28,2,'2013-11-08','1990',212,1),(9985,29,2,'2013-12-09','1990',212,1),(9986,30,2,'2014-01-08','1990',212,1),(9987,31,2,'2014-02-10','1990',212,1),(9988,32,2,'2014-03-10','1990',212,1),(9989,33,2,'2014-04-08','1990',212,1),(9990,34,2,'2014-05-08','1990',212,1),(9991,35,2,'2014-06-09','1990',212,1),(9992,36,2,'2014-07-08','1990',212,1),(9993,37,2,'2014-08-08','1990',212,1),(9994,38,2,'2014-09-08','1990',212,1),(9995,39,2,'2014-10-08','1990',212,1),(9996,40,2,'2014-11-10','1990',212,1),(9997,41,2,'2014-12-08','1990',212,1),(9998,42,2,'2015-01-08','1990',212,1),(9999,43,2,'2015-02-09','1990',212,1),(10000,44,2,'2015-03-09','1990',212,1),(10001,45,2,'2015-04-08','1990',212,1),(10002,46,2,'2015-05-08','1990',212,1),(10003,47,2,'2015-06-08','1990',212,1),(10004,48,2,'2015-07-08','1990',212,1),(10005,1,2,'2011-08-31','1990',213,1),(10006,2,2,'2011-09-08','1990',213,1),(10007,3,2,'2011-10-10','1990',213,1),(10008,4,2,'2011-11-08','1990',213,1),(10009,5,2,'2011-12-08','1990',213,1),(10010,6,2,'2012-01-09','1990',213,1),(10011,7,2,'2012-02-08','1990',213,1),(10012,8,2,'2012-03-08','1990',213,1),(10013,9,2,'2012-04-11','1990',213,1),(10014,10,2,'2012-05-08','1990',213,1),(10015,11,2,'2012-06-08','1990',213,1),(10016,12,2,'2012-07-09','1990',213,1),(10017,13,2,'2012-08-08','1990',213,1),(10018,14,2,'2012-09-10','1990',213,1),(10019,15,2,'2012-10-08','1990',213,1),(10020,16,2,'2012-11-08','1990',213,1),(10021,17,2,'2012-12-10','1990',213,1),(10022,18,2,'2013-01-08','1990',213,1),(10023,19,2,'2013-02-08','1990',213,1),(10024,20,2,'2013-03-08','1990',213,1),(10025,21,2,'2013-04-08','1990',213,1),(10026,22,2,'2013-05-08','1990',213,1),(10027,23,2,'2013-06-10','1990',213,1),(10028,24,2,'2013-07-08','1990',213,1),(10029,25,2,'2013-08-08','1990',213,1),(10030,26,2,'2013-09-09','1990',213,1),(10031,27,2,'2013-10-08','1990',213,1),(10032,28,2,'2013-11-08','1990',213,1),(10033,29,2,'2013-12-09','1990',213,1),(10034,30,2,'2014-01-08','1990',213,1),(10035,31,2,'2014-02-10','1990',213,1),(10036,32,2,'2014-03-10','1990',213,1),(10037,33,2,'2014-04-08','1990',213,1),(10038,34,2,'2014-05-08','1990',213,1),(10039,35,2,'2014-06-09','1990',213,1),(10040,36,2,'2014-07-08','1990',213,1),(10041,37,2,'2014-08-08','1990',213,1),(10042,38,2,'2014-09-08','1990',213,1),(10043,39,2,'2014-10-08','1990',213,1),(10044,40,2,'2014-11-10','1990',213,1),(10045,41,2,'2014-12-08','1990',213,1),(10046,42,2,'2015-01-08','1990',213,1),(10047,43,2,'2015-02-09','1990',213,1),(10048,44,2,'2015-03-09','1990',213,1),(10049,45,2,'2015-04-08','1990',213,1),(10050,46,2,'2015-05-08','1990',213,1),(10051,47,2,'2015-06-08','1990',213,1),(10052,48,2,'2015-07-08','1990',213,1),(10053,1,2,'2011-08-31','1990',214,1),(10054,2,2,'2011-09-08','1990',214,1),(10055,3,2,'2011-10-10','1990',214,1),(10056,4,2,'2011-11-08','1990',214,1),(10057,5,2,'2011-12-08','1990',214,1),(10058,6,2,'2012-01-09','1990',214,1),(10059,7,2,'2012-02-08','1990',214,1),(10060,8,2,'2012-03-08','1990',214,1),(10061,9,2,'2012-04-11','1990',214,1),(10062,10,2,'2012-05-08','1990',214,1),(10063,11,2,'2012-06-08','1990',214,1),(10064,12,2,'2012-07-09','1990',214,1),(10065,13,2,'2012-08-08','1990',214,1),(10066,14,2,'2012-09-10','1990',214,1),(10067,15,2,'2012-10-08','1990',214,1),(10068,16,2,'2012-11-08','1990',214,1),(10069,17,2,'2012-12-10','1990',214,1),(10070,18,2,'2013-01-08','1990',214,1),(10071,19,2,'2013-02-08','1990',214,1),(10072,20,2,'2013-03-08','1990',214,1),(10073,21,2,'2013-04-08','1990',214,1),(10074,22,2,'2013-05-08','1990',214,1),(10075,23,2,'2013-06-10','1990',214,1),(10076,24,2,'2013-07-08','1990',214,1),(10077,25,2,'2013-08-08','1990',214,1),(10078,26,2,'2013-09-09','1990',214,1),(10079,27,2,'2013-10-08','1990',214,1),(10080,28,2,'2013-11-08','1990',214,1),(10081,29,2,'2013-12-09','1990',214,1),(10082,30,2,'2014-01-08','1990',214,1),(10083,31,2,'2014-02-10','1990',214,1),(10084,32,2,'2014-03-10','1990',214,1),(10085,33,2,'2014-04-08','1990',214,1),(10086,34,2,'2014-05-08','1990',214,1),(10087,35,2,'2014-06-09','1990',214,1),(10088,36,2,'2014-07-08','1990',214,1),(10089,37,2,'2014-08-08','1990',214,1),(10090,38,2,'2014-09-08','1990',214,1),(10091,39,2,'2014-10-08','1990',214,1),(10092,40,2,'2014-11-10','1990',214,1),(10093,41,2,'2014-12-08','1990',214,1),(10094,42,2,'2015-01-08','1990',214,1),(10095,43,2,'2015-02-09','1990',214,1),(10096,44,2,'2015-03-09','1990',214,1),(10097,45,2,'2015-04-08','1990',214,1),(10098,46,2,'2015-05-08','1990',214,1),(10099,47,2,'2015-06-08','1990',214,1),(10100,48,2,'2015-07-08','1990',214,1),(10101,1,2,'2011-08-31','1990',215,1),(10102,2,2,'2011-09-08','1990',215,1),(10103,3,2,'2011-10-10','1990',215,1),(10104,4,2,'2011-11-08','1990',215,1),(10105,5,2,'2011-12-08','1990',215,1),(10106,6,2,'2012-01-09','1990',215,1),(10107,7,2,'2012-02-08','1990',215,1),(10108,8,2,'2012-03-08','1990',215,1),(10109,9,2,'2012-04-11','1990',215,1),(10110,10,2,'2012-05-08','1990',215,1),(10111,11,2,'2012-06-08','1990',215,1),(10112,12,2,'2012-07-09','1990',215,1),(10113,13,2,'2012-08-08','1990',215,1),(10114,14,2,'2012-09-10','1990',215,1),(10115,15,2,'2012-10-08','1990',215,1),(10116,16,2,'2012-11-08','1990',215,1),(10117,17,2,'2012-12-10','1990',215,1),(10118,18,2,'2013-01-08','1990',215,1),(10119,19,2,'2013-02-08','1990',215,1),(10120,20,2,'2013-03-08','1990',215,1),(10121,21,2,'2013-04-08','1990',215,1),(10122,22,2,'2013-05-08','1990',215,1),(10123,23,2,'2013-06-10','1990',215,1),(10124,24,2,'2013-07-08','1990',215,1),(10125,25,2,'2013-08-08','1990',215,1),(10126,26,2,'2013-09-09','1990',215,1),(10127,27,2,'2013-10-08','1990',215,1),(10128,28,2,'2013-11-08','1990',215,1),(10129,29,2,'2013-12-09','1990',215,1),(10130,30,2,'2014-01-08','1990',215,1),(10131,31,2,'2014-02-10','1990',215,1),(10132,32,2,'2014-03-10','1990',215,1),(10133,33,2,'2014-04-08','1990',215,1),(10134,34,2,'2014-05-08','1990',215,1),(10135,35,2,'2014-06-09','1990',215,1),(10136,36,2,'2014-07-08','1990',215,1),(10137,37,2,'2014-08-08','1990',215,1),(10138,38,2,'2014-09-08','1990',215,1),(10139,39,2,'2014-10-08','1990',215,1),(10140,40,2,'2014-11-10','1990',215,1),(10141,41,2,'2014-12-08','1990',215,1),(10142,42,2,'2015-01-08','1990',215,1),(10143,43,2,'2015-02-09','1990',215,1),(10144,44,2,'2015-03-09','1990',215,1),(10145,45,2,'2015-04-08','1990',215,1),(10146,46,2,'2015-05-08','1990',215,1),(10147,47,2,'2015-06-08','1990',215,1),(10148,48,2,'2015-07-08','1990',215,1),(10149,1,2,'2011-08-31','1990',216,1),(10150,2,2,'2011-09-08','1990',216,1),(10151,3,2,'2011-10-10','1990',216,1),(10152,4,2,'2011-11-08','1990',216,1),(10153,5,2,'2011-12-08','1990',216,1),(10154,6,2,'2012-01-09','1990',216,1),(10155,7,2,'2012-02-08','1990',216,1),(10156,8,2,'2012-03-08','1990',216,1),(10157,9,2,'2012-04-11','1990',216,1),(10158,10,2,'2012-05-08','1990',216,1),(10159,11,2,'2012-06-08','1990',216,1),(10160,12,2,'2012-07-09','1990',216,1),(10161,13,2,'2012-08-08','1990',216,1),(10162,14,2,'2012-09-10','1990',216,1),(10163,15,2,'2012-10-08','1990',216,1),(10164,16,2,'2012-11-08','1990',216,1),(10165,17,2,'2012-12-10','1990',216,1),(10166,18,2,'2013-01-08','1990',216,1),(10167,19,2,'2013-02-08','1990',216,1),(10168,20,2,'2013-03-08','1990',216,1),(10169,21,2,'2013-04-08','1990',216,1),(10170,22,2,'2013-05-08','1990',216,1),(10171,23,2,'2013-06-10','1990',216,1),(10172,24,2,'2013-07-08','1990',216,1),(10173,25,2,'2013-08-08','1990',216,1),(10174,26,2,'2013-09-09','1990',216,1),(10175,27,2,'2013-10-08','1990',216,1),(10176,28,2,'2013-11-08','1990',216,1),(10177,29,2,'2013-12-09','1990',216,1),(10178,30,2,'2014-01-08','1990',216,1),(10179,31,2,'2014-02-10','1990',216,1),(10180,32,2,'2014-03-10','1990',216,1),(10181,33,2,'2014-04-08','1990',216,1),(10182,34,2,'2014-05-08','1990',216,1),(10183,35,2,'2014-06-09','1990',216,1),(10184,36,2,'2014-07-08','1990',216,1),(10185,37,2,'2014-08-08','1990',216,1),(10186,38,2,'2014-09-08','1990',216,1),(10187,39,2,'2014-10-08','1990',216,1),(10188,40,2,'2014-11-10','1990',216,1),(10189,41,2,'2014-12-08','1990',216,1),(10190,42,2,'2015-01-08','1990',216,1),(10191,43,2,'2015-02-09','1990',216,1),(10192,44,2,'2015-03-09','1990',216,1),(10193,45,2,'2015-04-08','1990',216,1),(10194,46,2,'2015-05-08','1990',216,1),(10195,47,2,'2015-06-08','1990',216,1),(10196,48,2,'2015-07-08','1990',216,1),(10197,1,2,'2011-08-31','1990',217,1),(10198,2,2,'2011-09-08','1990',217,1),(10199,3,2,'2011-10-10','1990',217,1),(10200,4,2,'2011-11-08','1990',217,1),(10201,5,2,'2011-12-08','1990',217,1),(10202,6,2,'2012-01-09','1990',217,1),(10203,7,2,'2012-02-08','1990',217,1),(10204,8,2,'2012-03-08','1990',217,1),(10205,9,2,'2012-04-11','1990',217,1),(10206,10,2,'2012-05-08','1990',217,1),(10207,11,2,'2012-06-08','1990',217,1),(10208,12,2,'2012-07-09','1990',217,1),(10209,13,2,'2012-08-08','1990',217,1),(10210,14,2,'2012-09-10','1990',217,1),(10211,15,2,'2012-10-08','1990',217,1),(10212,16,2,'2012-11-08','1990',217,1),(10213,17,2,'2012-12-10','1990',217,1),(10214,18,2,'2013-01-08','1990',217,1),(10215,19,2,'2013-02-08','1990',217,1),(10216,20,2,'2013-03-08','1990',217,1),(10217,21,2,'2013-04-08','1990',217,1),(10218,22,2,'2013-05-08','1990',217,1),(10219,23,2,'2013-06-10','1990',217,1),(10220,24,2,'2013-07-08','1990',217,1),(10221,25,2,'2013-08-08','1990',217,1),(10222,26,2,'2013-09-09','1990',217,1),(10223,27,2,'2013-10-08','1990',217,1),(10224,28,2,'2013-11-08','1990',217,1),(10225,29,2,'2013-12-09','1990',217,1),(10226,30,2,'2014-01-08','1990',217,1),(10227,31,2,'2014-02-10','1990',217,1),(10228,32,2,'2014-03-10','1990',217,1),(10229,33,2,'2014-04-08','1990',217,1),(10230,34,2,'2014-05-08','1990',217,1),(10231,35,2,'2014-06-09','1990',217,1),(10232,36,2,'2014-07-08','1990',217,1),(10233,37,2,'2014-08-08','1990',217,1),(10234,38,2,'2014-09-08','1990',217,1),(10235,39,2,'2014-10-08','1990',217,1),(10236,40,2,'2014-11-10','1990',217,1),(10237,41,2,'2014-12-08','1990',217,1),(10238,42,2,'2015-01-08','1990',217,1),(10239,43,2,'2015-02-09','1990',217,1),(10240,44,2,'2015-03-09','1990',217,1),(10241,45,2,'2015-04-08','1990',217,1),(10242,46,2,'2015-05-08','1990',217,1),(10243,47,2,'2015-06-08','1990',217,1),(10244,48,2,'2015-07-08','1990',217,1),(10245,1,2,'2011-08-31','1990',218,1),(10246,2,2,'2011-09-08','1990',218,1),(10247,3,2,'2011-10-10','1990',218,1),(10248,4,2,'2011-11-08','1990',218,1),(10249,5,2,'2011-12-08','1990',218,1),(10250,6,2,'2012-01-09','1990',218,1),(10251,7,2,'2012-02-08','1990',218,1),(10252,8,2,'2012-03-08','1990',218,1),(10253,9,2,'2012-04-11','1990',218,1),(10254,10,2,'2012-05-08','1990',218,1),(10255,11,2,'2012-06-08','1990',218,1),(10256,12,2,'2012-07-09','1990',218,1),(10257,13,2,'2012-08-08','1990',218,1),(10258,14,2,'2012-09-10','1990',218,1),(10259,15,2,'2012-10-08','1990',218,1),(10260,16,2,'2012-11-08','1990',218,1),(10261,17,2,'2012-12-10','1990',218,1),(10262,18,2,'2013-01-08','1990',218,1),(10263,19,2,'2013-02-08','1990',218,1),(10264,20,2,'2013-03-08','1990',218,1),(10265,21,2,'2013-04-08','1990',218,1),(10266,22,2,'2013-05-08','1990',218,1),(10267,23,2,'2013-06-10','1990',218,1),(10268,24,2,'2013-07-08','1990',218,1),(10269,25,2,'2013-08-08','1990',218,1),(10270,26,2,'2013-09-09','1990',218,1),(10271,27,2,'2013-10-08','1990',218,1),(10272,28,2,'2013-11-08','1990',218,1),(10273,29,2,'2013-12-09','1990',218,1),(10274,30,2,'2014-01-08','1990',218,1),(10275,31,2,'2014-02-10','1990',218,1),(10276,32,2,'2014-03-10','1990',218,1),(10277,33,2,'2014-04-08','1990',218,1),(10278,34,2,'2014-05-08','1990',218,1),(10279,35,2,'2014-06-09','1990',218,1),(10280,36,2,'2014-07-08','1990',218,1),(10281,37,2,'2014-08-08','1990',218,1),(10282,38,2,'2014-09-08','1990',218,1),(10283,39,2,'2014-10-08','1990',218,1),(10284,40,2,'2014-11-10','1990',218,1),(10285,41,2,'2014-12-08','1990',218,1),(10286,42,2,'2015-01-08','1990',218,1),(10287,43,2,'2015-02-09','1990',218,1),(10288,44,2,'2015-03-09','1990',218,1),(10289,45,2,'2015-04-08','1990',218,1),(10290,46,2,'2015-05-08','1990',218,1),(10291,47,2,'2015-06-08','1990',218,1),(10292,48,2,'2015-07-08','1990',218,1),(10293,1,2,'2011-08-31','1990',219,1),(10294,2,2,'2011-09-08','1990',219,1),(10295,3,2,'2011-10-10','1990',219,1),(10296,4,2,'2011-11-08','1990',219,1),(10297,5,2,'2011-12-08','1990',219,1),(10298,6,2,'2012-01-09','1990',219,1),(10299,7,2,'2012-02-08','1990',219,1),(10300,8,2,'2012-03-08','1990',219,1),(10301,9,2,'2012-04-11','1990',219,1),(10302,10,2,'2012-05-08','1990',219,1),(10303,11,2,'2012-06-08','1990',219,1),(10304,12,2,'2012-07-09','1990',219,1),(10305,13,2,'2012-08-08','1990',219,1),(10306,14,2,'2012-09-10','1990',219,1),(10307,15,2,'2012-10-08','1990',219,1),(10308,16,2,'2012-11-08','1990',219,1),(10309,17,2,'2012-12-10','1990',219,1),(10310,18,2,'2013-01-08','1990',219,1),(10311,19,2,'2013-02-08','1990',219,1),(10312,20,2,'2013-03-08','1990',219,1),(10313,21,2,'2013-04-08','1990',219,1),(10314,22,2,'2013-05-08','1990',219,1),(10315,23,2,'2013-06-10','1990',219,1),(10316,24,2,'2013-07-08','1990',219,1),(10317,25,2,'2013-08-08','1990',219,1),(10318,26,2,'2013-09-09','1990',219,1),(10319,27,2,'2013-10-08','1990',219,1),(10320,28,2,'2013-11-08','1990',219,1),(10321,29,2,'2013-12-09','1990',219,1),(10322,30,2,'2014-01-08','1990',219,1),(10323,31,2,'2014-02-10','1990',219,1),(10324,32,2,'2014-03-10','1990',219,1),(10325,33,2,'2014-04-08','1990',219,1),(10326,34,2,'2014-05-08','1990',219,1),(10327,35,2,'2014-06-09','1990',219,1),(10328,36,2,'2014-07-08','1990',219,1),(10329,37,2,'2014-08-08','1990',219,1),(10330,38,2,'2014-09-08','1990',219,1),(10331,39,2,'2014-10-08','1990',219,1),(10332,40,2,'2014-11-10','1990',219,1),(10333,41,2,'2014-12-08','1990',219,1),(10334,42,2,'2015-01-08','1990',219,1),(10335,43,2,'2015-02-09','1990',219,1),(10336,44,2,'2015-03-09','1990',219,1),(10337,45,2,'2015-04-08','1990',219,1),(10338,46,2,'2015-05-08','1990',219,1),(10339,47,2,'2015-06-08','1990',219,1),(10340,48,2,'2015-07-08','1990',219,1),(10341,1,2,'2011-08-31','1990',220,1),(10342,2,2,'2011-09-08','1990',220,1),(10343,3,2,'2011-10-10','1990',220,1),(10344,4,2,'2011-11-08','1990',220,1),(10345,5,2,'2011-12-08','1990',220,1),(10346,6,2,'2012-01-09','1990',220,1),(10347,7,2,'2012-02-08','1990',220,1),(10348,8,2,'2012-03-08','1990',220,1),(10349,9,2,'2012-04-11','1990',220,1),(10350,10,2,'2012-05-08','1990',220,1),(10351,11,2,'2012-06-08','1990',220,1),(10352,12,2,'2012-07-09','1990',220,1),(10353,13,2,'2012-08-08','1990',220,1),(10354,14,2,'2012-09-10','1990',220,1),(10355,15,2,'2012-10-08','1990',220,1),(10356,16,2,'2012-11-08','1990',220,1),(10357,17,2,'2012-12-10','1990',220,1),(10358,18,2,'2013-01-08','1990',220,1),(10359,19,2,'2013-02-08','1990',220,1),(10360,20,2,'2013-03-08','1990',220,1),(10361,21,2,'2013-04-08','1990',220,1),(10362,22,2,'2013-05-08','1990',220,1),(10363,23,2,'2013-06-10','1990',220,1),(10364,24,2,'2013-07-08','1990',220,1),(10365,25,2,'2013-08-08','1990',220,1),(10366,26,2,'2013-09-09','1990',220,1),(10367,27,2,'2013-10-08','1990',220,1),(10368,28,2,'2013-11-08','1990',220,1),(10369,29,2,'2013-12-09','1990',220,1),(10370,30,2,'2014-01-08','1990',220,1),(10371,31,2,'2014-02-10','1990',220,1),(10372,32,2,'2014-03-10','1990',220,1),(10373,33,2,'2014-04-08','1990',220,1),(10374,34,2,'2014-05-08','1990',220,1),(10375,35,2,'2014-06-09','1990',220,1),(10376,36,2,'2014-07-08','1990',220,1),(10377,37,2,'2014-08-08','1990',220,1),(10378,38,2,'2014-09-08','1990',220,1),(10379,39,2,'2014-10-08','1990',220,1),(10380,40,2,'2014-11-10','1990',220,1),(10381,41,2,'2014-12-08','1990',220,1),(10382,42,2,'2015-01-08','1990',220,1),(10383,43,2,'2015-02-09','1990',220,1),(10384,44,2,'2015-03-09','1990',220,1),(10385,45,2,'2015-04-08','1990',220,1),(10386,46,2,'2015-05-08','1990',220,1),(10387,47,2,'2015-06-08','1990',220,1),(10388,48,2,'2015-07-08','1990',220,1),(10389,1,2,'2011-08-31','1990',221,1),(10390,2,2,'2011-09-08','1990',221,1),(10391,3,2,'2011-10-10','1990',221,1),(10392,4,2,'2011-11-08','1990',221,1),(10393,5,2,'2011-12-08','1990',221,1),(10394,6,2,'2012-01-09','1990',221,1),(10395,7,2,'2012-02-08','1990',221,1),(10396,8,2,'2012-03-08','1990',221,1),(10397,9,2,'2012-04-11','1990',221,1),(10398,10,2,'2012-05-08','1990',221,1),(10399,11,2,'2012-06-08','1990',221,1),(10400,12,2,'2012-07-09','1990',221,1),(10401,13,2,'2012-08-08','1990',221,1),(10402,14,2,'2012-09-10','1990',221,1),(10403,15,2,'2012-10-08','1990',221,1),(10404,16,2,'2012-11-08','1990',221,1),(10405,17,2,'2012-12-10','1990',221,1),(10406,18,2,'2013-01-08','1990',221,1),(10407,19,2,'2013-02-08','1990',221,1),(10408,20,2,'2013-03-08','1990',221,1),(10409,21,2,'2013-04-08','1990',221,1),(10410,22,2,'2013-05-08','1990',221,1),(10411,23,2,'2013-06-10','1990',221,1),(10412,24,2,'2013-07-08','1990',221,1),(10413,25,2,'2013-08-08','1990',221,1),(10414,26,2,'2013-09-09','1990',221,1),(10415,27,2,'2013-10-08','1990',221,1),(10416,28,2,'2013-11-08','1990',221,1),(10417,29,2,'2013-12-09','1990',221,1),(10418,30,2,'2014-01-08','1990',221,1),(10419,31,2,'2014-02-10','1990',221,1),(10420,32,2,'2014-03-10','1990',221,1),(10421,33,2,'2014-04-08','1990',221,1),(10422,34,2,'2014-05-08','1990',221,1),(10423,35,2,'2014-06-09','1990',221,1),(10424,36,2,'2014-07-08','1990',221,1),(10425,37,2,'2014-08-08','1990',221,1),(10426,38,2,'2014-09-08','1990',221,1),(10427,39,2,'2014-10-08','1990',221,1),(10428,40,2,'2014-11-10','1990',221,1),(10429,41,2,'2014-12-08','1990',221,1),(10430,42,2,'2015-01-08','1990',221,1),(10431,43,2,'2015-02-09','1990',221,1),(10432,44,2,'2015-03-09','1990',221,1),(10433,45,2,'2015-04-08','1990',221,1),(10434,46,2,'2015-05-08','1990',221,1),(10435,47,2,'2015-06-08','1990',221,1),(10436,48,2,'2015-07-08','1990',221,1),(10437,1,2,'2011-08-31','1990',222,1),(10438,2,2,'2011-09-08','1990',222,1),(10439,3,2,'2011-10-10','1990',222,1),(10440,4,2,'2011-11-08','1990',222,1),(10441,5,2,'2011-12-08','1990',222,1),(10442,6,2,'2012-01-09','1990',222,1),(10443,7,2,'2012-02-08','1990',222,1),(10444,8,2,'2012-03-08','1990',222,1),(10445,9,2,'2012-04-11','1990',222,1),(10446,10,2,'2012-05-08','1990',222,1),(10447,11,2,'2012-06-08','1990',222,1),(10448,12,2,'2012-07-09','1990',222,1),(10449,13,2,'2012-08-08','1990',222,1),(10450,14,2,'2012-09-10','1990',222,1),(10451,15,2,'2012-10-08','1990',222,1),(10452,16,2,'2012-11-08','1990',222,1),(10453,17,2,'2012-12-10','1990',222,1),(10454,18,2,'2013-01-08','1990',222,1),(10455,19,2,'2013-02-08','1990',222,1),(10456,20,2,'2013-03-08','1990',222,1),(10457,21,2,'2013-04-08','1990',222,1),(10458,22,2,'2013-05-08','1990',222,1),(10459,23,2,'2013-06-10','1990',222,1),(10460,24,2,'2013-07-08','1990',222,1),(10461,25,2,'2013-08-08','1990',222,1),(10462,26,2,'2013-09-09','1990',222,1),(10463,27,2,'2013-10-08','1990',222,1),(10464,28,2,'2013-11-08','1990',222,1),(10465,29,2,'2013-12-09','1990',222,1),(10466,30,2,'2014-01-08','1990',222,1),(10467,31,2,'2014-02-10','1990',222,1),(10468,32,2,'2014-03-10','1990',222,1),(10469,33,2,'2014-04-08','1990',222,1),(10470,34,2,'2014-05-08','1990',222,1),(10471,35,2,'2014-06-09','1990',222,1),(10472,36,2,'2014-07-08','1990',222,1),(10473,37,2,'2014-08-08','1990',222,1),(10474,38,2,'2014-09-08','1990',222,1),(10475,39,2,'2014-10-08','1990',222,1),(10476,40,2,'2014-11-10','1990',222,1),(10477,41,2,'2014-12-08','1990',222,1),(10478,42,2,'2015-01-08','1990',222,1),(10479,43,2,'2015-02-09','1990',222,1),(10480,44,2,'2015-03-09','1990',222,1),(10481,45,2,'2015-04-08','1990',222,1),(10482,46,2,'2015-05-08','1990',222,1),(10483,47,2,'2015-06-08','1990',222,1),(10484,48,2,'2015-07-08','1990',222,1),(10485,1,2,'2011-08-31','1990',223,1),(10486,2,2,'2011-09-08','1990',223,1),(10487,3,2,'2011-10-10','1990',223,1),(10488,4,2,'2011-11-08','1990',223,1),(10489,5,2,'2011-12-08','1990',223,1),(10490,6,2,'2012-01-09','1990',223,1),(10491,7,2,'2012-02-08','1990',223,1),(10492,8,2,'2012-03-08','1990',223,1),(10493,9,2,'2012-04-11','1990',223,1),(10494,10,2,'2012-05-08','1990',223,1),(10495,11,2,'2012-06-08','1990',223,1),(10496,12,2,'2012-07-09','1990',223,1),(10497,13,2,'2012-08-08','1990',223,1),(10498,14,2,'2012-09-10','1990',223,1),(10499,15,2,'2012-10-08','1990',223,1),(10500,16,2,'2012-11-08','1990',223,1),(10501,17,2,'2012-12-10','1990',223,1),(10502,18,2,'2013-01-08','1990',223,1),(10503,19,2,'2013-02-08','1990',223,1),(10504,20,2,'2013-03-08','1990',223,1),(10505,21,2,'2013-04-08','1990',223,1),(10506,22,2,'2013-05-08','1990',223,1),(10507,23,2,'2013-06-10','1990',223,1),(10508,24,2,'2013-07-08','1990',223,1),(10509,25,2,'2013-08-08','1990',223,1),(10510,26,2,'2013-09-09','1990',223,1),(10511,27,2,'2013-10-08','1990',223,1),(10512,28,2,'2013-11-08','1990',223,1),(10513,29,2,'2013-12-09','1990',223,1),(10514,30,2,'2014-01-08','1990',223,1),(10515,31,2,'2014-02-10','1990',223,1),(10516,32,2,'2014-03-10','1990',223,1),(10517,33,2,'2014-04-08','1990',223,1),(10518,34,2,'2014-05-08','1990',223,1),(10519,35,2,'2014-06-09','1990',223,1),(10520,36,2,'2014-07-08','1990',223,1),(10521,37,2,'2014-08-08','1990',223,1),(10522,38,2,'2014-09-08','1990',223,1),(10523,39,2,'2014-10-08','1990',223,1),(10524,40,2,'2014-11-10','1990',223,1),(10525,41,2,'2014-12-08','1990',223,1),(10526,42,2,'2015-01-08','1990',223,1),(10527,43,2,'2015-02-09','1990',223,1),(10528,44,2,'2015-03-09','1990',223,1),(10529,45,2,'2015-04-08','1990',223,1),(10530,46,2,'2015-05-08','1990',223,1),(10531,47,2,'2015-06-08','1990',223,1),(10532,48,2,'2015-07-08','1990',223,1),(10533,1,2,'2011-08-31','1990',224,1),(10534,2,2,'2011-09-08','1990',224,1),(10535,3,2,'2011-10-10','1990',224,1),(10536,4,2,'2011-11-08','1990',224,1),(10537,5,2,'2011-12-08','1990',224,1),(10538,6,2,'2012-01-09','1990',224,1),(10539,7,2,'2012-02-08','1990',224,1),(10540,8,2,'2012-03-08','1990',224,1),(10541,9,2,'2012-04-11','1990',224,1),(10542,10,2,'2012-05-08','1990',224,1),(10543,11,2,'2012-06-08','1990',224,1),(10544,12,2,'2012-07-09','1990',224,1),(10545,13,2,'2012-08-08','1990',224,1),(10546,14,2,'2012-09-10','1990',224,1),(10547,15,2,'2012-10-08','1990',224,1),(10548,16,2,'2012-11-08','1990',224,1),(10549,17,2,'2012-12-10','1990',224,1),(10550,18,2,'2013-01-08','1990',224,1),(10551,19,2,'2013-02-08','1990',224,1),(10552,20,2,'2013-03-08','1990',224,1),(10553,21,2,'2013-04-08','1990',224,1),(10554,22,2,'2013-05-08','1990',224,1),(10555,23,2,'2013-06-10','1990',224,1),(10556,24,2,'2013-07-08','1990',224,1),(10557,25,2,'2013-08-08','1990',224,1),(10558,26,2,'2013-09-09','1990',224,1),(10559,27,2,'2013-10-08','1990',224,1),(10560,28,2,'2013-11-08','1990',224,1),(10561,29,2,'2013-12-09','1990',224,1),(10562,30,2,'2014-01-08','1990',224,1),(10563,31,2,'2014-02-10','1990',224,1),(10564,32,2,'2014-03-10','1990',224,1),(10565,33,2,'2014-04-08','1990',224,1),(10566,34,2,'2014-05-08','1990',224,1),(10567,35,2,'2014-06-09','1990',224,1),(10568,36,2,'2014-07-08','1990',224,1),(10569,37,2,'2014-08-08','1990',224,1),(10570,38,2,'2014-09-08','1990',224,1),(10571,39,2,'2014-10-08','1990',224,1),(10572,40,2,'2014-11-10','1990',224,1),(10573,41,2,'2014-12-08','1990',224,1),(10574,42,2,'2015-01-08','1990',224,1),(10575,43,2,'2015-02-09','1990',224,1),(10576,44,2,'2015-03-09','1990',224,1),(10577,45,2,'2015-04-08','1990',224,1),(10578,46,2,'2015-05-08','1990',224,1),(10579,47,2,'2015-06-08','1990',224,1),(10580,48,2,'2015-07-08','1990',224,1),(10581,1,2,'2011-08-31','1990',225,1),(10582,2,2,'2011-09-08','1990',225,1),(10583,3,2,'2011-10-10','1990',225,1),(10584,4,2,'2011-11-08','1990',225,1),(10585,5,2,'2011-12-08','1990',225,1),(10586,6,2,'2012-01-09','1990',225,1),(10587,7,2,'2012-02-08','1990',225,1),(10588,8,2,'2012-03-08','1990',225,1),(10589,9,2,'2012-04-11','1990',225,1),(10590,10,2,'2012-05-08','1990',225,1),(10591,11,2,'2012-06-08','1990',225,1),(10592,12,2,'2012-07-09','1990',225,1),(10593,13,2,'2012-08-08','1990',225,1),(10594,14,2,'2012-09-10','1990',225,1),(10595,15,2,'2012-10-08','1990',225,1),(10596,16,2,'2012-11-08','1990',225,1),(10597,17,2,'2012-12-10','1990',225,1),(10598,18,2,'2013-01-08','1990',225,1),(10599,19,2,'2013-02-08','1990',225,1),(10600,20,2,'2013-03-08','1990',225,1),(10601,21,2,'2013-04-08','1990',225,1),(10602,22,2,'2013-05-08','1990',225,1),(10603,23,2,'2013-06-10','1990',225,1),(10604,24,2,'2013-07-08','1990',225,1),(10605,25,2,'2013-08-08','1990',225,1),(10606,26,2,'2013-09-09','1990',225,1),(10607,27,2,'2013-10-08','1990',225,1),(10608,28,2,'2013-11-08','1990',225,1),(10609,29,2,'2013-12-09','1990',225,1),(10610,30,2,'2014-01-08','1990',225,1),(10611,31,2,'2014-02-10','1990',225,1),(10612,32,2,'2014-03-10','1990',225,1),(10613,33,2,'2014-04-08','1990',225,1),(10614,34,2,'2014-05-08','1990',225,1),(10615,35,2,'2014-06-09','1990',225,1),(10616,36,2,'2014-07-08','1990',225,1),(10617,37,2,'2014-08-08','1990',225,1),(10618,38,2,'2014-09-08','1990',225,1),(10619,39,2,'2014-10-08','1990',225,1),(10620,40,2,'2014-11-10','1990',225,1),(10621,41,2,'2014-12-08','1990',225,1),(10622,42,2,'2015-01-08','1990',225,1),(10623,43,2,'2015-02-09','1990',225,1),(10624,44,2,'2015-03-09','1990',225,1),(10625,45,2,'2015-04-08','1990',225,1),(10626,46,2,'2015-05-08','1990',225,1),(10627,47,2,'2015-06-08','1990',225,1),(10628,48,2,'2015-07-08','1990',225,1),(10629,1,2,'2011-08-31','1990',226,1),(10630,2,2,'2011-09-08','1990',226,1),(10631,3,2,'2011-10-10','1990',226,1),(10632,4,2,'2011-11-08','1990',226,1),(10633,5,2,'2011-12-08','1990',226,1),(10634,6,2,'2012-01-09','1990',226,1),(10635,7,2,'2012-02-08','1990',226,1),(10636,8,2,'2012-03-08','1990',226,1),(10637,9,2,'2012-04-11','1990',226,1),(10638,10,2,'2012-05-08','1990',226,1),(10639,11,2,'2012-06-08','1990',226,1),(10640,12,2,'2012-07-09','1990',226,1),(10641,13,2,'2012-08-08','1990',226,1),(10642,14,2,'2012-09-10','1990',226,1),(10643,15,2,'2012-10-08','1990',226,1),(10644,16,2,'2012-11-08','1990',226,1),(10645,17,2,'2012-12-10','1990',226,1),(10646,18,2,'2013-01-08','1990',226,1),(10647,19,2,'2013-02-08','1990',226,1),(10648,20,2,'2013-03-08','1990',226,1),(10649,21,2,'2013-04-08','1990',226,1),(10650,22,2,'2013-05-08','1990',226,1),(10651,23,2,'2013-06-10','1990',226,1),(10652,24,2,'2013-07-08','1990',226,1),(10653,25,2,'2013-08-08','1990',226,1),(10654,26,2,'2013-09-09','1990',226,1),(10655,27,2,'2013-10-08','1990',226,1),(10656,28,2,'2013-11-08','1990',226,1),(10657,29,2,'2013-12-09','1990',226,1),(10658,30,2,'2014-01-08','1990',226,1),(10659,31,2,'2014-02-10','1990',226,1),(10660,32,2,'2014-03-10','1990',226,1),(10661,33,2,'2014-04-08','1990',226,1),(10662,34,2,'2014-05-08','1990',226,1),(10663,35,2,'2014-06-09','1990',226,1),(10664,36,2,'2014-07-08','1990',226,1),(10665,37,2,'2014-08-08','1990',226,1),(10666,38,2,'2014-09-08','1990',226,1),(10667,39,2,'2014-10-08','1990',226,1),(10668,40,2,'2014-11-10','1990',226,1),(10669,41,2,'2014-12-08','1990',226,1),(10670,42,2,'2015-01-08','1990',226,1),(10671,43,2,'2015-02-09','1990',226,1),(10672,44,2,'2015-03-09','1990',226,1),(10673,45,2,'2015-04-08','1990',226,1),(10674,46,2,'2015-05-08','1990',226,1),(10675,47,2,'2015-06-08','1990',226,1),(10676,48,2,'2015-07-08','1990',226,1),(10677,1,2,'2011-08-31','1990',227,1),(10678,2,2,'2011-09-08','1990',227,1),(10679,3,2,'2011-10-10','1990',227,1),(10680,4,2,'2011-11-08','1990',227,1),(10681,5,2,'2011-12-08','1990',227,1),(10682,6,2,'2012-01-09','1990',227,1),(10683,7,2,'2012-02-08','1990',227,1),(10684,8,2,'2012-03-08','1990',227,1),(10685,9,2,'2012-04-11','1990',227,1),(10686,10,2,'2012-05-08','1990',227,1),(10687,11,2,'2012-06-08','1990',227,1),(10688,12,2,'2012-07-09','1990',227,1),(10689,13,2,'2012-08-08','1990',227,1),(10690,14,2,'2012-09-10','1990',227,1),(10691,15,2,'2012-10-08','1990',227,1),(10692,16,2,'2012-11-08','1990',227,1),(10693,17,2,'2012-12-10','1990',227,1),(10694,18,2,'2013-01-08','1990',227,1),(10695,19,2,'2013-02-08','1990',227,1),(10696,20,2,'2013-03-08','1990',227,1),(10697,21,2,'2013-04-08','1990',227,1),(10698,22,2,'2013-05-08','1990',227,1),(10699,23,2,'2013-06-10','1990',227,1),(10700,24,2,'2013-07-08','1990',227,1),(10701,25,2,'2013-08-08','1990',227,1),(10702,26,2,'2013-09-09','1990',227,1),(10703,27,2,'2013-10-08','1990',227,1),(10704,28,2,'2013-11-08','1990',227,1),(10705,29,2,'2013-12-09','1990',227,1),(10706,30,2,'2014-01-08','1990',227,1),(10707,31,2,'2014-02-10','1990',227,1),(10708,32,2,'2014-03-10','1990',227,1),(10709,33,2,'2014-04-08','1990',227,1),(10710,34,2,'2014-05-08','1990',227,1),(10711,35,2,'2014-06-09','1990',227,1),(10712,36,2,'2014-07-08','1990',227,1),(10713,37,2,'2014-08-08','1990',227,1),(10714,38,2,'2014-09-08','1990',227,1),(10715,39,2,'2014-10-08','1990',227,1),(10716,40,2,'2014-11-10','1990',227,1),(10717,41,2,'2014-12-08','1990',227,1),(10718,42,2,'2015-01-08','1990',227,1),(10719,43,2,'2015-02-09','1990',227,1),(10720,44,2,'2015-03-09','1990',227,1),(10721,45,2,'2015-04-08','1990',227,1),(10722,46,2,'2015-05-08','1990',227,1),(10723,47,2,'2015-06-08','1990',227,1),(10724,48,2,'2015-07-08','1990',227,1),(10725,1,2,'2011-08-31','1990',228,1),(10726,2,2,'2011-09-08','1990',228,1),(10727,3,2,'2011-10-10','1990',228,1),(10728,4,2,'2011-11-08','1990',228,1),(10729,5,2,'2011-12-08','1990',228,1),(10730,6,2,'2012-01-09','1990',228,1),(10731,7,2,'2012-02-08','1990',228,1),(10732,8,2,'2012-03-08','1990',228,1),(10733,9,2,'2012-04-11','1990',228,1),(10734,10,2,'2012-05-08','1990',228,1),(10735,11,2,'2012-06-08','1990',228,1),(10736,12,2,'2012-07-09','1990',228,1),(10737,13,2,'2012-08-08','1990',228,1),(10738,14,2,'2012-09-10','1990',228,1),(10739,15,2,'2012-10-08','1990',228,1),(10740,16,2,'2012-11-08','1990',228,1),(10741,17,2,'2012-12-10','1990',228,1),(10742,18,2,'2013-01-08','1990',228,1),(10743,19,2,'2013-02-08','1990',228,1),(10744,20,2,'2013-03-08','1990',228,1),(10745,21,2,'2013-04-08','1990',228,1),(10746,22,2,'2013-05-08','1990',228,1),(10747,23,2,'2013-06-10','1990',228,1),(10748,24,2,'2013-07-08','1990',228,1),(10749,25,2,'2013-08-08','1990',228,1),(10750,26,2,'2013-09-09','1990',228,1),(10751,27,2,'2013-10-08','1990',228,1),(10752,28,2,'2013-11-08','1990',228,1),(10753,29,2,'2013-12-09','1990',228,1),(10754,30,2,'2014-01-08','1990',228,1),(10755,31,2,'2014-02-10','1990',228,1),(10756,32,2,'2014-03-10','1990',228,1),(10757,33,2,'2014-04-08','1990',228,1),(10758,34,2,'2014-05-08','1990',228,1),(10759,35,2,'2014-06-09','1990',228,1),(10760,36,2,'2014-07-08','1990',228,1),(10761,37,2,'2014-08-08','1990',228,1),(10762,38,2,'2014-09-08','1990',228,1),(10763,39,2,'2014-10-08','1990',228,1),(10764,40,2,'2014-11-10','1990',228,1),(10765,41,2,'2014-12-08','1990',228,1),(10766,42,2,'2015-01-08','1990',228,1),(10767,43,2,'2015-02-09','1990',228,1),(10768,44,2,'2015-03-09','1990',228,1),(10769,45,2,'2015-04-08','1990',228,1),(10770,46,2,'2015-05-08','1990',228,1),(10771,47,2,'2015-06-08','1990',228,1),(10772,48,2,'2015-07-08','1990',228,1),(10773,1,2,'2011-08-31','1990',229,1),(10774,2,2,'2011-09-08','1990',229,1),(10775,3,2,'2011-10-10','1990',229,1),(10776,4,2,'2011-11-08','1990',229,1),(10777,5,2,'2011-12-08','1990',229,1),(10778,6,2,'2012-01-09','1990',229,1),(10779,7,2,'2012-02-08','1990',229,1),(10780,8,2,'2012-03-08','1990',229,1),(10781,9,2,'2012-04-11','1990',229,1),(10782,10,2,'2012-05-08','1990',229,1),(10783,11,2,'2012-06-08','1990',229,1),(10784,12,2,'2012-07-09','1990',229,1),(10785,13,2,'2012-08-08','1990',229,1),(10786,14,2,'2012-09-10','1990',229,1),(10787,15,2,'2012-10-08','1990',229,1),(10788,16,2,'2012-11-08','1990',229,1),(10789,17,2,'2012-12-10','1990',229,1),(10790,18,2,'2013-01-08','1990',229,1),(10791,19,2,'2013-02-08','1990',229,1),(10792,20,2,'2013-03-08','1990',229,1),(10793,21,2,'2013-04-08','1990',229,1),(10794,22,2,'2013-05-08','1990',229,1),(10795,23,2,'2013-06-10','1990',229,1),(10796,24,2,'2013-07-08','1990',229,1),(10797,25,2,'2013-08-08','1990',229,1),(10798,26,2,'2013-09-09','1990',229,1),(10799,27,2,'2013-10-08','1990',229,1),(10800,28,2,'2013-11-08','1990',229,1),(10801,29,2,'2013-12-09','1990',229,1),(10802,30,2,'2014-01-08','1990',229,1),(10803,31,2,'2014-02-10','1990',229,1),(10804,32,2,'2014-03-10','1990',229,1),(10805,33,2,'2014-04-08','1990',229,1),(10806,34,2,'2014-05-08','1990',229,1),(10807,35,2,'2014-06-09','1990',229,1),(10808,36,2,'2014-07-08','1990',229,1),(10809,37,2,'2014-08-08','1990',229,1),(10810,38,2,'2014-09-08','1990',229,1),(10811,39,2,'2014-10-08','1990',229,1),(10812,40,2,'2014-11-10','1990',229,1),(10813,41,2,'2014-12-08','1990',229,1),(10814,42,2,'2015-01-08','1990',229,1),(10815,43,2,'2015-02-09','1990',229,1),(10816,44,2,'2015-03-09','1990',229,1),(10817,45,2,'2015-04-08','1990',229,1),(10818,46,2,'2015-05-08','1990',229,1),(10819,47,2,'2015-06-08','1990',229,1),(10820,48,2,'2015-07-08','1990',229,1),(10821,1,2,'2011-08-31','1990',230,1),(10822,2,2,'2011-09-08','1990',230,1),(10823,3,2,'2011-10-10','1990',230,1),(10824,4,2,'2011-11-08','1990',230,1),(10825,5,2,'2011-12-08','1990',230,1),(10826,6,2,'2012-01-09','1990',230,1),(10827,7,2,'2012-02-08','1990',230,1),(10828,8,2,'2012-03-08','1990',230,1),(10829,9,2,'2012-04-11','1990',230,1),(10830,10,2,'2012-05-08','1990',230,1),(10831,11,2,'2012-06-08','1990',230,1),(10832,12,2,'2012-07-09','1990',230,1),(10833,13,2,'2012-08-08','1990',230,1),(10834,14,2,'2012-09-10','1990',230,1),(10835,15,2,'2012-10-08','1990',230,1),(10836,16,2,'2012-11-08','1990',230,1),(10837,17,2,'2012-12-10','1990',230,1),(10838,18,2,'2013-01-08','1990',230,1),(10839,19,2,'2013-02-08','1990',230,1),(10840,20,2,'2013-03-08','1990',230,1),(10841,21,2,'2013-04-08','1990',230,1),(10842,22,2,'2013-05-08','1990',230,1),(10843,23,2,'2013-06-10','1990',230,1),(10844,24,2,'2013-07-08','1990',230,1),(10845,25,2,'2013-08-08','1990',230,1),(10846,26,2,'2013-09-09','1990',230,1),(10847,27,2,'2013-10-08','1990',230,1),(10848,28,2,'2013-11-08','1990',230,1),(10849,29,2,'2013-12-09','1990',230,1),(10850,30,2,'2014-01-08','1990',230,1),(10851,31,2,'2014-02-10','1990',230,1),(10852,32,2,'2014-03-10','1990',230,1),(10853,33,2,'2014-04-08','1990',230,1),(10854,34,2,'2014-05-08','1990',230,1),(10855,35,2,'2014-06-09','1990',230,1),(10856,36,2,'2014-07-08','1990',230,1),(10857,37,2,'2014-08-08','1990',230,1),(10858,38,2,'2014-09-08','1990',230,1),(10859,39,2,'2014-10-08','1990',230,1),(10860,40,2,'2014-11-10','1990',230,1),(10861,41,2,'2014-12-08','1990',230,1),(10862,42,2,'2015-01-08','1990',230,1),(10863,43,2,'2015-02-09','1990',230,1),(10864,44,2,'2015-03-09','1990',230,1),(10865,45,2,'2015-04-08','1990',230,1),(10866,46,2,'2015-05-08','1990',230,1),(10867,47,2,'2015-06-08','1990',230,1),(10868,48,2,'2015-07-08','1990',230,1),(10869,1,2,'2011-08-31','1990',231,1),(10870,2,2,'2011-09-08','1990',231,1),(10871,3,2,'2011-10-10','1990',231,1),(10872,4,2,'2011-11-08','1990',231,1),(10873,5,2,'2011-12-08','1990',231,1),(10874,6,2,'2012-01-09','1990',231,1),(10875,7,2,'2012-02-08','1990',231,1),(10876,8,2,'2012-03-08','1990',231,1),(10877,9,2,'2012-04-11','1990',231,1),(10878,10,2,'2012-05-08','1990',231,1),(10879,11,2,'2012-06-08','1990',231,1),(10880,12,2,'2012-07-09','1990',231,1),(10881,13,2,'2012-08-08','1990',231,1),(10882,14,2,'2012-09-10','1990',231,1),(10883,15,2,'2012-10-08','1990',231,1),(10884,16,2,'2012-11-08','1990',231,1),(10885,17,2,'2012-12-10','1990',231,1),(10886,18,2,'2013-01-08','1990',231,1),(10887,19,2,'2013-02-08','1990',231,1),(10888,20,2,'2013-03-08','1990',231,1),(10889,21,2,'2013-04-08','1990',231,1),(10890,22,2,'2013-05-08','1990',231,1),(10891,23,2,'2013-06-10','1990',231,1),(10892,24,2,'2013-07-08','1990',231,1),(10893,25,2,'2013-08-08','1990',231,1),(10894,26,2,'2013-09-09','1990',231,1),(10895,27,2,'2013-10-08','1990',231,1),(10896,28,2,'2013-11-08','1990',231,1),(10897,29,2,'2013-12-09','1990',231,1),(10898,30,2,'2014-01-08','1990',231,1),(10899,31,2,'2014-02-10','1990',231,1),(10900,32,2,'2014-03-10','1990',231,1),(10901,33,2,'2014-04-08','1990',231,1),(10902,34,2,'2014-05-08','1990',231,1),(10903,35,2,'2014-06-09','1990',231,1),(10904,36,2,'2014-07-08','1990',231,1),(10905,37,2,'2014-08-08','1990',231,1),(10906,38,2,'2014-09-08','1990',231,1),(10907,39,2,'2014-10-08','1990',231,1),(10908,40,2,'2014-11-10','1990',231,1),(10909,41,2,'2014-12-08','1990',231,1),(10910,42,2,'2015-01-08','1990',231,1),(10911,43,2,'2015-02-09','1990',231,1),(10912,44,2,'2015-03-09','1990',231,1),(10913,45,2,'2015-04-08','1990',231,1),(10914,46,2,'2015-05-08','1990',231,1),(10915,47,2,'2015-06-08','1990',231,1),(10916,48,2,'2015-07-08','1990',231,1),(10917,1,2,'2011-08-31','1990',232,1),(10918,2,2,'2011-09-08','1990',232,1),(10919,3,2,'2011-10-10','1990',232,1),(10920,4,2,'2011-11-08','1990',232,1),(10921,5,2,'2011-12-08','1990',232,1),(10922,6,2,'2012-01-09','1990',232,1),(10923,7,2,'2012-02-08','1990',232,1),(10924,8,2,'2012-03-08','1990',232,1),(10925,9,2,'2012-04-11','1990',232,1),(10926,10,2,'2012-05-08','1990',232,1),(10927,11,2,'2012-06-08','1990',232,1),(10928,12,2,'2012-07-09','1990',232,1),(10929,13,2,'2012-08-08','1990',232,1),(10930,14,2,'2012-09-10','1990',232,1),(10931,15,2,'2012-10-08','1990',232,1),(10932,16,2,'2012-11-08','1990',232,1),(10933,17,2,'2012-12-10','1990',232,1),(10934,18,2,'2013-01-08','1990',232,1),(10935,19,2,'2013-02-08','1990',232,1),(10936,20,2,'2013-03-08','1990',232,1),(10937,21,2,'2013-04-08','1990',232,1),(10938,22,2,'2013-05-08','1990',232,1),(10939,23,2,'2013-06-10','1990',232,1),(10940,24,2,'2013-07-08','1990',232,1),(10941,25,2,'2013-08-08','1990',232,1),(10942,26,2,'2013-09-09','1990',232,1),(10943,27,2,'2013-10-08','1990',232,1),(10944,28,2,'2013-11-08','1990',232,1),(10945,29,2,'2013-12-09','1990',232,1),(10946,30,2,'2014-01-08','1990',232,1),(10947,31,2,'2014-02-10','1990',232,1),(10948,32,2,'2014-03-10','1990',232,1),(10949,33,2,'2014-04-08','1990',232,1),(10950,34,2,'2014-05-08','1990',232,1),(10951,35,2,'2014-06-09','1990',232,1),(10952,36,2,'2014-07-08','1990',232,1),(10953,37,2,'2014-08-08','1990',232,1),(10954,38,2,'2014-09-08','1990',232,1),(10955,39,2,'2014-10-08','1990',232,1),(10956,40,2,'2014-11-10','1990',232,1),(10957,41,2,'2014-12-08','1990',232,1),(10958,42,2,'2015-01-08','1990',232,1),(10959,43,2,'2015-02-09','1990',232,1),(10960,44,2,'2015-03-09','1990',232,1),(10961,45,2,'2015-04-08','1990',232,1),(10962,46,2,'2015-05-08','1990',232,1),(10963,47,2,'2015-06-08','1990',232,1),(10964,48,2,'2015-07-08','1990',232,1),(10965,1,2,'2011-08-31','1990',233,1),(10966,2,2,'2011-09-08','1990',233,1),(10967,3,2,'2011-10-10','1990',233,1),(10968,4,2,'2011-11-08','1990',233,1),(10969,5,2,'2011-12-08','1990',233,1),(10970,6,2,'2012-01-09','1990',233,1),(10971,7,2,'2012-02-08','1990',233,1),(10972,8,2,'2012-03-08','1990',233,1),(10973,9,2,'2012-04-11','1990',233,1),(10974,10,2,'2012-05-08','1990',233,1),(10975,11,2,'2012-06-08','1990',233,1),(10976,12,2,'2012-07-09','1990',233,1),(10977,13,2,'2012-08-08','1990',233,1),(10978,14,2,'2012-09-10','1990',233,1),(10979,15,2,'2012-10-08','1990',233,1),(10980,16,2,'2012-11-08','1990',233,1),(10981,17,2,'2012-12-10','1990',233,1),(10982,18,2,'2013-01-08','1990',233,1),(10983,19,2,'2013-02-08','1990',233,1),(10984,20,2,'2013-03-08','1990',233,1),(10985,21,2,'2013-04-08','1990',233,1),(10986,22,2,'2013-05-08','1990',233,1),(10987,23,2,'2013-06-10','1990',233,1),(10988,24,2,'2013-07-08','1990',233,1),(10989,25,2,'2013-08-08','1990',233,1),(10990,26,2,'2013-09-09','1990',233,1),(10991,27,2,'2013-10-08','1990',233,1),(10992,28,2,'2013-11-08','1990',233,1),(10993,29,2,'2013-12-09','1990',233,1),(10994,30,2,'2014-01-08','1990',233,1),(10995,31,2,'2014-02-10','1990',233,1),(10996,32,2,'2014-03-10','1990',233,1),(10997,33,2,'2014-04-08','1990',233,1),(10998,34,2,'2014-05-08','1990',233,1),(10999,35,2,'2014-06-09','1990',233,1),(11000,36,2,'2014-07-08','1990',233,1),(11001,37,2,'2014-08-08','1990',233,1),(11002,38,2,'2014-09-08','1990',233,1),(11003,39,2,'2014-10-08','1990',233,1),(11004,40,2,'2014-11-10','1990',233,1),(11005,41,2,'2014-12-08','1990',233,1),(11006,42,2,'2015-01-08','1990',233,1),(11007,43,2,'2015-02-09','1990',233,1),(11008,44,2,'2015-03-09','1990',233,1),(11009,45,2,'2015-04-08','1990',233,1),(11010,46,2,'2015-05-08','1990',233,1),(11011,47,2,'2015-06-08','1990',233,1),(11012,48,2,'2015-07-08','1990',233,1),(11013,1,2,'2011-08-31','1990',234,1),(11014,2,2,'2011-09-08','1990',234,1),(11015,3,2,'2011-10-10','1990',234,1),(11016,4,2,'2011-11-08','1990',234,1),(11017,5,2,'2011-12-08','1990',234,1),(11018,6,2,'2012-01-09','1990',234,1),(11019,7,2,'2012-02-08','1990',234,1),(11020,8,2,'2012-03-08','1990',234,1),(11021,9,2,'2012-04-11','1990',234,1),(11022,10,2,'2012-05-08','1990',234,1),(11023,11,2,'2012-06-08','1990',234,1),(11024,12,2,'2012-07-09','1990',234,1),(11025,13,2,'2012-08-08','1990',234,1),(11026,14,2,'2012-09-10','1990',234,1),(11027,15,2,'2012-10-08','1990',234,1),(11028,16,2,'2012-11-08','1990',234,1),(11029,17,2,'2012-12-10','1990',234,1),(11030,18,2,'2013-01-08','1990',234,1),(11031,19,2,'2013-02-08','1990',234,1),(11032,20,2,'2013-03-08','1990',234,1),(11033,21,2,'2013-04-08','1990',234,1),(11034,22,2,'2013-05-08','1990',234,1),(11035,23,2,'2013-06-10','1990',234,1),(11036,24,2,'2013-07-08','1990',234,1),(11037,25,2,'2013-08-08','1990',234,1),(11038,26,2,'2013-09-09','1990',234,1),(11039,27,2,'2013-10-08','1990',234,1),(11040,28,2,'2013-11-08','1990',234,1),(11041,29,2,'2013-12-09','1990',234,1),(11042,30,2,'2014-01-08','1990',234,1),(11043,31,2,'2014-02-10','1990',234,1),(11044,32,2,'2014-03-10','1990',234,1),(11045,33,2,'2014-04-08','1990',234,1),(11046,34,2,'2014-05-08','1990',234,1),(11047,35,2,'2014-06-09','1990',234,1),(11048,36,2,'2014-07-08','1990',234,1),(11049,37,2,'2014-08-08','1990',234,1),(11050,38,2,'2014-09-08','1990',234,1),(11051,39,2,'2014-10-08','1990',234,1),(11052,40,2,'2014-11-10','1990',234,1),(11053,41,2,'2014-12-08','1990',234,1),(11054,42,2,'2015-01-08','1990',234,1),(11055,43,2,'2015-02-09','1990',234,1),(11056,44,2,'2015-03-09','1990',234,1),(11057,45,2,'2015-04-08','1990',234,1),(11058,46,2,'2015-05-08','1990',234,1),(11059,47,2,'2015-06-08','1990',234,1),(11060,48,2,'2015-07-08','1990',234,1),(11061,1,2,'2011-08-31','1990',235,1),(11062,2,2,'2011-09-08','1990',235,1),(11063,3,2,'2011-10-10','1990',235,1),(11064,4,2,'2011-11-08','1990',235,1),(11065,5,2,'2011-12-08','1990',235,1),(11066,6,2,'2012-01-09','1990',235,1),(11067,7,2,'2012-02-08','1990',235,1),(11068,8,2,'2012-03-08','1990',235,1),(11069,9,2,'2012-04-11','1990',235,1),(11070,10,2,'2012-05-08','1990',235,1),(11071,11,2,'2012-06-08','1990',235,1),(11072,12,2,'2012-07-09','1990',235,1),(11073,13,2,'2012-08-08','1990',235,1),(11074,14,2,'2012-09-10','1990',235,1),(11075,15,2,'2012-10-08','1990',235,1),(11076,16,2,'2012-11-08','1990',235,1),(11077,17,2,'2012-12-10','1990',235,1),(11078,18,2,'2013-01-08','1990',235,1),(11079,19,2,'2013-02-08','1990',235,1),(11080,20,2,'2013-03-08','1990',235,1),(11081,21,2,'2013-04-08','1990',235,1),(11082,22,2,'2013-05-08','1990',235,1),(11083,23,2,'2013-06-10','1990',235,1),(11084,24,2,'2013-07-08','1990',235,1),(11085,25,2,'2013-08-08','1990',235,1),(11086,26,2,'2013-09-09','1990',235,1),(11087,27,2,'2013-10-08','1990',235,1),(11088,28,2,'2013-11-08','1990',235,1),(11089,29,2,'2013-12-09','1990',235,1),(11090,30,2,'2014-01-08','1990',235,1),(11091,31,2,'2014-02-10','1990',235,1),(11092,32,2,'2014-03-10','1990',235,1),(11093,33,2,'2014-04-08','1990',235,1),(11094,34,2,'2014-05-08','1990',235,1),(11095,35,2,'2014-06-09','1990',235,1),(11096,36,2,'2014-07-08','1990',235,1),(11097,37,2,'2014-08-08','1990',235,1),(11098,38,2,'2014-09-08','1990',235,1),(11099,39,2,'2014-10-08','1990',235,1),(11100,40,2,'2014-11-10','1990',235,1),(11101,41,2,'2014-12-08','1990',235,1),(11102,42,2,'2015-01-08','1990',235,1),(11103,43,2,'2015-02-09','1990',235,1),(11104,44,2,'2015-03-09','1990',235,1),(11105,45,2,'2015-04-08','1990',235,1),(11106,46,2,'2015-05-08','1990',235,1),(11107,47,2,'2015-06-08','1990',235,1),(11108,48,2,'2015-07-08','1990',235,1),(11109,1,2,'2011-08-31','1990',236,1),(11110,2,2,'2011-09-08','1990',236,1),(11111,3,2,'2011-10-10','1990',236,1),(11112,4,2,'2011-11-08','1990',236,1),(11113,5,2,'2011-12-08','1990',236,1),(11114,6,2,'2012-01-09','1990',236,1),(11115,7,2,'2012-02-08','1990',236,1),(11116,8,2,'2012-03-08','1990',236,1),(11117,9,2,'2012-04-11','1990',236,1),(11118,10,2,'2012-05-08','1990',236,1),(11119,11,2,'2012-06-08','1990',236,1),(11120,12,2,'2012-07-09','1990',236,1),(11121,13,2,'2012-08-08','1990',236,1),(11122,14,2,'2012-09-10','1990',236,1),(11123,15,2,'2012-10-08','1990',236,1),(11124,16,2,'2012-11-08','1990',236,1),(11125,17,2,'2012-12-10','1990',236,1),(11126,18,2,'2013-01-08','1990',236,1),(11127,19,2,'2013-02-08','1990',236,1),(11128,20,2,'2013-03-08','1990',236,1),(11129,21,2,'2013-04-08','1990',236,1),(11130,22,2,'2013-05-08','1990',236,1),(11131,23,2,'2013-06-10','1990',236,1),(11132,24,2,'2013-07-08','1990',236,1),(11133,25,2,'2013-08-08','1990',236,1),(11134,26,2,'2013-09-09','1990',236,1),(11135,27,2,'2013-10-08','1990',236,1),(11136,28,2,'2013-11-08','1990',236,1),(11137,29,2,'2013-12-09','1990',236,1),(11138,30,2,'2014-01-08','1990',236,1),(11139,31,2,'2014-02-10','1990',236,1),(11140,32,2,'2014-03-10','1990',236,1),(11141,33,2,'2014-04-08','1990',236,1),(11142,34,2,'2014-05-08','1990',236,1),(11143,35,2,'2014-06-09','1990',236,1),(11144,36,2,'2014-07-08','1990',236,1),(11145,37,2,'2014-08-08','1990',236,1),(11146,38,2,'2014-09-08','1990',236,1),(11147,39,2,'2014-10-08','1990',236,1),(11148,40,2,'2014-11-10','1990',236,1),(11149,41,2,'2014-12-08','1990',236,1),(11150,42,2,'2015-01-08','1990',236,1),(11151,43,2,'2015-02-09','1990',236,1),(11152,44,2,'2015-03-09','1990',236,1),(11153,45,2,'2015-04-08','1990',236,1),(11154,46,2,'2015-05-08','1990',236,1),(11155,47,2,'2015-06-08','1990',236,1),(11156,48,2,'2015-07-08','1990',236,1),(11157,1,2,'2011-08-31','1990',237,1),(11158,2,2,'2011-09-08','1990',237,1),(11159,3,2,'2011-10-10','1990',237,1),(11160,4,2,'2011-11-08','1990',237,1),(11161,5,2,'2011-12-08','1990',237,1),(11162,6,2,'2012-01-09','1990',237,1),(11163,7,2,'2012-02-08','1990',237,1),(11164,8,2,'2012-03-08','1990',237,1),(11165,9,2,'2012-04-11','1990',237,1),(11166,10,2,'2012-05-08','1990',237,1),(11167,11,2,'2012-06-08','1990',237,1),(11168,12,2,'2012-07-09','1990',237,1),(11169,13,2,'2012-08-08','1990',237,1),(11170,14,2,'2012-09-10','1990',237,1),(11171,15,2,'2012-10-08','1990',237,1),(11172,16,2,'2012-11-08','1990',237,1),(11173,17,2,'2012-12-10','1990',237,1),(11174,18,2,'2013-01-08','1990',237,1),(11175,19,2,'2013-02-08','1990',237,1),(11176,20,2,'2013-03-08','1990',237,1),(11177,21,2,'2013-04-08','1990',237,1),(11178,22,2,'2013-05-08','1990',237,1),(11179,23,2,'2013-06-10','1990',237,1),(11180,24,2,'2013-07-08','1990',237,1),(11181,25,2,'2013-08-08','1990',237,1),(11182,26,2,'2013-09-09','1990',237,1),(11183,27,2,'2013-10-08','1990',237,1),(11184,28,2,'2013-11-08','1990',237,1),(11185,29,2,'2013-12-09','1990',237,1),(11186,30,2,'2014-01-08','1990',237,1),(11187,31,2,'2014-02-10','1990',237,1),(11188,32,2,'2014-03-10','1990',237,1),(11189,33,2,'2014-04-08','1990',237,1),(11190,34,2,'2014-05-08','1990',237,1),(11191,35,2,'2014-06-09','1990',237,1),(11192,36,2,'2014-07-08','1990',237,1),(11193,37,2,'2014-08-08','1990',237,1),(11194,38,2,'2014-09-08','1990',237,1),(11195,39,2,'2014-10-08','1990',237,1),(11196,40,2,'2014-11-10','1990',237,1),(11197,41,2,'2014-12-08','1990',237,1),(11198,42,2,'2015-01-08','1990',237,1),(11199,43,2,'2015-02-09','1990',237,1),(11200,44,2,'2015-03-09','1990',237,1),(11201,45,2,'2015-04-08','1990',237,1),(11202,46,2,'2015-05-08','1990',237,1),(11203,47,2,'2015-06-08','1990',237,1),(11204,48,2,'2015-07-08','1990',237,1),(11205,1,2,'2011-08-31','1990',238,1),(11206,2,2,'2011-09-08','1990',238,1),(11207,3,2,'2011-10-10','1990',238,1),(11208,4,2,'2011-11-08','1990',238,1),(11209,5,2,'2011-12-08','1990',238,1),(11210,6,2,'2012-01-09','1990',238,1),(11211,7,2,'2012-02-08','1990',238,1),(11212,8,2,'2012-03-08','1990',238,1),(11213,9,2,'2012-04-11','1990',238,1),(11214,10,2,'2012-05-08','1990',238,1),(11215,11,2,'2012-06-08','1990',238,1),(11216,12,2,'2012-07-09','1990',238,1),(11217,13,2,'2012-08-08','1990',238,1),(11218,14,2,'2012-09-10','1990',238,1),(11219,15,2,'2012-10-08','1990',238,1),(11220,16,2,'2012-11-08','1990',238,1),(11221,17,2,'2012-12-10','1990',238,1),(11222,18,2,'2013-01-08','1990',238,1),(11223,19,2,'2013-02-08','1990',238,1),(11224,20,2,'2013-03-08','1990',238,1),(11225,21,2,'2013-04-08','1990',238,1),(11226,22,2,'2013-05-08','1990',238,1),(11227,23,2,'2013-06-10','1990',238,1),(11228,24,2,'2013-07-08','1990',238,1),(11229,25,2,'2013-08-08','1990',238,1),(11230,26,2,'2013-09-09','1990',238,1),(11231,27,2,'2013-10-08','1990',238,1),(11232,28,2,'2013-11-08','1990',238,1),(11233,29,2,'2013-12-09','1990',238,1),(11234,30,2,'2014-01-08','1990',238,1),(11235,31,2,'2014-02-10','1990',238,1),(11236,32,2,'2014-03-10','1990',238,1),(11237,33,2,'2014-04-08','1990',238,1),(11238,34,2,'2014-05-08','1990',238,1),(11239,35,2,'2014-06-09','1990',238,1),(11240,36,2,'2014-07-08','1990',238,1),(11241,37,2,'2014-08-08','1990',238,1),(11242,38,2,'2014-09-08','1990',238,1),(11243,39,2,'2014-10-08','1990',238,1),(11244,40,2,'2014-11-10','1990',238,1),(11245,41,2,'2014-12-08','1990',238,1),(11246,42,2,'2015-01-08','1990',238,1),(11247,43,2,'2015-02-09','1990',238,1),(11248,44,2,'2015-03-09','1990',238,1),(11249,45,2,'2015-04-08','1990',238,1),(11250,46,2,'2015-05-08','1990',238,1),(11251,47,2,'2015-06-08','1990',238,1),(11252,48,2,'2015-07-08','1990',238,1),(11253,1,2,'2011-08-31','1990',239,1),(11254,2,2,'2011-09-08','1990',239,1),(11255,3,2,'2011-10-10','1990',239,1),(11256,4,2,'2011-11-08','1990',239,1),(11257,5,2,'2011-12-08','1990',239,1),(11258,6,2,'2012-01-09','1990',239,1),(11259,7,2,'2012-02-08','1990',239,1),(11260,8,2,'2012-03-08','1990',239,1),(11261,9,2,'2012-04-11','1990',239,1),(11262,10,2,'2012-05-08','1990',239,1),(11263,11,2,'2012-06-08','1990',239,1),(11264,12,2,'2012-07-09','1990',239,1),(11265,13,2,'2012-08-08','1990',239,1),(11266,14,2,'2012-09-10','1990',239,1),(11267,15,2,'2012-10-08','1990',239,1),(11268,16,2,'2012-11-08','1990',239,1),(11269,17,2,'2012-12-10','1990',239,1),(11270,18,2,'2013-01-08','1990',239,1),(11271,19,2,'2013-02-08','1990',239,1),(11272,20,2,'2013-03-08','1990',239,1),(11273,21,2,'2013-04-08','1990',239,1),(11274,22,2,'2013-05-08','1990',239,1),(11275,23,2,'2013-06-10','1990',239,1),(11276,24,2,'2013-07-08','1990',239,1),(11277,25,2,'2013-08-08','1990',239,1),(11278,26,2,'2013-09-09','1990',239,1),(11279,27,2,'2013-10-08','1990',239,1),(11280,28,2,'2013-11-08','1990',239,1),(11281,29,2,'2013-12-09','1990',239,1),(11282,30,2,'2014-01-08','1990',239,1),(11283,31,2,'2014-02-10','1990',239,1),(11284,32,2,'2014-03-10','1990',239,1),(11285,33,2,'2014-04-08','1990',239,1),(11286,34,2,'2014-05-08','1990',239,1),(11287,35,2,'2014-06-09','1990',239,1),(11288,36,2,'2014-07-08','1990',239,1),(11289,37,2,'2014-08-08','1990',239,1),(11290,38,2,'2014-09-08','1990',239,1),(11291,39,2,'2014-10-08','1990',239,1),(11292,40,2,'2014-11-10','1990',239,1),(11293,41,2,'2014-12-08','1990',239,1),(11294,42,2,'2015-01-08','1990',239,1),(11295,43,2,'2015-02-09','1990',239,1),(11296,44,2,'2015-03-09','1990',239,1),(11297,45,2,'2015-04-08','1990',239,1),(11298,46,2,'2015-05-08','1990',239,1),(11299,47,2,'2015-06-08','1990',239,1),(11300,48,2,'2015-07-08','1990',239,1),(11301,1,2,'2011-08-31','1990',240,1),(11302,2,2,'2011-09-08','1990',240,1),(11303,3,2,'2011-10-10','1990',240,1),(11304,4,2,'2011-11-08','1990',240,1),(11305,5,2,'2011-12-08','1990',240,1),(11306,6,2,'2012-01-09','1990',240,1),(11307,7,2,'2012-02-08','1990',240,1),(11308,8,2,'2012-03-08','1990',240,1),(11309,9,2,'2012-04-11','1990',240,1),(11310,10,2,'2012-05-08','1990',240,1),(11311,11,2,'2012-06-08','1990',240,1),(11312,12,2,'2012-07-09','1990',240,1),(11313,13,2,'2012-08-08','1990',240,1),(11314,14,2,'2012-09-10','1990',240,1),(11315,15,2,'2012-10-08','1990',240,1),(11316,16,2,'2012-11-08','1990',240,1),(11317,17,2,'2012-12-10','1990',240,1),(11318,18,2,'2013-01-08','1990',240,1),(11319,19,2,'2013-02-08','1990',240,1),(11320,20,2,'2013-03-08','1990',240,1),(11321,21,2,'2013-04-08','1990',240,1),(11322,22,2,'2013-05-08','1990',240,1),(11323,23,2,'2013-06-10','1990',240,1),(11324,24,2,'2013-07-08','1990',240,1),(11325,25,2,'2013-08-08','1990',240,1),(11326,26,2,'2013-09-09','1990',240,1),(11327,27,2,'2013-10-08','1990',240,1),(11328,28,2,'2013-11-08','1990',240,1),(11329,29,2,'2013-12-09','1990',240,1),(11330,30,2,'2014-01-08','1990',240,1),(11331,31,2,'2014-02-10','1990',240,1),(11332,32,2,'2014-03-10','1990',240,1),(11333,33,2,'2014-04-08','1990',240,1),(11334,34,2,'2014-05-08','1990',240,1),(11335,35,2,'2014-06-09','1990',240,1),(11336,36,2,'2014-07-08','1990',240,1),(11337,37,2,'2014-08-08','1990',240,1),(11338,38,2,'2014-09-08','1990',240,1),(11339,39,2,'2014-10-08','1990',240,1),(11340,40,2,'2014-11-10','1990',240,1),(11341,41,2,'2014-12-08','1990',240,1),(11342,42,2,'2015-01-08','1990',240,1),(11343,43,2,'2015-02-09','1990',240,1),(11344,44,2,'2015-03-09','1990',240,1),(11345,45,2,'2015-04-08','1990',240,1),(11346,46,2,'2015-05-08','1990',240,1),(11347,47,2,'2015-06-08','1990',240,1),(11348,48,2,'2015-07-08','1990',240,1),(11349,1,2,'2011-08-31','1990',241,1),(11350,2,2,'2011-09-08','1990',241,1),(11351,3,2,'2011-10-10','1990',241,1),(11352,4,2,'2011-11-08','1990',241,1),(11353,5,2,'2011-12-08','1990',241,1),(11354,6,2,'2012-01-09','1990',241,1),(11355,7,2,'2012-02-08','1990',241,1),(11356,8,2,'2012-03-08','1990',241,1),(11357,9,2,'2012-04-11','1990',241,1),(11358,10,2,'2012-05-08','1990',241,1),(11359,11,2,'2012-06-08','1990',241,1),(11360,12,2,'2012-07-09','1990',241,1),(11361,13,2,'2012-08-08','1990',241,1),(11362,14,2,'2012-09-10','1990',241,1),(11363,15,2,'2012-10-08','1990',241,1),(11364,16,2,'2012-11-08','1990',241,1),(11365,17,2,'2012-12-10','1990',241,1),(11366,18,2,'2013-01-08','1990',241,1),(11367,19,2,'2013-02-08','1990',241,1),(11368,20,2,'2013-03-08','1990',241,1),(11369,21,2,'2013-04-08','1990',241,1),(11370,22,2,'2013-05-08','1990',241,1),(11371,23,2,'2013-06-10','1990',241,1),(11372,24,2,'2013-07-08','1990',241,1),(11373,25,2,'2013-08-08','1990',241,1),(11374,26,2,'2013-09-09','1990',241,1),(11375,27,2,'2013-10-08','1990',241,1),(11376,28,2,'2013-11-08','1990',241,1),(11377,29,2,'2013-12-09','1990',241,1),(11378,30,2,'2014-01-08','1990',241,1),(11379,31,2,'2014-02-10','1990',241,1),(11380,32,2,'2014-03-10','1990',241,1),(11381,33,2,'2014-04-08','1990',241,1),(11382,34,2,'2014-05-08','1990',241,1),(11383,35,2,'2014-06-09','1990',241,1),(11384,36,2,'2014-07-08','1990',241,1),(11385,37,2,'2014-08-08','1990',241,1),(11386,38,2,'2014-09-08','1990',241,1),(11387,39,2,'2014-10-08','1990',241,1),(11388,40,2,'2014-11-10','1990',241,1),(11389,41,2,'2014-12-08','1990',241,1),(11390,42,2,'2015-01-08','1990',241,1),(11391,43,2,'2015-02-09','1990',241,1),(11392,44,2,'2015-03-09','1990',241,1),(11393,45,2,'2015-04-08','1990',241,1),(11394,46,2,'2015-05-08','1990',241,1),(11395,47,2,'2015-06-08','1990',241,1),(11396,48,2,'2015-07-08','1990',241,1),(11397,1,2,'2011-08-31','1990',242,1),(11398,2,2,'2011-09-08','1990',242,1),(11399,3,2,'2011-10-10','1990',242,1),(11400,4,2,'2011-11-08','1990',242,1),(11401,5,2,'2011-12-08','1990',242,1),(11402,6,2,'2012-01-09','1990',242,1),(11403,7,2,'2012-02-08','1990',242,1),(11404,8,2,'2012-03-08','1990',242,1),(11405,9,2,'2012-04-11','1990',242,1),(11406,10,2,'2012-05-08','1990',242,1),(11407,11,2,'2012-06-08','1990',242,1),(11408,12,2,'2012-07-09','1990',242,1),(11409,13,2,'2012-08-08','1990',242,1),(11410,14,2,'2012-09-10','1990',242,1),(11411,15,2,'2012-10-08','1990',242,1),(11412,16,2,'2012-11-08','1990',242,1),(11413,17,2,'2012-12-10','1990',242,1),(11414,18,2,'2013-01-08','1990',242,1),(11415,19,2,'2013-02-08','1990',242,1),(11416,20,2,'2013-03-08','1990',242,1),(11417,21,2,'2013-04-08','1990',242,1),(11418,22,2,'2013-05-08','1990',242,1),(11419,23,2,'2013-06-10','1990',242,1),(11420,24,2,'2013-07-08','1990',242,1),(11421,25,2,'2013-08-08','1990',242,1),(11422,26,2,'2013-09-09','1990',242,1),(11423,27,2,'2013-10-08','1990',242,1),(11424,28,2,'2013-11-08','1990',242,1),(11425,29,2,'2013-12-09','1990',242,1),(11426,30,2,'2014-01-08','1990',242,1),(11427,31,2,'2014-02-10','1990',242,1),(11428,32,2,'2014-03-10','1990',242,1),(11429,33,2,'2014-04-08','1990',242,1),(11430,34,2,'2014-05-08','1990',242,1),(11431,35,2,'2014-06-09','1990',242,1),(11432,36,2,'2014-07-08','1990',242,1),(11433,37,2,'2014-08-08','1990',242,1),(11434,38,2,'2014-09-08','1990',242,1),(11435,39,2,'2014-10-08','1990',242,1),(11436,40,2,'2014-11-10','1990',242,1),(11437,41,2,'2014-12-08','1990',242,1),(11438,42,2,'2015-01-08','1990',242,1),(11439,43,2,'2015-02-09','1990',242,1),(11440,44,2,'2015-03-09','1990',242,1),(11441,45,2,'2015-04-08','1990',242,1),(11442,46,2,'2015-05-08','1990',242,1),(11443,47,2,'2015-06-08','1990',242,1),(11444,48,2,'2015-07-08','1990',242,1),(11445,1,2,'2011-08-31','1990',243,1),(11446,2,2,'2011-09-08','1990',243,1),(11447,3,2,'2011-10-10','1990',243,1),(11448,4,2,'2011-11-08','1990',243,1),(11449,5,2,'2011-12-08','1990',243,1),(11450,6,2,'2012-01-09','1990',243,1),(11451,7,2,'2012-02-08','1990',243,1),(11452,8,2,'2012-03-08','1990',243,1),(11453,9,2,'2012-04-11','1990',243,1),(11454,10,2,'2012-05-08','1990',243,1),(11455,11,2,'2012-06-08','1990',243,1),(11456,12,2,'2012-07-09','1990',243,1),(11457,13,2,'2012-08-08','1990',243,1),(11458,14,2,'2012-09-10','1990',243,1),(11459,15,2,'2012-10-08','1990',243,1),(11460,16,2,'2012-11-08','1990',243,1),(11461,17,2,'2012-12-10','1990',243,1),(11462,18,2,'2013-01-08','1990',243,1),(11463,19,2,'2013-02-08','1990',243,1),(11464,20,2,'2013-03-08','1990',243,1),(11465,21,2,'2013-04-08','1990',243,1),(11466,22,2,'2013-05-08','1990',243,1),(11467,23,2,'2013-06-10','1990',243,1),(11468,24,2,'2013-07-08','1990',243,1),(11469,25,2,'2013-08-08','1990',243,1),(11470,26,2,'2013-09-09','1990',243,1),(11471,27,2,'2013-10-08','1990',243,1),(11472,28,2,'2013-11-08','1990',243,1),(11473,29,2,'2013-12-09','1990',243,1),(11474,30,2,'2014-01-08','1990',243,1),(11475,31,2,'2014-02-10','1990',243,1),(11476,32,2,'2014-03-10','1990',243,1),(11477,33,2,'2014-04-08','1990',243,1),(11478,34,2,'2014-05-08','1990',243,1),(11479,35,2,'2014-06-09','1990',243,1),(11480,36,2,'2014-07-08','1990',243,1),(11481,37,2,'2014-08-08','1990',243,1),(11482,38,2,'2014-09-08','1990',243,1),(11483,39,2,'2014-10-08','1990',243,1),(11484,40,2,'2014-11-10','1990',243,1),(11485,41,2,'2014-12-08','1990',243,1),(11486,42,2,'2015-01-08','1990',243,1),(11487,43,2,'2015-02-09','1990',243,1),(11488,44,2,'2015-03-09','1990',243,1),(11489,45,2,'2015-04-08','1990',243,1),(11490,46,2,'2015-05-08','1990',243,1),(11491,47,2,'2015-06-08','1990',243,1),(11492,48,2,'2015-07-08','1990',243,1),(11493,1,2,'2011-08-31','1990',244,1),(11494,2,2,'2011-09-08','1990',244,1),(11495,3,2,'2011-10-10','1990',244,1),(11496,4,2,'2011-11-08','1990',244,1),(11497,5,2,'2011-12-08','1990',244,1),(11498,6,2,'2012-01-09','1990',244,1),(11499,7,2,'2012-02-08','1990',244,1),(11500,8,2,'2012-03-08','1990',244,1),(11501,9,2,'2012-04-11','1990',244,1),(11502,10,2,'2012-05-08','1990',244,1),(11503,11,2,'2012-06-08','1990',244,1),(11504,12,2,'2012-07-09','1990',244,1),(11505,13,2,'2012-08-08','1990',244,1),(11506,14,2,'2012-09-10','1990',244,1),(11507,15,2,'2012-10-08','1990',244,1),(11508,16,2,'2012-11-08','1990',244,1),(11509,17,2,'2012-12-10','1990',244,1),(11510,18,2,'2013-01-08','1990',244,1),(11511,19,2,'2013-02-08','1990',244,1),(11512,20,2,'2013-03-08','1990',244,1),(11513,21,2,'2013-04-08','1990',244,1),(11514,22,2,'2013-05-08','1990',244,1),(11515,23,2,'2013-06-10','1990',244,1),(11516,24,2,'2013-07-08','1990',244,1),(11517,25,2,'2013-08-08','1990',244,1),(11518,26,2,'2013-09-09','1990',244,1),(11519,27,2,'2013-10-08','1990',244,1),(11520,28,2,'2013-11-08','1990',244,1),(11521,29,2,'2013-12-09','1990',244,1),(11522,30,2,'2014-01-08','1990',244,1),(11523,31,2,'2014-02-10','1990',244,1),(11524,32,2,'2014-03-10','1990',244,1),(11525,33,2,'2014-04-08','1990',244,1),(11526,34,2,'2014-05-08','1990',244,1),(11527,35,2,'2014-06-09','1990',244,1),(11528,36,2,'2014-07-08','1990',244,1),(11529,37,2,'2014-08-08','1990',244,1),(11530,38,2,'2014-09-08','1990',244,1),(11531,39,2,'2014-10-08','1990',244,1),(11532,40,2,'2014-11-10','1990',244,1),(11533,41,2,'2014-12-08','1990',244,1),(11534,42,2,'2015-01-08','1990',244,1),(11535,43,2,'2015-02-09','1990',244,1),(11536,44,2,'2015-03-09','1990',244,1),(11537,45,2,'2015-04-08','1990',244,1),(11538,46,2,'2015-05-08','1990',244,1),(11539,47,2,'2015-06-08','1990',244,1),(11540,48,2,'2015-07-08','1990',244,1),(11541,1,2,'2011-08-31','1990',245,1),(11542,2,2,'2011-09-08','1990',245,1),(11543,3,2,'2011-10-10','1990',245,1),(11544,4,2,'2011-11-08','1990',245,1),(11545,5,2,'2011-12-08','1990',245,1),(11546,6,2,'2012-01-09','1990',245,1),(11547,7,2,'2012-02-08','1990',245,1),(11548,8,2,'2012-03-08','1990',245,1),(11549,9,2,'2012-04-11','1990',245,1),(11550,10,2,'2012-05-08','1990',245,1),(11551,11,2,'2012-06-08','1990',245,1),(11552,12,2,'2012-07-09','1990',245,1),(11553,13,2,'2012-08-08','1990',245,1),(11554,14,2,'2012-09-10','1990',245,1),(11555,15,2,'2012-10-08','1990',245,1),(11556,16,2,'2012-11-08','1990',245,1),(11557,17,2,'2012-12-10','1990',245,1),(11558,18,2,'2013-01-08','1990',245,1),(11559,19,2,'2013-02-08','1990',245,1),(11560,20,2,'2013-03-08','1990',245,1),(11561,21,2,'2013-04-08','1990',245,1),(11562,22,2,'2013-05-08','1990',245,1),(11563,23,2,'2013-06-10','1990',245,1),(11564,24,2,'2013-07-08','1990',245,1),(11565,25,2,'2013-08-08','1990',245,1),(11566,26,2,'2013-09-09','1990',245,1),(11567,27,2,'2013-10-08','1990',245,1),(11568,28,2,'2013-11-08','1990',245,1),(11569,29,2,'2013-12-09','1990',245,1),(11570,30,2,'2014-01-08','1990',245,1),(11571,31,2,'2014-02-10','1990',245,1),(11572,32,2,'2014-03-10','1990',245,1),(11573,33,2,'2014-04-08','1990',245,1),(11574,34,2,'2014-05-08','1990',245,1),(11575,35,2,'2014-06-09','1990',245,1),(11576,36,2,'2014-07-08','1990',245,1),(11577,37,2,'2014-08-08','1990',245,1),(11578,38,2,'2014-09-08','1990',245,1),(11579,39,2,'2014-10-08','1990',245,1),(11580,40,2,'2014-11-10','1990',245,1),(11581,41,2,'2014-12-08','1990',245,1),(11582,42,2,'2015-01-08','1990',245,1),(11583,43,2,'2015-02-09','1990',245,1),(11584,44,2,'2015-03-09','1990',245,1),(11585,45,2,'2015-04-08','1990',245,1),(11586,46,2,'2015-05-08','1990',245,1),(11587,47,2,'2015-06-08','1990',245,1),(11588,48,2,'2015-07-08','1990',245,1),(11589,1,2,'2011-08-31','1990',246,1),(11590,2,2,'2011-09-08','1990',246,1),(11591,3,2,'2011-10-10','1990',246,1),(11592,4,2,'2011-11-08','1990',246,1),(11593,5,2,'2011-12-08','1990',246,1),(11594,6,2,'2012-01-09','1990',246,1),(11595,7,2,'2012-02-08','1990',246,1),(11596,8,2,'2012-03-08','1990',246,1),(11597,9,2,'2012-04-11','1990',246,1),(11598,10,2,'2012-05-08','1990',246,1),(11599,11,2,'2012-06-08','1990',246,1),(11600,12,2,'2012-07-09','1990',246,1),(11601,13,2,'2012-08-08','1990',246,1),(11602,14,2,'2012-09-10','1990',246,1),(11603,15,2,'2012-10-08','1990',246,1),(11604,16,2,'2012-11-08','1990',246,1),(11605,17,2,'2012-12-10','1990',246,1),(11606,18,2,'2013-01-08','1990',246,1),(11607,19,2,'2013-02-08','1990',246,1),(11608,20,2,'2013-03-08','1990',246,1),(11609,21,2,'2013-04-08','1990',246,1),(11610,22,2,'2013-05-08','1990',246,1),(11611,23,2,'2013-06-10','1990',246,1),(11612,24,2,'2013-07-08','1990',246,1),(11613,25,2,'2013-08-08','1990',246,1),(11614,26,2,'2013-09-09','1990',246,1),(11615,27,2,'2013-10-08','1990',246,1),(11616,28,2,'2013-11-08','1990',246,1),(11617,29,2,'2013-12-09','1990',246,1),(11618,30,2,'2014-01-08','1990',246,1),(11619,31,2,'2014-02-10','1990',246,1),(11620,32,2,'2014-03-10','1990',246,1),(11621,33,2,'2014-04-08','1990',246,1),(11622,34,2,'2014-05-08','1990',246,1),(11623,35,2,'2014-06-09','1990',246,1),(11624,36,2,'2014-07-08','1990',246,1),(11625,37,2,'2014-08-08','1990',246,1),(11626,38,2,'2014-09-08','1990',246,1),(11627,39,2,'2014-10-08','1990',246,1),(11628,40,2,'2014-11-10','1990',246,1),(11629,41,2,'2014-12-08','1990',246,1),(11630,42,2,'2015-01-08','1990',246,1),(11631,43,2,'2015-02-09','1990',246,1),(11632,44,2,'2015-03-09','1990',246,1),(11633,45,2,'2015-04-08','1990',246,1),(11634,46,2,'2015-05-08','1990',246,1),(11635,47,2,'2015-06-08','1990',246,1),(11636,48,2,'2015-07-08','1990',246,1),(11637,1,2,'2011-08-31','1990',247,1),(11638,2,2,'2011-09-08','1990',247,1),(11639,3,2,'2011-10-10','1990',247,1),(11640,4,2,'2011-11-08','1990',247,1),(11641,5,2,'2011-12-08','1990',247,1),(11642,6,2,'2012-01-09','1990',247,1),(11643,7,2,'2012-02-08','1990',247,1),(11644,8,2,'2012-03-08','1990',247,1),(11645,9,2,'2012-04-11','1990',247,1),(11646,10,2,'2012-05-08','1990',247,1),(11647,11,2,'2012-06-08','1990',247,1),(11648,12,2,'2012-07-09','1990',247,1),(11649,13,2,'2012-08-08','1990',247,1),(11650,14,2,'2012-09-10','1990',247,1),(11651,15,2,'2012-10-08','1990',247,1),(11652,16,2,'2012-11-08','1990',247,1),(11653,17,2,'2012-12-10','1990',247,1),(11654,18,2,'2013-01-08','1990',247,1),(11655,19,2,'2013-02-08','1990',247,1),(11656,20,2,'2013-03-08','1990',247,1),(11657,21,2,'2013-04-08','1990',247,1),(11658,22,2,'2013-05-08','1990',247,1),(11659,23,2,'2013-06-10','1990',247,1),(11660,24,2,'2013-07-08','1990',247,1),(11661,25,2,'2013-08-08','1990',247,1),(11662,26,2,'2013-09-09','1990',247,1),(11663,27,2,'2013-10-08','1990',247,1),(11664,28,2,'2013-11-08','1990',247,1),(11665,29,2,'2013-12-09','1990',247,1),(11666,30,2,'2014-01-08','1990',247,1),(11667,31,2,'2014-02-10','1990',247,1),(11668,32,2,'2014-03-10','1990',247,1),(11669,33,2,'2014-04-08','1990',247,1),(11670,34,2,'2014-05-08','1990',247,1),(11671,35,2,'2014-06-09','1990',247,1),(11672,36,2,'2014-07-08','1990',247,1),(11673,37,2,'2014-08-08','1990',247,1),(11674,38,2,'2014-09-08','1990',247,1),(11675,39,2,'2014-10-08','1990',247,1),(11676,40,2,'2014-11-10','1990',247,1),(11677,41,2,'2014-12-08','1990',247,1),(11678,42,2,'2015-01-08','1990',247,1),(11679,43,2,'2015-02-09','1990',247,1),(11680,44,2,'2015-03-09','1990',247,1),(11681,45,2,'2015-04-08','1990',247,1),(11682,46,2,'2015-05-08','1990',247,1),(11683,47,2,'2015-06-08','1990',247,1),(11684,48,2,'2015-07-08','1990',247,1);
/*!40000 ALTER TABLE `Contratos_Detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_perfiles_detail`
--

DROP TABLE IF EXISTS `menu_perfiles_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_perfiles_detail` (
  `id_perfil_detalle` int(11) unsigned NOT NULL,
  `id_perfil` int(11) unsigned NOT NULL,
  `id_funcion` int(11) unsigned NOT NULL,
  `lectura` int(11) NOT NULL,
  `escritura` int(11) NOT NULL,
  `borrado` int(11) NOT NULL,
  `impresion` int(11) NOT NULL,
  `autorizacion` int(11) DEFAULT NULL,
  `ultimaAct` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_perfil_detalle`),
  KEY `FK_menuperfilesdetail_menuperfilesmaster` (`id_perfil`),
  KEY `FK_menuperfilesdetail_menufunciones` (`id_funcion`),
  CONSTRAINT `FK_menuperfilesdetail_menufunciones` FOREIGN KEY (`id_funcion`) REFERENCES `menu_funciones` (`id_funcion`),
  CONSTRAINT `FK_menuperfilesdetail_menuperfilesmaster` FOREIGN KEY (`id_perfil`) REFERENCES `menu_perfiles_master` (`id_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_perfiles_detail`
--

LOCK TABLES `menu_perfiles_detail` WRITE;
/*!40000 ALTER TABLE `menu_perfiles_detail` DISABLE KEYS */;
INSERT INTO `menu_perfiles_detail` VALUES (1,1,1,1,1,1,1,1,'2011-09-09 00:27:34'),(2,1,2,1,1,1,1,1,'2011-09-09 00:27:35'),(3,1,3,1,1,1,1,1,'2011-09-09 00:27:35'),(4,1,4,1,1,1,1,1,'2011-09-09 00:27:35'),(5,1,5,1,1,1,1,1,'2011-09-09 00:27:36'),(6,1,6,1,1,1,1,1,'2011-09-09 00:27:36'),(7,1,7,1,1,1,1,1,'2011-09-09 00:27:36'),(8,1,8,1,1,1,1,1,'2011-09-09 00:27:36'),(10,1,10,1,1,1,1,1,'2011-09-09 00:27:37'),(11,1,11,1,1,1,1,1,'2011-09-09 00:27:37'),(12,1,12,1,1,1,1,1,'2011-09-09 00:27:37'),(15,1,15,1,1,1,1,1,'2011-09-09 00:27:37'),(16,1,16,1,1,1,1,1,'2011-09-09 00:27:38'),(17,1,17,1,1,1,1,1,'2011-09-09 00:27:38'),(19,1,19,1,1,1,1,1,'2011-09-09 00:27:38'),(21,1,21,1,1,1,1,1,'2011-09-09 00:27:38'),(22,1,22,1,1,1,1,1,'2011-09-09 00:27:38'),(23,1,23,1,1,1,1,1,'2011-09-09 00:27:39'),(24,1,24,1,1,1,1,1,'2011-09-09 00:27:39'),(26,1,26,1,1,1,1,1,'2011-09-09 00:27:39'),(27,1,27,1,1,1,1,1,'2011-09-09 00:27:39'),(28,1,28,1,1,1,1,1,'2011-09-09 00:27:39'),(29,1,29,1,1,1,1,1,'2011-09-09 00:27:40'),(30,1,30,1,1,1,1,1,'2011-09-09 00:27:40'),(31,1,31,1,1,1,1,1,'2011-09-09 00:27:40'),(32,1,32,1,1,1,1,1,'2011-09-09 00:27:40'),(33,1,33,1,1,1,1,1,'2011-09-09 00:27:40'),(34,1,34,1,1,1,1,1,'2011-09-09 00:27:41'),(35,1,35,1,1,1,1,1,'2011-09-09 00:27:41'),(40,1,40,1,1,1,1,1,'2011-09-09 00:27:42'),(41,1,41,1,1,1,1,1,'2011-09-09 00:27:43'),(42,1,42,1,1,1,1,1,'2011-09-09 00:27:43'),(43,1,43,1,1,1,1,1,'2011-09-09 00:27:44'),(44,1,44,1,1,1,1,1,'2011-09-13 16:29:56'),(45,1,45,1,1,1,1,1,'2011-10-10 17:35:01'),(46,1,46,1,1,1,1,1,'2011-11-30 17:57:48'),(47,1,47,1,1,1,1,1,'2011-10-20 00:38:28');
/*!40000 ALTER TABLE `menu_perfiles_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Programa_Pagos_Detalle`
--

DROP TABLE IF EXISTS `Programa_Pagos_Detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Programa_Pagos_Detalle` (
  `programa_pagos_detalle_id` int(11) NOT NULL,
  `programaPagos_id` int(11) NOT NULL,
  `partida` int(10) NOT NULL,
  `subcuenta_id` int(11) NOT NULL,
  `fechaVigencia` date NOT NULL,
  `estatus_id` int(11) NOT NULL,
  `importe` decimal(10,0) NOT NULL,
  `version` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`programa_pagos_detalle_id`),
  KEY `FK_ProgramaPagosDetalle_ProgramaPagos` (`programaPagos_id`),
  KEY `FK_ProgramaPagosDetalle_Subcuentas` (`subcuenta_id`),
  KEY `FK_ProgramaPagosDetalle_Estatus` (`estatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Programa_Pagos_Detalle`
--

LOCK TABLES `Programa_Pagos_Detalle` WRITE;
/*!40000 ALTER TABLE `Programa_Pagos_Detalle` DISABLE KEYS */;
INSERT INTO `Programa_Pagos_Detalle` VALUES (1,1,1,2,'2010-08-23',1,'1990',0),(2,1,2,2,'2010-09-08',1,'1990',0),(3,1,3,2,'2010-10-08',1,'1990',0),(4,1,4,2,'2010-11-08',1,'1990',0),(5,1,5,2,'2010-12-08',1,'1990',0),(6,1,6,2,'2011-01-10',1,'1990',0),(7,1,7,2,'2011-02-08',1,'1990',0),(8,1,8,2,'2011-03-09',1,'1990',0),(9,1,9,2,'2011-04-08',1,'1990',0),(10,1,10,2,'2011-05-09',1,'1990',0),(11,1,11,2,'2011-06-08',1,'1990',0),(12,1,12,2,'2011-07-08',1,'1990',0),(13,1,13,2,'2011-08-08',1,'1990',0),(14,1,14,2,'2011-09-08',1,'1990',0),(15,1,15,2,'2011-10-10',1,'1990',0),(16,1,16,2,'2011-11-08',1,'1990',0),(17,1,17,2,'2011-12-08',1,'1990',0),(18,1,18,2,'2012-01-09',1,'1990',0),(19,1,19,2,'2012-02-08',1,'1990',0),(20,1,20,2,'2012-03-08',1,'1990',0),(21,1,21,2,'2012-04-09',1,'1990',0),(22,1,22,2,'2012-05-08',1,'1990',0),(23,1,23,2,'2012-07-09',1,'1990',0),(24,1,24,2,'2012-08-08',1,'1990',0),(25,1,25,2,'2012-09-10',1,'1990',0),(26,1,26,2,'2012-10-08',1,'1990',0),(27,1,27,2,'2012-11-08',1,'1990',0),(28,1,28,2,'2012-12-10',1,'1990',0),(29,1,29,2,'2013-01-08',1,'1990',0),(30,1,30,2,'2013-02-08',1,'1990',0),(31,1,31,2,'2013-03-08',1,'1990',0),(32,1,32,2,'2013-04-08',1,'1990',0),(33,1,33,2,'2013-05-08',1,'1990',0),(34,1,34,2,'2013-06-10',1,'1990',0),(35,1,35,2,'2013-07-08',1,'1990',0),(36,1,36,2,'2013-08-08',1,'1990',0),(37,1,37,2,'2013-09-09',1,'1990',0),(38,1,38,2,'2013-10-08',1,'1990',0),(39,1,39,2,'2013-11-08',1,'1990',0),(40,1,40,2,'2013-12-09',1,'1990',0),(41,1,41,2,'2014-01-08',1,'1990',0),(42,1,42,2,'2014-02-10',1,'1990',0),(43,1,43,2,'2014-03-10',1,'1990',0),(44,1,44,2,'2014-04-08',1,'1990',0),(45,1,45,2,'2014-05-08',1,'1990',0),(46,1,46,2,'2014-06-09',1,'1990',0),(52,3,1,2,'2011-08-31',1,'1990',0),(53,3,2,2,'2011-09-08',1,'1990',0),(54,3,3,2,'2011-10-10',1,'1990',0),(55,3,4,2,'2011-11-08',1,'1990',0),(56,3,5,2,'2011-12-08',1,'1990',0),(57,3,6,2,'2012-01-09',1,'1990',0),(58,3,7,2,'2012-02-08',1,'1990',0),(59,3,8,2,'2012-03-08',1,'1990',0),(60,3,9,2,'2012-04-11',1,'1990',0),(61,3,10,2,'2012-05-08',1,'1990',0),(62,3,11,2,'2012-06-08',1,'1990',0),(63,3,12,2,'2012-07-09',1,'1990',0),(64,3,13,2,'2012-08-08',1,'1990',0),(65,3,14,2,'2012-09-10',1,'1990',0),(66,3,15,2,'2012-10-08',1,'1990',0),(67,3,16,2,'2012-11-08',1,'1990',0),(68,3,17,2,'2012-12-10',1,'1990',0),(69,3,18,2,'2013-01-08',1,'1990',0),(70,3,19,2,'2013-02-08',1,'1990',0),(71,3,20,2,'2013-03-08',1,'1990',0),(72,3,21,2,'2013-04-08',1,'1990',0),(73,3,22,2,'2013-05-08',1,'1990',0),(74,3,23,2,'2013-06-10',1,'1990',0),(75,3,24,2,'2013-07-08',1,'1990',0),(76,3,25,2,'2013-08-08',1,'1990',0),(77,3,26,2,'2013-09-09',1,'1990',0),(78,3,27,2,'2013-10-08',1,'1990',0),(79,3,28,2,'2013-11-08',1,'1990',0),(80,3,29,2,'2013-12-09',1,'1990',0),(81,3,30,2,'2014-01-08',1,'1990',0),(82,3,31,2,'2014-02-10',1,'1990',0),(83,3,32,2,'2014-03-10',1,'1990',0),(84,3,33,2,'2014-04-08',1,'1990',0),(85,3,34,2,'2014-05-08',1,'1990',0),(86,3,35,2,'2014-06-09',1,'1990',0),(87,3,36,2,'2014-07-08',1,'1990',0),(88,3,37,2,'2014-08-08',1,'1990',0),(89,3,38,2,'2014-09-08',1,'1990',0),(90,3,39,2,'2014-10-08',1,'1990',0),(91,3,40,2,'2014-11-10',1,'1990',0),(92,3,41,2,'2014-12-08',1,'1990',0),(93,3,42,2,'2015-01-08',1,'1990',0),(94,3,43,2,'2015-02-09',1,'1990',0),(95,3,44,2,'2015-03-09',1,'1990',0),(96,3,45,2,'2015-04-08',1,'1990',0),(97,3,46,2,'2015-05-08',1,'1990',0),(98,3,47,2,'2015-06-08',1,'1990',0),(99,3,48,2,'2015-07-08',1,'1990',0);
/*!40000 ALTER TABLE `Programa_Pagos_Detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_procesos`
--

DROP TABLE IF EXISTS `menu_procesos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_procesos` (
  `id_proceso` int(11) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `estatus_id` int(11) unsigned NOT NULL,
  `idioma_id` int(11) unsigned NOT NULL,
  `orden` int(11) NOT NULL,
  PRIMARY KEY (`id_proceso`),
  KEY `FK_menuprocesos_Estatus` (`estatus_id`),
  KEY `FK_menuprocesos_Idiomas` (`idioma_id`),
  CONSTRAINT `FK_menuprocesos_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`),
  CONSTRAINT `FK_menuprocesos_Idiomas` FOREIGN KEY (`idioma_id`) REFERENCES `Idiomas` (`idioma_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_procesos`
--

LOCK TABLES `menu_procesos` WRITE;
/*!40000 ALTER TABLE `menu_procesos` DISABLE KEYS */;
INSERT INTO `menu_procesos` VALUES (1,'ADMINISTRACION ESCOLAR',1,1,1),(2,'ADMINISTRACION ACADEMICA',1,1,2),(3,'VENTAS',1,1,3);
/*!40000 ALTER TABLE `menu_procesos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Alumnos`
--

DROP TABLE IF EXISTS `Alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Alumnos` (
  `matricula` varchar(20) NOT NULL DEFAULT '',
  `prospecto_id` int(11) unsigned NOT NULL,
  `estatus_id` int(11) unsigned NOT NULL,
  `empresa_id` int(11) unsigned NOT NULL,
  `alumno_id` int(11) NOT NULL,
  PRIMARY KEY (`alumno_id`),
  KEY `FK_Alumnos_Prospectos` (`prospecto_id`),
  KEY `FK_Alumnos_Estatus` (`estatus_id`),
  KEY `FK_Alumnos_Empresas` (`empresa_id`),
  CONSTRAINT `FK_Alumnos_Empresas` FOREIGN KEY (`empresa_id`) REFERENCES `Empresas` (`empresa_id`),
  CONSTRAINT `FK_Alumnos_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`),
  CONSTRAINT `FK_Alumnos_Prospectos` FOREIGN KEY (`prospecto_id`) REFERENCES `Prospectos` (`prospecto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alumnos`
--

LOCK TABLES `Alumnos` WRITE;
/*!40000 ALTER TABLE `Alumnos` DISABLE KEYS */;
INSERT INTO `Alumnos` VALUES ('e0000001',182,1,1,1),('e0000002',183,1,1,2),('e0000003',184,1,1,3),('e0000004',185,1,1,4),('e0000005',186,1,1,5),('e0000006',187,1,1,6),('e0000007',188,1,1,7),('e0000008',189,1,1,8),('e0000009',16,1,1,9),('e0000010',190,1,1,10),('e0000011',191,1,1,11),('e0000012',192,1,1,12),('e0000013',193,1,1,13),('e0000014',194,1,1,14),('e0000015',195,1,1,15),('e0000016',196,1,1,16),('e0000017',197,1,1,17),('e0000018',198,1,1,18),('e0000019',199,1,1,19),('e0000020',200,1,1,20),('e0000021',201,1,1,21),('e0000022',202,1,1,22),('e0000023',203,1,1,23),('e0000024',204,1,1,24),('e0000025',205,1,1,25),('e0000026',206,1,1,26),('e0000027',207,1,1,27),('e0000028',208,1,1,28),('e0000029',209,1,1,29),('e0000030',210,1,1,30),('e0000031',211,1,1,31),('e0000032',212,1,1,32),('e0000033',213,1,1,33),('e0000034',214,1,1,34),('e0000035',215,1,1,35),('e0000036',216,1,1,36),('e0000037',217,1,1,37),('e0000038',218,1,1,38),('e0000039',219,1,1,39),('e0000040',220,1,1,40),('e0000041',221,1,1,41),('e0000042',222,1,1,42),('e0000043',223,1,1,43),('e0000044',224,1,1,44),('e0000045',225,1,1,45),('e0000046',226,1,1,46),('e0000047',227,1,1,47),('e0000048',228,1,1,48),('e0000049',229,1,1,49),('e0000050',230,1,1,50),('e0000051',231,1,1,51),('e0000052',232,1,1,52),('e0000053',233,1,1,53),('e0000054',234,1,1,54),('e0000055',235,1,1,55),('e0000056',236,1,1,56),('e0000057',237,1,1,57),('e0000058',238,1,1,58),('e0000059',239,1,1,59),('e0000060',240,1,1,60),('e0000061',241,1,1,61),('e0000062',242,1,1,62),('e0000063',243,1,1,63),('e0000064',244,1,1,64),('e0000065',245,1,1,65),('e0000066',246,1,1,66),('e0000067',247,1,1,67),('e0000068',248,1,1,68),('e0000069',249,1,1,69),('e0000070',250,1,1,70),('e0000071',251,1,1,71),('e0000072',252,1,1,72),('e0000073',253,1,1,73),('e0000074',254,1,1,74),('e0000075',255,1,1,75),('e0000076',256,1,1,76),('e0000077',257,1,1,77),('e0000078',258,1,1,78),('e0000079',259,1,1,79),('e0000080',260,1,1,80),('e0000081',261,1,1,81),('e0000082',262,1,1,82),('e0000083',263,1,1,83),('e0000084',264,1,1,84),('e0000085',265,1,1,85),('e0000086',266,1,1,86),('e0000087',17,1,1,87),('e0000088',18,1,1,88),('e0000089',6,1,1,89),('e0000090',10,1,1,90),('e0000091',19,1,1,91),('e0000092',20,1,1,92),('e0000093',11,1,1,93),('e0000094',21,1,1,94),('e0000095',22,1,1,95),('e0000096',14,1,1,96),('e0000097',24,1,1,97),('e0000098',25,1,1,98),('e0000099',26,1,1,99),('e0000100',38,1,1,100),('e0000101',39,1,1,101),('e0000102',40,1,1,102),('e0000103',41,1,1,103),('e0000104',42,1,1,104),('e0000105',43,1,1,105),('e0000106',44,1,1,106),('e0000107',45,1,1,107),('e0000108',46,1,1,108),('e0000109',47,1,1,109),('e0000110',48,1,1,110),('e0000111',50,1,1,111),('e0000112',51,1,1,112),('e0000113',156,1,1,113),('e0000114',157,1,1,114),('e0000115',12,1,1,115),('e0000116',4,1,1,116),('e0000117',52,1,1,117),('e0000118',53,1,1,118),('e0000119',54,1,1,119),('e0000120',55,1,1,120),('e0000121',56,1,1,121),('e0000122',57,1,1,122),('e0000123',58,1,1,123),('e0000124',59,1,1,124),('e0000125',60,1,1,125),('e0000126',61,1,1,126),('e0000127',62,1,1,127),('e0000128',63,1,1,128),('e0000129',64,1,1,129),('e0000130',9,1,1,130),('e0000131',65,1,1,131),('e0000132',66,1,1,132),('e0000133',67,1,1,133),('e0000134',68,1,1,134);
/*!40000 ALTER TABLE `Alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Subcuentas`
--

DROP TABLE IF EXISTS `Subcuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Subcuentas` (
  `subcuenta_id` int(11) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `importe` decimal(10,0) NOT NULL,
  `estatus_id` int(11) unsigned NOT NULL,
  `tipo` char(1) NOT NULL DEFAULT '',
  `version` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`subcuenta_id`),
  UNIQUE KEY `unique_subcuentas_nombre` (`nombre`),
  KEY `FK_Subcuentas_Estatus` (`estatus_id`),
  CONSTRAINT `FK_Subcuentas_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Subcuentas`
--

LOCK TABLES `Subcuentas` WRITE;
/*!40000 ALTER TABLE `Subcuentas` DISABLE KEYS */;
INSERT INTO `Subcuentas` VALUES (1,'INSCRIPCION','1990',1,'C',0),(2,'MENSUALIDAD','1990',1,'C',0),(3,'CARGO PAGO EXTEMPORANEO','130',1,'C',0),(4,'APLICACION ANTICIPO','700',1,'C',0),(5,'DESC PAGOS ANTICIPADOS','600',1,'A',0),(6,'DESCUENTO BECA','500',1,'A',0),(7,'PAGO','0',1,'A',0),(8,'INTERES','4',1,'C',0);
/*!40000 ALTER TABLE `Subcuentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empresas`
--

DROP TABLE IF EXISTS `Empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Empresas` (
  `empresa_id` int(11) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `nombreCorto` varchar(50) NOT NULL DEFAULT '',
  `codigo` int(11) NOT NULL,
  `moneda_id` int(11) unsigned NOT NULL,
  `grupo_id` int(11) unsigned NOT NULL,
  `telefono` varchar(100) NOT NULL DEFAULT '',
  `estatus_id` int(11) unsigned NOT NULL,
  `version` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`empresa_id`),
  UNIQUE KEY `unique_empresas_nombre` (`nombre`),
  UNIQUE KEY `unique_empresas_nombrecorto` (`nombreCorto`),
  KEY `FK_Empresas_Grupos` (`grupo_id`),
  KEY `FK_Empresas_Estatus` (`estatus_id`),
  KEY `FK_Empresas_Monedas` (`moneda_id`),
  CONSTRAINT `FK_Empresas_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Empresas` (`empresa_id`),
  CONSTRAINT `FK_Empresas_Grupos` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`grupo_id`),
  CONSTRAINT `FK_Empresas_Monedas` FOREIGN KEY (`moneda_id`) REFERENCES `Monedas` (`moneda_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empresas`
--

LOCK TABLES `Empresas` WRITE;
/*!40000 ALTER TABLE `Empresas` DISABLE KEYS */;
INSERT INTO `Empresas` VALUES (1,'USS CULIACAN','USS CULIACAN',1,1,1,'667612612',1,NULL),(2,'USS MOCHIS','USS MOCHIS',2,1,1,'387463677',1,NULL),(3,'USS MAZATLAN','USS MAZATLAN',3,1,1,'983984989',1,NULL);
/*!40000 ALTER TABLE `Empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Generaciones`
--

DROP TABLE IF EXISTS `Generaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Generaciones` (
  `generacion_id` int(11) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `estatus_id` int(11) unsigned NOT NULL,
  `version` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`generacion_id`),
  UNIQUE KEY `unique_generaciones_nombre` (`nombre`),
  KEY `FK_Generaciones_Estatus` (`estatus_id`),
  CONSTRAINT `FK_Generaciones_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Generaciones`
--

LOCK TABLES `Generaciones` WRITE;
/*!40000 ALTER TABLE `Generaciones` DISABLE KEYS */;
INSERT INTO `Generaciones` VALUES (1,'2010-2014',1,NULL),(2,'2011-2015',1,NULL);
/*!40000 ALTER TABLE `Generaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Promociones_Prospectos`
--

DROP TABLE IF EXISTS `Promociones_Prospectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Promociones_Prospectos` (
  `promocion_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `prospecto_id` int(11) unsigned DEFAULT NULL,
  `estatus_id` int(11) unsigned DEFAULT NULL,
  `version` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`promocion_id`),
  KEY `FK_PromocionesProspectos_Prospectos` (`prospecto_id`),
  KEY `FK_PromocionesProspectos_Estatus` (`estatus_id`),
  CONSTRAINT `FK_PromocionesProspectos_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`),
  CONSTRAINT `FK_PromocionesProspectos_Promociones` FOREIGN KEY (`promocion_id`) REFERENCES `Promociones` (`promocion_id`),
  CONSTRAINT `FK_PromocionesProspectos_Prospectos` FOREIGN KEY (`prospecto_id`) REFERENCES `Prospectos` (`prospecto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Promociones_Prospectos`
--

LOCK TABLES `Promociones_Prospectos` WRITE;
/*!40000 ALTER TABLE `Promociones_Prospectos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Promociones_Prospectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Monedas`
--

DROP TABLE IF EXISTS `Monedas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Monedas` (
  `moneda_id` int(11) unsigned NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `estatus_id` int(11) unsigned DEFAULT NULL,
  `version` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`moneda_id`),
  UNIQUE KEY `unique_monedas_nombre` (`nombre`),
  KEY `FK_Monedas_Estatus` (`estatus_id`),
  CONSTRAINT `FK_Monedas_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Monedas`
--

LOCK TABLES `Monedas` WRITE;
/*!40000 ALTER TABLE `Monedas` DISABLE KEYS */;
INSERT INTO `Monedas` VALUES (1,'MX',1,NULL),(2,'DLL',1,NULL);
/*!40000 ALTER TABLE `Monedas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Idiomas`
--

DROP TABLE IF EXISTS `Idiomas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Idiomas` (
  `idioma_id` int(11) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `estatus_id` int(11) unsigned NOT NULL,
  `nombreCorto` varchar(50) NOT NULL DEFAULT '',
  `version` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`idioma_id`),
  UNIQUE KEY `unique_idiomas_nombre` (`nombre`),
  KEY `FK_Idiomas_Estatus` (`estatus_id`),
  KEY `unique_gruposalumnos_nombrecorto` (`nombreCorto`),
  CONSTRAINT `FK_Idiomas_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Idiomas`
--

LOCK TABLES `Idiomas` WRITE;
/*!40000 ALTER TABLE `Idiomas` DISABLE KEYS */;
INSERT INTO `Idiomas` VALUES (1,'ESPAÑOL',1,'',NULL),(2,'INGLES',1,'',NULL),(3,'PORTUGUES',1,'',NULL);
/*!40000 ALTER TABLE `Idiomas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Estatus`
--

DROP TABLE IF EXISTS `Estatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Estatus` (
  `estatus_id` int(11) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `catalogo` tinyint(1) NOT NULL,
  PRIMARY KEY (`estatus_id`),
  UNIQUE KEY `unique_estatus_nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Estatus`
--

LOCK TABLES `Estatus` WRITE;
/*!40000 ALTER TABLE `Estatus` DISABLE KEYS */;
INSERT INTO `Estatus` VALUES (1,'ACTIVO',1),(2,'CANCELADO',1),(3,'AUTORIZADO',1),(4,'APROBADO',0),(5,'INACTIVO',1),(6,'APLICADO',0),(7,'PAGADO',0),(8,'VENCIDO',0),(9,'POR VENCER',0),(10,'PROCESO FACTURACION',0);
/*!40000 ALTER TABLE `Estatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Periodos`
--

DROP TABLE IF EXISTS `Periodos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Periodos` (
  `periodo_id` int(11) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `estatus_id` int(11) NOT NULL,
  `version` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`periodo_id`),
  UNIQUE KEY `unique_periodos_nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Periodos`
--

LOCK TABLES `Periodos` WRITE;
/*!40000 ALTER TABLE `Periodos` DISABLE KEYS */;
INSERT INTO `Periodos` VALUES (1,'QUINCENAL',1,NULL),(2,'MENSUAL',1,NULL),(3,'BIMESTRAL',1,NULL),(4,'TRIMESTRAL',1,NULL),(5,'TETRAMESTRAL',1,NULL),(6,'SEMESTRAL',1,NULL),(7,'ANUAL',1,NULL);
/*!40000 ALTER TABLE `Periodos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_funciones`
--

DROP TABLE IF EXISTS `menu_funciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_funciones` (
  `id_funcion` int(11) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `orden` int(11) NOT NULL,
  `idioma_id` int(11) unsigned NOT NULL,
  `id_opcion` int(11) unsigned NOT NULL,
  `estatus_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_funcion`),
  KEY `FK_menufunciones_Idiomas` (`idioma_id`),
  KEY `FK_menufunciones_menuopciones` (`id_opcion`),
  KEY `FK_menufunciones_Estatus` (`estatus_id`),
  CONSTRAINT `FK_menufunciones_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`),
  CONSTRAINT `FK_menufunciones_Idiomas` FOREIGN KEY (`idioma_id`) REFERENCES `Idiomas` (`idioma_id`),
  CONSTRAINT `FK_menufunciones_menuopciones` FOREIGN KEY (`id_opcion`) REFERENCES `menu_opciones` (`id_opcion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_funciones`
--

LOCK TABLES `menu_funciones` WRITE;
/*!40000 ALTER TABLE `menu_funciones` DISABLE KEYS */;
INSERT INTO `menu_funciones` VALUES (1,'PAISES',1,1,1,1),(2,'ESTADOS',2,1,1,1),(3,'POBLACIONES',3,1,1,1),(4,'COLONIAS',4,1,1,1),(5,'PREPARATORIAS',5,1,1,1),(6,'ALERGIAS',6,1,1,1),(7,'CICLOS',7,1,1,1),(8,'DOCUMENTOS',8,1,1,1),(10,'CATEGORIAS DE SERVICIOS',10,1,1,1),(11,'SERVICIOS',11,1,1,1),(12,'DOCUMENTOS POR PROSPECTO',12,1,8,1),(15,'CONFIGURACION PROGRAMA DE PAGOS',1,1,2,1),(16,'PROSPECTOS',16,1,7,1),(17,'BECAS',17,1,7,1),(19,'LINEAS DE FORMACION',19,1,4,1),(21,'MAPA CURRICULAR',21,1,5,1),(22,'GRUPOS ALUMNOS',22,1,4,1),(23,'DOCUMENTOS ESCOLARES',23,1,7,1),(24,'SERVICIOS INTERES POR PROSPECTO',24,1,8,1),(26,'TUTORES',12,1,1,1),(27,'TUTORES POR PROSPECTO',27,1,8,1),(28,'DESCUENTOS',13,1,1,1),(29,'APROBACION DOCUMENTOS ESCOLARES',2,1,2,1),(30,'ALERGIAS POR PROSPECTO',30,1,8,1),(31,'IDIOMAS POR PROSPECTO',31,1,8,1),(32,'PROMOCIONES',32,1,7,1),(33,'ANTICIPOS',4,1,2,1),(34,'CONTRATOS',3,1,2,1),(35,'TIPOS DE BECAS',35,1,7,1),(40,'DATOS FISCALES',5,1,2,1),(41,'FACTURACION',6,1,2,1),(42,'CUENTAS',14,1,1,1),(43,'SUBCUENTAS',15,1,1,1),(44,'CUENTAS POR SUBCUENTAS',16,1,2,1),(45,'ALUMNOS',36,1,7,1),(46,'ESTADO DE CUENTA',38,1,8,1),(47,'BECAS POR PROSPECTO',37,1,8,1);
/*!40000 ALTER TABLE `menu_funciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Materias`
--

DROP TABLE IF EXISTS `Materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Materias` (
  `materia_id` int(11) unsigned NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `estatus_id` int(11) unsigned DEFAULT NULL,
  `horasteoricas` int(3) DEFAULT NULL,
  `horasindependientes` int(3) DEFAULT NULL,
  `horaspracticas` int(3) DEFAULT NULL,
  `empresa_id` int(11) unsigned DEFAULT NULL,
  `version` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`materia_id`),
  UNIQUE KEY `unique_materias_nombre` (`nombre`),
  KEY `FK_Materias_Estatus` (`estatus_id`),
  KEY `FK_Materias_Empresas` (`empresa_id`),
  CONSTRAINT `FK_Materias_Empresas` FOREIGN KEY (`empresa_id`) REFERENCES `Empresas` (`empresa_id`),
  CONSTRAINT `FK_Materias_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Materias`
--

LOCK TABLES `Materias` WRITE;
/*!40000 ALTER TABLE `Materias` DISABLE KEYS */;
/*!40000 ALTER TABLE `Materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Facturas`
--

DROP TABLE IF EXISTS `Facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Facturas` (
  `factura_id` int(11) unsigned NOT NULL,
  `folio` varchar(50) NOT NULL,
  `fechaCreacion` date NOT NULL,
  `rfc` varchar(50) NOT NULL DEFAULT '',
  `serie` varchar(50) NOT NULL DEFAULT '',
  `calle` varchar(100) NOT NULL DEFAULT '',
  `numero` int(11) NOT NULL,
  `codigoPostal` varchar(20) NOT NULL DEFAULT '',
  `poblacion_id` int(11) NOT NULL,
  `alumno_id` int(11) NOT NULL,
  `colonia_id` int(11) NOT NULL,
  `estatus_id` int(11) unsigned NOT NULL,
  `empresa_id` int(11) unsigned NOT NULL,
  `version` bigint(11) DEFAULT NULL,
  `razonSocial` varchar(145) NOT NULL,
  PRIMARY KEY (`factura_id`),
  UNIQUE KEY `unique_facturas_folio` (`folio`),
  UNIQUE KEY `unique_factura_serie` (`serie`),
  KEY `FK_Facturas_Estatus` (`estatus_id`),
  KEY `FK_Facturas_Empresas` (`empresa_id`),
  CONSTRAINT `FK_Facturas_Empresas` FOREIGN KEY (`empresa_id`) REFERENCES `Empresas` (`empresa_id`),
  CONSTRAINT `FK_Facturas_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Facturas`
--

LOCK TABLES `Facturas` WRITE;
/*!40000 ALTER TABLE `Facturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Documentos_Escolares_Prospectos`
--

DROP TABLE IF EXISTS `Documentos_Escolares_Prospectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Documentos_Escolares_Prospectos` (
  `documentoEscolar_id` int(11) unsigned NOT NULL,
  `prospecto_id` int(11) unsigned NOT NULL,
  `estatus_id` int(11) unsigned NOT NULL,
  `empresa_id` int(11) unsigned NOT NULL,
  `version` bigint(11) DEFAULT NULL,
  KEY `FK_DocumentosEscolaresProspectos_Estatus` (`estatus_id`),
  KEY `FK_DocumentosEscolaresProspectos_Prospectos` (`prospecto_id`),
  KEY `FK_DocumentosEscolaresProspectos_Empresas` (`empresa_id`),
  CONSTRAINT `FK_DocumentosEscolaresProspectos_Empresas` FOREIGN KEY (`empresa_id`) REFERENCES `Empresas` (`empresa_id`),
  CONSTRAINT `FK_DocumentosEscolaresProspectos_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`),
  CONSTRAINT `FK_DocumentosEscolaresProspectos_Prospectos` FOREIGN KEY (`prospecto_id`) REFERENCES `Prospectos` (`prospecto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Documentos_Escolares_Prospectos`
--

LOCK TABLES `Documentos_Escolares_Prospectos` WRITE;
/*!40000 ALTER TABLE `Documentos_Escolares_Prospectos` DISABLE KEYS */;
INSERT INTO `Documentos_Escolares_Prospectos` VALUES (1,182,1,1,NULL),(8,182,1,1,NULL),(7,182,1,1,NULL),(3,183,1,1,NULL),(2,183,1,1,NULL),(10,183,1,1,NULL),(4,183,1,1,NULL),(7,183,1,1,NULL),(1,183,1,1,NULL),(8,183,1,1,NULL),(10,184,1,1,NULL),(3,184,1,1,NULL),(7,184,1,1,NULL),(1,184,1,1,NULL),(8,184,1,1,NULL),(3,185,1,1,NULL),(7,185,1,1,NULL),(1,185,1,1,NULL),(8,185,1,1,NULL),(1,186,1,1,NULL),(8,186,1,1,NULL),(7,186,1,1,NULL),(3,186,1,1,NULL),(10,186,1,1,NULL),(1,187,1,1,NULL),(7,187,1,1,NULL),(10,187,1,1,NULL),(3,187,1,1,NULL),(8,187,1,1,NULL),(1,189,1,1,NULL),(8,189,1,1,NULL),(3,189,1,1,NULL),(7,189,1,1,NULL),(10,189,1,1,NULL),(8,16,1,1,NULL),(3,16,1,1,NULL),(1,16,1,1,NULL),(1,190,1,1,NULL),(8,190,1,1,NULL),(10,190,1,1,NULL),(3,190,1,1,NULL),(2,190,1,1,NULL),(8,191,1,1,NULL),(1,191,1,1,NULL),(7,191,1,1,NULL),(10,191,1,1,NULL),(3,191,1,1,NULL),(8,192,1,1,NULL),(3,192,1,1,NULL),(10,192,1,1,NULL),(7,192,1,1,NULL),(1,192,1,1,NULL),(1,193,1,1,NULL),(8,193,1,1,NULL),(10,193,1,1,NULL),(7,193,1,1,NULL),(3,193,1,1,NULL),(1,195,1,1,NULL),(7,195,1,1,NULL),(3,195,1,1,NULL),(8,195,1,1,NULL),(1,196,1,1,NULL),(10,196,1,1,NULL),(3,196,1,1,NULL),(7,196,1,1,NULL),(8,196,1,1,NULL),(1,197,1,1,NULL),(8,197,1,1,NULL),(10,197,1,1,NULL),(7,197,1,1,NULL),(3,197,1,1,NULL),(1,199,1,1,NULL),(8,199,1,1,NULL),(10,199,1,1,NULL);
/*!40000 ALTER TABLE `Documentos_Escolares_Prospectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cuentas_Subcuentas`
--

DROP TABLE IF EXISTS `Cuentas_Subcuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cuentas_Subcuentas` (
  `cuenta_id` int(11) NOT NULL,
  `subcuenta_id` int(11) unsigned NOT NULL,
  `estatus_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`subcuenta_id`,`cuenta_id`),
  KEY `FK_CuentasSubcuentas_Estatus` (`estatus_id`),
  CONSTRAINT `FK_CuentasSubcuentas_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`),
  CONSTRAINT `FK_CuentasSubcuentas_Subcuentas` FOREIGN KEY (`subcuenta_id`) REFERENCES `Subcuentas` (`subcuenta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cuentas_Subcuentas`
--

LOCK TABLES `Cuentas_Subcuentas` WRITE;
/*!40000 ALTER TABLE `Cuentas_Subcuentas` DISABLE KEYS */;
INSERT INTO `Cuentas_Subcuentas` VALUES (3,2,1),(4,2,1),(3,3,1),(4,3,1),(1,4,1),(2,5,1),(2,6,1),(5,7,1),(3,8,1),(4,8,1);
/*!40000 ALTER TABLE `Cuentas_Subcuentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_usuarios`
--

DROP TABLE IF EXISTS `menu_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_usuarios` (
  `id_usuario` int(11) unsigned NOT NULL,
  `usuario` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(40) NOT NULL DEFAULT '',
  `apaterno` varchar(100) NOT NULL DEFAULT '',
  `amaterno` varchar(100) NOT NULL DEFAULT '',
  `id_perfil` int(11) unsigned NOT NULL,
  `estatus_id` int(11) unsigned NOT NULL,
  `codigo` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `empleado_id` int(11) unsigned NOT NULL,
  `admongpos` int(11) NOT NULL,
  `ultimaAct` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `FK_menuusuarios_Estatus` (`estatus_id`),
  KEY `FK_menuusuarios_menuperfilesmaster` (`id_perfil`),
  CONSTRAINT `FK_menuusuarios_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`),
  CONSTRAINT `FK_menuusuarios_menuperfilesmaster` FOREIGN KEY (`id_perfil`) REFERENCES `menu_perfiles_master` (`id_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_usuarios`
--

LOCK TABLES `menu_usuarios` WRITE;
/*!40000 ALTER TABLE `menu_usuarios` DISABLE KEYS */;
INSERT INTO `menu_usuarios` VALUES (1,'jlora','123','lora','camacho',1,1,'123','jlora_1983@hotmail.com',1,1,'2012-01-12 00:55:06','andres'),(2,'rzamarripa','Zamarripa83','Zamarripa','',1,1,'1234','rzamarripa@uss.mx',2,1,'2011-12-16 19:44:36','Roberto'),(3,'fcastro','F3rn@nd0','Castro','Armenta',1,1,'123','fcastro@uss.mx',3,1,'2011-12-16 20:18:35','Fernando'),(4,'msalazar','msp3652','Salazar','Perez',1,1,'123','msalazar@uss.mx',4,1,'2012-02-22 19:57:26','Marisol'),(5,'eguerrero','eguerrero','Guerrero','Espinoza',1,1,'123','eguerrero@uss.mx',5,1,'2012-04-16 19:23:11','Erik'),(6,'evalenzuela','evalenzuela','Valenzuela','',1,1,'123','evalenzuela@uss.mx',6,1,'2012-04-27 18:23:45','Edna');
/*!40000 ALTER TABLE `menu_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_opciones`
--

DROP TABLE IF EXISTS `menu_opciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_opciones` (
  `id_opcion` int(11) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `orden` int(11) NOT NULL,
  `id_tarea` int(11) unsigned NOT NULL,
  `idioma_id` int(11) unsigned NOT NULL,
  `estatus_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_opcion`),
  KEY `FK_menuopciones_menutareas` (`id_tarea`),
  KEY `FK_menuopciones_Idiomas` (`idioma_id`),
  KEY `FK_menuopciones_Estatus` (`estatus_id`),
  CONSTRAINT `FK_menuopciones_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`),
  CONSTRAINT `FK_menuopciones_Idiomas` FOREIGN KEY (`idioma_id`) REFERENCES `Idiomas` (`idioma_id`),
  CONSTRAINT `FK_menuopciones_menutareas` FOREIGN KEY (`id_tarea`) REFERENCES `menu_tareas` (`id_tarea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_opciones`
--

LOCK TABLES `menu_opciones` WRITE;
/*!40000 ALTER TABLE `menu_opciones` DISABLE KEYS */;
INSERT INTO `menu_opciones` VALUES (1,'CATALOGOS',1,1,1,1),(2,'TRANSACCIONES',2,1,1,1),(3,'REPORTES',3,1,1,1),(4,'CATALOGOS',1,2,1,1),(5,'TRANSACCIONES',2,2,1,1),(6,'REPORTES',3,2,1,1),(7,'CATALOGOS',1,3,1,1),(8,'TRANSACCIONES',2,3,1,1),(9,'REPORTES',3,3,1,1);
/*!40000 ALTER TABLE `menu_opciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Diccionario_Ayuda`
--

DROP TABLE IF EXISTS `Diccionario_Ayuda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Diccionario_Ayuda` (
  `pkAyuda` int(11) unsigned NOT NULL,
  `nombreMostrar` varchar(100) NOT NULL DEFAULT '',
  `nombreCampo` varchar(100) NOT NULL DEFAULT '',
  `idayu` varchar(100) NOT NULL DEFAULT '',
  `sizeayu` int(11) NOT NULL,
  `idioma_id` int(11) unsigned NOT NULL,
  `version` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`pkAyuda`),
  KEY `FK_Diccionarioayuda_Idiomas` (`idioma_id`),
  CONSTRAINT `FK_Diccionarioayuda_Idiomas` FOREIGN KEY (`idioma_id`) REFERENCES `Idiomas` (`idioma_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Diccionario_Ayuda`
--

LOCK TABLES `Diccionario_Ayuda` WRITE;
/*!40000 ALTER TABLE `Diccionario_Ayuda` DISABLE KEYS */;
INSERT INTO `Diccionario_Ayuda` VALUES (1,'Codigo','codigo','class com.uss.dtoGenerales.serviciosDTO',100,1,NULL),(2,'Nombre','nombre','class com.uss.dtoGenerales.serviciosDTO',800,1,NULL),(3,'Codigo','codigo','class com.uss.dtoGenerales.prospectosDTO',100,1,NULL),(4,'Nombre','nombre','class com.uss.dtoGenerales.prospectosDTO',800,1,NULL),(5,'Matricula','matricula','class com.uss.dtoGenerales.alumnosDTO',150,1,NULL),(6,'Nombre','nombre','class com.uss.dtoGenerales.alumnosDTO',550,1,NULL),(7,'Codigo','codigo','class com.uss.dtoGenerales.cuentasDTO',100,1,NULL),(8,'Nombre','nombre','class com.uss.dtoGenerales.cuentasDTO',800,1,NULL),(9,'Codigo','codigo','class com.uss.dtoGenerales.CategoriasServiciosDTO',100,1,NULL),(10,'Nombre','nombre','class com.uss.dtoGenerales.CategoriasServiciosDTO',800,1,NULL),(11,'Codigo','codigo','class com.uss.dtoGenerales.CiclosDTO',100,1,NULL),(12,'Nombre','nombre','class com.uss.dtoGenerales.CiclosDTO',800,1,NULL);
/*!40000 ALTER TABLE `Diccionario_Ayuda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Descuentos`
--

DROP TABLE IF EXISTS `Descuentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Descuentos` (
  `descuento_id` int(11) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `subcuenta_id` int(11) unsigned NOT NULL,
  `cantidad` decimal(10,4) NOT NULL,
  `importe` decimal(10,4) NOT NULL,
  `porcentaje` decimal(10,4) NOT NULL,
  `estatus_id` int(11) unsigned NOT NULL,
  `version` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`descuento_id`),
  UNIQUE KEY `unique_descuentos_nombre` (`nombre`),
  KEY `FK_Descuentos_Subcuentas` (`subcuenta_id`),
  KEY `FK_Descuentos_Estatus` (`estatus_id`),
  CONSTRAINT `FK_Descuentos_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`),
  CONSTRAINT `FK_Descuentos_Subcuentas` FOREIGN KEY (`subcuenta_id`) REFERENCES `Subcuentas` (`subcuenta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Descuentos`
--

LOCK TABLES `Descuentos` WRITE;
/*!40000 ALTER TABLE `Descuentos` DISABLE KEYS */;
INSERT INTO `Descuentos` VALUES (1,'DESCUENTO ',5,'6.0000','3600.0000','8.0000',1,0),(2,'DESCUENTO BECA',6,'6.0000','3000.0000','50.0000',1,0);
/*!40000 ALTER TABLE `Descuentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Anticipos_Saldo`
--

DROP TABLE IF EXISTS `Anticipos_Saldo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Anticipos_Saldo` (
  `prospecto_id` int(11) NOT NULL,
  `saldo` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`prospecto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Anticipos_Saldo`
--

LOCK TABLES `Anticipos_Saldo` WRITE;
/*!40000 ALTER TABLE `Anticipos_Saldo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Anticipos_Saldo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lineas_Formacion`
--

DROP TABLE IF EXISTS `Lineas_Formacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Lineas_Formacion` (
  `lineaFormacion_id` int(11) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `estatus_id` int(11) unsigned NOT NULL,
  `version` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`lineaFormacion_id`),
  UNIQUE KEY `unique_lineasformacion_nombre` (`nombre`),
  KEY `FK_LineasFormacion_Estatus` (`estatus_id`),
  CONSTRAINT `FK_LineasFormacion_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lineas_Formacion`
--

LOCK TABLES `Lineas_Formacion` WRITE;
/*!40000 ALTER TABLE `Lineas_Formacion` DISABLE KEYS */;
INSERT INTO `Lineas_Formacion` VALUES (1,'linea 1',1,0);
/*!40000 ALTER TABLE `Lineas_Formacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Programa_Pagos`
--

DROP TABLE IF EXISTS `Programa_Pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Programa_Pagos` (
  `programaPagos_id` int(11) unsigned NOT NULL,
  `ciclo_id` int(11) unsigned NOT NULL,
  `categoriaServicio_id` int(11) unsigned NOT NULL,
  `servicio_id` int(11) unsigned DEFAULT NULL,
  `estatus_id` int(11) unsigned NOT NULL,
  `esquema_id` int(11) unsigned NOT NULL,
  `empresa_id` int(11) unsigned NOT NULL,
  `version` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`programaPagos_id`),
  KEY `FK_ProgramaPagos_Ciclos` (`ciclo_id`),
  KEY `FK_ProgramaPagos_Servicios` (`servicio_id`),
  KEY `FK_ProgramaPagos_Estatus` (`estatus_id`),
  KEY `FK_ProgramaPagos_CategoriasServicios` (`categoriaServicio_id`),
  KEY `FK_ProgramaPagos_Empresas` (`empresa_id`),
  CONSTRAINT `FK_ProgramaPagos_CategoriasServicios` FOREIGN KEY (`categoriaServicio_id`) REFERENCES `Categorias_Servicios` (`categoriaServicio_id`),
  CONSTRAINT `FK_ProgramaPagos_Ciclos` FOREIGN KEY (`ciclo_id`) REFERENCES `Ciclos` (`ciclo_id`),
  CONSTRAINT `FK_ProgramaPagos_Empresas` FOREIGN KEY (`empresa_id`) REFERENCES `Empresas` (`empresa_id`),
  CONSTRAINT `FK_ProgramaPagos_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`),
  CONSTRAINT `FK_ProgramaPagos_Servicios` FOREIGN KEY (`servicio_id`) REFERENCES `Servicios` (`servicio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Programa_Pagos`
--

LOCK TABLES `Programa_Pagos` WRITE;
/*!40000 ALTER TABLE `Programa_Pagos` DISABLE KEYS */;
INSERT INTO `Programa_Pagos` VALUES (1,1,1,NULL,1,1,1,0),(3,2,1,NULL,1,1,1,0);
/*!40000 ALTER TABLE `Programa_Pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Poblaciones`
--

DROP TABLE IF EXISTS `Poblaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Poblaciones` (
  `poblacion_id` int(11) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `estado_id` int(11) unsigned NOT NULL,
  `estatus_id` int(11) unsigned NOT NULL,
  `version` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`poblacion_id`),
  UNIQUE KEY `unique_poblaciones_nombre` (`nombre`),
  KEY `FK_Poblaciones_Estados` (`estado_id`),
  KEY `FK_Poblaciones_Estatus` (`estatus_id`),
  CONSTRAINT `FK_Poblaciones_Estados` FOREIGN KEY (`estado_id`) REFERENCES `Estados` (`estado_id`),
  CONSTRAINT `FK_Poblaciones_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Poblaciones`
--

LOCK TABLES `Poblaciones` WRITE;
/*!40000 ALTER TABLE `Poblaciones` DISABLE KEYS */;
INSERT INTO `Poblaciones` VALUES (1,'CULIACÁN',1,1,0),(2,'NAVOLATO',1,1,0),(3,'COSTA RICA',1,1,0),(4,'MOCORITO',1,1,0),(5,'BADIRAGUATO',1,1,0),(6,'GUASAVE',1,1,0),(7,'GUAMUCHIL',1,1,0);
/*!40000 ALTER TABLE `Poblaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_usu_gru_emp`
--

DROP TABLE IF EXISTS `menu_usu_gru_emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_usu_gru_emp` (
  `empresa_id` int(11) unsigned NOT NULL,
  `grupo_id` int(11) unsigned NOT NULL,
  `usuario_id` int(11) unsigned NOT NULL,
  KEY `FK_menuusugruemp_Grupos` (`grupo_id`),
  CONSTRAINT `FK_menuusugruemp_Grupos` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`grupo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_usu_gru_emp`
--

LOCK TABLES `menu_usu_gru_emp` WRITE;
/*!40000 ALTER TABLE `menu_usu_gru_emp` DISABLE KEYS */;
INSERT INTO `menu_usu_gru_emp` VALUES (1,1,1),(2,1,1),(3,1,1),(4,1,1),(5,1,1),(6,1,1);
/*!40000 ALTER TABLE `menu_usu_gru_emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Maestros`
--

DROP TABLE IF EXISTS `Maestros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Maestros` (
  `maestro_id` int(11) unsigned NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellidoPaterno` varchar(100) DEFAULT NULL,
  `apellidoMaterno` varchar(100) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `sexo_id` int(11) unsigned DEFAULT NULL,
  `calle` varchar(30) DEFAULT NULL,
  `numero` int(10) DEFAULT NULL,
  `colonia_id` int(11) unsigned DEFAULT NULL,
  `poblacion_id` int(11) unsigned DEFAULT NULL,
  `codigoPostal` varchar(20) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `nivelAcademico_id` int(11) unsigned DEFAULT NULL,
  `profesion_id` int(11) unsigned DEFAULT NULL,
  `trabajoExterno` varchar(50) DEFAULT NULL,
  `telefonoTrabajoExterno` varchar(30) DEFAULT NULL,
  `cedulaProfesional` varchar(50) DEFAULT NULL,
  `tipoSangre` varchar(30) DEFAULT NULL,
  `estatus_id` int(11) unsigned DEFAULT NULL,
  `empresa_id` int(11) unsigned DEFAULT NULL,
  `version` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`maestro_id`),
  KEY `FK_Maestros_Sexos` (`sexo_id`),
  KEY `FK_Maestros_Colonias` (`colonia_id`),
  KEY `FK_Maestros_Poblaciones` (`poblacion_id`),
  KEY `FK_Maestros_Profesiones` (`profesion_id`),
  KEY `FK_Maestros_NivelesAcademicos` (`nivelAcademico_id`),
  KEY `FK_Maestros_Estatus` (`estatus_id`),
  KEY `FK_Maestros_Empresas` (`empresa_id`),
  CONSTRAINT `FK_Maestros_Colonias` FOREIGN KEY (`colonia_id`) REFERENCES `Colonias` (`colonia_id`),
  CONSTRAINT `FK_Maestros_Empresas` FOREIGN KEY (`empresa_id`) REFERENCES `Empresas` (`empresa_id`),
  CONSTRAINT `FK_Maestros_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`),
  CONSTRAINT `FK_Maestros_NivelesAcademicos` FOREIGN KEY (`nivelAcademico_id`) REFERENCES `Niveles_Academicos` (`nivelAcademico_id`),
  CONSTRAINT `FK_Maestros_Poblaciones` FOREIGN KEY (`poblacion_id`) REFERENCES `Poblaciones` (`poblacion_id`),
  CONSTRAINT `FK_Maestros_Profesiones` FOREIGN KEY (`profesion_id`) REFERENCES `Profesiones` (`profesion_id`),
  CONSTRAINT `FK_Maestros_Sexos` FOREIGN KEY (`sexo_id`) REFERENCES `Sexos` (`sexo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Maestros`
--

LOCK TABLES `Maestros` WRITE;
/*!40000 ALTER TABLE `Maestros` DISABLE KEYS */;
/*!40000 ALTER TABLE `Maestros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Alergias_Prospectos`
--

DROP TABLE IF EXISTS `Alergias_Prospectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Alergias_Prospectos` (
  `alergia_id` int(11) unsigned NOT NULL,
  `prospecto_id` int(11) unsigned NOT NULL,
  `estatus_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`alergia_id`),
  KEY `FK_AlergiasProspectos_Prospectos` (`prospecto_id`),
  KEY `FK_AlergiasProspectos_Estatus` (`estatus_id`),
  CONSTRAINT `FK_AlergiasProspectos_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`),
  CONSTRAINT `FK_AlergiasProspectos_Prospectos` FOREIGN KEY (`prospecto_id`) REFERENCES `Prospectos` (`prospecto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alergias_Prospectos`
--

LOCK TABLES `Alergias_Prospectos` WRITE;
/*!40000 ALTER TABLE `Alergias_Prospectos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Alergias_Prospectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tipos_Institucion`
--

DROP TABLE IF EXISTS `Tipos_Institucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tipos_Institucion` (
  `tipoInstitucion_id` int(11) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `estatus_id` int(11) unsigned NOT NULL,
  `version` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`tipoInstitucion_id`),
  UNIQUE KEY `unique_tiposinstitucion_nombre` (`nombre`),
  KEY `FK_TiposInstitucion_Estatus` (`estatus_id`),
  CONSTRAINT `FK_TiposInstitucion_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tipos_Institucion`
--

LOCK TABLES `Tipos_Institucion` WRITE;
/*!40000 ALTER TABLE `Tipos_Institucion` DISABLE KEYS */;
INSERT INTO `Tipos_Institucion` VALUES (1,'PUBLICO',1,NULL),(2,'PRIVADA',1,NULL);
/*!40000 ALTER TABLE `Tipos_Institucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Idiomas_Prospectos`
--

DROP TABLE IF EXISTS `Idiomas_Prospectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Idiomas_Prospectos` (
  `idioma_id` int(11) NOT NULL,
  `prospecto_id` int(11) unsigned NOT NULL,
  `porcentaje` decimal(11,4) NOT NULL,
  `estatus_id` int(11) unsigned NOT NULL,
  `version` bigint(11) DEFAULT NULL,
  KEY `FK_IdiomasProspectos_Prospectos` (`prospecto_id`),
  KEY `FK_IdiomasProspectos_Estatus` (`estatus_id`),
  CONSTRAINT `FK_IdiomasProspectos_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`),
  CONSTRAINT `FK_IdiomasProspectos_Prospectos` FOREIGN KEY (`prospecto_id`) REFERENCES `Prospectos` (`prospecto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Idiomas_Prospectos`
--

LOCK TABLES `Idiomas_Prospectos` WRITE;
/*!40000 ALTER TABLE `Idiomas_Prospectos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Idiomas_Prospectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Documentos_Escolares`
--

DROP TABLE IF EXISTS `Documentos_Escolares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Documentos_Escolares` (
  `documentoEscolar_id` int(11) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `estatus_id` int(11) unsigned NOT NULL,
  `requerido` tinyint(1) NOT NULL,
  `empresa_id` int(11) unsigned NOT NULL,
  `version` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`documentoEscolar_id`),
  UNIQUE KEY `unique_documentosescolares_nombre` (`nombre`),
  KEY `FK_DocumentosEscolares_Estatus` (`estatus_id`),
  KEY `FK_DocumentosEscolares_Empresas` (`empresa_id`),
  CONSTRAINT `FK_DocumentosEscolares_Empresas` FOREIGN KEY (`empresa_id`) REFERENCES `Empresas` (`empresa_id`),
  CONSTRAINT `FK_DocumentosEscolares_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Documentos_Escolares`
--

LOCK TABLES `Documentos_Escolares` WRITE;
/*!40000 ALTER TABLE `Documentos_Escolares` DISABLE KEYS */;
INSERT INTO `Documentos_Escolares` VALUES (1,'ACTA DE NACIMIENTO',1,1,1,0),(2,'FOTOS',1,1,1,0),(3,'COMPROBANTE DOMICILIO',1,1,1,0),(4,'CURP',1,0,1,0),(5,'CARTA BUENA CONDUCTA',1,0,1,0),(6,'KARDEX',1,0,1,0),(7,'CERTIFICADO MEDICA',1,1,1,0),(8,'CERTIFICADO DE PREPARATORIA',1,1,1,0),(9,'COMPROBANTE DE INGRESOS',1,1,1,0),(10,'EXAMEN DE ADMISIÓN',1,1,1,0),(11,'EXAMEN DE ORIENTACIÓN VOCACIONAL',1,1,1,0),(12,'EXAMEN FORMAT',1,1,1,0),(13,'EXAMEN EDAOM',1,1,1,0),(14,'ESTUDIO SOCIOECONOMICO',1,1,1,0),(15,'BOLETA DE BECA',1,0,1,0);
/*!40000 ALTER TABLE `Documentos_Escolares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ciclos`
--

DROP TABLE IF EXISTS `Ciclos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ciclos` (
  `ciclo_id` int(11) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `fechaInicial` date NOT NULL,
  `fechaFinal` date NOT NULL,
  `estatus_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`ciclo_id`),
  UNIQUE KEY `unique_ciclos_fechafinal` (`fechaFinal`),
  UNIQUE KEY `unique_ciclos_fechainicial` (`fechaInicial`),
  UNIQUE KEY `unique_ciclos_nombre` (`nombre`),
  KEY `FK_Ciclos_Estatus` (`estatus_id`),
  CONSTRAINT `FK_Ciclos_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ciclos`
--

LOCK TABLES `Ciclos` WRITE;
/*!40000 ALTER TABLE `Ciclos` DISABLE KEYS */;
INSERT INTO `Ciclos` VALUES (1,'CICLO ESCOLAR 2010-2014','2010-08-16','2014-06-16',5),(2,'CICLO ESCOLAR 2011-2015','2011-01-10','2015-06-15',1);
/*!40000 ALTER TABLE `Ciclos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Grupos_Alumnos`
--

DROP TABLE IF EXISTS `Grupos_Alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Grupos_Alumnos` (
  `grupoAlumnos_id` int(11) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `estatus_id` int(11) unsigned NOT NULL,
  `empresa_id` int(11) unsigned DEFAULT NULL,
  `version` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`grupoAlumnos_id`),
  UNIQUE KEY `unique_gruposalumnos_nombre` (`nombre`),
  KEY `FK_GruposAlumnos_Estatus` (`estatus_id`),
  KEY `FK_GruposAlumnos_Empresas` (`empresa_id`),
  CONSTRAINT `FK_GruposAlumnos_Empresas` FOREIGN KEY (`empresa_id`) REFERENCES `Empresas` (`empresa_id`),
  CONSTRAINT `FK_GruposAlumnos_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Grupos_Alumnos`
--

LOCK TABLES `Grupos_Alumnos` WRITE;
/*!40000 ALTER TABLE `Grupos_Alumnos` DISABLE KEYS */;
INSERT INTO `Grupos_Alumnos` VALUES (1,'GRUPO',1,1,0),(2,'GRUPO 2',1,1,0);
/*!40000 ALTER TABLE `Grupos_Alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Promociones`
--

DROP TABLE IF EXISTS `Promociones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Promociones` (
  `promocion_id` int(11) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `porcentaje` decimal(10,0) NOT NULL,
  `estatus_id` int(11) unsigned NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `empresa_id` int(11) unsigned NOT NULL,
  `version` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`promocion_id`),
  UNIQUE KEY `unique_promociones_nombre` (`nombre`),
  KEY `FK_Promociones_Estatus` (`estatus_id`),
  KEY `FK_Promociones_Empresas` (`empresa_id`),
  CONSTRAINT `FK_Promociones_Empresas` FOREIGN KEY (`empresa_id`) REFERENCES `Empresas` (`empresa_id`),
  CONSTRAINT `FK_Promociones_Estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`estatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Promociones`
--

LOCK TABLES `Promociones` WRITE;
/*!40000 ALTER TABLE `Promociones` DISABLE KEYS */;
INSERT INTO `Promociones` VALUES (1,'Promoción','10',1,'2012-02-29','2012-02-29',1,0);
/*!40000 ALTER TABLE `Promociones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-07-19 23:42:35
CREATE DATABASE  IF NOT EXISTS `videosdb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `videosdb`;
-- MySQL dump 10.13  Distrib 5.1.34, for apple-darwin9.5.0 (i386)
--
-- Host: 192.168.5.103    Database: videosdb
-- ------------------------------------------------------
-- Server version	5.5.24-0ubuntu0.12.04.1

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
-- Table structure for table `VideosPorProyecto`
--

DROP TABLE IF EXISTS `VideosPorProyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VideosPorProyecto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `estatus_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkvidxpro_proyecto` (`proyecto_id`),
  KEY `fkvidxpro_video` (`video_id`),
  KEY `fkvidxpro_estatus` (`estatus_id`),
  CONSTRAINT `fkvidxpro_estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkvidxpro_proyecto` FOREIGN KEY (`proyecto_id`) REFERENCES `Proyecto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkvidxpro_video` FOREIGN KEY (`video_id`) REFERENCES `Video` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VideosPorProyecto`
--

LOCK TABLES `VideosPorProyecto` WRITE;
/*!40000 ALTER TABLE `VideosPorProyecto` DISABLE KEYS */;
INSERT INTO `VideosPorProyecto` VALUES (1,2,1,2),(2,2,2,2),(3,4,1,1),(4,5,1,1),(5,5,2,1);
/*!40000 ALTER TABLE `VideosPorProyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Estatus`
--

DROP TABLE IF EXISTS `Estatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Estatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(90) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Estatus`
--

LOCK TABLES `Estatus` WRITE;
/*!40000 ALTER TABLE `Estatus` DISABLE KEYS */;
INSERT INTO `Estatus` VALUES (1,'Activo'),(2,'Inactivo'),(3,'Visto'),(4,'No Visto');
/*!40000 ALTER TABLE `Estatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(90) NOT NULL,
  `password` varchar(90) NOT NULL,
  `tipousuario_id` int(11) NOT NULL,
  `estatus_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_UNIQUE` (`usuario`),
  KEY `fkusuario_tipousuario` (`tipousuario_id`),
  KEY `fkusuario_estatus` (`estatus_id`),
  CONSTRAINT `fkusuario_estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkusuario_tipousuario` FOREIGN KEY (`tipousuario_id`) REFERENCES `TipoUsuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
INSERT INTO `Usuario` VALUES (1,'francisco','pelicano',2,1),(2,'administrador','admin',1,1);
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Video`
--

DROP TABLE IF EXISTS `Video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(90) NOT NULL,
  `url` varchar(180) NOT NULL,
  `estatus_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkvideo_estatus` (`estatus_id`),
  CONSTRAINT `fkvideo_estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Video`
--

LOCK TABLES `Video` WRITE;
/*!40000 ALTER TABLE `Video` DISABLE KEYS */;
INSERT INTO `Video` VALUES (1,'Pruebas','<iframe src=\"http://player.vimeo.com/video/43557443\" width=\"400\" height=\"300\" frameborder=\"0\" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>',1),(2,'Pruebas','<iframe src=\"http://player.vimeo.com/video/43557443\" width=\"400\" height=\"300\" frameborder=\"0\" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>',1);
/*!40000 ALTER TABLE `Video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TipoUsuario`
--

DROP TABLE IF EXISTS `TipoUsuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TipoUsuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(90) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TipoUsuario`
--

LOCK TABLES `TipoUsuario` WRITE;
/*!40000 ALTER TABLE `TipoUsuario` DISABLE KEYS */;
INSERT INTO `TipoUsuario` VALUES (1,'Administrador'),(2,'Cliente');
/*!40000 ALTER TABLE `TipoUsuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Proyecto`
--

DROP TABLE IF EXISTS `Proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Proyecto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(90) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `estatus_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkproyecto_estatus` (`estatus_id`),
  KEY `fkproyecto_cliente` (`cliente_id`),
  CONSTRAINT `fkproyecto_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `Cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkproyecto_estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proyecto`
--

LOCK TABLES `Proyecto` WRITE;
/*!40000 ALTER TABLE `Proyecto` DISABLE KEYS */;
INSERT INTO `Proyecto` VALUES (1,'Vias Locas',1,1),(2,'uno',1,1),(3,'dfsdaf',1,1),(4,'de',1,1),(5,'fasdf',1,1);
/*!40000 ALTER TABLE `Proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cliente`
--

DROP TABLE IF EXISTS `Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_empresa` varchar(180) NOT NULL,
  `nombre_contacto` varchar(90) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(90) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkcliente_usuario` (`usuario_id`),
  CONSTRAINT `fkcliente_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `Usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
INSERT INTO `Cliente` VALUES (1,'Granos de sinaloa','francisco','7621979','jfranciscomn@gmail.com',1);
/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-07-19 23:42:36
CREATE DATABASE  IF NOT EXISTS `videosricma` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `videosricma`;
-- MySQL dump 10.13  Distrib 5.1.34, for apple-darwin9.5.0 (i386)
--
-- Host: 192.168.5.103    Database: videosricma
-- ------------------------------------------------------
-- Server version	5.5.24-0ubuntu0.12.04.1

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
-- Table structure for table `VideosPorProyecto`
--

DROP TABLE IF EXISTS `VideosPorProyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VideosPorProyecto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `estatus_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkvidxpro_proyecto` (`proyecto_id`),
  KEY `fkvidxpro_video` (`video_id`),
  KEY `fkvidxpro_estatus` (`estatus_id`),
  CONSTRAINT `fkvidxpro_estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkvidxpro_proyecto` FOREIGN KEY (`proyecto_id`) REFERENCES `Proyecto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkvidxpro_video` FOREIGN KEY (`video_id`) REFERENCES `Video` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VideosPorProyecto`
--

LOCK TABLES `VideosPorProyecto` WRITE;
/*!40000 ALTER TABLE `VideosPorProyecto` DISABLE KEYS */;
INSERT INTO `VideosPorProyecto` VALUES (1,2,1,2),(2,2,2,2),(3,1,2,2),(4,3,2,1),(5,3,1,2),(6,4,3,2),(7,4,2,1),(8,4,1,2),(9,2,4,2),(10,2,5,2);
/*!40000 ALTER TABLE `VideosPorProyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Estatus`
--

DROP TABLE IF EXISTS `Estatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Estatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(90) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Estatus`
--

LOCK TABLES `Estatus` WRITE;
/*!40000 ALTER TABLE `Estatus` DISABLE KEYS */;
INSERT INTO `Estatus` VALUES (1,'Activo'),(2,'Inactivo');
/*!40000 ALTER TABLE `Estatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(90) NOT NULL,
  `password` varchar(90) NOT NULL,
  `tipousuario_id` int(11) NOT NULL,
  `estatus_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkusuario_tipousuario` (`tipousuario_id`),
  KEY `fkusuario_estatus` (`estatus_id`),
  CONSTRAINT `fkusuario_estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkusuario_tipousuario` FOREIGN KEY (`tipousuario_id`) REFERENCES `TipoUsuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
INSERT INTO `Usuario` VALUES (2,'zama','123qwe',1,1),(3,'francisco','pelicano',1,1),(5,'uss','123qwe',2,1),(7,'alberto','123qwe',2,1),(8,'fran','123qwe',2,1),(9,'julio','123',2,1);
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Video`
--

DROP TABLE IF EXISTS `Video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(90) NOT NULL,
  `url` varchar(180) NOT NULL,
  `estatus_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkvideo_estatus` (`estatus_id`),
  CONSTRAINT `fkvideo_estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Video`
--

LOCK TABLES `Video` WRITE;
/*!40000 ALTER TABLE `Video` DISABLE KEYS */;
INSERT INTO `Video` VALUES (1,'Video1','video1-ipad.m4v',1),(2,'uss','uss.m4v',1),(3,'video harinera','Alse.mp4',1),(4,'video uno','598671_1.swf',1),(5,'video uno','598671_1.swf',1);
/*!40000 ALTER TABLE `Video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TipoUsuario`
--

DROP TABLE IF EXISTS `TipoUsuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TipoUsuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(90) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TipoUsuario`
--

LOCK TABLES `TipoUsuario` WRITE;
/*!40000 ALTER TABLE `TipoUsuario` DISABLE KEYS */;
INSERT INTO `TipoUsuario` VALUES (1,'Administrador'),(2,'Cliente');
/*!40000 ALTER TABLE `TipoUsuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Proyecto`
--

DROP TABLE IF EXISTS `Proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Proyecto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(90) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `imagen` varchar(182) NOT NULL,
  `estatus_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkproyecto_estatus` (`estatus_id`),
  KEY `fkproyecto_cliente` (`cliente_id`),
  CONSTRAINT `fkproyecto_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `Cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkproyecto_estatus` FOREIGN KEY (`estatus_id`) REFERENCES `Estatus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proyecto`
--

LOCK TABLES `Proyecto` WRITE;
/*!40000 ALTER TABLE `Proyecto` DISABLE KEYS */;
INSERT INTO `Proyecto` VALUES (1,'Proyecto persona',3,'',1),(2,'Proyecto Fran',4,'',1),(3,'Ejemplo',1,'',1),(4,'Proyecto harinera',5,'',1);
/*!40000 ALTER TABLE `Proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cliente`
--

DROP TABLE IF EXISTS `Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_empresa` varchar(180) NOT NULL,
  `nombre_contacto` varchar(90) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(90) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkcliente_usuario` (`usuario_id`),
  CONSTRAINT `fkcliente_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `Usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
INSERT INTO `Cliente` VALUES (1,'USS','Roberto Zamarripa','6677519841','asfdsa',5),(3,'Inoxza','Alberto','','',7),(4,'Francisco','Francisco','','',8),(5,'Harinera La Barca','Julio Amabile','123456','julio_amabile@harinera.com',9);
/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-07-19 23:42:37
