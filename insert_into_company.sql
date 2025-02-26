-- INSERÇÃO DE DADOS NO BD COMPANY 
use company;
show tables;
select * from departament;

-- Retira-se a ambiguidade com o Alias ou As Statement ( como é conhecido)
select Dname, l.Dlocation as Departament_name 
from departament as d, dept_locations as l where Dnumber = l.Dnumber;

-- Dnumber em departament e dept_location

desc departament;
insert into employee values 
							('Franklin', 'T', 'Wong', 333445555, '1955-12-08', '638-Voss-Houston-TX', 'M', 40000, 123456789, 5),
                            ('Alicia', 'J', 'Zelaya', 999887777, '1968-01-19', '3321-Castle-Spring-TX', 'F', 25000, 333445555, 4),
                            ('Jennifer', 'S', 'Wallace', 987654321, '1941-06-20', '291-Berry-Bellaire-TX', 'F', 43000, NULL, 4),
                            ('Ramesh', 'K', 'Narayan', 666884444, '1962-09-15', '975-Fire-Oak-Humble-TX', 'M', 38000, 333445555, 5),
                            ('Joyce', 'A', 'English', 453453453, '1972-07-31', '5631-Rice-Houston-TX', 'F', 25000, 333445555, 5),
                            ('Ahmad', 'V', 'Jabbar', 987987987, '1969-03-29', '980-Dallas-Houston-TX', 'M', 25000, 987654321, 4),
                            ('James', 'E', 'Borg', 888665555, '1937-11-10', '450-Stone-Houston-TX', 'M', 55000, NULL, 1);

desc employee;
select * from employee;

insert into dependent values (333445555, 'Alice', 'F', '1986-04-05', 'Daughter'),
							 (333445555, 'Theodore', 'M', '1983-10-25', 'Son'),
                             (333445555, 'Joy', 'F', '1958-05-03', 'Spouse'),
                             (987654321, 'Abner', 'M', '1942-02-28', 'Spouse'),
                             (123456789, 'Michael', 'M', '1988-01-04', 'Son'),
                             (123456789, 'Alice', 'F', '1988-12-30', 'Daughter'),
                             (123456789, 'Elizabeth', 'F', '1967-05-05', 'Spouse');
select * from dependent;

insert into departament values ('Research', 5, 333445555, '1988-05-22','1986-05-22'),
							   ('Administration', 4, 987654321, '1995-01-01','1994-01-01'),
                               ('Headquarters', 1, 888665555,'1981-06-19','1980-06-19');

insert into dept_locations values (1, 'Houston'),
								 (4, 'Stafford'),
                                 (5, 'Bellaire'),
                                 (5, 'Sugarland'),
                                 (5, 'Houston');

insert into project values ('ProductX', 1, 'Bellaire', 5),
						   ('ProductY', 2, 'Sugarland', 5),
						   ('ProductZ', 3, 'Houston', 5),
                           ('Computerization', 10, 'Stafford', 4),
                           ('Reorganization', 20, 'Houston', 1),
                           ('Newbenefits', 30, 'Stafford', 4);

insert into works_on values (123456789, 1, 32.5),
							(123456789, 2, 7.5),
                            (666884444, 3, 40.0),
                            (453453453, 1, 20.0),
                            (453453453, 2, 20.0),
                            (333445555, 2, 10.0),
                            (333445555, 3, 10.0),
                            (333445555, 10, 10.0),
                            (333445555, 20, 10.0),
                            (999887777, 30, 30.0),
                            (999887777, 10, 10.0),
                            (987987987, 10, 35.0),
                            (987987987, 30, 5.0),
                            (987654321, 30, 20.0),
                            (987654321, 20, 15.0),
                            (888665555, 20, 0.0);

-- Consultas SQL (Queries SQL)
-- USO DO WHERE
select * from employee; -- informações de forma geral 

-- gerente e seu departamento
select Ssn, Fname, Dname from employee e, dependent d where (e.Ssn = d.Essn);
select Ssn, Fname, Dependent_name from employee, dependent where Essn = Ssn;
-- Selecionando a data e o endereço 
select Bdate, Address from employee where Fname = 'Joyce' and Minit = 'A' and Lname = 'English';

select * from dependent;

SELECT Bdate, Address FROM employee
WHERE Fname = 'John' AND Minit = 'B' AND Lname = 'Smith';

