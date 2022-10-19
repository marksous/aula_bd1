###### D D L #############
#CRIAÇÃO DO BANCO DE DADOS
create database aula_remota;

#APAGAR O BANCO DE DADOS
drop database aula_remota;

#SELECIONAR O BANCO DE DADOS
use aula_remota;

#CRIAR A TABELA
create table alunos (
   id_aluno int(3) not null,  
   nome     varchar(40) not null,
   endereco varchar(50) not null,
   turma    varchar(20) not null,
   primary key (id_aluno)
);

create table clientes(
	cpf             integer unsigned not null, 
	nome            varchar(100) not null,
	data_nascimento date not null,  #yyyy-mm-dd
    sexo            char(1) default "M",
    salario         decimal(10,2) default 0,
	profissao       varchar(30),
    primary key(cpf)
);

#APAGAR A TABELA
drop table alunos;


###### D M L ###########
#INSERIR OS DADOS
insert into alunos (id_aluno, nome, endereco, turma) values (1, "Zezinho Pança", "Rua Comendador Souza", "1DSN");
insert into alunos (id_aluno, nome, endereco, turma) values (2, "Marcondes Braga", "Rua Zizundo Silva", "1DSN");
insert into alunos (id_aluno, nome, endereco, turma) values (3, "Vivânio Santos", "Rua Emengarda Costa", "3DSN");
insert into alunos (id_aluno, nome, endereco, turma) values (4, "Ionegunda Ferreira", "Rua Rituania Lara", "2DSN");
insert into alunos (id_aluno, nome, endereco, turma) values (5, "Rubiano Silva", "Rua Titânio Bário", "2DSN");

#CONSULTAR DADOS SIMPLES
select * from alunos;

#CONSULTAR DADOS ESPECÍFICOS
select nome, turma from alunos;

#CONSULTAR DADOS FILTRADOS
select nome, turma from alunos
where turma = "1DSN";

