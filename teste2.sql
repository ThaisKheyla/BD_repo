create database if not exists sprint2;

use sprint2;

create table cliente(
id  int not null auto_increment,
nome   varchar(100),
primary key(id));

create table produto(
id int not null auto_increment,
nome   varchar(100),
preco_unitario  decimal(10,2),
primary key(id));

create table pedido(
id   int not null auto_increment,
data_pedido   date,
fkcliente     int,
primary key(id),
foreign key (fkcliente) references cliente(id)) auto_increment=1000;

create table pedido_item(
fkpedido    int not null,
fkproduto   int not null,
quantidade  decimal(10,3),
valor_unitario  decimal(10,2),
primary key(fkpedido, fkproduto),
foreign key(fkpedido) references pedido(id),
foreign key(fkproduto) references produto(id));


INSERT INTO cliente (nome) VALUES
		('Empresa ABC LTDA'),
		('Companhia XYZ S.A.'),
		('Serviços de Tecnologia EFG Ltda.'),
		('Comércio de Alimentos GHI Ltda.'),
		('Transportadora JKL S.A.'),
		('Consultoria MNO LTDA'),
		('Fabricação de Produtos PQR S.A.'),
		('Agropecuária STU LTDA'),
		('Indústria de Cosméticos VWX S.A.'),
		('Construtora YZ Ltda.');
        
INSERT INTO produto (nome, preco_unitario) VALUES
	('Tênis de Skate', 129.99),
	('Camiseta Estampada', 49.99),
	('Boné de Marca', 39.99),
	('Celular Gamer', 999.99),
	('Fone de Ouvido Bluetooth', 79.99),
	('Mochila Escolar com Estampa', 69.99),
	('Skate Completo', 149.99),
	('Calça Jeans Rasgada', 79.99),
	('Sneakers de Marca', 89.99),
	('Pulseira Inteligente', 59.99);     
  
INSERT INTO pedido (data_pedido, fkcliente) VALUES
	('2024-04-01', 1),
	('2024-04-02', 2),
	('2024-04-03', 3),
	('2024-04-04', 4),
	('2024-04-05', 5),
	('2024-04-06', 6);    

INSERT INTO pedido_item (fkpedido, fkproduto, quantidade, valor_unitario) VALUES
		(1000, 1, 2, 129.99), 
		(1000, 2, 1, 49.99),  
		(1001, 4, 1, 999.99), 
		(1001, 5, 1, 79.99),  
		(1002, 7, 1, 149.99),
		(1002, 8, 1, 79.99),
		(1003, 9, 1, 89.99),
		(1003, 10, 1, 59.99),
		(1004, 2, 2, 49.99),
		(1004, 6, 1, 69.99),
		(1005, 1, 1, 129.99),
		(1005, 4, 1, 999.99);
    
 