-- recuperando um departamento especifico 
select * from departament where Dname = 'Research';

-- uso dos operadores lógicos AND, OR
SELECT Fname, Lname, Address
FROM employee, departament
WHERE Dname = 'Research' AND Dnumber = Dno;

select * from project;
--
--
--
-- Expressões e concatenação de strings
--
--
-- recuperando informações dos departamentos presentes em Stafford
select Dname as Department, Mgr_ssn as Manager from departament d, dept_locations l
where d.Dnumber = l.Dnumber;

-- padrão sql -> || no MySQL usa a função concat()
select Dname as Department, concat(Fname, ' ', Lname) from departament d, dept_locations l, employee e
where d.Dnumber = l.Dnumber and Mgr_ssn = e.Ssn;

-- recuperando info dos projetos em Stafford
select * from project, departament where Dnum = Dnumber and Plocation = 'Stafford';

-- recuperando info sobre os departamentos e projetos localizados em Stafford
SELECT Pnumber, Dnum, Lname, Address, Bdate
FROM project, departament, employee
WHERE Dnum = Dnumber AND Mgr_ssn = Ssn AND
Plocation = 'Stafford';

SELECT * FROM employee WHERE Dno IN (3,6,9);

--
--
-- Operadores lógicos
--
--

SELECT Bdate, Address
FROM EMPLOYEE
WHERE Fname = ‘John’ AND Minit = ‘B’ AND Lname = ‘Smith’;

SELECT Fname, Lname, Address
FROM EMPLOYEE, DEPARTMENT
WHERE Dname = ‘Research’ AND Dnumber = Dno;


-- Expressões e alias
-- a expressão as e, 


-- recolhendo o valor do INSS-*
select Fname, Lname, Salary, Salary*0.011 from employee;
select Fname, Lname, Salary, Salary*0.011 as INSS from employee; -- modificação do nome, INSS é um atributo derivado 
select Fname, Lname, Salary, round(Salary*0.011,2) as INSS from employee; -- função round para deixar duas casas decimais 

-- definir um aumento de salário para os gerentes que trabalham no projeto associado ao ProdutoX
select e.Fname, e.Lname, 1.1*e.Salary as increased_sal from employee as e,
works_on as w, project as p where e.Ssn = w.Essn and w.Pno = p.Pnumber and p.Pname='ProductX';

-- concatenando e fornecendo alias 
-- se os atributos forem diferentes, não necessariamente precisa do alias 
select Dname as Department, concat(Fname, ' ', Lname) as Manager from departament d, dept_locations l, employee e
where d.Dnumber = l.Dnumber and Mgr_ssn = e.Ssn;

-- recuperando dados dos empregados que trabalham para o departamento de pesquisa
select Fname, Lname, Address from employee, departament
	where Dname = 'Research' and Dnumber = Dno;

-- definindo alias para legibilidade da consulta
select e.Fname, e.Lname, e.Address from employee e, departament d
	where d.Dname = 'Research' and d.Dnumber = e.Dno;
    
    -- como utilizar like e between nas queries
    -- usado para comparar informações
    -- like é associedado a comparação 

use company;
select * from employee;
select * from project;
select Fname, Lname, Address from employee where Address like '%Houston-TX%'; 
-- %: Representa qualquer sequência de caracteres (incluindo nenhum caractere). 
-- _: Representa um único caractere qualquer.

/*
 Busca clientes com id entre 10 e 50 (inclusive)
SELECT * FROM clientes WHERE id BETWEEN 10 AND 50;

 Busca vendas realizadas entre duas datas
SELECT * FROM vendas WHERE data_venda BETWEEN '2024-01-01' AND '2024-12-31';

 Busca produtos com preço entre R$ 50 e R$ 200
SELECT * FROM produtos WHERE preco BETWEEN 50 AND 200;
*/
select Fname, Lname from employee where Bdate like '19________';
select Fname, Lname from employee where Bdate like '19__-__-__';
select Fname, Lname from employee where Bdate like '__7_-__-__';

select Fname, Lname, Bdate from employee where Bdate like '__6%';
select Fname, Lname, Bdate from employee where Bdate like '196%';

-- usando o between
select Dno, Salary from employee;
select * from employee where (Salary between 30000 and 40000);
select * from employee where (Salary between 30000 and 40000) and Dno=5

-- usando operadores lógicos 