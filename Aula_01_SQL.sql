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

#COMANDO UPDATE (ATUALIZAR OS DADOS)
update alunos set endereco = "Rua Comendador Cresfúncio", nome = "Werington Screnildo"
where id_aluno = 1;

#COMANDO DELETE (EXCLUIR OS DADOS)
delete from alunos
where id_aluno = 1; 


# INSERÇÃO    - INSERT
# CONSULTA    - SELECT
# ATUALIZAÇÃO - UPDATE
# EXCLUSÃO    - DELETE

#C -> CREATE -> INSERT
#R -> READ   -> SELECT
#U -> UPDATE -> UPDATE
#D -> DELETE -> DELETE

#ALTERANDO A TABELA ACRESCENTADO UM CAMPO
alter table alunos add nome_mae varchar(40) not null;

#ALTERANDO A TABELA REMOVENDO UM CAMPO
alter table alunos drop nome_mae;

#EXERCÍCIO PRÁTICO COM O FESSOR!
#BANCO DE DADOS DE PRODUTO
create database exercicio1;

#SELECIONAR O BANCO DE DADOS
use exercicio1;

#CRIAR A TABELA DE CATEGORIA
create table categoria (
	id            integer not null,
    especificacao varchar(10) default '',
    primary key(id)
);

#CRIAR A TABELA DE UNIDADE DE MEDIDA
create table unidmedida(
	id            integer not null,
    especificacao char(2) default '',
    primary key(id)
);

#CRIAR A TABELA DE PRODUTO
create table produto(
	codigo         integer not null auto_increment,
    descricao      varchar(30) not null default '',
    estoque_minimo integer     not null default 0,
    estoque_maximo integer     not null default 0,
    exportacao     integer     not null default 0,
    reposicao      integer     not null default 0,
    montadora      integer     not null default 0,
    id_unidMed     integer     not null,
    id_categoria   integer     not null,
    primary key (codigo),
    foreign key (id_unidMed) references unidmedida(id),
    foreign key (id_categoria) references categoria(id)
);

#CRIAR ALGUNS REGISTROS OU INSTÂNCIAS OU TUPLAS
#DML - UNIDADE DE MEDIDA
insert into unidmedida (id, especificacao) values (1, 'PÇ');
insert into unidmedida (id, especificacao) values (2, 'KG');
insert into unidmedida (id, especificacao) values (3, 'LT');

#DML - CATEGORIA
insert into categoria (id, especificacao) values (1, 'Forjado');
insert into categoria (id, especificacao) values (2, 'Usinado');
insert into categoria (id, especificacao) values (3, 'Fundido');
insert into categoria (id, especificacao) values (4, 'Grãos');

#DML - PRODUTO
insert into produto (descricao, estoque_minimo, estoque_maximo, exportacao, reposicao,
					 montadora, id_unidMed, id_categoria)
	   values ('Arroz Tio Marcão', 10, 50, 0, 1, 0, 2, 4);

### B Ô N U S ###
select descricao, categoria.especificacao, unidmedida.especificacao
from produto, categoria, unidmedida
where categoria.id = produto.id_categoria
  and produto.id_unidmed = unidmedida.id;
  
#SELECTs DE APOIO
select * from produto;
select * from categoria;
select * from unidmedida;