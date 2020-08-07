-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 07-Ago-2020 às 18:16
-- Versão do servidor: 10.1.44-MariaDB-0ubuntu0.18.04.1
-- PHP Version: 7.4.8

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
-- Estrutura da tabela `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `peca` varchar(50) NOT NULL,
  `funcionario` varchar(50) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `compras`
--

INSERT INTO `compras` (`id`, `valor`, `peca`, `funcionario`, `data`) VALUES
(2, '250.00', 'tela original j3', 'vinicius', '2020-08-04');

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
(4, 'Robson Ferreira Miranda', '333.333.333-33', '(11) 96470-4420', 'rua 10', 'Funcionário', '2020-07-07'),
(5, 'Mendel Silva', '000.000.000-00', '(00) 00000-0000', 'rua 20', 'Funcionário', '2020-07-28'),
(7, 'vinicius', '101.010.101-01', '(11) 11111-1111', 'rua 20', 'Tesoureiro', '2020-07-28');

-- --------------------------------------------------------

--
-- Estrutura da tabela `gastos`
--

CREATE TABLE `gastos` (
  `id` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `motivo` varchar(200) NOT NULL,
  `funcionario` varchar(50) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `gastos`
--

INSERT INTO `gastos` (`id`, `valor`, `motivo`, `funcionario`, `data`) VALUES
(1, '200.00', 'teste 5', 'vinicius', '2020-07-31'),
(2, '300.00', 'teste', 'vinicius', '2020-07-31'),
(7, '100.00', 'teste', '', '2020-07-31'),
(8, '100.00', 're', '', '2020-07-31'),
(9, '100.00', 'teste', '', '2020-07-31');

-- --------------------------------------------------------

--
-- Estrutura da tabela `movimentacoes`
--

CREATE TABLE `movimentacoes` (
  `id` int(11) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `movimento` varchar(20) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `funcionario` varchar(50) NOT NULL,
  `data` date NOT NULL,
  `id_movimento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `movimentacoes`
--

