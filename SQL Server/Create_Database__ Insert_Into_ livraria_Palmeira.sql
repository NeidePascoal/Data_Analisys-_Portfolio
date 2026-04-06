-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 24, 2025 at 01:43 PM
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
-- Database: `livraria_palmeira`
--

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(10) NOT NULL,
  `descritivo_categoria` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `descritivo_categoria`) VALUES
(1, 'Romance'),
(2, 'Ficção Científica'),
(3, 'História'),
(4, 'Tecnologia'),
(5, 'Poesia'),
(6, 'Fantasia'),
(7, 'Biografia');

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(10) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `telemovel` int(10) NOT NULL,
  `data_registo` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nome`, `telemovel`, `data_registo`) VALUES
(1, 'Ana Santos', 912345678, '2007-01-15'),
(2, 'Bruno Costa', 913456789, '2023-12-22'),
(3, 'Carla Nunes', 914567890, '2008-05-10'),
(4, 'Daniel Silva', 915678901, '2023-11-05'),
(5, 'Eva Martins', 916789012, '2024-03-18'),
(6, 'João Ferreira', 918234567, '2024-01-12'),
(7, 'Maria Rocha', 913987654, '2024-02-18'),
(8, 'Tiago Marques', 912345987, '2023-11-25'),
(9, 'Sofia Cardoso', 916789543, '2024-03-03'),
(10, 'Pedro Almeida', 915678321, '2023-09-30'),
(11, 'Marta Lopes', 917234123, '2024-04-14'),
(12, 'Rui Pinto', 914321876, '2000-12-10'),
(13, 'Carolina Ramos', 918765432, '1999-06-01'),
(14, 'Fábio Gonçalves', 913654789, '2024-05-22'),
(15, 'Inês Barros', 912987321, '2024-01-29'),
(16, 'Luís Costa', 917123654, '2023-08-16'),
(17, 'Raquel Nogueira', 915432678, '2024-07-05'),
(18, 'André Silva', 914789654, '2023-10-08'),
(19, 'Test Morais', 919876543, '2010-02-26'),
(20, 'Test Carvalho', 912112233, '2024-03-17'),
(21, 'Filipa Martins', 916223344, '2023-07-24'),
(22, 'Daniel Fonseca', 913998877, '2008-06-30'),
(23, 'Catarina Dias', 917445566, '2024-05-12'),
(24, 'Vítor Matos', 918554433, '2024-04-03'),
(25, 'Joana Correia', 915667788, '2003-11-15');

-- --------------------------------------------------------

--
-- Table structure for table `cliente_livro`
--

CREATE TABLE `cliente_livro` (
  `id_cliente` int(10) NOT NULL,
  `id_livro` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cliente_livro`
--

INSERT INTO `cliente_livro` (`id_cliente`, `id_livro`) VALUES
(2, 5),
(3, 12),
(3, 18),
(4, 7),
(6, 2),
(6, 8),
(7, 3),
(8, 14),
(9, 9),
(10, 5),
(12, 1),
(12, 11),
(14, 6),
(14, 19),
(15, 4),
(17, 10),
(18, 15),
(20, 16),
(21, 22),
(22, 24);

-- --------------------------------------------------------

--
-- Table structure for table `livro`
--

CREATE TABLE `livro` (
  `id_livro` int(10) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `autor` varchar(255) NOT NULL,
  `preco` decimal(65,0) NOT NULL,
  `id_categoria` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `livro`
--

INSERT INTO `livro` (`id_livro`, `nome`, `autor`, `preco`, `id_categoria`) VALUES
(1, 'O Alquimista', 'Paulo Coelho', '13', 0),
(2, '1984', 'George Orwell', '15', 0),
(3, 'Breve História do Tempo', 'Stephen Hawking', '19', 0),
(4, 'Aprender SQL', 'Alan Beaulieu', '24', 0),
(5, 'Os Lusíadas', 'Luís de Camões', '10', 0),
(6, 'A Sombra do Vento', 'Carlos Ruiz Zafón', '15', 0),
(7, 'Duna', 'Frank Herbert', '18', 0),
(8, 'O Diário de Anne Frank', 'Anne Frank', '12', 0),
(9, 'O Programador Pragmático', 'Andy Hunt', '22', 0),
(10, 'Mensagem', 'Fernando Pessoa', '10', 0),
(11, 'O Senhor dos Anéis', 'J.R.R. Tolkien', '25', 0),
(12, 'Steve Jobs', 'Walter Isaacson', '18', 0),
(13, 'O Nome da Rosa', 'Umberto Eco', '13', 0),
(14, 'Neuromancer', 'William Gibson', '16', 0),
(15, 'Breve História de Quase Tudo', 'Bill Bryson', '16', 0),
(16, 'Clean Code', 'Robert C. Martin', '25', 0),
(17, 'Os Poemas da Minha Vida', 'Sophia de Mello Breyner', '9', 0),
(18, 'Harry Potter e a Pedra Filosofal', 'J.K. Rowling', '20', 0),
(19, 'Leonardo da Vinci', 'Walter Isaacson', '20', 0),
(20, 'Dom Quixote', 'Miguel de Cervantes', '13', 0),
(21, 'Fundação', 'Isaac Asimov', '17', 0),
(22, 'História de Portugal', 'José Hermano Saraiva', '14', 0),
(23, 'Estruturas de Dados em Java', 'Nuno Preguiça', '21', 0),
(24, 'Antologia Poética', 'Florbela Espanca', '10', 0),
(25, 'O Hobbit', 'J.R.R. Tolkien', '19', 0);

-- --------------------------------------------------------

--
-- Table structure for table `livro_categoria`
--

CREATE TABLE `livro_categoria` (
  `id_livro` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indexes for table `cliente_livro`
--
ALTER TABLE `cliente_livro`
  ADD KEY `FK_cl_livro` (`id_livro`),
  ADD KEY `FK_cl_cliente` (`id_cliente`);

--
-- Indexes for table `livro`
--
ALTER TABLE `livro`
  ADD PRIMARY KEY (`id_livro`);

--
-- Indexes for table `livro_categoria`
--
ALTER TABLE `livro_categoria`
  ADD PRIMARY KEY (`id_livro`,`id_categoria`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `livro`
--
ALTER TABLE `livro`
  MODIFY `id_livro` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cliente_livro`
--
ALTER TABLE `cliente_livro`
  ADD CONSTRAINT `FK_cl_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `FK_cl_livro` FOREIGN KEY (`id_livro`) REFERENCES `livro` (`id_livro`);

--
-- Constraints for table `livro_categoria`
--
ALTER TABLE `livro_categoria`
  ADD CONSTRAINT `livro_categoria_ibfk_1` FOREIGN KEY (`id_livro`) REFERENCES `livro` (`id_livro`),
  ADD CONSTRAINT `livro_categoria_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
