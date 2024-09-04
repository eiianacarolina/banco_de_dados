create database construtora;

use construtora;

create table departamentos(
	id int not null auto_increment primary key,
    nome varchar(45) not null
);

create table funcionarios(
	id int not null auto_increment primary key,
    nome varchar(100) not null,
    email varchar(45) not null unique,
    senha varchar(45),
    departamentos_id int not null,
    foreign key (departamentos_id) references departamentos (id)
);

create table projetos(
	id int not null auto_increment primary key,
    nome varchar(45) not null,
    descricao varchar(255)
);

create table projetos_funcionarios(
	funcionarios_id int not null ,
    projetos_id int not null ,
    horas_trabalhadas int not null,
    primary key (funcionarios_id, projetos_id),
    foreign key (funcionarios_id) references funcionarios (id),
    foreign key (projetos_id) references projetos (id)
);

insert into departamentos (nome) values ('RH');
insert into departamentos (nome) values ('Financeiro');
insert into departamentos (nome) values ('TI');
insert into departamentos (nome) values ('Gerência');
insert into departamentos (nome) values ('Diretoria');


insert into projetos (nome) values ('Projeto A');
insert into projetos (nome, descricao) values ('Projeto B', 'Projeto Senai');
select * from projetos;

insert into funcionarios (nome, email, departamentos_id) values ('Guilherme', 'guilherme@senai.br', 3);
insert into funcionarios (nome, email, departamentos_id) values ('João', 'joão@senai.br', 5);
insert into funcionarios (nome, email, departamentos_id) values ('Manuel', 'manuel@senai.br', 4);

select * from departamentos;
select * from funcionarios;

insert into projetos_funcionarios (funcionarios_id, projetos_id, horas_trabalhadas) values (4, 1, 10);
insert into projetos_funcionarios (funcionarios_id, projetos_id, horas_trabalhadas) values (4, 2, 100);
insert into projetos_funcionarios (funcionarios_id, projetos_id, horas_trabalhadas) values (5, 1, 200);

select * from projetos_funcionarios;


