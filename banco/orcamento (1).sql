-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 17-Jul-2020 às 17:22
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
(2, 'Adriano Ferreira Miranda', '(11) 11111-1111', 'rua 2', 'fabio@hotmail.com', '11111111111', '0000-00-00'),
(3, 'Fabio Ferreira Miranda', '(11) 22222-2222', 'rua 2', 'teste@hotmail.com', '22222222222', '0000-00-00'),
(4, 'Débora Sanches ', '(11) 98723-3444', 'rua Arari', 'debora@hotmail.com', '99999999999', '0000-00-00'),
(5, 'Dolores', '(22) 22222-2222', 'rua 20', 'dolores@hotmail.com', '77777777777', '0000-00-00'),
(9, 'mendel', '(11) 11111-1111', 'rua 10', 'mendel@hotmail.com', '444', '2020-07-16'),
(10, 'Vinicius', '(11) 11111-1111', 'rua 5', 'vinicius@hotmail.com', '888', '2020-07-16');

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
(3, '22222222222', '4', 'Galaxy s9', '012', 'Tela quebrada', 'troca de tela', 'caiu no chão', '50.00', 'tela nova ', '100.00', '150.00', '0.00', '150.00', NULL, '2020-07-09', '0000-00-00', NULL, 'Aguardando'),
(4, '99999999999', '4', 'Iphone 8', '014', 'celular desliga sozinho', NULL, 'nenhuma', NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '2020-07-09', NULL, NULL, 'Aberto'),
(5, '77777777777', '4', 'samsung a50', '050', 'tela', NULL, 'troca', NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '2020-07-13', NULL, NULL, 'Aberto'),
(6, '99999999999', '4', 'iphone 8', '025', 'carregador', 'carregador com defeito', 'nenhuma', '200.00', 'novo carregador', '400.00', '600.00', '0.00', '600.00', NULL, '2020-07-13', '0000-00-00', NULL, 'Aguardando'),
(7, '77777777777', '4', 'Moto g8', '050', 'carregador', NULL, 'nenhuma', NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '2020-07-13', NULL, NULL, 'Aberto'),
(8, '444', '4', 'tv', '045', 'carregador', 'teste ', 'tv não liga', '100.00', 'nova tela', '500.00', '600.00', '0.00', '600.00', NULL, '2020-07-16', '0000-00-00', NULL, 'Aguardando'),
(9, '888', '4', 'moto g8', '025', 'tela', 'teste', 'rtgrtr', '100.00', 'tela', '200.00', '300.00', '0.00', '300.00', NULL, '2020-07-16', '2020-07-16', NULL, 'Aguardando');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `orcamento`
--
ALTER TABLE `orcamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
