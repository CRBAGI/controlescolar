-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-12-2023 a las 06:10:14
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `colegio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `id_alumno` int(10) NOT NULL,
  `nom_alum` varchar(50) NOT NULL,
  `ape_alum` varchar(50) NOT NULL,
  `sexo_alum` varchar(50) NOT NULL,
  `telefono_alum` varchar(15) NOT NULL,
  `correo_alum` varchar(100) NOT NULL,
  `fechaNa_alum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id_alumno`, `nom_alum`, `ape_alum`, `sexo_alum`, `telefono_alum`, `correo_alum`, `fechaNa_alum`) VALUES
(1, 'Bryan  Alberto', 'Gomez Ibarias', 'Hombre', '9622140339', 'al19510868@tapachula.tecnm.mx', '2002-06-23'),
(3, 'Esmeralda', 'Garcia', 'Mujer', '9622147611', 'al19510867@gmail.com', '2002-07-27'),
(5, 'Jeremy', 'Osorio', 'Hombre', '9622365478', 'jeremy@gmail.com', '2023-12-14'),
(7, 'Jhonatan', 'Lopez', 'Hombre', '9622140339', 'lopez@gmail.com', '2023-12-27'),
(9, 'Rodolfo', 'Lopez', 'Hombre', '987456123', 'rodolfo@gmail.com', '2023-12-14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `id_asignatura` int(10) NOT NULL,
  `nom_asig` varchar(50) NOT NULL,
  `desc_asig` varchar(250) NOT NULL,
  `id_prof` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`id_asignatura`, `nom_asig`, `desc_asig`, `id_prof`) VALUES
(1, 'Metodos l', 'Calculo de tiempos y movimientos', 5),
(2, 'Español', 'Gramatica, lectura etc', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `id_grupo` int(10) NOT NULL,
  `nom_grupo` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`id_grupo`, `nom_grupo`) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo_asig`
--

CREATE TABLE `grupo_asig` (
  `Id_grupoAsig` int(10) NOT NULL,
  `Id_grupo` int(11) NOT NULL,
  `id_alum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `grupo_asig`
--

INSERT INTO `grupo_asig` (`Id_grupoAsig`, `Id_grupo`, `id_alum`) VALUES
(6, 1, 1),
(8, 1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `Id_prof` int(10) NOT NULL,
  `cedula_profesional` int(20) NOT NULL,
  `nom_prof` varchar(20) NOT NULL,
  `ape_prof` varchar(20) NOT NULL,
  `sexo_prof` varchar(20) NOT NULL,
  `tel_prof` varchar(20) NOT NULL,
  `correo_prof` varchar(100) NOT NULL,
  `fechaNa_prof` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`Id_prof`, `cedula_profesional`, `nom_prof`, `ape_prof`, `sexo_prof`, `tel_prof`, `correo_prof`, `fechaNa_prof`) VALUES
(5, 123987, 'Ceci', 'Muñoz', 'Mujer', '9621457896', 'ceci@muñoz.com', '2023-12-06'),
(6, 123654, 'Carlos', 'Chang', 'Hombre', '9623698521', 'carlochang@gmail.com', '2023-12-02'),
(7, 1111, 'Violeta', 'Industrial', 'Mujer', '962258789', 'violeta@gmail.com', '2023-12-08'),
(8, 1234678, 'Hector', 'Peralta', 'Hombre', '962147896', 'hector@gmail.com', '2023-12-14'),
(9, 789456, 'Nicolas', 'Perez', 'Hombre', '962145678', 'nicolas@gmail.com', '2023-12-21');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id_alumno`);

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`id_asignatura`),
  ADD KEY `id_maestro` (`id_prof`) USING BTREE,
  ADD KEY `id_prof` (`id_prof`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`id_grupo`);

--
-- Indices de la tabla `grupo_asig`
--
ALTER TABLE `grupo_asig`
  ADD PRIMARY KEY (`Id_grupoAsig`),
  ADD KEY `Id_grupo` (`Id_grupo`),
  ADD KEY `id_alum` (`id_alum`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`Id_prof`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id_alumno` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  MODIFY `id_asignatura` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `id_grupo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `grupo_asig`
--
ALTER TABLE `grupo_asig`
  MODIFY `Id_grupoAsig` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `profesores`
--
ALTER TABLE `profesores`
  MODIFY `Id_prof` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD CONSTRAINT `asignatura_ibfk_1` FOREIGN KEY (`id_prof`) REFERENCES `profesores` (`Id_prof`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `grupo_asig`
--
ALTER TABLE `grupo_asig`
  ADD CONSTRAINT `grupo_asig_ibfk_1` FOREIGN KEY (`Id_grupo`) REFERENCES `grupo` (`id_grupo`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `grupo_asig_ibfk_2` FOREIGN KEY (`id_alum`) REFERENCES `alumnos` (`id_alumno`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
