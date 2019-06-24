create database locadora;
use locadora;

create table telefone(
	idtelefone int key,
	ddd char(2),
	numeros char(12)
);


create table cliente(
	idcliente int key,
	idtelefone int,
	nome varchar(50),
	rg char(12),
	cpf char(14),
	cnh char(11),
	foreign key(idtelefone)	references telefone(idtelefone)
);


create table orcamento(
idorcamento int key,
idcliente int,
idcarro int,
dataincio date,
datatermino date,
valordiaria float(10,2),
valortotal float(10,2),
foreign key(idcliente) references cliente(idcliente),
foreign key(idcarro) references carro(idcarro));


create table carro(
idcarro int key,
idoficina int,
modelo varchar(50),
cor varchar(50),
placa char(8));

create table endereco(
idendereco int key,
idcliente int,
rua varchar(20),
numero varchar(10),
cidade varchar(20),
bairro varchar(20),
cep char(9),
foreign key(idcliente) references cliente(idcliente));

create table entrada(
identrada int key,
idorcamento int,
data date,
valor float(10,2),
foreign key(idorcamento) references orcamento(idorcamento));

create table caixa(
idcaixa int key,
identrada int,
idsaida int,
total float(10,2),
foreign key(identrada) references entrada (identrada),
foreign key(idsaida) references saida (idsaida));

create table saida(
idsaida int key,
idfuncionario int,
data date,
motivo varchar(20),
valor float(10,2),
foreign key(idfuncionario) references funcionario(idfuncionario));

create table funcionario(
idfuncionario int key,
idtelefone int,
idendereco int,
nome varchar(50),
cargo varchar(20),
rg char(12),
cpf char(11),
cidade varchar(20),
rua varchar(20),
cep char(9),
estado char(2),
foreign key(idtelefone) references telefone(idtelefone),
foreign key(idendereco) references endereco(idendereco));

