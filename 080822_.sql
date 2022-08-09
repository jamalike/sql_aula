/*Criando a base de dados empresa*/
create database empresa;
/*Selecionando a base de dados que irei utilizar*/
use empresa;
/*Criando a base de dados hospital*/
create database hospital;
use hospital;

use empresa;
CREATE TABLE funcionario (
    matricula DECIMAL(5),
    nome VARCHAR(50),
    endereco VARCHAR(80),
    datanasc DATE,
    salario decimal(5,2)
);

use hospital;
CREATE TABLE paciente (
    cpf DECIMAL(11) PRIMARY KEY,
    rg DECIMAL(8),
    nome VARCHAR(50),
    rua VARCHAR(45),
    bairro VARCHAR(30),
    cidade VARCHAR(30),
    cep DECIMAL(8),
    datanasc DATE
);

drop table funcionario;
use empresa;
drop table funcionario;
drop database empresa;
use hospital;

/*Exemplo de alter table com add*/
alter table paciente add column filiacao varchar(80);

/*Exemplo de alter table com alter - Valor padrão*/
alter table paciente alter datanasc set default "2022-08-05";
/*Olhando a descrição da tabela com seus atributos e restrições*/
desc paciente;

/*Exemplo de alter table com change - Alterando nome e tipo do atributo */
alter table paciente change rua endereco varchar(60);

/*Exemplo de alter table com modify - Alterando o tipo do atributo*/
alter table paciente modify bairro varchar(45);

/*Exemplo de alter table com drop - Eliminando o atributo filiacao*/
alter table paciente drop filiacao;

/*Exemplo de alter com rename*/
alter table paciente rename as cliente;
alter table cliente rename to paciente;

/*Alterando o atributo nome para não permitir valor nulo*/
alter table paciente modify nome varchar(50) not null;
desc paciente;

/*Retirando a chave primária da tabela*/
alter table paciente drop primary key;

/*Criando a chave primária da tabela*/
alter table paciente add constraint pk_paciente primary key(cpf);

/*Criando uma chave candidata - RG*/
alter table paciente add constraint uk_rg unique(rg);
alter table paciente change rg rg decimal(8) unique;
alter table paciente modify rg decimal(8) unique;

desc paciente;

create database faculdade;
use faculdade;
create table curso(
cod char(3) primary key,
nome varchar(50)
);
insert into curso values('ADS','Análise e Desenvolvimento de Sistemas'),
('ADM','Administração');

create table aluno(
matricula decimal(5) primary key,
nome varchar(50),
codCurso char(3),
constraint fk_aluno_curso foreign key(codCurso) references
curso(cod)
);

insert into aluno values(12345,'Fulano de Tal','ADS'),
(23456,'Beltrano','ADM');

/*Retirando o modo seguro do mysql*/
set sql_safe_updates=0;

delete from curso where cod='ADS';
/*Eliminar a chave estrangeira da tabela aluno*/
alter table aluno drop foreign key fk_aluno_curso;

/*Criando a chave estrangeira com on delete cascade e on update cascade*/
alter table anuno add constraint fk_aluno_curso foreign key(codcurso)
references curso(cod) on delete cascade on update cascade;

delete from curso where cod='ADS';

