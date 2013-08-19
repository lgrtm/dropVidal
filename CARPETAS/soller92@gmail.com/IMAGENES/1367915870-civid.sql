-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 08-03-2013 a las 07:41:13
-- Versión del servidor: 5.1.44
-- Versión de PHP: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `civid`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actors`
--

CREATE TABLE IF NOT EXISTS `actors` (
  `ID_ACTOR` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NOM` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `COGNOMS` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `VIDA` varchar(1000) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NAIXEMENT` date DEFAULT NULL,
  `MORT` date DEFAULT NULL,
  `ID_IMATGE` int(10) unsigned DEFAULT NULL,
  `ID_PAIS` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_ACTOR`),
  UNIQUE KEY `ID_ACTOR` (`ID_ACTOR`),
  UNIQUE KEY `ID_PAIS` (`ID_PAIS`),
  KEY `ID_IMATGE` (`ID_IMATGE`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=6 ;

--
-- Volcar la base de datos para la tabla `actors`
--

INSERT INTO `actors` (`ID_ACTOR`, `NOM`, `COGNOMS`, `VIDA`, `NAIXEMENT`, `MORT`, `ID_IMATGE`, `ID_PAIS`) VALUES
(5, 'Manuel', 'Maria Jose', 'Esto es una prueba', '2013-02-14', '2013-02-28', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actors_serie`
--

CREATE TABLE IF NOT EXISTS `actors_serie` (
  `ID_ACTOR` int(10) unsigned NOT NULL DEFAULT '0',
  `ID_SERIE` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `ID_ACTOR` (`ID_ACTOR`),
  UNIQUE KEY `ID_SERIE` (`ID_SERIE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcar la base de datos para la tabla `actors_serie`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capituls`
--

CREATE TABLE IF NOT EXISTS `capituls` (
  `ID_CAPITUL` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NOM_CAPITUL` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `TEMPORADA` int(10) unsigned NOT NULL,
  `NUM_CAPITUL` int(10) unsigned NOT NULL,
  `DESCRIPCIO` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ID_SERIE` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_CAPITUL`),
  UNIQUE KEY `ID_CAPITUL` (`ID_CAPITUL`),
  UNIQUE KEY `ID_SERIE` (`ID_SERIE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `capituls`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cinema`
--

CREATE TABLE IF NOT EXISTS `cinema` (
  `ID_CINEMA` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NOM` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `PREU_NORMAL` float unsigned DEFAULT NULL,
  `PREU_ESTRENA` float unsigned DEFAULT NULL,
  `PREU_FESTIU` float DEFAULT NULL,
  `ID_IMATGE` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_CINEMA`),
  UNIQUE KEY `ID_CINEMA` (`ID_CINEMA`),
  KEY `ID_IMATGE` (`ID_IMATGE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `cinema`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario_jocs`
--

CREATE TABLE IF NOT EXISTS `comentario_jocs` (
  `ID_USUARI` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `ID_JOCS` int(10) unsigned NOT NULL DEFAULT '0',
  `ID_COMENTARI` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `COMENTARI` longtext COLLATE utf8_spanish_ci NOT NULL,
  `HORA` date NOT NULL,
  PRIMARY KEY (`ID_COMENTARI`),
  UNIQUE KEY `ID_USUARI` (`ID_USUARI`),
  UNIQUE KEY `ID_JOCS` (`ID_JOCS`),
  UNIQUE KEY `ID_COMENTARI` (`ID_COMENTARI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `comentario_jocs`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario_pelicula`
--

CREATE TABLE IF NOT EXISTS `comentario_pelicula` (
  `ID_COMENTARI` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `COMENTARI` longtext COLLATE utf8_spanish_ci NOT NULL,
  `HORA` date NOT NULL,
  `ID_PELICULA` int(10) unsigned NOT NULL DEFAULT '0',
  `ID_USUARI` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`ID_COMENTARI`),
  UNIQUE KEY `ID_COMENTARI` (`ID_COMENTARI`),
  UNIQUE KEY `ID_PELICULA` (`ID_PELICULA`),
  UNIQUE KEY `ID_USUARI` (`ID_USUARI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `comentario_pelicula`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario_series`
--

CREATE TABLE IF NOT EXISTS `comentario_series` (
  `ID_COMENTARI` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `COMENTARI` longtext COLLATE utf8_spanish_ci NOT NULL,
  `HORA` date NOT NULL,
  `ID_USUARI` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `ID_SERIE` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_COMENTARI`),
  UNIQUE KEY `ID_COMENTARI` (`ID_COMENTARI`),
  UNIQUE KEY `ID_USUARI` (`ID_USUARI`),
  UNIQUE KEY `ID_SERIE` (`ID_SERIE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `comentario_series`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `critica_jocs`
--

CREATE TABLE IF NOT EXISTS `critica_jocs` (
  `ID_CRITICA` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITOL_CRITICA` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `DESCRIPCIO` longtext COLLATE utf8_spanish_ci NOT NULL,
  `COS_TEXT` longtext COLLATE utf8_spanish_ci NOT NULL,
  `VOT_CRITC` float unsigned NOT NULL,
  `ID_USUARI` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `ID_JOCS` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_CRITICA`),
  UNIQUE KEY `ID_CRITICA` (`ID_CRITICA`),
  UNIQUE KEY `ID_USUARI` (`ID_USUARI`),
  UNIQUE KEY `ID_JOCS` (`ID_JOCS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `critica_jocs`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `critica_pelicula`
--

CREATE TABLE IF NOT EXISTS `critica_pelicula` (
  `ID_CRITICA` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITOL_CRITICA` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `DESCRIPCIO` longtext COLLATE utf8_spanish_ci NOT NULL,
  `COS_TEXT` longtext COLLATE utf8_spanish_ci NOT NULL,
  `VOT_CRITC` float unsigned NOT NULL,
  `ID_USUARI` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `ID_PELICULA` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_CRITICA`),
  UNIQUE KEY `ID_CRITICA` (`ID_CRITICA`),
  UNIQUE KEY `ID_USUARI` (`ID_USUARI`),
  UNIQUE KEY `ID_PELICULA` (`ID_PELICULA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `critica_pelicula`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `critica_series`
--

CREATE TABLE IF NOT EXISTS `critica_series` (
  `ID_CRITICA` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITOL_CRITICA` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `DESCRIPCIO` longtext COLLATE utf8_spanish_ci NOT NULL,
  `COS_TEXT` longtext COLLATE utf8_spanish_ci NOT NULL,
  `VOT_CRITC` float unsigned NOT NULL,
  `ID_SERIE` int(10) unsigned NOT NULL DEFAULT '0',
  `ID_USUARI` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`ID_CRITICA`),
  UNIQUE KEY `ID_CRITICA` (`ID_CRITICA`),
  UNIQUE KEY `ID_SERIE` (`ID_SERIE`),
  UNIQUE KEY `ID_USUARI` (`ID_USUARI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `critica_series`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `directors`
--

CREATE TABLE IF NOT EXISTS `directors` (
  `ID_ACTOR` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NOM` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `COGNOMS` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `VIDA` varchar(1000) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NAIXEMENT` date DEFAULT NULL,
  `MORT` date DEFAULT NULL,
  `ID_IMATGE` int(10) unsigned DEFAULT NULL,
  `ID_PAIS` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_ACTOR`),
  UNIQUE KEY `ID_ACTOR` (`ID_ACTOR`),
  UNIQUE KEY `ID_PAIS` (`ID_PAIS`),
  KEY `ID_IMATGE` (`ID_IMATGE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `directors`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `directors_serie`
--

CREATE TABLE IF NOT EXISTS `directors_serie` (
  `ID_ACTOR` int(10) unsigned NOT NULL DEFAULT '0',
  `ID_SERIE` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `ID_ACTOR` (`ID_ACTOR`),
  UNIQUE KEY `ID_SERIE` (`ID_SERIE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcar la base de datos para la tabla `directors_serie`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudi`
--

CREATE TABLE IF NOT EXISTS `estudi` (
  `ID_ESTUDI` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NOM` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `ID_IMATGE` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_ESTUDI`),
  UNIQUE KEY `ID_ESTUDI` (`ID_ESTUDI`),
  KEY `ID_IMATGE` (`ID_IMATGE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `estudi`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudi_joc`
--

CREATE TABLE IF NOT EXISTS `estudi_joc` (
  `ID_JOCS` int(10) unsigned NOT NULL DEFAULT '0',
  `ID_ESTUDI` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `ID_JOCS` (`ID_JOCS`),
  UNIQUE KEY `ID_ESTUDI` (`ID_ESTUDI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcar la base de datos para la tabla `estudi_joc`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudi_serie`
--

CREATE TABLE IF NOT EXISTS `estudi_serie` (
  `ID_ESTUDI` int(10) unsigned NOT NULL DEFAULT '0',
  `ID_SERIE` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `ID_ESTUDI` (`ID_ESTUDI`),
  UNIQUE KEY `ID_SERIE` (`ID_SERIE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcar la base de datos para la tabla `estudi_serie`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genere`
--

CREATE TABLE IF NOT EXISTS `genere` (
  `ID_GENERE` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NOM` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `DESCRIPCIO` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`ID_GENERE`),
  UNIQUE KEY `ID_GENERE` (`ID_GENERE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `genere`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genere_joc`
--

CREATE TABLE IF NOT EXISTS `genere_joc` (
  `ID_JOCS` int(10) unsigned NOT NULL DEFAULT '0',
  `ID_GENERE` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `ID_JOCS` (`ID_JOCS`),
  UNIQUE KEY `ID_GENERE` (`ID_GENERE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcar la base de datos para la tabla `genere_joc`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genere_serie`
--

CREATE TABLE IF NOT EXISTS `genere_serie` (
  `ID_GENERE` int(10) unsigned NOT NULL DEFAULT '0',
  `ID_SERIE` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `ID_GENERE` (`ID_GENERE`),
  UNIQUE KEY `ID_SERIE` (`ID_SERIE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcar la base de datos para la tabla `genere_serie`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imatges`
--

CREATE TABLE IF NOT EXISTS `imatges` (
  `ID_IMATGE` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NOM_IMATGE` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `LINK` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `DESCRIPCIO` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `SIZE` float unsigned DEFAULT NULL,
  `BASE` float unsigned DEFAULT NULL,
  `ALTURA` float unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_IMATGE`),
  UNIQUE KEY `ID_IMATGE` (`ID_IMATGE`),
  UNIQUE KEY `LINK` (`LINK`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `imatges`
--

INSERT INTO `imatges` (`ID_IMATGE`, `NOM_IMATGE`, `LINK`, `DESCRIPCIO`, `SIZE`, `BASE`, `ALTURA`) VALUES
(1, 'nada', 'USUARIS/andresoller.png', 'nada', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jocs`
--

CREATE TABLE IF NOT EXISTS `jocs` (
  `ID_JOCS` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DURACIO` int(10) unsigned DEFAULT NULL,
  `NOM_JOCS` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `DESARROLLADOR` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ONLINE` int(10) unsigned DEFAULT NULL,
  `VEUS` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TEXT` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ID_PAIS` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_JOCS`),
  UNIQUE KEY `ID_JOCS` (`ID_JOCS`),
  UNIQUE KEY `ID_PAIS` (`ID_PAIS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `jocs`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `joc_imatge`
--

CREATE TABLE IF NOT EXISTS `joc_imatge` (
  `ID_JOCS` int(10) unsigned NOT NULL DEFAULT '0',
  `ID_IMATGE` int(10) unsigned NOT NULL DEFAULT '0',
  `PORTADA` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `ID_JOCS` (`ID_JOCS`),
  UNIQUE KEY `ID_IMATGE` (`ID_IMATGE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcar la base de datos para la tabla `joc_imatge`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticies`
--

CREATE TABLE IF NOT EXISTS `noticies` (
  `ID_NOTICIA` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TITOL` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `SUBTITOL` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `CONTINGUT` longtext COLLATE utf8_spanish_ci NOT NULL,
  `DATA` date NOT NULL,
  PRIMARY KEY (`ID_NOTICIA`),
  UNIQUE KEY `ID_NOTICIA` (`ID_NOTICIA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `noticies`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticies_joc`
--

CREATE TABLE IF NOT EXISTS `noticies_joc` (
  `ID_NOTICIA` int(10) unsigned NOT NULL DEFAULT '0',
  `ID_JOCS` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `ID_NOTICIA` (`ID_NOTICIA`),
  UNIQUE KEY `ID_JOCS` (`ID_JOCS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcar la base de datos para la tabla `noticies_joc`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticies_serie`
--

CREATE TABLE IF NOT EXISTS `noticies_serie` (
  `ID_NOTICIA` int(10) unsigned NOT NULL DEFAULT '0',
  `ID_SERIE` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `ID_NOTICIA` (`ID_NOTICIA`),
  UNIQUE KEY `ID_SERIE` (`ID_SERIE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcar la base de datos para la tabla `noticies_serie`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE IF NOT EXISTS `pais` (
  `ID_PAIS` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NOM_PAIS` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`ID_PAIS`),
  UNIQUE KEY `ID_PAIS` (`ID_PAIS`),
  UNIQUE KEY `NOM_PAIS` (`NOM_PAIS`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `pais`
--

INSERT INTO `pais` (`ID_PAIS`, `NOM_PAIS`) VALUES
(1, 'España');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pegi`
--

CREATE TABLE IF NOT EXISTS `pegi` (
  `ID_PEGI` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NOM_PEGI` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `DESCRIPCIO` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ID_IMATGE` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_PEGI`),
  UNIQUE KEY `ID_PEGI` (`ID_PEGI`),
  KEY `ID_IMATGE` (`ID_IMATGE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `pegi`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pegi_joc`
--

CREATE TABLE IF NOT EXISTS `pegi_joc` (
  `ID_PEGI` int(10) unsigned NOT NULL DEFAULT '0',
  `ID_JOCS` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `ID_PEGI` (`ID_PEGI`),
  UNIQUE KEY `ID_JOCS` (`ID_JOCS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcar la base de datos para la tabla `pegi_joc`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula_actor`
--

CREATE TABLE IF NOT EXISTS `pelicula_actor` (
  `ID_PELICULA` int(10) unsigned NOT NULL DEFAULT '0',
  `ID_ACTOR` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `ID_PELICULA` (`ID_PELICULA`),
  UNIQUE KEY `ID_ACTOR` (`ID_ACTOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcar la base de datos para la tabla `pelicula_actor`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula_cinema`
--

CREATE TABLE IF NOT EXISTS `pelicula_cinema` (
  `ID_PELICULA` int(10) unsigned NOT NULL DEFAULT '0',
  `ID_CINEMA` int(10) unsigned NOT NULL DEFAULT '0',
  `DATA_ESTRENA` date NOT NULL,
  `DATA_FINAL` date DEFAULT NULL,
  UNIQUE KEY `ID_PELICULA` (`ID_PELICULA`),
  UNIQUE KEY `ID_CINEMA` (`ID_CINEMA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcar la base de datos para la tabla `pelicula_cinema`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula_director`
--

CREATE TABLE IF NOT EXISTS `pelicula_director` (
  `ID_PELICULA` int(10) unsigned NOT NULL DEFAULT '0',
  `ID_ACTOR` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `ID_PELICULA` (`ID_PELICULA`),
  UNIQUE KEY `ID_ACTOR` (`ID_ACTOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcar la base de datos para la tabla `pelicula_director`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula_estudi`
--

CREATE TABLE IF NOT EXISTS `pelicula_estudi` (
  `ID_PELICULA` int(10) unsigned NOT NULL DEFAULT '0',
  `ID_ESTUDI` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `ID_PELICULA` (`ID_PELICULA`),
  UNIQUE KEY `ID_ESTUDI` (`ID_ESTUDI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcar la base de datos para la tabla `pelicula_estudi`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula_genere`
--

CREATE TABLE IF NOT EXISTS `pelicula_genere` (
  `ID_PELICULA` int(10) unsigned NOT NULL DEFAULT '0',
  `ID_GENERE` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `ID_PELICULA` (`ID_PELICULA`),
  UNIQUE KEY `ID_GENERE` (`ID_GENERE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcar la base de datos para la tabla `pelicula_genere`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula_imatge`
--

CREATE TABLE IF NOT EXISTS `pelicula_imatge` (
  `ID_IMATGE` int(10) unsigned NOT NULL DEFAULT '0',
  `ID_PELICULA` int(10) unsigned NOT NULL DEFAULT '0',
  `PORTADA` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `ID_IMATGE` (`ID_IMATGE`),
  UNIQUE KEY `ID_PELICULA` (`ID_PELICULA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcar la base de datos para la tabla `pelicula_imatge`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula_noticia`
--

CREATE TABLE IF NOT EXISTS `pelicula_noticia` (
  `ID_NOTICIA` int(10) unsigned NOT NULL DEFAULT '0',
  `ID_PELICULA` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `ID_NOTICIA` (`ID_NOTICIA`),
  UNIQUE KEY `ID_PELICULA` (`ID_PELICULA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcar la base de datos para la tabla `pelicula_noticia`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula_plataforma`
--

CREATE TABLE IF NOT EXISTS `pelicula_plataforma` (
  `ID_PLATAFORMA` int(10) unsigned NOT NULL DEFAULT '0',
  `ID_PELICULA` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `ID_PLATAFORMA` (`ID_PLATAFORMA`),
  UNIQUE KEY `ID_PELICULA` (`ID_PELICULA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcar la base de datos para la tabla `pelicula_plataforma`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula_vist`
--

CREATE TABLE IF NOT EXISTS `pelicula_vist` (
  `ID_USUARI` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `ID_PELICULA` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `VISTA` tinyint(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `ID_USUARI` (`ID_USUARI`),
  UNIQUE KEY `ID_PELICULA` (`ID_PELICULA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `pelicula_vist`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicules`
--

CREATE TABLE IF NOT EXISTS `pelicules` (
  `ID_PELICULA` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NOM_ORIGINAL` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `NOM_ESPANYOL` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DURACIO` int(10) unsigned DEFAULT NULL,
  `DESARROLLADOR` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `MUSICA` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FOTOGRAFIA` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `MUNTATGE` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DISTRIBUIDORA` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `EDAD_MINIMA` int(10) unsigned DEFAULT NULL,
  `SINOPSIS` varchar(1000) COLLATE utf8_spanish_ci NOT NULL,
  `ESTRENA` date DEFAULT NULL,
  `ESTRENA_FISIC` date DEFAULT NULL,
  `ID_PAIS` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_PELICULA`),
  UNIQUE KEY `ID_PELICULA` (`ID_PELICULA`),
  UNIQUE KEY `NOM_ORIGINAL` (`NOM_ORIGINAL`),
  UNIQUE KEY `ID_PAIS` (`ID_PAIS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `pelicules`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plataforma`
--

CREATE TABLE IF NOT EXISTS `plataforma` (
  `ID_PLATAFORMA` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NOM_PLATAFORMA` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `ID_IMATGE` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_PLATAFORMA`),
  UNIQUE KEY `ID_PLATAFORMA` (`ID_PLATAFORMA`),
  KEY `ID_IMATGE` (`ID_IMATGE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `plataforma`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plataforma_joc`
--

CREATE TABLE IF NOT EXISTS `plataforma_joc` (
  `ID_PLATAFORMA` int(10) unsigned NOT NULL DEFAULT '0',
  `ID_JOCS` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `ID_PLATAFORMA` (`ID_PLATAFORMA`),
  UNIQUE KEY `ID_JOCS` (`ID_JOCS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcar la base de datos para la tabla `plataforma_joc`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plataforma_serie`
--

CREATE TABLE IF NOT EXISTS `plataforma_serie` (
  `ID_PLATAFORMA` int(10) unsigned NOT NULL DEFAULT '0',
  `ID_SERIE` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `ID_PLATAFORMA` (`ID_PLATAFORMA`),
  UNIQUE KEY `ID_SERIE` (`ID_SERIE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcar la base de datos para la tabla `plataforma_serie`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `series`
--

CREATE TABLE IF NOT EXISTS `series` (
  `ID_SERIE` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NOM_SERIE` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `DESARROLLADOR` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `FOTOGRAFIA` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `MONTAJE` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DISTRIBUIDORA` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `EDAD_MINIMA` int(10) unsigned DEFAULT NULL,
  `SINOPSIS` varchar(1000) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ESTRENA` date DEFAULT NULL,
  `ESTRENA_FISIC` date DEFAULT NULL,
  `ID_PAIS` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_SERIE`),
  UNIQUE KEY `ID_SERIE` (`ID_SERIE`),
  UNIQUE KEY `ID_PAIS` (`ID_PAIS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `series`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `serie_imatge`
--

CREATE TABLE IF NOT EXISTS `serie_imatge` (
  `ID_SERIE` int(10) unsigned NOT NULL DEFAULT '0',
  `ID_IMATGE` int(10) unsigned NOT NULL DEFAULT '0',
  `PORTADA` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `ID_SERIE` (`ID_SERIE`),
  UNIQUE KEY `ID_IMATGE` (`ID_IMATGE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcar la base de datos para la tabla `serie_imatge`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipus`
--

CREATE TABLE IF NOT EXISTS `tipus` (
  `ID_TIPUS` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NOM_TIPUS` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `DESCRIPCIO` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ID_TIPUS`),
  UNIQUE KEY `ID_TIPUS` (`ID_TIPUS`),
  UNIQUE KEY `NOM_TIPUS` (`NOM_TIPUS`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `tipus`
--

INSERT INTO `tipus` (`ID_TIPUS`, `NOM_TIPUS`, `DESCRIPCIO`) VALUES
(1, 'Admin', 'Administrador de tot CIVID');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuari`
--

CREATE TABLE IF NOT EXISTS `usuari` (
  `ID_USUARI` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `NOM_USUARI` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `PRIM_COGNOM` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `SEG_COGNOM` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `NEIX` date NOT NULL,
  `CORREU` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `SEXE` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CREACIO` date NOT NULL,
  `CONFIRMAT` tinyint(1) NOT NULL DEFAULT '0',
  `COMPTE` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ID_IMATGE` int(10) unsigned NOT NULL DEFAULT '0',
  `ID_TIPUS` int(10) unsigned NOT NULL DEFAULT '0',
  `ID_PAIS` int(10) unsigned NOT NULL DEFAULT '0',
  `PAGA` tinyint(1) DEFAULT '0',
  `CONTRASENYA` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`ID_USUARI`),
  UNIQUE KEY `ID_USUARI` (`ID_USUARI`),
  UNIQUE KEY `ID_IMATGE` (`ID_IMATGE`),
  UNIQUE KEY `ID_TIPUS` (`ID_TIPUS`),
  UNIQUE KEY `ID_PAIS` (`ID_PAIS`),
  UNIQUE KEY `COMPTE` (`COMPTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcar la base de datos para la tabla `usuari`
--

INSERT INTO `usuari` (`ID_USUARI`, `NOM_USUARI`, `PRIM_COGNOM`, `SEG_COGNOM`, `NEIX`, `CORREU`, `SEXE`, `CREACIO`, `CONFIRMAT`, `COMPTE`, `ID_IMATGE`, `ID_TIPUS`, `ID_PAIS`, `PAGA`, `CONTRASENYA`) VALUES
('andres192', 'Andres', 'Oller', 'Serrano', '2013-02-14', 'soller92@gmail.com', 'hombre', '2013-02-26', 1, NULL, 1, 1, 1, 0, 'andres192');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votar_jocs`
--

CREATE TABLE IF NOT EXISTS `votar_jocs` (
  `ID_VOTO` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `VOT_EMES` float unsigned DEFAULT NULL,
  `ID_USUARI` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `ID_JOCS` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_VOTO`),
  UNIQUE KEY `ID_VOTO` (`ID_VOTO`),
  UNIQUE KEY `ID_USUARI` (`ID_USUARI`),
  UNIQUE KEY `ID_JOCS` (`ID_JOCS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `votar_jocs`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votar_pelicula`
--

CREATE TABLE IF NOT EXISTS `votar_pelicula` (
  `ID_VOTO` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `VOT_EMES` float unsigned DEFAULT NULL,
  `ID_USUARI` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `ID_PELICULA` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_VOTO`),
  UNIQUE KEY `ID_VOTO` (`ID_VOTO`),
  UNIQUE KEY `ID_USUARI` (`ID_USUARI`),
  UNIQUE KEY `ID_PELICULA` (`ID_PELICULA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `votar_pelicula`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votar_series`
--

CREATE TABLE IF NOT EXISTS `votar_series` (
  `ID_VOTO` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `VOT_EMES` float unsigned DEFAULT NULL,
  `ID_USUARI` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `ID_SERIE` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_VOTO`),
  UNIQUE KEY `ID_VOTO` (`ID_VOTO`),
  UNIQUE KEY `ID_USUARI` (`ID_USUARI`),
  UNIQUE KEY `ID_SERIE` (`ID_SERIE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `votar_series`
--


--
-- Filtros para las tablas descargadas (dump)
--

--
-- Filtros para la tabla `actors`
--
ALTER TABLE `actors`
  ADD CONSTRAINT `actors_ibfk_1` FOREIGN KEY (`ID_IMATGE`) REFERENCES `imatges` (`ID_IMATGE`),
  ADD CONSTRAINT `actors_ibfk_2` FOREIGN KEY (`ID_PAIS`) REFERENCES `pais` (`ID_PAIS`);

--
-- Filtros para la tabla `actors_serie`
--
ALTER TABLE `actors_serie`
  ADD CONSTRAINT `actors_serie_ibfk_1` FOREIGN KEY (`ID_ACTOR`) REFERENCES `actors` (`ID_ACTOR`),
  ADD CONSTRAINT `actors_serie_ibfk_2` FOREIGN KEY (`ID_SERIE`) REFERENCES `series` (`ID_SERIE`);

--
-- Filtros para la tabla `capituls`
--
ALTER TABLE `capituls`
  ADD CONSTRAINT `capituls_ibfk_1` FOREIGN KEY (`ID_SERIE`) REFERENCES `series` (`ID_SERIE`);

--
-- Filtros para la tabla `cinema`
--
ALTER TABLE `cinema`
  ADD CONSTRAINT `cinema_ibfk_1` FOREIGN KEY (`ID_IMATGE`) REFERENCES `imatges` (`ID_IMATGE`);

--
-- Filtros para la tabla `comentario_jocs`
--
ALTER TABLE `comentario_jocs`
  ADD CONSTRAINT `comentario_jocs_ibfk_1` FOREIGN KEY (`ID_JOCS`) REFERENCES `jocs` (`ID_JOCS`),
  ADD CONSTRAINT `comentario_jocs_ibfk_2` FOREIGN KEY (`ID_USUARI`) REFERENCES `usuari` (`ID_USUARI`);

--
-- Filtros para la tabla `comentario_pelicula`
--
ALTER TABLE `comentario_pelicula`
  ADD CONSTRAINT `comentario_pelicula_ibfk_1` FOREIGN KEY (`ID_PELICULA`) REFERENCES `pelicules` (`ID_PELICULA`),
  ADD CONSTRAINT `comentario_pelicula_ibfk_2` FOREIGN KEY (`ID_USUARI`) REFERENCES `usuari` (`ID_USUARI`);

--
-- Filtros para la tabla `comentario_series`
--
ALTER TABLE `comentario_series`
  ADD CONSTRAINT `comentario_series_ibfk_1` FOREIGN KEY (`ID_SERIE`) REFERENCES `series` (`ID_SERIE`),
  ADD CONSTRAINT `comentario_series_ibfk_2` FOREIGN KEY (`ID_USUARI`) REFERENCES `usuari` (`ID_USUARI`);

--
-- Filtros para la tabla `critica_jocs`
--
ALTER TABLE `critica_jocs`
  ADD CONSTRAINT `critica_jocs_ibfk_1` FOREIGN KEY (`ID_JOCS`) REFERENCES `jocs` (`ID_JOCS`),
  ADD CONSTRAINT `critica_jocs_ibfk_2` FOREIGN KEY (`ID_USUARI`) REFERENCES `usuari` (`ID_USUARI`);

--
-- Filtros para la tabla `critica_pelicula`
--
ALTER TABLE `critica_pelicula`
  ADD CONSTRAINT `critica_pelicula_ibfk_1` FOREIGN KEY (`ID_PELICULA`) REFERENCES `pelicules` (`ID_PELICULA`),
  ADD CONSTRAINT `critica_pelicula_ibfk_2` FOREIGN KEY (`ID_USUARI`) REFERENCES `usuari` (`ID_USUARI`);

--
-- Filtros para la tabla `critica_series`
--
ALTER TABLE `critica_series`
  ADD CONSTRAINT `critica_series_ibfk_1` FOREIGN KEY (`ID_SERIE`) REFERENCES `series` (`ID_SERIE`),
  ADD CONSTRAINT `critica_series_ibfk_2` FOREIGN KEY (`ID_USUARI`) REFERENCES `usuari` (`ID_USUARI`);

--
-- Filtros para la tabla `directors`
--
ALTER TABLE `directors`
  ADD CONSTRAINT `directors_ibfk_1` FOREIGN KEY (`ID_IMATGE`) REFERENCES `imatges` (`ID_IMATGE`),
  ADD CONSTRAINT `directors_ibfk_2` FOREIGN KEY (`ID_PAIS`) REFERENCES `pais` (`ID_PAIS`);

--
-- Filtros para la tabla `directors_serie`
--
ALTER TABLE `directors_serie`
  ADD CONSTRAINT `directors_serie_ibfk_1` FOREIGN KEY (`ID_ACTOR`) REFERENCES `directors` (`ID_ACTOR`),
  ADD CONSTRAINT `directors_serie_ibfk_2` FOREIGN KEY (`ID_SERIE`) REFERENCES `series` (`ID_SERIE`);

--
-- Filtros para la tabla `estudi`
--
ALTER TABLE `estudi`
  ADD CONSTRAINT `estudi_ibfk_1` FOREIGN KEY (`ID_IMATGE`) REFERENCES `imatges` (`ID_IMATGE`);

--
-- Filtros para la tabla `estudi_joc`
--
ALTER TABLE `estudi_joc`
  ADD CONSTRAINT `estudi_joc_ibfk_1` FOREIGN KEY (`ID_ESTUDI`) REFERENCES `estudi` (`ID_ESTUDI`),
  ADD CONSTRAINT `estudi_joc_ibfk_2` FOREIGN KEY (`ID_JOCS`) REFERENCES `jocs` (`ID_JOCS`);

--
-- Filtros para la tabla `estudi_serie`
--
ALTER TABLE `estudi_serie`
  ADD CONSTRAINT `estudi_serie_ibfk_1` FOREIGN KEY (`ID_ESTUDI`) REFERENCES `estudi` (`ID_ESTUDI`),
  ADD CONSTRAINT `estudi_serie_ibfk_2` FOREIGN KEY (`ID_SERIE`) REFERENCES `series` (`ID_SERIE`);

--
-- Filtros para la tabla `genere_joc`
--
ALTER TABLE `genere_joc`
  ADD CONSTRAINT `genere_joc_ibfk_1` FOREIGN KEY (`ID_GENERE`) REFERENCES `genere` (`ID_GENERE`),
  ADD CONSTRAINT `genere_joc_ibfk_2` FOREIGN KEY (`ID_JOCS`) REFERENCES `jocs` (`ID_JOCS`);

--
-- Filtros para la tabla `genere_serie`
--
ALTER TABLE `genere_serie`
  ADD CONSTRAINT `genere_serie_ibfk_1` FOREIGN KEY (`ID_GENERE`) REFERENCES `genere` (`ID_GENERE`),
  ADD CONSTRAINT `genere_serie_ibfk_2` FOREIGN KEY (`ID_SERIE`) REFERENCES `series` (`ID_SERIE`);

--
-- Filtros para la tabla `jocs`
--
ALTER TABLE `jocs`
  ADD CONSTRAINT `jocs_ibfk_1` FOREIGN KEY (`ID_PAIS`) REFERENCES `pais` (`ID_PAIS`);

--
-- Filtros para la tabla `joc_imatge`
--
ALTER TABLE `joc_imatge`
  ADD CONSTRAINT `joc_imatge_ibfk_1` FOREIGN KEY (`ID_IMATGE`) REFERENCES `imatges` (`ID_IMATGE`),
  ADD CONSTRAINT `joc_imatge_ibfk_2` FOREIGN KEY (`ID_JOCS`) REFERENCES `jocs` (`ID_JOCS`);

--
-- Filtros para la tabla `noticies_joc`
--
ALTER TABLE `noticies_joc`
  ADD CONSTRAINT `noticies_joc_ibfk_1` FOREIGN KEY (`ID_JOCS`) REFERENCES `jocs` (`ID_JOCS`),
  ADD CONSTRAINT `noticies_joc_ibfk_2` FOREIGN KEY (`ID_NOTICIA`) REFERENCES `noticies` (`ID_NOTICIA`);

--
-- Filtros para la tabla `noticies_serie`
--
ALTER TABLE `noticies_serie`
  ADD CONSTRAINT `noticies_serie_ibfk_1` FOREIGN KEY (`ID_NOTICIA`) REFERENCES `noticies` (`ID_NOTICIA`),
  ADD CONSTRAINT `noticies_serie_ibfk_2` FOREIGN KEY (`ID_SERIE`) REFERENCES `series` (`ID_SERIE`);

--
-- Filtros para la tabla `pegi`
--
ALTER TABLE `pegi`
  ADD CONSTRAINT `pegi_ibfk_1` FOREIGN KEY (`ID_IMATGE`) REFERENCES `imatges` (`ID_IMATGE`);

--
-- Filtros para la tabla `pegi_joc`
--
ALTER TABLE `pegi_joc`
  ADD CONSTRAINT `pegi_joc_ibfk_1` FOREIGN KEY (`ID_JOCS`) REFERENCES `jocs` (`ID_JOCS`),
  ADD CONSTRAINT `pegi_joc_ibfk_2` FOREIGN KEY (`ID_PEGI`) REFERENCES `pegi` (`ID_PEGI`);

--
-- Filtros para la tabla `pelicula_actor`
--
ALTER TABLE `pelicula_actor`
  ADD CONSTRAINT `pelicula_actor_ibfk_1` FOREIGN KEY (`ID_ACTOR`) REFERENCES `actors` (`ID_ACTOR`),
  ADD CONSTRAINT `pelicula_actor_ibfk_2` FOREIGN KEY (`ID_PELICULA`) REFERENCES `pelicules` (`ID_PELICULA`);

--
-- Filtros para la tabla `pelicula_cinema`
--
ALTER TABLE `pelicula_cinema`
  ADD CONSTRAINT `pelicula_cinema_ibfk_1` FOREIGN KEY (`ID_CINEMA`) REFERENCES `cinema` (`ID_CINEMA`),
  ADD CONSTRAINT `pelicula_cinema_ibfk_2` FOREIGN KEY (`ID_PELICULA`) REFERENCES `pelicules` (`ID_PELICULA`);

--
-- Filtros para la tabla `pelicula_director`
--
ALTER TABLE `pelicula_director`
  ADD CONSTRAINT `pelicula_director_ibfk_1` FOREIGN KEY (`ID_ACTOR`) REFERENCES `directors` (`ID_ACTOR`),
  ADD CONSTRAINT `pelicula_director_ibfk_2` FOREIGN KEY (`ID_PELICULA`) REFERENCES `pelicules` (`ID_PELICULA`);

--
-- Filtros para la tabla `pelicula_estudi`
--
ALTER TABLE `pelicula_estudi`
  ADD CONSTRAINT `pelicula_estudi_ibfk_1` FOREIGN KEY (`ID_ESTUDI`) REFERENCES `estudi` (`ID_ESTUDI`),
  ADD CONSTRAINT `pelicula_estudi_ibfk_2` FOREIGN KEY (`ID_PELICULA`) REFERENCES `pelicules` (`ID_PELICULA`);

--
-- Filtros para la tabla `pelicula_genere`
--
ALTER TABLE `pelicula_genere`
  ADD CONSTRAINT `pelicula_genere_ibfk_1` FOREIGN KEY (`ID_GENERE`) REFERENCES `genere` (`ID_GENERE`),
  ADD CONSTRAINT `pelicula_genere_ibfk_2` FOREIGN KEY (`ID_PELICULA`) REFERENCES `pelicules` (`ID_PELICULA`);

--
-- Filtros para la tabla `pelicula_imatge`
--
ALTER TABLE `pelicula_imatge`
  ADD CONSTRAINT `pelicula_imatge_ibfk_1` FOREIGN KEY (`ID_IMATGE`) REFERENCES `imatges` (`ID_IMATGE`),
  ADD CONSTRAINT `pelicula_imatge_ibfk_2` FOREIGN KEY (`ID_PELICULA`) REFERENCES `pelicules` (`ID_PELICULA`);

--
-- Filtros para la tabla `pelicula_noticia`
--
ALTER TABLE `pelicula_noticia`
  ADD CONSTRAINT `pelicula_noticia_ibfk_1` FOREIGN KEY (`ID_NOTICIA`) REFERENCES `noticies` (`ID_NOTICIA`),
  ADD CONSTRAINT `pelicula_noticia_ibfk_2` FOREIGN KEY (`ID_PELICULA`) REFERENCES `pelicules` (`ID_PELICULA`);

--
-- Filtros para la tabla `pelicula_plataforma`
--
ALTER TABLE `pelicula_plataforma`
  ADD CONSTRAINT `pelicula_plataforma_ibfk_1` FOREIGN KEY (`ID_PELICULA`) REFERENCES `pelicules` (`ID_PELICULA`),
  ADD CONSTRAINT `pelicula_plataforma_ibfk_2` FOREIGN KEY (`ID_PLATAFORMA`) REFERENCES `plataforma` (`ID_PLATAFORMA`);

--
-- Filtros para la tabla `pelicula_vist`
--
ALTER TABLE `pelicula_vist`
  ADD CONSTRAINT `pelicula_vist_ibfk_1` FOREIGN KEY (`ID_PELICULA`) REFERENCES `pelicules` (`ID_PELICULA`),
  ADD CONSTRAINT `pelicula_vist_ibfk_2` FOREIGN KEY (`ID_USUARI`) REFERENCES `usuari` (`ID_USUARI`);

--
-- Filtros para la tabla `pelicules`
--
ALTER TABLE `pelicules`
  ADD CONSTRAINT `pelicules_ibfk_1` FOREIGN KEY (`ID_PAIS`) REFERENCES `pais` (`ID_PAIS`);

--
-- Filtros para la tabla `plataforma`
--
ALTER TABLE `plataforma`
  ADD CONSTRAINT `plataforma_ibfk_1` FOREIGN KEY (`ID_IMATGE`) REFERENCES `imatges` (`ID_IMATGE`);

--
-- Filtros para la tabla `plataforma_joc`
--
ALTER TABLE `plataforma_joc`
  ADD CONSTRAINT `plataforma_joc_ibfk_1` FOREIGN KEY (`ID_JOCS`) REFERENCES `jocs` (`ID_JOCS`),
  ADD CONSTRAINT `plataforma_joc_ibfk_2` FOREIGN KEY (`ID_PLATAFORMA`) REFERENCES `plataforma` (`ID_PLATAFORMA`);

--
-- Filtros para la tabla `plataforma_serie`
--
ALTER TABLE `plataforma_serie`
  ADD CONSTRAINT `plataforma_serie_ibfk_1` FOREIGN KEY (`ID_PLATAFORMA`) REFERENCES `plataforma` (`ID_PLATAFORMA`),
  ADD CONSTRAINT `plataforma_serie_ibfk_2` FOREIGN KEY (`ID_SERIE`) REFERENCES `series` (`ID_SERIE`);

--
-- Filtros para la tabla `series`
--
ALTER TABLE `series`
  ADD CONSTRAINT `series_ibfk_1` FOREIGN KEY (`ID_PAIS`) REFERENCES `pais` (`ID_PAIS`);

--
-- Filtros para la tabla `serie_imatge`
--
ALTER TABLE `serie_imatge`
  ADD CONSTRAINT `serie_imatge_ibfk_1` FOREIGN KEY (`ID_IMATGE`) REFERENCES `imatges` (`ID_IMATGE`),
  ADD CONSTRAINT `serie_imatge_ibfk_2` FOREIGN KEY (`ID_SERIE`) REFERENCES `series` (`ID_SERIE`);

--
-- Filtros para la tabla `usuari`
--
ALTER TABLE `usuari`
  ADD CONSTRAINT `usuari_ibfk_1` FOREIGN KEY (`ID_IMATGE`) REFERENCES `imatges` (`ID_IMATGE`),
  ADD CONSTRAINT `usuari_ibfk_2` FOREIGN KEY (`ID_PAIS`) REFERENCES `pais` (`ID_PAIS`),
  ADD CONSTRAINT `usuari_ibfk_3` FOREIGN KEY (`ID_TIPUS`) REFERENCES `tipus` (`ID_TIPUS`);

--
-- Filtros para la tabla `votar_jocs`
--
ALTER TABLE `votar_jocs`
  ADD CONSTRAINT `votar_jocs_ibfk_1` FOREIGN KEY (`ID_JOCS`) REFERENCES `jocs` (`ID_JOCS`),
  ADD CONSTRAINT `votar_jocs_ibfk_2` FOREIGN KEY (`ID_USUARI`) REFERENCES `usuari` (`ID_USUARI`);

--
-- Filtros para la tabla `votar_pelicula`
--
ALTER TABLE `votar_pelicula`
  ADD CONSTRAINT `votar_pelicula_ibfk_1` FOREIGN KEY (`ID_PELICULA`) REFERENCES `pelicules` (`ID_PELICULA`),
  ADD CONSTRAINT `votar_pelicula_ibfk_2` FOREIGN KEY (`ID_USUARI`) REFERENCES `usuari` (`ID_USUARI`);

--
-- Filtros para la tabla `votar_series`
--
ALTER TABLE `votar_series`
  ADD CONSTRAINT `votar_series_ibfk_1` FOREIGN KEY (`ID_SERIE`) REFERENCES `series` (`ID_SERIE`),
  ADD CONSTRAINT `votar_series_ibfk_2` FOREIGN KEY (`ID_USUARI`) REFERENCES `usuari` (`ID_USUARI`);
