-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2025 at 01:03 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zenclinc`
--
CREATE DATABASE IF NOT EXISTS `zenclinc` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `zenclinc`;

-- --------------------------------------------------------

--
-- Stand-in structure for view `agenda_diaria`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `agenda_diaria`;
CREATE TABLE `agenda_diaria` (
`id_consulta` int(11)
,`nome_medico` varchar(255)
,`nome_Paciente` varchar(255)
,`data_consulta` datetime
);

-- --------------------------------------------------------

--
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
CREATE TABLE `consulta` (
  `id_consulta` int(11) NOT NULL,
  `id_medico` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `id_estadoconsulta` int(11) NOT NULL,
  `data_consulta` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `consulta`
--

INSERT INTO `consulta` (`id_consulta`, `id_medico`, `id_paciente`, `id_estadoconsulta`, `data_consulta`) VALUES
(132, 1, 5, 2, '2025-03-26 16:30:00'),
(133, 3, 2, 3, '2025-02-07 11:00:00'),
(134, 3, 2, 1, '2026-04-30 17:30:00'),
(135, 2, 4, 3, '2025-03-21 10:00:00'),
(136, 1, 3, 3, '2025-05-06 15:30:00'),
(138, 4, 2, 3, '2025-03-21 10:30:00'),
(139, 1, 1, 2, '2025-02-05 13:30:00'),
(140, 2, 5, 1, '2025-09-30 16:00:00'),
(141, 2, 3, 2, '2025-02-13 14:30:00'),
(142, 1, 2, 1, '2026-04-07 09:30:00'),
(143, 1, 4, 3, '2025-02-08 17:00:00'),
(144, 2, 1, 2, '2025-02-10 18:00:00'),
(145, 2, 2, 1, '2025-09-13 09:30:00'),
(146, 1, 4, 2, '2025-02-12 14:00:00'),
(147, 3, 2, 3, '2025-04-30 10:30:00'),
(148, 3, 3, 2, '2025-05-09 09:30:00'),
(149, 1, 3, 3, '2025-02-20 14:30:00'),
(150, 4, 4, 3, '2025-01-29 14:00:00'),
(151, 4, 4, 3, '2025-03-19 18:00:00'),
(152, 2, 3, 1, '2025-12-17 09:00:00'),
(153, 1, 1, 1, '2026-01-07 13:30:00'),
(154, 2, 5, 2, '2025-03-23 14:30:00'),
(155, 3, 1, 2, '2025-01-21 13:00:00'),
(156, 2, 1, 2, '2025-02-20 16:00:00'),
(157, 1, 1, 3, '2025-04-14 18:00:00'),
(158, 3, 4, 1, '2026-03-29 17:00:00'),
(159, 2, 2, 1, '2025-08-29 14:30:00'),
(160, 3, 2, 3, '2025-05-14 09:00:00'),
(161, 3, 5, 2, '2025-01-25 18:00:00'),
(162, 3, 4, 1, '2026-10-19 13:30:00'),
(163, 2, 3, 1, '2026-09-22 14:30:00'),
(164, 3, 5, 3, '2025-01-31 11:30:00'),
(165, 4, 4, 2, '2025-06-09 11:30:00'),
(166, 2, 5, 1, '2026-05-26 09:30:00'),
(167, 1, 5, 2, '2025-05-25 10:00:00'),
(168, 2, 1, 2, '2025-05-16 12:00:00'),
(169, 1, 3, 1, '2026-07-27 11:00:00'),
(170, 2, 1, 1, '2025-08-27 14:00:00'),
(171, 3, 5, 1, '2026-08-01 16:30:00'),
(172, 4, 5, 2, '2025-05-05 13:00:00'),
(173, 2, 2, 1, '2026-12-02 11:30:00'),
(174, 2, 1, 3, '2025-02-25 18:00:00'),
(175, 4, 4, 2, '2025-04-13 15:30:00'),
(176, 1, 2, 1, '2026-05-23 09:00:00'),
(177, 3, 2, 2, '2025-06-07 10:30:00'),
(178, 3, 3, 2, '2025-02-11 10:00:00'),
(179, 4, 1, 1, '2026-02-04 16:00:00'),
(180, 1, 2, 2, '2025-03-23 14:00:00'),
(181, 4, 5, 3, '2025-05-15 14:00:00'),
(182, 4, 4, 3, '2025-02-10 11:00:00'),
(183, 3, 3, 1, '2026-08-09 12:00:00'),
(184, 1, 1, 3, '2025-03-11 12:00:00'),
(185, 4, 2, 1, '2026-03-17 11:00:00'),
(186, 4, 4, 3, '2025-05-23 11:30:00'),
(187, 4, 2, 3, '2025-04-12 13:00:00'),
(188, 1, 5, 3, '2025-02-13 10:30:00'),
(189, 1, 1, 1, '2026-11-12 16:00:00'),
(190, 2, 4, 1, '2025-11-10 15:00:00'),
(192, 3, 5, 2, '2025-04-30 12:00:00'),
(193, 2, 4, 3, '2025-01-23 09:30:00'),
(194, 3, 3, 1, '2026-05-31 09:00:00'),
(195, 1, 4, 1, '2026-02-10 16:30:00'),
(196, 3, 1, 2, '2025-05-31 15:30:00'),
(197, 4, 1, 1, '2026-10-05 16:00:00'),
(198, 3, 3, 1, '2026-03-15 16:30:00'),
(199, 2, 3, 3, '2025-04-24 12:30:00'),
(200, 4, 2, 1, '2026-10-02 15:00:00'),
(201, 2, 1, 3, '2025-01-20 13:30:00'),
(202, 1, 1, 2, '2025-02-02 13:30:00'),
(203, 4, 4, 3, '2025-05-28 10:30:00'),
(204, 1, 1, 1, '2026-08-13 15:30:00'),
(205, 2, 2, 1, '2026-03-02 17:30:00'),
(206, 4, 2, 2, '2025-05-13 11:30:00'),
(207, 1, 5, 2, '2025-04-10 17:00:00'),
(208, 1, 2, 3, '2025-02-11 11:00:00'),
(209, 3, 1, 2, '2025-04-08 13:00:00'),
(210, 2, 3, 1, '2025-12-25 15:30:00'),
(211, 1, 4, 1, '2026-07-13 11:00:00'),
(212, 2, 1, 3, '2025-03-14 09:00:00'),
(213, 3, 2, 1, '2025-10-24 10:00:00'),
(214, 2, 1, 1, '2025-09-10 09:00:00'),
(215, 4, 3, 3, '2025-01-24 13:30:00'),
(216, 4, 4, 3, '2025-04-25 17:30:00'),
(217, 2, 5, 2, '2025-04-30 16:00:00'),
(218, 4, 2, 1, '2025-08-03 17:00:00'),
(219, 1, 1, 3, '2025-03-06 09:30:00'),
(220, 2, 4, 3, '2025-02-01 09:30:00'),
(221, 3, 4, 3, '2025-03-25 17:00:00'),
(222, 2, 1, 1, '2026-02-17 11:30:00'),
(223, 1, 5, 2, '2025-02-28 13:30:00'),
(224, 3, 5, 3, '2025-04-24 10:00:00'),
(225, 3, 4, 2, '2025-03-02 12:00:00'),
(226, 2, 2, 2, '2025-03-15 17:00:00'),
(227, 3, 2, 3, '2025-02-24 10:00:00'),
(228, 3, 4, 1, '2026-01-15 15:30:00'),
(229, 2, 2, 2, '2025-02-25 11:00:00'),
(230, 4, 1, 1, '2026-07-12 10:00:00'),
(231, 4, 1, 2, '2025-05-08 13:30:00'),
(232, 3, 4, 2, '2025-03-24 13:00:00'),
(233, 3, 2, 1, '2026-08-30 12:00:00'),
(234, 4, 3, 3, '2025-04-20 09:00:00'),
(235, 1, 1, 3, '2025-01-12 09:00:00'),
(236, 2, 4, 3, '2025-03-12 09:30:00'),
(237, 1, 4, 2, '2025-01-27 14:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `especialidade`
--

DROP TABLE IF EXISTS `especialidade`;
CREATE TABLE `especialidade` (
  `id_especialidade` int(11) NOT NULL,
  `nome_especialidade` varchar(255) NOT NULL,
  `periodicidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `especialidade`
