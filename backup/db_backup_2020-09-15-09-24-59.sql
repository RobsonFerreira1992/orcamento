DROP TABLE IF EXISTS cargos;

CREATE TABLE `cargos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cargo` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO cargos VALUES("2","Administrador");
INSERT INTO cargos VALUES("3","Gerente");
INSERT INTO cargos VALUES("4","Tesoureiro");
INSERT INTO cargos VALUES("5","Funcionário");


DROP TABLE IF EXISTS clientes;

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `telefone` varchar(50) NOT NULL,
  `endereco` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `cpf` varchar(50) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

INSERT INTO clientes VALUES("13","Débora Aparecida Sanches de Araujo ","(11) 95408-3343","arari 19","debby@hotmail.com","444.444.444-44","2020-07-23");
INSERT INTO clientes VALUES("14","Fabio Ferreira Miranda","(11) 11111-1111","rua 10","fabio@hotmail.com","777.777.777-77","2020-07-23");
INSERT INTO clientes VALUES("15","Andrea de Fatima","(33) 33333-3333","rua itapevi","dea@hotmail.com","999.999.999-99","2020-07-23");
INSERT INTO clientes VALUES("16","Adriano Ferreira Miranda","(22) 22222-2222","rua 2","adriano@hotmail.com","666.666.666-66","2020-07-23");


DROP TABLE IF EXISTS compras;

CREATE TABLE `compras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` decimal(10,2) NOT NULL,
  `peca` varchar(50) NOT NULL,
  `funcionario` varchar(50) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

INSERT INTO compras VALUES("2","250.00","tela original j3","vinicius","2020-08-04");
INSERT INTO compras VALUES("3","20.00","cabo","vinicius","2020-09-03");


DROP TABLE IF EXISTS funcionarios;

CREATE TABLE `funcionarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `cpf` varchar(50) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `endereco` varchar(50) NOT NULL,
  `cargo` varchar(50) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

INSERT INTO funcionarios VALUES("2","Fabio Ferreira Miranda","111.111.111-11","(11) 11111-1111","rua 6","Gerente","2020-07-06");
INSERT INTO funcionarios VALUES("3","Adriano","22222222222","1111111111","rua 9","Gerente","2020-07-06");
INSERT INTO funcionarios VALUES("4","Robson Ferreira Miranda","333.333.333-33","(11) 96470-4420","rua 10","Funcionário","2020-07-07");
INSERT INTO funcionarios VALUES("5","Mendel Silva","000.000.000-00","(00) 00000-0000","rua 20","Funcionário","2020-07-28");
INSERT INTO funcionarios VALUES("7","vinicius","101.010.101-01","(11) 11111-1111","rua 20","Tesoureiro","2020-07-28");


DROP TABLE IF EXISTS gastos;

CREATE TABLE `gastos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` decimal(10,2) NOT NULL,
  `motivo` varchar(200) NOT NULL,
  `funcionario` varchar(50) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

INSERT INTO gastos VALUES("1","200.00","teste 5","vinicius","2020-07-31");
INSERT INTO gastos VALUES("2","300.00","teste","vinicius","2020-07-31");
INSERT INTO gastos VALUES("7","100.00","teste",NULL,"2020-07-31");
INSERT INTO gastos VALUES("8","100.00","re",NULL,"2020-07-31");
INSERT INTO gastos VALUES("9","100.00","teste",NULL,"2020-07-31");
INSERT INTO gastos VALUES("10","100.00","reembolso","vinicius","2020-09-03");


DROP TABLE IF EXISTS movimentacoes;

CREATE TABLE `movimentacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(20) NOT NULL,
  `movimento` varchar(20) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `funcionario` varchar(50) NOT NULL,
  `data` date NOT NULL,
  `id_movimento` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

INSERT INTO movimentacoes VALUES("5","Saída","Gasto","100.00",NULL,"2020-07-31","7");
INSERT INTO movimentacoes VALUES("6","Saída","Gasto","100.00",NULL,"2020-07-31","8");
INSERT INTO movimentacoes VALUES("7","Saída","Gasto","100.00",NULL,"2020-07-31","9");
INSERT INTO movimentacoes VALUES("8","Saída","Pagamento","200.00","vinicius","2020-08-03","1");
INSERT INTO movimentacoes VALUES("9","Entrada","Venda","200.00","vinicius","2020-08-03",NULL);
INSERT INTO movimentacoes VALUES("10","Entrada","Venda","100.00","vinicius","2020-08-03",NULL);
INSERT INTO movimentacoes VALUES("12","Saida","Compra","250.00","vinicius","2020-08-04","2");
INSERT INTO movimentacoes VALUES("14","Entrada","Serviço","300.00","Mendel Silva","2020-08-27","20");
INSERT INTO movimentacoes VALUES("15","Entrada","Serviço","500.00","Mendel Silva","2020-08-27","21");
INSERT INTO movimentacoes VALUES("16","Entrada","Serviço","500.00","Mendel Silva","2020-08-04","22");
INSERT INTO movimentacoes VALUES("17","Saída","Pagamento","300.00","vinicius","2020-08-20","2");
INSERT INTO movimentacoes VALUES("18","Entrada","Venda","400.00","vinicius","2020-09-03","4");
INSERT INTO movimentacoes VALUES("19","Saída","Gasto","100.00","vinicius","2020-09-03","10");
INSERT INTO movimentacoes VALUES("20","Saída","Pagamento","50.00","vinicius","2020-09-03","3");
INSERT INTO movimentacoes VALUES("21","Saida","Compra","20.00","vinicius","2020-09-03","3");


