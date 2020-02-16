-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Temps de generació: 14-02-2020 a les 22:41:15
-- Versió del servidor: 10.4.11-MariaDB
-- Versió de PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de dades: `it_ex2_6_optics`
--
CREATE DATABASE IF NOT EXISTS `it_ex2_6_optics` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `it_ex2_6_optics`;

-- --------------------------------------------------------

--
-- Estructura de la taula `brand`
--

CREATE TABLE `brand` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(45) DEFAULT NULL,
  `brand_provider_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Bolcament de dades per a la taula `brand`
--

INSERT INTO `brand` (`brand_id`, `brand_name`, `brand_provider_id`) VALUES
(1, 'Rayban', 1),
(2, 'Oakley', 1),
(3, 'Polaroid', 2),
(4, 'Carrera', 2),
(5, 'Lacoste', 3),
(6, 'Vogue', 3),
(7, 'Boss', 4),
(8, 'Dior', 5);

-- --------------------------------------------------------

--
-- Estructura de la taula `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(45) DEFAULT NULL,
  `customer_postCode` varchar(45) DEFAULT NULL,
  `customer_telephone` varchar(45) DEFAULT NULL,
  `customer_email` varchar(45) DEFAULT NULL,
  `customer_reg_date` date DEFAULT NULL,
  `customer_friendly_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Bolcament de dades per a la taula `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `customer_postCode`, `customer_telephone`, `customer_email`, `customer_reg_date`, `customer_friendly_id`) VALUES
(1, 'Customer_1', '08801', '938900001', 'customer_1@email.pers', '2020-02-14', NULL),
(2, 'Customer_2', '08802', '938900002', 'customer_2@email.pers', '2020-02-14', 1),
(3, 'Customer_3', '08803', '938900003', 'customer_3@email.pers', '2020-02-15', NULL),
(4, 'Customer_4', '08804', '938900004', 'customer_4@email.pers', '2020-02-15', 2),
(5, 'Customer_5', '08805', '938900005', 'customer_5@email.pers', '2020-02-15', NULL),
(6, 'Customer_6', '08806', '938900006', 'customer_6@email.pers', '2020-02-16', 3);

-- --------------------------------------------------------

--
-- Estructura de la taula `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `employee_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Bolcament de dades per a la taula `employee`
--

INSERT INTO `employee` (`employee_id`, `employee_name`) VALUES
(1, 'Employee_1'),
(2, 'Employee_2'),
(3, 'Employee_3'),
(4, 'Employee_4'),
(5, 'Employee_5');

-- --------------------------------------------------------

--
-- Estructura de la taula `glasses`
--

