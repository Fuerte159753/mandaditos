-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-02-2024 a las 04:26:07
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pedidos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `admin_id` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `contrasena` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`admin_id`, `nombre`, `email`, `contrasena`) VALUES
(1, 'Jose Luis', 'admin@mandados', '123456789');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `cliente_id` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `localidad` varchar(20) NOT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `correo` varchar(255) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `verificado` int(11) NOT NULL,
  `codigo_verificacion` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`cliente_id`, `nombre`, `apellido`, `localidad`, `telefono`, `correo`, `password`, `verificado`, `codigo_verificacion`) VALUES
(2, 'Daniela', 'Mayor Martinez', 'Centro de Tasquillo', '7721181348', 'dani@gmail.com', '123456789', 0, 0),
(3, 'Miguel', 'Ruiz', 'Centro de Tasquillo', '7721512654', 'mig@googl.com', '123', 0, 0),
(4, 'Jhoana', 'Perez Gomez', 'La Vega', '7721557858', 'jhoanagomez199@gmail.com', '1234567890', 0, 0),
(5, 'Diego', 'martinez ', 'El Calvario', '7777777744', 'martines@gmial.com', '1234', 0, 0),
(6, 'Odalis', 'Resendiz', 'Centro de Tasquillo', '7721356498', 'odalis@gmail.com', '12335678', 0, 0),
(7, 'jhoana ', 'perez', 'Nuevo Porvenir', '7721557858', 'jhoanap989@gmail.com', '1234567890', 0, 0),
(9, 'Luis', 'Norbero', 'El Calvario', '7721181348', 'driackuwuh@gmail.com', '2usgnwj9', 0, 0),
(10, '', '', '', '', '', '$2y$10$bCSPCasI4.N9RnSgyUqQiOCzbWrjZQcDMaasrbLQsHqXOAHGDmND.', 1, 698701),
(11, 'ale', 'martinez', 'La Vega', '7721383124', 'ale@gmail.com', '$2y$10$6N21OxLWm5/hW.adPYHjV.Pgwn1oYpvul.Zxx8P/zhw9zRFhrxh92', 0, 262634);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallespedido`
--

CREATE TABLE `detallespedido` (
  `detalle_id` int(11) NOT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `categoria` text DEFAULT NULL,
  `subcategoria` text DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detallespedido`
--