DROP TABLE IF EXISTS orcamento;

CREATE TABLE `orcamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

INSERT INTO orcamento VALUES("11","666.666.666-66","4","celular moto g8","050","carregador","necessidade de nova troca de tela","possivel troca de celular","100.00","tela","200.00","300.00","20.00","280.00","Dinheiro","2020-07-23","2020-07-23","2020-07-23","Aprovado");
INSERT INTO orcamento VALUES("12","999.999.999-99","4","iphone 8","060","tela desliga sozinha","nova","nova troca","100.00","tela","50.00","150.00","20.00","130.00","Cartão","2020-07-23","2020-07-24","2020-07-24","Aprovado");
INSERT INTO orcamento VALUES("13","777.777.777-77","4","celular","050","tela","tela","troca","20.00","tela","50.00","70.00","20.00","50.00","Dinheiro","2020-07-24","2020-07-24","2020-07-24","Aprovado");
INSERT INTO orcamento VALUES("14","444.444.444-44","4","iphone 10","060","tela","nova tela","xxxxxxxxxxxx","50.00","tela","2000.00","2050.00","30.00","2020.00","Dinheiro","2020-07-24","2020-07-24","2020-07-24","Aprovado");
INSERT INTO orcamento VALUES("15","666.666.666-66","4","celular","090","tela não liga","troca de tela","avaliar ","100.00","nova tela ","200.00","300.00","20.00","280.00","Dinheiro","2020-07-25","2020-07-25","2020-07-25","Aprovado");
INSERT INTO orcamento VALUES("16","999.999.999-99","5","celular s5","070","tela","nova troca de tela","troca de tela","400.00","tela","100.00","500.00","50.00","450.00","Dinheiro","2020-07-28","2020-07-28","2020-07-28","Aprovado");
INSERT INTO orcamento VALUES("17","777.777.777-77","5","celular s8","080","teste","teste","teste","30.00","teste","40.00","70.00","50.00","20.00","Dinheiro","2020-07-28","2020-07-28","2020-07-28","Aprovado");
INSERT INTO orcamento VALUES("18","777.777.777-77","5","celular","090","teste","teste","teste","400.00","teste","100.00","500.00","90.00","410.00","Cartão","2020-07-28","2020-07-28","2020-07-28","Aprovado");
INSERT INTO orcamento VALUES("19","777.777.777-77","5","celular","090","teste","teste","teste","100.00","tela","200.00","300.00","10.00","290.00","Dinheiro","2020-07-28","2020-08-04","2020-08-04","Aprovado");
INSERT INTO orcamento VALUES("20","999.999.999-99","4","tv","080","teste","teste","teste","100.00","tela","200.00","300.00","10.00","290.00","Dinheiro","2020-08-03","2020-08-03","2020-08-03","Aprovado");
INSERT INTO orcamento VALUES("21","999.999.999-99","4","iphone","080","teste","teste","teste","100.00","teste","100.00","200.00","20.00","180.00","Dinheiro","2020-08-03","2020-08-03","2020-08-03","Aprovado");
INSERT INTO orcamento VALUES("22","777.777.777-77","5","celular j7","66","tela com defeito","nova tela ","troca de tela","200.00","tela original","150.00","350.00","20.00","330.00","Dinheiro","2020-08-04","2020-08-04","2020-08-04","Aprovado");
INSERT INTO orcamento VALUES("23","777.777.777-77","5","tv","77","teste","teste","teste","200.00","teste","300.00","500.00","20.00","480.00","Dinheiro","2020-08-04","2020-08-04","2020-08-04","Aprovado");
INSERT INTO orcamento VALUES("24","999.999.999-99","5","teste","099","teste",NULL,"teste",NULL,NULL,NULL,NULL,NULL,"0.00",NULL,"2020-08-07",NULL,NULL,"Aberto");


DROP TABLE IF EXISTS os;

CREATE TABLE `os` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_orc` int(11) NOT NULL,
  `cliente` varchar(50) NOT NULL,
  `produto` varchar(50) NOT NULL,
  `tecnico` varchar(50) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `data_abertura` date NOT NULL,
  `data_fechamento` date DEFAULT NULL,
  `garantia` varchar(15) DEFAULT NULL,
  `status` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