CREATE TABLE `glasses` (
  `glasses_id` int(11) NOT NULL,
  `glasses_left_lens_grad` decimal(4,2) DEFAULT NULL,
  `glasses_right_lens_grad` decimal(4,2) DEFAULT NULL,
  `glasses_frame_color` varchar(45) DEFAULT NULL,
  `glasses_left_lens_color` varchar(45) DEFAULT NULL,
  `glasses_right_lens_color` varchar(45) DEFAULT NULL,
  `glasses_price` decimal(15,2) DEFAULT NULL,
  `glasses_type_id` int(11) NOT NULL,
  `glasses_brand_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Bolcament de dades per a la taula `glasses`
--

INSERT INTO `glasses` (`glasses_id`, `glasses_left_lens_grad`, `glasses_right_lens_grad`, `glasses_frame_color`, `glasses_left_lens_color`, `glasses_right_lens_color`, `glasses_price`, `glasses_type_id`, `glasses_brand_id`) VALUES
(1, '1.50', '1.80', 'red', 'dark', 'dark', '350.99', 1, 1),
(2, '1.00', '1.10', 'black', 'clear', 'clear', '250.99', 2, 1),
(3, '1.25', '1.35', 'orange', 'clear', 'clear', '255.50', 3, 2),
(4, '1.75', '1.75', 'white', 'clear', 'clear', '450.00', 2, 3),
(5, '0.90', '0.80', 'gray', 'dark', 'dark', '375.50', 3, 4),
(6, '0.80', '0.70', 'black', 'clear', 'clear', '175.00', 3, 5),
(7, '2.00', '2.10', 'black', 'clear', 'clear', '300.00', 3, 6);

-- --------------------------------------------------------

--
-- Estructura de la taula `glasses_type`
--

CREATE TABLE `glasses_type` (
  `glasses_type_id` int(11) NOT NULL,
  `glasses_type_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Bolcament de dades per a la taula `glasses_type`
--

INSERT INTO `glasses_type` (`glasses_type_id`, `glasses_type_name`) VALUES
(1, 'Flotant'),
(2, 'Pasta'),
(3, 'Metàl·lica');

-- --------------------------------------------------------

--
-- Estructura de la taula `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `order_num` varchar(45) NOT NULL,
  `order_customer_id` int(11) NOT NULL,
  `order_employee_id` int(11) NOT NULL,
  `order_glasses_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Bolcament de dades per a la taula `order`
--

INSERT INTO `order` (`order_id`, `order_num`, `order_customer_id`, `order_employee_id`, `order_glasses_id`) VALUES
(1, '20001', 2, 1, 1),
(2, '20002', 4, 1, 2),
(3, '20003', 5, 1, 3),
(4, '20004', 5, 1, 1),
(5, '20005', 6, 2, 4);

-- --------------------------------------------------------

--
-- Estructura de la taula `provider`
--

CREATE TABLE `provider` (
  `provider_id` int(11) NOT NULL,
  `provider_name` varchar(45) DEFAULT NULL,
  `provider_street` varchar(45) DEFAULT NULL,
  `provider_postCode` int(11) DEFAULT NULL,
  `provider_city` varchar(45) DEFAULT NULL,
  `provider_country` varchar(45) DEFAULT NULL,
  `provider_telephone` varchar(45) DEFAULT NULL,
  `provider_fax` varchar(45) DEFAULT NULL,
  `provider_nif` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Bolcament de dades per a la taula `provider`
--

INSERT INTO `provider` (`provider_id`, `provider_name`, `provider_street`, `provider_postCode`, `provider_city`, `provider_country`, `provider_telephone`, `provider_fax`, `provider_nif`) VALUES
(1, 'Provider_1', 'C. Salvador Dalí', 8801, 'Figueres', 'Catalonia', '900010203', '900010204', '123456789A'),
(2, 'Provider_2', 'C. Pablo Picasso', 8802, 'Málaga', 'Spain', '900010205', '900010206', '234567890B'),
(3, 'Provider_3', 'C. Joan Miro', 8803, 'Barcelona', 'Catalonia', '900010207', '900010208', '345678901C'),
(4, 'Provider_4', 'C. Diego Velázquez', 8804, 'Sevilla', 'Spain', '900010209', '900010210', '456789012D');

--
-- Índexs per a les taules bolcades
--

--
-- Índexs per a la taula `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brand_id`),
  ADD KEY `brand_provider_id_idx` (`brand_provider_id`);

--
-- Índexs per a la taula `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `customer_friendly_id_idx` (`customer_friendly_id`);

--
-- Índexs per a la taula `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Índexs per a la taula `glasses`
--
ALTER TABLE `glasses`
  ADD PRIMARY KEY (`glasses_id`),
  ADD KEY `glasses_type_id_idx` (`glasses_type_id`),
  ADD KEY `glasses_brand_id_idx` (`glasses_brand_id`);

--
-- Índexs per a la taula `glasses_type`
--
ALTER TABLE `glasses_type`
  ADD PRIMARY KEY (`glasses_type_id`);

--
-- Índexs per a la taula `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `ordrer_customer_id_idx` (`order_customer_id`),
  ADD KEY `order_employee_id_idx` (`order_employee_id`),
  ADD KEY `order_glasses_id_idx` (`order_glasses_id`);

--
-- Índexs per a la taula `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`provider_id`);

--
-- AUTO_INCREMENT per les taules bolcades
--

--
-- AUTO_INCREMENT per la taula `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la taula `glasses`
--
ALTER TABLE `glasses`
  MODIFY `glasses_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la taula `glasses_type`
--
ALTER TABLE `glasses_type`
  MODIFY `glasses_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la taula `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la taula `provider`
--
ALTER TABLE `provider`
  MODIFY `provider_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restriccions per a les taules bolcades
--

--
-- Restriccions per a la taula `brand`
--
ALTER TABLE `brand`
  ADD CONSTRAINT `brand_provider_id` FOREIGN KEY (`brand_provider_id`) REFERENCES `provider` (`provider_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restriccions per a la taula `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_friendly_id` FOREIGN KEY (`customer_friendly_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restriccions per a la taula `glasses`
--
ALTER TABLE `glasses`
  ADD CONSTRAINT `glasses_brand_id` FOREIGN KEY (`glasses_brand_id`) REFERENCES `brand` (`brand_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `glasses_type_id` FOREIGN KEY (`glasses_type_id`) REFERENCES `glasses_type` (`glasses_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restriccions per a la taula `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_customer_id` FOREIGN KEY (`order_customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `order_employee_id` FOREIGN KEY (`order_employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `order_glasses_id` FOREIGN KEY (`order_glasses_id`) REFERENCES `glasses` (`glasses_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
