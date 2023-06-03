-- criacao do bd para o cenario de ecommerce

CREATE DATABASE ecommerce;
USE ecommerce;
-- criar tabela cliente
CREATE TABLE  Clients(
idClient INT auto_increment PRIMARY KEY,
Fname VARCHAR(10),
Minit char(3),
Lname VARCHAR(20),
cpf CHAR(11) not null,
adress varchar(30),
constraint unique_cpf_cliente unique (cpf)
);
-- criar tabela produto
CREATE TABLE  Product(
idProduct INT auto_increment PRIMARY KEY,
Fname VARCHAR(10) not null,
classification_kids bool default false,
category enum('Eletronico','vestimenta','brinquedos','alimentos','Moveis','utilitarios') ,
cpf CHAR(11) not null,
avaliation FLOAT default 0,
size VARCHAR(10),
price INT not null
);

CREATE TABLE  Payment(
idClient INT ,
idPayment INT,
typePayment ENUM('pix','cartao','2 cartoes') not null,
limitAvailable float,
primary key(idClient,idPayment)
);
-- criar tabela pedido
CREATE TABLE  Orders(
idOrders INT auto_increment PRIMARY KEY,
idOrdersClient INT,
ordersStatus ENUM('cancelado','confirmado','em processamento') not null default 'em processamento',
orderDescription TEXT(255),
sendvalue FLOAT default 10,
paymentCash bool default false,
constraint fk_orders_client foreign key(idOrdersClient) references Clients(idClient)
);

CREATE TABLE  ProductStorage(
idProductStorage INT auto_increment PRIMARY KEY ,
storageLocation VARCHAR (255),
quantity BIGINT  not null default 0
);

CREATE TABLE  Supplier(
idSupplier INT auto_increment PRIMARY KEY ,
SocialName VARCHAR (255) not null,
CNPJ CHAR(15) not null unique,
contact VARCHAR(10) not null
);

CREATE TABLE Seller(
idSeller INT auto_increment PRIMARY KEY ,
SocialName VARCHAR (255) not null,
CNPJ CHAR(15) not null UNIQUE,
contact VARCHAR(10) not null,
cpf CHAR(9) not null UNIQUE
);

CREATE TABLE ProductSeller(
idProductSeller INT ,
idProduct INT,
productQuantity INT not null default 1,
primary key(idProductSeller,idProduct),
constraint fk_prodseller foreign key(idProductSeller) references Seller(idSeller),
constraint fk_prodprod foreign key(idProduct) references Product(idProduct)
);

CREATE TABLE ProductOrder(
idProductProduct INT ,
idProductOrder INT,
productQuantity INT  default 1,
productStatus ENUM('Disponivel','Sem esotque') default 'disponivel',
primary key(idProductProduct,idProductOrde),
constraint fk_productorder_seller foreign key(idProductOrder) references Orders(idOrder),
constraint fk_idProductorderProduct foreign key(idProductProduct) references Product(idProduct)
);

CREATE TABLE storageLocation(
idProduct INT ,
idStorage INT,
location TEXT(255) not null,
primary key(idProduct,idStorage),
constraint fk_product foreign key(idProduct) references Product(idProduct),
constraint fk_idProductProduct foreign key(idStorage) references Storage(idStorage)
);

CREATE TABLE ProductSupplier(
idSupplier INT ,
idProduct INT,
quantity INT not null ,
primary key(idProductSupplier,idsProduct),
constraint fk_idProductSupplier foreign key(idSupplier) references Supplier(idSupplier),
constraint fk_idsProduct foreign key(idProduct) references Product(idProduct)
);

SELECT * from Supplier;
SELECT adress,count(adress) from Orders group by adress having count(adress)>2 AND count(adress)<10 ;
SELECT * from Clients where idClient='1';

SELECT * from Product order by price desc;
SELECT * from Product order by price desc;