INSERT INTO os VALUES("7","11","666.666.666-66","celular moto g8","4","300.00","2020-07-23","2020-07-23","50","Fechado");
INSERT INTO os VALUES("8","12","999.999.999-99","iphone 8","4","150.00","2020-07-24",NULL,NULL,"Cancelado");
INSERT INTO os VALUES("9","13","777.777.777-77","celular","4","70.00","2020-07-24","2020-07-24","50","Fechado");
INSERT INTO os VALUES("10","14","444.444.444-44","iphone 10","4","2050.00","2020-07-24","2020-07-25","50 dias","Fechado");
INSERT INTO os VALUES("11","15","666.666.666-66","celular","4","300.00","2020-07-25","2020-07-25","20","Fechado");
INSERT INTO os VALUES("12","16","999.999.999-99","celular s5","5","500.00","2020-07-28",NULL,NULL,"Cancelado");
INSERT INTO os VALUES("13","17","777.777.777-77","celular s8","5","70.00","2020-07-28",NULL,NULL,"Cancelado");
INSERT INTO os VALUES("14","18","777.777.777-77","celular","5","500.00","2020-07-28",NULL,NULL,"Cancelado");
INSERT INTO os VALUES("15","18","777.777.777-77","celular","5","500.00","2020-07-28",NULL,NULL,"Cancelada");
INSERT INTO os VALUES("16","18","777.777.777-77","celular","5","500.00","2020-07-28",NULL,NULL,"Cancelada");
INSERT INTO os VALUES("17","20","999.999.999-99","tv","4","300.00","2020-08-03",NULL,NULL,"Cancelada");
INSERT INTO os VALUES("18","21","999.999.999-99","iphone","4","200.00","2020-08-03",NULL,NULL,"Cancelada");
INSERT INTO os VALUES("19","22","777.777.777-77","celular j7","5","350.00","2020-08-04","2020-08-04","50","Fechada");
INSERT INTO os VALUES("20","19","777.777.777-77","celular","5","300.00","2020-08-04","2020-08-04","20","Fechada");
INSERT INTO os VALUES("21","23","777.777.777-77","tv","5","500.00","2020-08-04","2020-08-04","10","Fechada");
INSERT INTO os VALUES("22","23","777.777.777-77","tv","5","500.00","2020-08-04","2020-08-04","90","Fechada");


DROP TABLE IF EXISTS pagamentos;

CREATE TABLE `pagamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` decimal(10,2) NOT NULL,
  `funcionario` varchar(50) NOT NULL,
  `tesoureiro` varchar(50) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

INSERT INTO pagamentos VALUES("1","200.00","Robson Ferreira Miranda","vinicius","2020-08-03");
INSERT INTO pagamentos VALUES("2","300.00","Mendel Silva","vinicius","2020-08-20");
INSERT INTO pagamentos VALUES("3","50.00","Robson Ferreira Miranda","vinicius","2020-09-03");


DROP TABLE IF EXISTS produtos;

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produto` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

INSERT INTO produtos VALUES("8","-17");


DROP TABLE IF EXISTS usuarios;

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `cargo` varchar(50) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO usuarios VALUES("1","administrador","admin","123","Administrador",NULL);
INSERT INTO usuarios VALUES("5","Adriano","adr","123","Gerente","3");
INSERT INTO usuarios VALUES("6","Robson Ferreira Miranda","robson","123","Funcionário","4");
INSERT INTO usuarios VALUES("7","Mendel Silva","mendel","123","Funcionário","5");
INSERT INTO usuarios VALUES("8","vinicius","vini","123","Tesoureiro","7");


DROP TABLE IF EXISTS vendas;

CREATE TABLE `vendas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` decimal(10,2) NOT NULL,
  `produto` varchar(50) NOT NULL,
  `funcionario` varchar(50) NOT NULL,
  `data` date NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

INSERT INTO vendas VALUES("1","200.00","celular","vinicius","2020-08-27","Efetuado");
INSERT INTO vendas VALUES("2","100.00","-17","vinicius","2020-08-03","Cancelada");
INSERT INTO vendas VALUES("3","50.00","-17","vinicius","2020-08-03","Cancelada");
INSERT INTO vendas VALUES("4","400.00","iphone-18","vinicius","2020-09-03","Efetuada");


