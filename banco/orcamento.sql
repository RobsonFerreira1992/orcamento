-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20-Jul-2020 às 03:51
-- Versão do servidor: 10.4.8-MariaDB
-- versão do PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `orcamento`
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
(5, 'Dolores', '(11) 99999-9999', 'rua 20', 'dolorescomdores@hotmail.com', '66666666666', '0000-00-00'),
(6, 'Mendel', '(11) 11111-1111', 'rua 10', 'mendel@hotmail.com', '77777777777', '2020-07-18');

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
(3, '22222222222', '4', 'Galaxy s9', '012', 'Tela quebrada', 'Troca de tela', 'caiu no chão', '100.00', 'botao', '50.00', '150.00', '20.00', '130.00', 'Dinheiro', '2020-07-09', '0000-00-00', '2020-07-18', 'Aprovado'),
(4, '99999999999', '4', 'Iphone 8', '014', 'celular desliga sozinho', 'Troca de tela', 'nenhuma', '150.00', 'tela modelo iphone 8', '450.00', '600.00', '20.00', '580.00', 'Dinheiro', '2020-07-09', '0000-00-00', '0000-00-00', 'Aprovado'),
(5, '11111111111', '4', 'Celular Motorola', '016', 'carregador', 'troca de entrada de carregador', 'mal contato', '50.00', 'nova entrada usb', '20.00', '70.00', '10.00', '60.00', 'Cartão', '2020-07-11', '0000-00-00', '2020-07-19', 'Aprovado'),
(6, '66666666666', '4', 'iphone 10', '020', 'carregador', 'troca de entrada de carregador', 'mal contato', '100.00', 'nova entrada usb', '450.00', '550.00', '0.00', '550.00', 'Cartão', '2020-07-11', '0000-00-00', '2020-07-18', 'Aprovado'),
(7, '66666666666', '4', 'Celular LG', '025', 'botao', NULL, 'botão de volume não esta mais funcionando ', NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '2020-07-11', NULL, NULL, 'Aberto'),
(8, '22222222222', '4', 'Celular LG', '023', 'carregador', 'troca de entrada de carregador', 'mal contato', '150.00', 'tela modelo iphone 8', '20.00', '170.00', '0.00', '170.00', NULL, '2020-07-11', '2020-07-19', NULL, 'Aguardando'),
(9, '77777777777', '4', 'Celular LG', '050', 'tela', 'Troca de tela', 'tela não liga', '100.00', 'tela modelo lg', '450.00', '550.00', '10.00', '540.00', 'Dinheiro', '2020-07-18', '2020-07-18', '2020-07-18', 'Aprovado'),
(10, '77777777777', '4', 'Celular LG', '020', 'botao', 'Troca de tela', 'mal contato', '100.00', 'nova entrada usb', '450.00', '550.00', '0.00', '550.00', NULL, '2020-07-19', '2020-07-19', NULL, 'Aguardando');

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
(1, 9, '77777777777', 'Celular LG', '', '550.00', '2020-07-18', NULL, NULL, 'Aberto'),
(2, 6, '66666666666', 'iphone 10', '', '550.00', '2020-07-18', NULL, NULL, 'Aberto'),
(3, 5, '11111111111', 'Celular Motorola', '4', '70.00', '2020-07-19', NULL, NULL, 'Aberto');

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
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `orcamento`
--
ALTER TABLE `orcamento`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `os`
--
ALTER TABLE `os`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `orcamento`
--
ALTER TABLE `orcamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `os`
--
ALTER TABLE `os`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
