create database aula12;

use aula12;

create table curso(
id  int not null auto_increment,
nome  varchar(30),
primary key(id));

create table periodo(
id    int not null auto_increment,
descricao   varchar(10),
primary key(id));

create table teste(
 id int auto_increment not null,
 descricao varchar(100),
 primary key(id)
);

create table disciplina(
id     int not null auto_increment,
descricao   varchar(30),
primary key(id));

create table aluno(
id   int not null auto_increment,
nome    varchar(50),
fkcurso   int,
fkperiodo int,
primary key(id));

create table curso_periodo(
fkcurso   int not null,
fkperiodo int not null,
primary key(fkcurso, fkperiodo));

create table curso_periodo_disciplina(
fkcurso   int not null,
fkperiodo int not null,
fkdisciplina int not null,
primary key(fkcurso, fkperiodo, fkdisciplina));

alter table curso_periodo add constraint fk_curso_periodo_curso
       foreign key(fkcurso)
       references curso(id);

alter table curso_periodo add constraint fk_curso_periodo_periodo
       foreign key(fkperiodo)
       references periodo(id);
       
alter table aluno add constraint fk_aluno_curso_periodo
      foreign key(fkcurso, fkperiodo)
      references curso_periodo(fkcurso, fkperiodo);
      
alter table curso_periodo_disciplina add constraint fk_curpermat_curper
      foreign key(fkcurso, fkperiodo)
      references curso_periodo(fkcurso, fkperiodo);

alter table curso_periodo_disciplina add constraint fk_curpermat_disciplina
      foreign key(fkdisciplina)
      references disciplina(id);

insert into curso(nome)
values ('CCOB'),
       ('CCOA'),
       ('SISA'),
       ('ADSA');

insert into periodo(descricao)
values ('2024/1'),
       ('2024/2'),
       ('2025/1'),
       ('2025/2');

insert into disciplina(descricao)
values ('BD'),
		('LP'),
		('PI'),
        ('TI'),
		('ALGORITMO');

select * from periodo;
select * from curso;
        
        

insert into curso_periodo(fkcurso, fkperiodo)
select c.id fkcurso, p.id fkperiodo
from curso c
inner join periodo p;

select * from periodo;

insert into aluno(nome, fkcurso, fkperiodo)
values ('ANDRÉ ', 1, 3),
('ANNA ', 1, 3),
('BIANCA ', 1, 3),
('BILL ', 1, 3),
('BRENO ', 1, 3),
('CÉSAR ', 1, 3),
('DAVI ', 1, 3),
('DERECK ', 1, 3),
('ENRICO ', 1, 3),
('ENZO ', 1, 3),
('ERICK ', 1, 3),
('FELIPE ', 1, 3),
('FERNANDO ', 1, 3),
('GABRIEL ', 1, 3),
('GABRIELA ', 2, 3),
('GIOVANNA ', 2, 3),
('GIULIA ', 2, 3),
('GUILHERME ', 2, 3),
('GUSTAVO ', 2, 3),
('HENRY ', 2, 3),
('IGOR ', 2, 3),
('ISABELLY ', 2, 3),
('JOÃO ', 2, 3),
('KAUÃ ', 2, 3),
('KHAIAN ', 2, 3),
('KHEYLA ', 2, 3),
('LAURA ', 2, 3),
('LEANDRO ', 4, 3),
('LUCAS ', 4, 3),
('MANUELA ', 4, 3),
('MARILIA ', 4, 3),
('MATHEUS ', 4, 3),
('MICHEL ', 4, 3),
('MIGUEL ', 4, 3),
('MUNIR ', 4, 3),
('NATÁLIA ', 4, 3),
('PEDRO ', 4, 3),
('RAFAEL ', 3, 3),
('RENAN ', 3, 3),
('RICHARD ', 3, 3),
('SERGIO ', 3, 3),
('VICTOR ', 3, 3),
('WILLIAN ', 3, 3);

update aluno set nome = replace(nome, ' ','');
update aluno set nome = trim(nome);


insert into curso_periodo_disciplina
   (fkcurso, fkperiodo, fkdisciplina)
select fkcurso, fkperiodo, id
from curso_periodo, disciplina;

select nome, 
       date_add('2000-01-01', 
           interval ((fkcurso*10)+(fkperiodo*2))*id day) 
from aluno
order by 2 desc;
alter table aluno add data_nasc date;
update aluno set data_nasc = date_add('2000-01-01', 
           interval ((fkcurso*10)+(fkperiodo*2))*id day);

select * from aluno;

-- select a.id , a.nome, a.fkcurso, c.fkperiodo, a.data_nasc
-- from aluno a
-- join curso c
-- on a.fkcurso = c.id;

select a.id, a.nome, a.fkcurso, cp.fkperiodo, a.data_nasc
from aluno a
join curso_periodo cp on a.fkcurso = cp.fkcurso;


select a.id, a.nome, a.fkcurso, cp.fkperiodo, a.data_nasc
from aluno a
join curso_periodo cp on a.fkcurso = cp.fkcurso
join curso c on a.fkcurso = c.id;

select al.nome, cur.nome, per.descricao, di.descricao
from aluno al
inner join curso_periodo cp on cp.fkperiodo = al.fkperiodo
							and cp.fkcurso = al.fkcurso
inner join curso cur on cur.id = cp.fkcurso
inner join periodo per on per.id = cp.fkperiodo
inner join curso_periodo_disciplina cpd on cpd.fkperiodo = cp.fkperiodo
										and cpd.fkperiodo = cp.fkcurso
inner join disciplina di on di.id = cpd.fkdisciplina
order by 1,2;

select count(*) from curso_periodo_disciplina;

-- curso, periodo e disciplina
select per.descricao, cur.nome, di.descricao, al.nome
from curso_periodo cp
inner join curso cur on cur.id = cp.fkcurso
inner join periodo per on per.id = cp.fkperiodo
inner join curso_periodo_disciplina cpd on cpd.fkperiodo = cp.fkperiodo
										and cpd.fkcurso = cp.fkcurso
inner join disciplina di on di.id = cpd.fkdisciplina 
left join aluno al on cp.fkperiodo = al.fkperiodo and cp.fkcurso = al.fkcurso
order by 1, 2;

-- Função count
select count(*) from aluno;

select * from aluno;

insert into aluno(nome, fkcurso, fkperiodo, data_nasc)
select nome, fkcurso, fkperiodo, data_nasc
from aluno
where id< 20;

select count(distinct nome) from aluno;

select distinct nome from aluno;

-- Função max

-- pega a primeira letra do alfabeto e verifica qual é a ultima... utiliza a tabela aschi, convertendo para binário e identifica qual é o maior 
select max(nome), min(nome) from aluno;
select min(id) as maximo, min(id) minimo from aluno;
select max(id) as maximo, min(id) minimo from aluno;

select max(data_nasc) as maximo, min(data_nasc) minimo from aluno;

select max(data_nasc) as maximo, min(data_nasc) minimo from aluno;