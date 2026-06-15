CREATE TABLE EMPLOYEE (ID INT PRIMARY KEY,NAME VARCHAR(20),SALES INT);
INSERT INTO EMPLOYEE VALUES(1,'SANTHOSH',20000),(2,'SHIV',30000);
SELECT * FROM EMPLOYEE;
insert INTO EMPLOYEE VALUES(3,'KRISHNA',20000),(4,'KESHAV',50000);

WITH TEMP AS(
SELECT * FROM EMPLOYEE
)SELECT NAME,SALES FROM TEMP;

SELECT SUM(CASE
				WHEN SALES>=30000 THEN 1
                ELSE 0
                END) AS SALESCNT FROM EMPLOYEE;
explain
SELECT id FROM EMPLOYEE WHERE name in ('santhosh');
create index idx_name on employee(name);
create index idx_sales on employee(sales);


explain
select id,sales from employee where id=4 and sales>=30000 and sales<=100000;


create table students(std_id int primary key,std_name TEXT NOT NULL,marks int,status varchar(1));
insert into students values(100,'santhosh',90,'P'),(101,'shiv',89,'P'),(102,'Raj',35,'F');
select * from students;


alter table students add Gender varchar(1);


update students set Gender='M' where std_id=100;
update students set Gender='M' where std_id>=101;

select * from students;

create table dept(dept_id TEXT,dept_name TEXT,std_id int,foreign key(std_id) references students(std_id));
insert into dept values('D1','CSD',101);
insert into dept values('T1','CST',102),('E1','CSE',102);
select * from dept;

desc students;
desc dept;


create table sales(sales_id int,sales int,cust_name TEXT,cust_id int,primary key(sales_id,cust_id)); 
alter table sales add region varchar(4);
alter table sales modify region varchar(4) NOT NULL;
desc sales;

create table emp_info
(
first_name text,
lasr_name text,
age int,
salary int);

alter table emp_info add gender varchar(1);
alter table emp_info modify gender varchar(2);
alter table emp_info drop column gender;
alter table emp_info rename column salary to emp_salary;

desc emp_info;

insert into emp_info values (null,null,null,null),('g','santhosh',20,50000);

select * from emp_info;

CALL insertdata('n','nandha',24,60000);
SET SQL_SAFE_UPDATES=0;
UPDATE EMP_INFO SET EMP_SALARY=100000 WHERE EMP_SALARY IS NULL;
DELETE FROM EMP_INFO WHERE AGE IS NULL;

SELECT ROUTINE_NAME FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_TYPE='PROCEDURE' AND ROUTINE_SCHEMA='SALES';
SHOW CREATE PROCEDURE DELETEFIRSTNAMENULL;
DROP PROCEDURE DELETEFIRSTNAMENULL;

DELIMITER //

CREATE PROCEDURE DELETENULLS()
BEGIN
    DELETE FROM sales.EMP_INFO WHERE FIRST_NAME IS NULL;
END //

DELIMITER ;
CALL DELETENULLS();


create table emp_new
(
first_name text,
last_name text,
id int,
age int,
city text,
satet text
);
 
 
CALL insertdataemp_new('golla','santhosh',10001,20,'Anantapuram','AP');
call insertdatanew('g','keshav',4,22,'BLG','UP');
select * from emp_new;
 
select*from emp_new where age>=20; 
select*from emp_new where last_name like 's%';
select*from emp_new where last_name like '%v';
select*from emp_new where satet in ('AP','UP');

update emp_new set first_name='maha' where last_name='shiv';
update emp_new set age=age+1 where last_name='santhosh';
update emp_new set city='MPL' where city='ATP';
update emp_new set salary=salary+3000 where salary>50000;
update emp_new set salary=salary+4500 where salary>90000;


 select * from emp_new;

CALL `sales`.`update`();

select * from dept;
select * from students;

select*from dept d LEFT JOIN students s ON d.std_id=s.std_id
UNION
select*from dept d RIGHT JOIN students s ON d.std_id=s.std_id;





#Remove Duplicates
with temp as(
	select*,row_number() over(order by ord_col DESC) as row_num from tab_name 
)
delete t1 from temp t1 JOIN temp t2 ON t1.ord_col = t2.ord_col and t1.row_num>t2.row_num;