--

INSERT INTO `especialidade` (`id_especialidade`, `nome_especialidade`, `periodicidade`) VALUES
(1, 'Pediatria ', 10),
(2, 'Medicina Geral', 12),
(3, 'Cardiologia', 6),
(4, 'Obstetricia', 8);

-- --------------------------------------------------------

--
-- Table structure for table `estadoconsulta`
--

DROP TABLE IF EXISTS `estadoconsulta`;
CREATE TABLE `estadoconsulta` (
  `id_estadoconsulta` int(11) NOT NULL,
  `estado` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `estadoconsulta`
--

INSERT INTO `estadoconsulta` (`id_estadoconsulta`, `estado`) VALUES
(1, 'agendada'),
(2, 'realizada'),
(3, 'cancelada');

-- --------------------------------------------------------

--
-- Stand-in structure for view `futuras_consultas`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `futuras_consultas`;
CREATE TABLE `futuras_consultas` (
`id_paciente` int(11)
,`nome_paciente` varchar(255)
,`id_especialidade` int(11)
,`nome_especialidade` varchar(255)
,`periodicidade` int(11)
,`id_medico` int(11)
,`nome_medico` varchar(255)
,`data_ult_consulta` datetime
,`data_novaconsulta` datetime
);

-- --------------------------------------------------------

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
CREATE TABLE `medico` (
  `id_medico` int(11) NOT NULL,
  `nome_medico` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password1` varchar(255) NOT NULL,
  `data_contratacao` date NOT NULL,
  `id_especialidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medico`
--

INSERT INTO `medico` (`id_medico`, `nome_medico`, `email`, `password1`, `data_contratacao`, `id_especialidade`) VALUES
(1, 'pedro silva', 'ps@gmail.com', '(md5(pedr123)', '2020-05-05', 1),
(2, 'faria jose', 'faria@gmail.com', '(md5(far123)', '2010-10-05', 2),
(3, 'petra fonseca', 'petr@gmail.com', '(md5(petr123)', '2015-09-15', 3),
(4, 'ana vieira', 'anavia@gmail.com', '(md5(vie123)', '1980-05-04', 4);

-- --------------------------------------------------------

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
CREATE TABLE `paciente` (
  `id_paciente` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `data_nascimento` date NOT NULL,
  `nif` int(9) NOT NULL DEFAULT 999999999,
  `telefone` int(15) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `telemovel_urgencia` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paciente`
--

INSERT INTO `paciente` (`id_paciente`, `nome`, `data_nascimento`, `nif`, `telefone`, `endereco`, `telemovel_urgencia`) VALUES
(1, 'ana paulo', '2010-06-16', 285656896, 930310258, '932548599', 0),
(2, 'Vina silvestre', '2014-04-16', 248568965, 930310258, '922548599', 0),
(3, 'edna castro', '2011-04-16', 248544465, 944410258, '922444599', 0),
(4, 'neide varela', '1999-04-16', 124568965, 144310258, '955548599', 0),
(5, 'sonia dado', '1980-04-16', 277768965, 937770258, '977748599', 0);

-- --------------------------------------------------------

--
-- Structure for view `agenda_diaria`
--
DROP TABLE IF EXISTS `agenda_diaria`;

DROP VIEW IF EXISTS `agenda_diaria`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `agenda_diaria`  AS SELECT `c`.`id_consulta` AS `id_consulta`, `m`.`nome_medico` AS `nome_medico`, `p`.`nome` AS `nome_Paciente`, `c`.`data_consulta` AS `data_consulta` FROM ((`consulta` `c` join `medico` `m` on(`m`.`id_medico` = `c`.`id_medico`)) join `paciente` `p` on(`p`.`id_paciente` = `c`.`id_paciente`)) ;

-- --------------------------------------------------------

--
-- Structure for view `futuras_consultas`
--
DROP TABLE IF EXISTS `futuras_consultas`;

DROP VIEW IF EXISTS `futuras_consultas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `futuras_consultas`  AS SELECT `p`.`id_paciente` AS `id_paciente`, `p`.`nome` AS `nome_paciente`, `e`.`id_especialidade` AS `id_especialidade`, `e`.`nome_especialidade` AS `nome_especialidade`, `e`.`periodicidade` AS `periodicidade`, `m`.`id_medico` AS `id_medico`, `m`.`nome_medico` AS `nome_medico`, max(`c`.`data_consulta`) AS `data_ult_consulta`, max(`c`.`data_consulta`) + interval `e`.`periodicidade` month AS `data_novaconsulta` FROM (((`consulta` `c` join `paciente` `p` on(`p`.`id_paciente` = `c`.`id_paciente`)) join `medico` `m` on(`m`.`id_medico` = `c`.`id_medico`)) join `especialidade` `e` on(`e`.`id_especialidade` = `m`.`id_especialidade`)) GROUP BY `p`.`id_paciente`, `e`.`id_especialidade`, `m`.`id_medico`, `p`.`nome`, `e`.`nome_especialidade`, `e`.`periodicidade`, `m`.`nome_medico` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`id_consulta`),
  ADD KEY `fk_cons_med` (`id_medico`),
  ADD KEY `fk_cons_esta` (`id_estadoconsulta`),
  ADD KEY `fk_cons_pac` (`id_paciente`);

--
-- Indexes for table `especialidade`
--
ALTER TABLE `especialidade`
  ADD PRIMARY KEY (`id_especialidade`);

--
-- Indexes for table `estadoconsulta`
--
ALTER TABLE `estadoconsulta`
  ADD PRIMARY KEY (`id_estadoconsulta`);

--
-- Indexes for table `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`id_medico`),
  ADD KEY `fk_med_esp` (`id_especialidade`);

--
-- Indexes for table `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id_paciente`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `consulta`
--
ALTER TABLE `consulta`
  MODIFY `id_consulta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=238;

--
-- AUTO_INCREMENT for table `especialidade`
--
ALTER TABLE `especialidade`
  MODIFY `id_especialidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `estadoconsulta`
--
ALTER TABLE `estadoconsulta`
  MODIFY `id_estadoconsulta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `medico`
--
ALTER TABLE `medico`
  MODIFY `id_medico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `fk_cons_esta` FOREIGN KEY (`id_estadoconsulta`) REFERENCES `especialidade` (`id_especialidade`),
  ADD CONSTRAINT `fk_cons_med` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`),
  ADD CONSTRAINT `fk_cons_pac` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`);

--
-- Constraints for table `medico`
--
ALTER TABLE `medico`
  ADD CONSTRAINT `fk_med_esp` FOREIGN KEY (`id_especialidade`) REFERENCES `especialidade` (`id_especialidade`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
