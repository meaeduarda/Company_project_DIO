-- Union, Except, and Intersect
create database teste1;
use teste;
create table R(
A varchar(2)
);
create table S(
A varchar(2)
);

-- inserindo dados 
insert into R(A) values ('a1'),('a2'),('a2'),('a3');
insert into S(A) values ('a1'),('a1'),('a2'),('a2'),('a2'),('a3'),('a4'),('a5');
select * from S WHERE A NOT IN (select A from R); -- NOT IN é um Except (não está) 

-- EXCEPT -> NOT IN 

-- UNION
(select distinct R.A from R) union (Select distinct S.A from S);

-- intersect 
select distinct R.A from R where R.A IN (select S.A from S);