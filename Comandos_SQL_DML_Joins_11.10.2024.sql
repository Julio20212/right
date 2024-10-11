create database ger_join;

create table funcionarios (
    cod int primary key auto_increment not null,
    nome varchar(255) not null,
    especialidade varchar(255) not null
);

create table dependentes (
    cod int primary key auto_increment not null,
    nome varchar(255) not null,
    cod_func int,
    foreign key  (cod_func) references funcionarios(cod)
);

insert into funcionarios (cod, nome, especialidade)
values 
    (1, "José", "Engenheiro"),
    (2, "João", "Mestre de obras"),    
    (3, "Maria", "Contabilista");

insert into dependentes (cod, nome, cod_func)
values 
    (1, "Pedro", 1),
    (2, "Alice", 1),    
    (3, "Luana", 3);
    
select * from funcionarios;
select * from dependentes;

#EXEMPLOS
#inner join
select funcionarios.nome, dependentes.nome
from funcionarios
inner join dependentes 
on funcionarios.cod = dependentes.cod_func
where dependentes.cod_func = 1;

#left join
select funcionarios.nome, dependentes.nome
from funcionarios
left join dependentes 
on funcionarios.cod = dependentes.cod_func;

#left excluding join
select funcionarios.nome, dependentes.nome
from funcionarios
left join dependentes 
on funcionarios.cod = dependentes.cod_func
where dependentes.nome is null;

#right join
select funcionarios.nome, dependentes.nome
from funcionarios
right join dependentes 
on funcionarios.cod = dependentes.cod_func;

#rigth excluding join
select funcionarios.nome, dependentes.nome
from funcionarios
right join dependentes 
on funcionarios.cod = dependentes.cod_func
where funcionarios.cod is null;