INSERT INTO `detallespedido` (`detalle_id`, `pedido_id`, `producto_id`, `categoria`, `subcategoria`, `descripcion`) VALUES
(1, 1, NULL, 'Comida', 'Supermercados', '1 Kg de Barbacoa'),
(2, 2, NULL, 'Farmacia', 'Artículos de cuidado personal', 'Pasta de dientes y un cepillo'),
(3, 3, NULL, 'Artículos de hogar', 'Electrodomésticos pequeños', 'Horno de microndas'),
(4, 4, NULL, 'Farmacia', 'Artículos de cuidado personal', 'Shampoo Tio Nachi'),
(5, 5, NULL, 'Ferretería', 'Materiales de construcción', '1 Bulto de Cemento'),
(6, 6, NULL, 'Farmacia', 'Medicamentos recetados', 'hhhhhjfhj'),
(7, 7, NULL, 'Comida', 'Tiendas especializadas', 'Galletas'),
(8, 8, NULL, 'Artículos de hogar', 'Decoración para el hogar', 'Cesto de basura'),
(9, 9, NULL, 'Comida', 'Restaurantes locales', 'unas enchiladas suizas del restaurante a lado de la presidencia '),
(10, 10, NULL, 'Farmacia', 'Suministros médicos básicos', 'Pastillas'),
(11, 11, NULL, 'Farmacia', 'Artículos de cuidado personal', 'caja guantes '),
(12, 12, NULL, 'Farmacia', 'Medicamentos recetados', ' pastlillas'),
(13, 13, NULL, 'Farmacia', 'Medicamentos recetados', 'paracetamol'),
(14, 14, NULL, 'Comida', 'Supermercados', 'COMIDA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciones`
--

CREATE TABLE `direcciones` (
  `id_dire` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `direccion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `direcciones`
--

INSERT INTO `direcciones` (`id_dire`, `cliente_id`, `direccion`) VALUES
(8, 3, '1 de Mayo'),
(9, 2, '1 de Mayo 290 Col. Las Nubes'),
(10, 2, 'Zaragoza, 29 Col. Pastores'),
(16, 5, 'juan de la barrera '),
(17, 2, 'calle 1 de mayo a un costado de tienda el juan'),
(18, 6, 'Av. Revolución '),
(19, 7, 'huisticola '),
(22, 4, 'Santiago '),
(25, 4, 'Ixmiquilpan '),
(36, 9, 'av prolongacion hidalgo'),
(79, 10, ''),
(80, 11, 'por mi casa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `pedido_id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `fecha_pedido` varchar(20) DEFAULT NULL,
  `direccion` text NOT NULL,
  `estado_pedido` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`pedido_id`, `cliente_id`, `fecha_pedido`, `direccion`, `estado_pedido`) VALUES
(1, 2, '2023-11-30 11:13 pm', '1 de Mayo 290 Col. Las Nubes', 'cancelado'),
(2, 2, '2023-11-30 11:14 pm', '1 de Mayo 290 Col. Las Nubes', 'cancelado'),
(3, 2, '2023-11-30 11:16 pm', 'Zaragoza, 29 Col. Pastores', 'cancelado'),
(4, 2, '2023-11-30 11:36 pm', '1 de Mayo 290 Col. Las Nubes', 'cancelado'),
(5, 2, '2023-12-01 12:45 am', '1 de Mayo 290 Col. Las Nubes', 'entregado'),
(6, 2, '2023-12-01 1:36 am', '1 de Mayo 290 Col. Las Nubes', 'entregado'),
(7, 4, '2023-12-01 1:59 am', 'Joaquín 1', 'cancelado'),
(8, 4, '2023-12-01 3:04 am', 'Joaquín 1', 'cancelado'),
(9, 2, '2023-12-01 10:23 am', 'calle 1 de mayo a un costado de tienda el juan', 'entregado'),
(10, 2, '2023-12-01 11:13 am', 'calle 1 de mayo a un costado de tienda el juan', 'cancelado'),
(11, 4, '2023-12-01 11:17 am', 'Joaquín 1', 'en espera'),
(12, 4, '2024-01-12 9:52 am', 'Joaquín 1', 'entregado'),
(13, 7, '2024-01-29 2:26 pm', 'huisticola ', 'cancelado'),
(14, 7, '2024-01-29 2:42 pm', 'huisticola ', 'cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `producto_id` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repartidores`
--

CREATE TABLE `repartidores` (
  `repartidor_id` int(11) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `password` varchar(25) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `repartidores`
--

INSERT INTO `repartidores` (`repartidor_id`, `correo`, `password`, `nombre`, `apellido`, `telefono`) VALUES
(4, 'labra1@jfiei.com', '1234567', 'Santiago', 'Labra Hernandez', '7721048082');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutas`
--

CREATE TABLE `rutas` (
  `ruta_id` int(11) NOT NULL,
  `repartidor_id` int(11) DEFAULT NULL,
  `localidad` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rutas`
--

INSERT INTO `rutas` (`ruta_id`, `repartidor_id`, `localidad`) VALUES
(12, 4, 'La vega'),
(13, 4, NULL),
(14, 4, 'Muntzy'),
(15, 4, 'Nuevo porvenir'),
(16, 4, 'Centro de Tasquillo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Id` int(5) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `password` varchar(10) NOT NULL,
  `Tipeuser` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`Id`, `Nombre`, `correo`, `password`, `Tipeuser`) VALUES
(1, 'alejandro', 'ale@gmail.com', '1234567890', '0');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cliente_id`),
  ADD UNIQUE KEY `uc_correo` (`correo`);

--
-- Indices de la tabla `detallespedido`
--
ALTER TABLE `detallespedido`
  ADD PRIMARY KEY (`detalle_id`),
  ADD KEY `detallespedido_ibfk_1` (`pedido_id`),
  ADD KEY `detallespedido_ibfk_2` (`producto_id`);

--
-- Indices de la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD PRIMARY KEY (`id_dire`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`pedido_id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`producto_id`);

--
-- Indices de la tabla `repartidores`
--
ALTER TABLE `repartidores`
  ADD PRIMARY KEY (`repartidor_id`);

--
-- Indices de la tabla `rutas`
--
ALTER TABLE `rutas`
  ADD PRIMARY KEY (`ruta_id`),
  ADD KEY `repartidor_id` (`repartidor_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cliente_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `detallespedido`
--
ALTER TABLE `detallespedido`
  MODIFY `detalle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `direcciones`
--
ALTER TABLE `direcciones`
  MODIFY `id_dire` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `pedido_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `producto_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `repartidores`
--
ALTER TABLE `repartidores`
  MODIFY `repartidor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `rutas`
--
ALTER TABLE `rutas`
  MODIFY `ruta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detallespedido`
--
ALTER TABLE `detallespedido`
  ADD CONSTRAINT `detallespedido_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`pedido_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detallespedido_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD CONSTRAINT `direcciones_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `rutas`
--
ALTER TABLE `rutas`
  ADD CONSTRAINT `rutas_ibfk_1` FOREIGN KEY (`repartidor_id`) REFERENCES `repartidores` (`repartidor_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
