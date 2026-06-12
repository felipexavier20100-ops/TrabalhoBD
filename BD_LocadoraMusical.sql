CREATE DATABASE IF NOT EXISTS Locadora_Musical;

USE Locadora_Musical;

CREATE TABLE IF NOT EXISTS CDs_musicais 
(
	id_cd varchar(20) NOT NULL UNIQUE,
	id_artista varchar(50) NOT NULL,
	genero_musical varchar(30) NOT NULL,
	PRIMARY KEY (id_cd)
);
CREATE TABLE IF NOT EXISTS cliente (
	cpf_cliente int NOT NULL UNIQUE,
	nome_cliente varchar(50) NOT NULL,
	nascimento date NOT NULL,
	cep int NOT NULL,
	num_casa int NOT NULL,
	PRIMARY KEY (cpf_cliente)
);
CREATE TABLE IF NOT EXISTS disco_vinil (
	id_vinil varchar(20) NOT NULL UNIQUE,
	id_artista varchar(50) NOT NULL,
	genero_musical varchar(30) NOT NULL,
	PRIMARY KEY (id_vinil)
);
CREATE TABLE IF NOT EXISTS artista (
	id_artista varchar(50) NOT NULL UNIQUE,
	sexo varchar(1) NOT NULL,
	PRIMARY KEY (id_artista)
);
CREATE TABLE IF NOT EXISTS atendimento (
	id_venda int AUTO_INCREMENT NOT NULL UNIQUE,
	id_funcionario int NOT NULL,
	cpf_cliente int NOT NULL,
	id_cd varchar(20) NOT NULL,
	id_vinil varchar(20) NOT NULL,
	data_hora_aluguel datetime NOT NULL,
	PRIMARY KEY (id_venda)
);
CREATE TABLE IF NOT EXISTS funcionario (
	id_funcionario int NOT NULL UNIQUE,
	cpf_funcionario int NOT NULL,
	nome varchar(50) NOT NULL,
	nascimento date NOT NULL,
	cep int NOT NULL,
	num_casa int NOT NULL,
	PRIMARY KEY (id_funcionario)
);
ALTER TABLE CDs_musicais ADD CONSTRAINT CDs_musicais_fk1 FOREIGN KEY (id_artista) REFERENCES artista (id_artista);
ALTER TABLE disco_vinil ADD CONSTRAINT disco_vinil_fk1 FOREIGN KEY (id_artista) REFERENCES artista (id_artista);
ALTER TABLE atendimento ADD CONSTRAINT atendimento_fk1 FOREIGN KEY (id_funcionario) REFERENCES funcionario (id_funcionario);
ALTER TABLE atendimento ADD CONSTRAINT atendimento_fk2 FOREIGN KEY (cpf_cliente) REFERENCES cliente (cpf_cliente);
ALTER TABLE atendimento ADD CONSTRAINT atendimento_fk3 FOREIGN KEY (id_cd) REFERENCES CDs_musicais (id_cd);
ALTER TABLE atendimento ADD CONSTRAINT atendimento_fk4 FOREIGN KEY (id_vinil) REFERENCES disco_vinil (id_vinil);