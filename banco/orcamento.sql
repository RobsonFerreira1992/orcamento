-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 25-Jul-2020 às 20:05
-- Versão do servidor: 10.1.44-MariaDB-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `orcamento`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargos`
--

CREATE TABLE `cargos` (
  `id` int(11) NOT NULL,
  `cargo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cargos`
--

INSERT INTO `cargos` (`id`, `cargo`) VALUES
(2, 'Administrador'),
(3, 'Gerente'),
(4, 'Tesoureiro'),
(5, 'Funcionário');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `telefone` varchar(50) NOT NULL,
  `endereco` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `cpf` varchar(50) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `telefone`, `endereco`, `email`, `cpf`, `data`) VALUES
(13, 'Débora Aparecida Sanches de Araujo ', '(11) 95408-3343', 'arari 19', 'debby@hotmail.com', '444.444.444-44', '2020-07-23'),
(14, 'Fabio Ferreira Miranda', '(11) 11111-1111', 'rua 10', 'fabio@hotmail.com', '777.777.777-77', '2020-07-23'),
(15, 'Andrea de Fatima', '(33) 33333-3333', 'rua itapevi', 'dea@hotmail.com', '999.999.999-99', '2020-07-23'),
(16, 'Adriano Ferreira Miranda', '(22) 22222-2222', 'rua 2', 'adriano@hotmail.com', '666.666.666-66', '2020-07-23');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cpf` varchar(50) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `endereco` varchar(50) NOT NULL,
  `cargo` varchar(50) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `funcionarios`
--

INSERT INTO `funcionarios` (`id`, `nome`, `cpf`, `telefone`, `endereco`, `cargo`, `data`) VALUES
(2, 'Fabio Ferreira Miranda', '111.111.111-11', '(11) 11111-1111', 'rua 6', 'Gerente', '2020-07-06'),
(3, 'Adriano', '22222222222', '1111111111', 'rua 9', 'Gerente', '2020-07-06'),
(4, 'Robson Ferreira Miranda', '333.333.333-33', '(11) 96470-4420', 'rua 10', 'Funcionário', '2020-07-07');

-- --------------------------------------------------------

--
-- Estrutura da tabela `orcamento`
--

CREATE TABLE `orcamento` (
  `id` int(11) NOT NULL,
  `cliente` varchar(50) NOT NULL,
  `tecnico` varchar(50) NOT NULL,
  `produto` varchar(50) NOT NULL,
  `serie` varchar(100) DEFAULT NULL,
  `problema` varchar(255) NOT NULL,
  `laudo` varchar(255) DEFAULT NULL,
  `obs` varchar(255) DEFAULT NULL,
  `valor_servico` decimal(10,2) DEFAULT NULL,
  `pecas` varchar(255) DEFAULT NULL,
  `valor_pecas` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `desconto` decimal(10,2) DEFAULT NULL,
  `valor_total` decimal(10,2) DEFAULT NULL,
  `pgto` varchar(50) DEFAULT NULL,
  `data_abertura` date NOT NULL,
  `data_geracao` date DEFAULT NULL,
  `data_aprovacao` date DEFAULT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `orcamento`
--

INSERT INTO `orcamento` (`id`, `cliente`, `tecnico`, `produto`, `serie`, `problema`, `laudo`, `obs`, `valor_servico`, `pecas`, `valor_pecas`, `total`, `desconto`, `valor_total`, `pgto`, `data_abertura`, `data_geracao`, `data_aprovacao`, `status`) VALUES
(11, '666.666.666-66', '4', 'celular moto g8', '050', 'carregador', 'necessidade de nova troca de tela', 'possivel troca de celular', '100.00', 'tela', '200.00', '300.00', '20.00', '280.00', 'Dinheiro', '2020-07-23', '2020-07-23', '2020-07-23', 'Aprovado'),
(12, '999.999.999-99', '4', 'iphone 8', '060', 'tela desliga sozinha', 'nova', 'nova troca', '100.00', 'tela', '50.00', '150.00', '20.00', '130.00', 'Cartão', '2020-07-23', '2020-07-24', '2020-07-24', 'Aprovado'),
(13, '777.777.777-77', '4', 'celular', '050', 'tela', 'tela', 'troca', '20.00', 'tela', '50.00', '70.00', '20.00', '50.00', 'Dinheiro', '2020-07-24', '2020-07-24', '2020-07-24', 'Aprovado'),
(14, '444.444.444-44', '4', 'iphone 10', '060', 'tela', 'nova tela', 'xxxxxxxxxxxx', '50.00', 'tela', '2000.00', '2050.00', '30.00', '2020.00', 'Dinheiro', '2020-07-24', '2020-07-24', '2020-07-24', 'Aprovado'),
(15, '666.666.666-66', '4', 'celular', '090', 'tela não liga', 'troca de tela', 'avaliar ', '100.00', 'nova tela ', '200.00', '300.00', '20.00', '280.00', 'Dinheiro', '2020-07-25', '2020-07-25', '2020-07-25', 'Aprovado');

-- --------------------------------------------------------

--
-- Estrutura da tabela `os`
--

CREATE TABLE `os` (
  `id` int(11) NOT NULL,
  `id_orc` int(11) NOT NULL,
  `cliente` varchar(50) NOT NULL,
  `produto` varchar(50) NOT NULL,
  `tecnico` varchar(50) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `data_abertura` date NOT NULL,
  `data_fechamento` date DEFAULT NULL,
  `garantia` varchar(15) DEFAULT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `os`
--

INSERT INTO `os` (`id`, `id_orc`, `cliente`, `produto`, `tecnico`, `total`, `data_abertura`, `data_fechamento`, `garantia`, `status`) VALUES
(7, 11, '666.666.666-66', 'celular moto g8', '4', '300.00', '2020-07-23', '2020-07-23', '50', 'Fechado'),
(8, 12, '999.999.999-99', 'iphone 8', '4', '150.00', '2020-07-24', NULL, NULL, 'Cancelado'),
(9, 13, '777.777.777-77', 'celular', '4', '70.00', '2020-07-24', '2020-07-24', '50', 'Fechado'),
(10, 14, '444.444.444-44', 'iphone 10', '4', '2050.00', '2020-07-24', '2020-07-25', '50 dias', 'Fechado'),
(11, 15, '666.666.666-66', 'celular', '4', '300.00', '2020-07-25', '2020-07-25', '20', 'Fechado');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `cargo` varchar(50) NOT NULL,
  `id_funcionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `usuario`, `senha`, `cargo`, `id_funcionario`) VALUES
(1, 'administrador', 'admin', '123', 'Administrador', 0),
(5, 'Adriano', 'adr', '123', 'Gerente', 3),
(6, 'Robson Ferreira Miranda', 'robson', '123', 'Funcionário', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orcamento`
--
ALTER TABLE `orcamento`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `os`
--
ALTER TABLE `os`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `orcamento`
--
ALTER TABLE `orcamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `os`
--
ALTER TABLE `os`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