INSERT INTO `movimentacoes` (`id`, `tipo`, `movimento`, `valor`, `funcionario`, `data`, `id_movimento`) VALUES
(5, 'Saída', 'Gasto', '100.00', '', '2020-07-31', 7),
(6, 'Saída', 'Gasto', '100.00', '', '2020-07-31', 8),
(7, 'Saída', 'Gasto', '100.00', '', '2020-07-31', 9),
(8, 'Saída', 'Pagamento', '200.00', 'vinicius', '2020-08-03', 1),
(9, 'Entrada', 'Venda', '200.00', 'vinicius', '2020-08-03', 0),
(10, 'Entrada', 'Venda', '100.00', 'vinicius', '2020-08-03', 0),
(12, 'Saida', 'Compra', '250.00', 'vinicius', '2020-08-04', 2),
(14, 'Entrada', 'Serviço', '300.00', 'Mendel Silva', '2020-08-04', 20),
(15, 'Entrada', 'Serviço', '500.00', 'Mendel Silva', '2020-08-04', 21),
(16, 'Entrada', 'Serviço', '500.00', 'Mendel Silva', '2020-08-04', 22);

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
(15, '666.666.666-66', '4', 'celular', '090', 'tela não liga', 'troca de tela', 'avaliar ', '100.00', 'nova tela ', '200.00', '300.00', '20.00', '280.00', 'Dinheiro', '2020-07-25', '2020-07-25', '2020-07-25', 'Aprovado'),
(16, '999.999.999-99', '5', 'celular s5', '070', 'tela', 'nova troca de tela', 'troca de tela', '400.00', 'tela', '100.00', '500.00', '50.00', '450.00', 'Dinheiro', '2020-07-28', '2020-07-28', '2020-07-28', 'Aprovado'),
(17, '777.777.777-77', '5', 'celular s8', '080', 'teste', 'teste', 'teste', '30.00', 'teste', '40.00', '70.00', '50.00', '20.00', 'Dinheiro', '2020-07-28', '2020-07-28', '2020-07-28', 'Aprovado'),
(18, '777.777.777-77', '5', 'celular', '090', 'teste', 'teste', 'teste', '400.00', 'teste', '100.00', '500.00', '90.00', '410.00', 'Cartão', '2020-07-28', '2020-07-28', '2020-07-28', 'Aprovado'),
(19, '777.777.777-77', '5', 'celular', '090', 'teste', 'teste', 'teste', '100.00', 'tela', '200.00', '300.00', '10.00', '290.00', 'Dinheiro', '2020-07-28', '2020-08-04', '2020-08-04', 'Aprovado'),
(20, '999.999.999-99', '4', 'tv', '080', 'teste', 'teste', 'teste', '100.00', 'tela', '200.00', '300.00', '10.00', '290.00', 'Dinheiro', '2020-08-03', '2020-08-03', '2020-08-03', 'Aprovado'),
(21, '999.999.999-99', '4', 'iphone', '080', 'teste', 'teste', 'teste', '100.00', 'teste', '100.00', '200.00', '20.00', '180.00', 'Dinheiro', '2020-08-03', '2020-08-03', '2020-08-03', 'Aprovado'),
(22, '777.777.777-77', '5', 'celular j7', '66', 'tela com defeito', 'nova tela ', 'troca de tela', '200.00', 'tela original', '150.00', '350.00', '20.00', '330.00', 'Dinheiro', '2020-08-04', '2020-08-04', '2020-08-04', 'Aprovado'),
(23, '777.777.777-77', '5', 'tv', '77', 'teste', 'teste', 'teste', '200.00', 'teste', '300.00', '500.00', '20.00', '480.00', 'Dinheiro', '2020-08-04', '2020-08-04', '2020-08-04', 'Aprovado'),
(24, '999.999.999-99', '5', 'teste', '099', 'teste', NULL, 'teste', NULL, NULL, NULL, NULL, NULL, '0.00', NULL, '2020-08-07', NULL, NULL, 'Aberto');

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
(11, 15, '666.666.666-66', 'celular', '4', '300.00', '2020-07-25', '2020-07-25', '20', 'Fechado'),
(12, 16, '999.999.999-99', 'celular s5', '5', '500.00', '2020-07-28', NULL, NULL, 'Cancelado'),
(13, 17, '777.777.777-77', 'celular s8', '5', '70.00', '2020-07-28', NULL, NULL, 'Cancelado'),
(14, 18, '777.777.777-77', 'celular', '5', '500.00', '2020-07-28', NULL, NULL, 'Cancelado'),
(15, 18, '777.777.777-77', 'celular', '5', '500.00', '2020-07-28', NULL, NULL, 'Cancelada'),
(16, 18, '777.777.777-77', 'celular', '5', '500.00', '2020-07-28', NULL, NULL, 'Cancelada'),
(17, 20, '999.999.999-99', 'tv', '4', '300.00', '2020-08-03', NULL, NULL, 'Cancelada'),
(18, 21, '999.999.999-99', 'iphone', '4', '200.00', '2020-08-03', NULL, NULL, 'Cancelada'),
(19, 22, '777.777.777-77', 'celular j7', '5', '350.00', '2020-08-04', '2020-08-04', '50', 'Fechada'),
(20, 19, '777.777.777-77', 'celular', '5', '300.00', '2020-08-04', '2020-08-04', '20', 'Fechada'),
(21, 23, '777.777.777-77', 'tv', '5', '500.00', '2020-08-04', '2020-08-04', '10', 'Fechada'),
(22, 23, '777.777.777-77', 'tv', '5', '500.00', '2020-08-04', '2020-08-04', '90', 'Fechada');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamentos`
--

CREATE TABLE `pagamentos` (
  `id` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `funcionario` varchar(50) NOT NULL,
  `tesoureiro` varchar(50) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pagamentos`
--

INSERT INTO `pagamentos` (`id`, `valor`, `funcionario`, `tesoureiro`, `data`) VALUES
(1, '200.00', 'Robson Ferreira Miranda', 'vinicius', '2020-08-03');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `produto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id`, `produto`) VALUES
(6, 'iphone-18'),
(8, '-17');

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
(6, 'Robson Ferreira Miranda', 'robson', '123', 'Funcionário', 4),
(7, 'Mendel Silva', 'mendel', '123', 'Funcionário', 5),
(8, 'vinicius', 'vini', '123', 'Tesoureiro', 7);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

CREATE TABLE `vendas` (
  `id` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `produto` varchar(50) NOT NULL,
  `funcionario` varchar(50) NOT NULL,
  `data` date NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `vendas`
--

INSERT INTO `vendas` (`id`, `valor`, `produto`, `funcionario`, `data`, `status`) VALUES
(1, '200.00', 'celular', 'vinicius', '2020-08-03', 'Efetuado'),
(2, '100.00', '-17', 'vinicius', '2020-08-03', 'Cancelada'),
(3, '50.00', '-17', 'vinicius', '2020-08-03', 'Cancelada');

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
-- Indexes for table `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gastos`
--
ALTER TABLE `gastos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movimentacoes`
--
ALTER TABLE `movimentacoes`
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
-- Indexes for table `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendas`
--
ALTER TABLE `vendas`
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
-- AUTO_INCREMENT for table `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `gastos`
--
ALTER TABLE `gastos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `movimentacoes`
--
ALTER TABLE `movimentacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `orcamento`
--
ALTER TABLE `orcamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `os`
--
ALTER TABLE `os`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `pagamentos`
--
ALTER TABLE `pagamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `vendas`
--
ALTER TABLE `vendas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
