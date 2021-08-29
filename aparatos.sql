-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-08-2021 a las 21:40:10
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aparatos`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create` (IN `p_nombre` VARCHAR(255), IN `p_calle` VARCHAR(255), IN `p_colonia` VARCHAR(255), IN `p_postal` INT, IN `p_estado` VARCHAR(255), IN `p_pais` VARCHAR(255))  BEGIN
	DECLARE iddireccion INT;
    
	INSERT INTO direccion(calle, colonia, postal, estado, pais) 
    VALUES(p_calle, p_colonia, p_postal, p_estado, p_pais);
    
    SELECT MAX(id) INTO iddireccion FROM direccion;
    
    INSERT INTO electronicos(nombre, fecha, direccionId, estado) 
    VALUES(p_nombre,CURRENT_TIMESTAMP,iddireccion,1);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete` (IN `p_idelectronicos` INT(5))  BEGIN
    UPDATE electronicos SET estasdo = 0
    WHERE id = p_idelectronicos;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Find` ()  BEGIN
SELECT * 
FROM electronicos G 
INNER JOIN direccion A 
ON G.direccionId = A.id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_FindById` (IN `p_idelectronicos` INT(5))  BEGIN
SELECT * 
FROM electronicos G 
INNER JOIN direccion A 
ON G.direccionId = A.id
WHERE id = p_idelectronicos;
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update` (IN `p_iddireccion` INT(5), IN `p_idelectronicos` INT(5), IN `p_nombre` VARCHAR(255), IN `p_calle` VARCHAR(255), IN `p_colonia` VARCHAR(255), IN `p_postal` INT, IN `p_estado` VARCHAR(255), IN `p_pais` VARCHAR(255))  BEGIN
    UPDATE direccion SET calle= p_calle, colonia = p_colonia ,postal= p_postal ,estado = p_estado , pais = p_pais 
    WHERE id = p_iddireccion;

    UPDATE electronicos SET nombre = p_nombre, fecha = CURRENT_TIMESTAMP 
    WHERE id = p_idelectronicos;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `id` int(5) NOT NULL,
  `calle` varchar(255) NOT NULL,
  `colonia` varchar(255) NOT NULL,
  `postal` int(11) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `pais` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`id`, `calle`, `colonia`, `postal`, `estado`, `pais`) VALUES
(1, 'Conervadores', 'Lazaro Cardenas', 62080, 'cuernavaca', 'Mexico'),
(2, 'Liberadores', 'Centro Cultural', 25966, 'Chignahuapan', 'Puebla'),
(3, 'Cubistas', 'Tepito', 10493, 'Ciudad de Mexico', 'Mexico'),
(4, 'Zapatistas', 'Conquista', 15928, 'Gran Estatus', 'El Salvador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `electronicos`
--

CREATE TABLE `electronicos` (
  `id` int(5) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  `direccionId` int(5) NOT NULL,
  `estado` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `electronicos`
--

INSERT INTO `electronicos` (`id`, `nombre`, `fecha`, `direccionId`, `estado`) VALUES
(1, 'Microondas ', '0000-00-00', 1, 0),
(2, 'Refrigerador', '0000-00-00', 2, 1),
(3, 'Estufa', '0000-00-00', 3, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `electronicos`
--
ALTER TABLE `electronicos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `electronicos`
--
ALTER TABLE `electronicos`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
