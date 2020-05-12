-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-04-2020 a las 17:49:02
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `opticalshop`
--
CREATE DATABASE IF NOT EXISTS `opticalshop` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `opticalshop`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `address`
--

CREATE TABLE `address` (
  `idAddress` int(11) NOT NULL,
  `streetAddress` varchar(150) NOT NULL,
  `numberAddress` varchar(45) NOT NULL,
  `floorAddress` varchar(10) DEFAULT NULL,
  `doorAddress` varchar(10) DEFAULT NULL,
  `cityAddress` varchar(45) NOT NULL,
  `zipCodeAddress` varchar(45) NOT NULL,
  `countryAddress` varchar(45) NOT NULL,
  `Person_identificationPerson` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `address`
--

INSERT INTO `address` (`idAddress`, `streetAddress`, `numberAddress`, `floorAddress`, `doorAddress`, `cityAddress`, `zipCodeAddress`, `countryAddress`, `Person_identificationPerson`) VALUES
(1, 'Plaza San Roque', '7', NULL, NULL, 'Calamocha', '44200 ', 'EspaÃ±a', '92759958W'),
(2, 'Calle Mariano Barbacid', '5', NULL, NULL, 'Madrid', '28521', 'EspaÃ±a', '95344786T'),
(3, 'Carrer Major', '19', NULL, NULL, 'Barcelona', '08110', 'España', 'A28015866'),
(4, 'Avenida Imperio Argentina', '6', NULL, NULL, 'Malaga', '29004', 'España', '97766499E'),
(5, 'Calle de Zurbano', '79', '8', '4', 'Madrid', '28003', 'España', '25659875R'),
(6, 'Paseo de la Castellana', '61', '1', '2', 'Madrid', '28046', 'España', '53859276X'),
(7, 'Carrer de la Marina', '19', '6', '3', 'Barcelona', '08005', 'España', '61612543Z'),
(8, 'Carrer de Sardenya', '48', '2', '1', 'Barcelona', '08005', 'España', 'B14030899'),
(9, 'Carrer d\'Europa', '24', '1', '1', 'Barcelona', '08028', 'España', 'B29805314');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brand`
--

CREATE TABLE `brand` (
  `idBrand` int(11) NOT NULL,
  `nameBrand` varchar(50) NOT NULL,
  `Supplier_Person_identificationPerson1` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `brand`
--

INSERT INTO `brand` (`idBrand`, `nameBrand`, `Supplier_Person_identificationPerson1`) VALUES
(1, 'Ray-Ban', 'A28015866'),
(2, 'Oakley', 'A28015866'),
(3, 'Polaroid', 'B14030899'),
(4, 'Carrera', 'B29805314'),
(5, 'Police', 'B59765122'),
(6, 'Bvlgari', 'B29805314');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `color`
--

CREATE TABLE `color` (
  `idColor` int(11) NOT NULL,
  `nameColor` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `color`
--

INSERT INTO `color` (`idColor`, `nameColor`) VALUES
(1, 'black '),
(2, 'white'),
(3, 'gray'),
(4, 'blue'),
(5, 'brown'),
(6, 'green'),
(7, 'orange'),
(8, 'pink'),
(9, 'purple'),
(10, 'red'),
(11, 'yellow');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customer`
--

CREATE TABLE `customer` (
  `Person_identificationPerson` varchar(9) NOT NULL,
  `registrationDateCustomer` datetime NOT NULL,
  `referredCustomer` varchar(255) DEFAULT NULL COMMENT 'Referred Customer for each new customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `customer`
--

INSERT INTO `customer` (`Person_identificationPerson`, `registrationDateCustomer`, `referredCustomer`) VALUES
('25659875R', '2020-04-23 12:22:00', NULL),
('61612543Z', '2019-05-12 09:15:23', 'Charlie Sheen'),
('69751497X', '2018-01-10 15:30:52', NULL),
('75482705Y', '2019-09-12 12:45:20', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee`
--

CREATE TABLE `employee` (
  `Person_identificationPerson` varchar(9) NOT NULL,
  `startDateEmployee` datetime NOT NULL,
  `finalDateEmployee` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `employee`
--

INSERT INTO `employee` (`Person_identificationPerson`, `startDateEmployee`, `finalDateEmployee`) VALUES
('53859276X', '2015-01-10 08:30:00', NULL),
('82812482A', '2017-04-25 08:30:00', NULL),
('97766499E', '2019-05-12 08:30:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `frame`
--

CREATE TABLE `frame` (
  `idFrame` int(11) NOT NULL,
  `typeFrame` varchar(45) NOT NULL COMMENT 'Type of frame  Full mount design, flow of air design, semi-rimless design',
  `materialFrame` varchar(45) NOT NULL COMMENT 'the glasses can take these values in the materials: paste, metal, titanium, wooden',
  `Color_idColor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `frame`
--

INSERT INTO `frame` (`idFrame`, `typeFrame`, `materialFrame`, `Color_idColor`) VALUES
(1, ' Full mount', 'paste', 1),
(2, ' flow of air', 'metal', 1),
(3, ' semi-rimless', 'metal', 3),
(4, ' flow of air', ' titanium', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glasses`
--

CREATE TABLE `glasses` (
  `idGlasses` int(11) NOT NULL,
  `priceGlasses` double NOT NULL,
  `Brand_idBrand` int(11) NOT NULL,
  `Frame_idFrame` int(11) NOT NULL,
  `LeftLens_idLeftLens` int(11) NOT NULL,
  `RightLens_idRightLens` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `glasses`
--

INSERT INTO `glasses` (`idGlasses`, `priceGlasses`, `Brand_idBrand`, `Frame_idFrame`, `LeftLens_idLeftLens`, `RightLens_idRightLens`) VALUES
(1, 250.95, 1, 1, 1, 1),
(2, 360.5, 2, 2, 2, 2),
(3, 650.3, 4, 4, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `graduation`
--

CREATE TABLE `graduation` (
  `idGraduation` int(11) NOT NULL,
  `sphereGraduation` varchar(10) DEFAULT NULL COMMENT 'The numbre might be very small, like 0.25 or a large number like 6.00 and a positive or negative sign',
  `cylinderGraduation` double DEFAULT NULL COMMENT 'The numbre might be very small, like 0.2 or a large number like 3.00',
  `axisGraduation` int(5) DEFAULT NULL COMMENT 'The axis is defined with a number from 1 to 180. measured in degrees ',
  `addGraduation` varchar(10) DEFAULT NULL COMMENT 'Generally, it will range from +0.75 to +3.00',
  `prismGraduation` varchar(10) DEFAULT NULL,
  `pdGraduation` int(5) DEFAULT NULL COMMENT 'Pupillary Distance It is expressed in millimeters and is usually between 25 and 40mm for each eye'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `graduation`
--

INSERT INTO `graduation` (`idGraduation`, `sphereGraduation`, `cylinderGraduation`, `axisGraduation`, `addGraduation`, `prismGraduation`, `pdGraduation`) VALUES
(1, '-0.2', -2, 70, '+1.75', '2UP', 63),
(2, '-2', -1, 30, NULL, NULL, 64),
(3, '-1.50', 0.5, 90, '+2.25', '2DN 1IN', 63),
(4, '-1.25', 0.5, 90, '+2.25', '2UP', 63);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoice`
--

CREATE TABLE `invoice` (
  `idInvoice` int(11) NOT NULL,
  `dateInvoice` datetime NOT NULL,
  `ivaInvoice` double NOT NULL,
  `totalnvoice` double NOT NULL,
  `Employee_Person_identificationPerson` varchar(9) NOT NULL,
  `Customer_Person_identificationPerson` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `invoice`
--

INSERT INTO `invoice` (`idInvoice`, `dateInvoice`, `ivaInvoice`, `totalnvoice`, `Employee_Person_identificationPerson`, `Customer_Person_identificationPerson`) VALUES
(1, '2020-04-22 10:45:20', 52.71, 304.315, '53859276X', '25659875R'),
(2, '2019-10-25 15:25:10', 151.72, 874, '53859276X', '75482705Y'),
(3, '2018-12-04 09:25:02', 136.5, 786.86, '82812482A', '61612543Z'),
(4, '2019-11-25 14:32:20', 128.7, 741.56, '53859276X', '69751497X');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoicedetail`
--

CREATE TABLE `invoicedetail` (
  `idInvoiceDetail` int(11) NOT NULL,
  `quantityInvoiceDetail` int(5) NOT NULL,
  `priceInvoiceDetail` double NOT NULL,
  `Invoice_idInvoice` int(11) NOT NULL,
  `Glasses_idGlasses` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `invoicedetail`
--

INSERT INTO `invoicedetail` (`idInvoiceDetail`, `quantityInvoiceDetail`, `priceInvoiceDetail`, `Invoice_idInvoice`, `Glasses_idGlasses`) VALUES
(1, 1, 251.5, 1, 1),
(2, 2, 361.25, 2, 2),
(3, 1, 650.21, 3, 3),
(4, 1, 251.32, 4, 1),
(5, 1, 361.54, 4, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `leftlens`
--

CREATE TABLE `leftlens` (
  `idLeftLens` int(11) NOT NULL,
  `Graduation_idGraduation` int(11) NOT NULL,
  `Color_idColor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `leftlens`
--

INSERT INTO `leftlens` (`idLeftLens`, `Graduation_idGraduation`, `Color_idColor`) VALUES
(1, 1, 2),
(2, 3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `person`
--

CREATE TABLE `person` (
  `identificationPerson` varchar(9) NOT NULL COMMENT 'Identification Document: National ID Numbe (DNI), Tax Identification Number (NIF) or Foreign Resident Number (NIE)',
  `namePerson` varchar(255) NOT NULL COMMENT 'Full name',
  `typeDocumentPerson` varchar(10) NOT NULL COMMENT 'Identification Document: National ID Numbe (DNI), Tax Identification Number (NIF),  Foreign Resident Number (NIE) or passport ',
  `profilePerson` varchar(45) NOT NULL COMMENT 'Profile for the person: Supplier, customer, employee',
  `phonePerson` int(20) NOT NULL COMMENT 'contact telephone',
  `emailPerson` varchar(150) NOT NULL COMMENT 'Contact email. '
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `person`
--

INSERT INTO `person` (`identificationPerson`, `namePerson`, `typeDocumentPerson`, `profilePerson`, `phonePerson`, `emailPerson`) VALUES
('25659875R', 'Demi Moore', 'DNI', 'Customer', 933363041, 'demim@gmail.com'),
('53859276X', 'Caroline Seger', 'DNI', 'Employee', 699785395, 'carolines@gmail.com'),
('61612543Z', 'Elton John', 'DNI', 'Customer', 988366276, 'eltonj@gmail.com'),
('69751497X', 'Nicolas Cage', 'DNI', 'Customer', 938886266, 'nicolasc@gmail.com'),
('75482705Y', 'Woody Allen', 'DNI', 'Customer', 925224549, 'woddya@gmail.com'),
('82812482A', 'Philipp Lahm', 'DNI', 'Employee', 980052382, 'pholippl@gmail.com'),
('92759958W', 'Charlie Sheen', 'DNI', 'Customer', 914990003, 'charlies@gmail.com'),
('95344786T', 'Natalie Portman', 'DNI', 'Customer', 993759767, 'nataliep@gmail.com'),
('97766499E', 'Samir Nasri ', 'DNI', 'Employee', 669321660, 'samirn@gmail.com'),
('A28015866', 'Optiali', 'NIF', 'Supplier', 911230275, 'ventas@optiali.com'),
('B14030899', 'Gafas Dicogaf SL', 'NIF', 'Supplier', 665268958, 'ventas@dicogaf.es'),
('B29805314', 'Ajc Opticos SL', 'NIF', 'Supplier', 945498366, 'compras@ajc.com'),
('B59765122', 'Gafas de Colindres SL', 'NIF', 'Supplier', 921625200, 'gafasc@colindres.es');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rightlens`
--

CREATE TABLE `rightlens` (
  `idRightLens` int(11) NOT NULL,
  `Graduation_idGraduation` int(11) NOT NULL,
  `Color_idColor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rightlens`
--

INSERT INTO `rightlens` (`idRightLens`, `Graduation_idGraduation`, `Color_idColor`) VALUES
(1, 2, 2),
(2, 4, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `supplier`
--

CREATE TABLE `supplier` (
  `Person_identificationPerson` varchar(9) NOT NULL,
  `faxSupplier` int(15) DEFAULT NULL COMMENT 'fax supplier the field can be empty'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `supplier`
--

INSERT INTO `supplier` (`Person_identificationPerson`, `faxSupplier`) VALUES
('A28015866', 985362154),
('B14030899', 998745214),
('B29805314', NULL),
('B59765122', 914257863);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`idAddress`),
  ADD KEY `fk_Address_Person1_idx` (`Person_identificationPerson`);

--
-- Indices de la tabla `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`idBrand`),
  ADD UNIQUE KEY `nameBrand_UNIQUE` (`nameBrand`),
  ADD KEY `fk_Brand_Supplier1_idx` (`Supplier_Person_identificationPerson1`);

--
-- Indices de la tabla `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`idColor`);

--
-- Indices de la tabla `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Person_identificationPerson`),
  ADD UNIQUE KEY `Person_identificationPerson_UNIQUE` (`Person_identificationPerson`);

--
-- Indices de la tabla `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Person_identificationPerson`),
  ADD UNIQUE KEY `Person_identificationPerson_UNIQUE` (`Person_identificationPerson`);

--
-- Indices de la tabla `frame`
--
ALTER TABLE `frame`
  ADD PRIMARY KEY (`idFrame`),
  ADD KEY `fk_Frame_Color1_idx` (`Color_idColor`);

--
-- Indices de la tabla `glasses`
--
ALTER TABLE `glasses`
  ADD PRIMARY KEY (`idGlasses`),
  ADD KEY `fk_Glasses_Brand1_idx` (`Brand_idBrand`),
  ADD KEY `fk_Glasses_Frame1_idx` (`Frame_idFrame`),
  ADD KEY `fk_Glasses_LeftLens1_idx` (`LeftLens_idLeftLens`),
  ADD KEY `fk_Glasses_RightLens1_idx` (`RightLens_idRightLens`);

--
-- Indices de la tabla `graduation`
--
ALTER TABLE `graduation`
  ADD PRIMARY KEY (`idGraduation`);

--
-- Indices de la tabla `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`idInvoice`),
  ADD KEY `fk_Invoice_Employee1_idx` (`Employee_Person_identificationPerson`),
  ADD KEY `fk_Invoice_Customer1_idx` (`Customer_Person_identificationPerson`);

--
-- Indices de la tabla `invoicedetail`
--
ALTER TABLE `invoicedetail`
  ADD PRIMARY KEY (`idInvoiceDetail`),
  ADD KEY `fk_InvoiceDetail_Invoice1_idx` (`Invoice_idInvoice`),
  ADD KEY `fk_InvoiceDetail_Glasses1_idx` (`Glasses_idGlasses`);

--
-- Indices de la tabla `leftlens`
--
ALTER TABLE `leftlens`
  ADD PRIMARY KEY (`idLeftLens`),
  ADD KEY `fk_LeftLens_Graduation1_idx` (`Graduation_idGraduation`),
  ADD KEY `fk_LeftLens_Color1_idx` (`Color_idColor`);

--
-- Indices de la tabla `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`identificationPerson`),
  ADD UNIQUE KEY `emailPerson_UNIQUE` (`emailPerson`),
  ADD UNIQUE KEY `identificationPerson_UNIQUE` (`identificationPerson`);

--
-- Indices de la tabla `rightlens`
--
ALTER TABLE `rightlens`
  ADD PRIMARY KEY (`idRightLens`),
  ADD KEY `fk_RightLens_Graduation1_idx` (`Graduation_idGraduation`),
  ADD KEY `fk_RightLens_Color1_idx` (`Color_idColor`);

--
-- Indices de la tabla `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`Person_identificationPerson`),
  ADD UNIQUE KEY `Person_identificationPerson_UNIQUE` (`Person_identificationPerson`),
  ADD KEY `fk_Supplier_Person1_idx` (`Person_identificationPerson`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `address`
--
ALTER TABLE `address`
  MODIFY `idAddress` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `brand`
--
ALTER TABLE `brand`
  MODIFY `idBrand` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `color`
--
ALTER TABLE `color`
  MODIFY `idColor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `frame`
--
ALTER TABLE `frame`
  MODIFY `idFrame` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `glasses`
--
ALTER TABLE `glasses`
  MODIFY `idGlasses` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `graduation`
--
ALTER TABLE `graduation`
  MODIFY `idGraduation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `invoice`
--
ALTER TABLE `invoice`
  MODIFY `idInvoice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `invoicedetail`
--
ALTER TABLE `invoicedetail`
  MODIFY `idInvoiceDetail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `leftlens`
--
ALTER TABLE `leftlens`
  MODIFY `idLeftLens` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `rightlens`
--
ALTER TABLE `rightlens`
  MODIFY `idRightLens` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `fk_Address_Person1` FOREIGN KEY (`Person_identificationPerson`) REFERENCES `person` (`identificationPerson`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `brand`
--
ALTER TABLE `brand`
  ADD CONSTRAINT `fk_Brand_Supplier1` FOREIGN KEY (`Supplier_Person_identificationPerson1`) REFERENCES `supplier` (`Person_identificationPerson`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `fk_Customer_Person1` FOREIGN KEY (`Person_identificationPerson`) REFERENCES `person` (`identificationPerson`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `fk_Employee_Person1` FOREIGN KEY (`Person_identificationPerson`) REFERENCES `person` (`identificationPerson`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `frame`
--
ALTER TABLE `frame`
  ADD CONSTRAINT `fk_Frame_Color1` FOREIGN KEY (`Color_idColor`) REFERENCES `color` (`idColor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `glasses`
--
ALTER TABLE `glasses`
  ADD CONSTRAINT `fk_Glasses_Brand1` FOREIGN KEY (`Brand_idBrand`) REFERENCES `brand` (`idBrand`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Glasses_Frame1` FOREIGN KEY (`Frame_idFrame`) REFERENCES `frame` (`idFrame`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Glasses_LeftLens1` FOREIGN KEY (`LeftLens_idLeftLens`) REFERENCES `leftlens` (`idLeftLens`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Glasses_RightLens1` FOREIGN KEY (`RightLens_idRightLens`) REFERENCES `rightlens` (`idRightLens`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `fk_Invoice_Customer1` FOREIGN KEY (`Customer_Person_identificationPerson`) REFERENCES `customer` (`Person_identificationPerson`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Invoice_Employee1` FOREIGN KEY (`Employee_Person_identificationPerson`) REFERENCES `employee` (`Person_identificationPerson`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `invoicedetail`
--
ALTER TABLE `invoicedetail`
  ADD CONSTRAINT `fk_InvoiceDetail_Glasses1` FOREIGN KEY (`Glasses_idGlasses`) REFERENCES `glasses` (`idGlasses`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_InvoiceDetail_Invoice1` FOREIGN KEY (`Invoice_idInvoice`) REFERENCES `invoice` (`idInvoice`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `leftlens`
--
ALTER TABLE `leftlens`
  ADD CONSTRAINT `fk_LeftLens_Color1` FOREIGN KEY (`Color_idColor`) REFERENCES `color` (`idColor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_LeftLens_Graduation1` FOREIGN KEY (`Graduation_idGraduation`) REFERENCES `graduation` (`idGraduation`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `rightlens`
--
ALTER TABLE `rightlens`
  ADD CONSTRAINT `fk_RightLens_Color1` FOREIGN KEY (`Color_idColor`) REFERENCES `color` (`idColor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_RightLens_Graduation1` FOREIGN KEY (`Graduation_idGraduation`) REFERENCES `graduation` (`idGraduation`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `fk_Supplier_Person1` FOREIGN KEY (`Person_identificationPerson`) REFERENCES `person` (`identificationPerson`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
