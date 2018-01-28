--2

---
INSERT INTO departments(department_id, 
       department_name, manager_id, location_id)
VALUES (70, 'Public Relations', 100, 1700);

SELECT *
FROM departments
WHERE department_id = 70;
---

DESCRIBE departments;

--- implicit null for unknown values (when possible)
INSERT INTO	departments (department_id, department_name)
VALUES  (30, 'Purchasing');

SELECT *
FROM departments;
WHERE department_id = 30;
---

-- explicit insertion of null (when possible)
INSERT INTO	departments
VALUES (100, 'Finance', NULL, NULL);

SELECT * 
FROM departments
WHERE department_id = 100;

-- use of sysdate to enter current date
INSERT INTO employees (employee_id, 
                 first_name, last_name, 
                 email, phone_number,
                 hire_date, job_id, salary, 
                 commission_pct, manager_id,
                 department_id)
VALUES		   (113, 
                 'Louis', 'Popp', 
                 'LPOPP', '515.124.4567', 
                 SYSDATE, 'AC_ACCOUNT', 6900, 
                 NULL, 205, 110);

SELECT employee_id, last_name, job_id, hire_date, commission_pct
FROM   employees
WHERE  employee_id = 113;
---

INSERT INTO departments 
           (department_id, department_name, location_id)
VALUES     (&department_id, '&department_name', &location);

--Code to create sales_reps table.
-- Ensure to run this statement to create the sales_reps table before inserting rows into it.
CREATE TABLE sales_reps AS
    SELECT employee_id id, last_name name, salary, commission_pct
    FROM   employees 
    WHERE 1=2;

descr sales_reps;
select * from sales_reps;
---------------------------------------------------------------------------------------------

INSERT INTO sales_reps(id, name, salary, commission_pct)
 SELECT employee_id, last_name, salary, commission_pct
  FROM   employees
  WHERE  job_id LIKE '%REP%';

--Code to create copy_emp table.
--Ensure to run this statement to create the copy_emp table before inserting rows into it.
CREATE TABLE copy_emp AS SELECT *
FROM employees
WHERE 1=2;
--------------------------------------------------------------------------

INSERT INTO copy_emp
SELECT * 
FROM   employees;

select * from copy_emp;

--3

select *
from employees
where department_id = 60 or department_id = 80;

UPDATE employees
SET department_id = 80
WHERE department_id = 60;

-- probably bugged, all dep_id changed!
UPDATE copy_emp
SET department_id = 80;

-- change of data for a single employee
select * from employees where employee_id = 113;
--
UPDATE employees
SET job_id = 'IT_PROG', commission_pct = NULL
WHERE employee_id = 113;
---

-- subquery to updated
select * from employees where employee_id = 103 or employee_id = 205;

UPDATE employees
SET (job_id, salary) =
    (SELECT job_id, salary FROM employees WHERE employee_id = 205)
WHERE employee_id = 103;

SELECT employee_id, job_id, salary
FROM employees
WHERE employee_id IN (103, 205);

--
UPDATE  copy_emp
SET     department_id  =  (SELECT department_id
                           FROM employees
                           WHERE employee_id = 100)
WHERE   job_id         =  (SELECT job_id
                           FROM employees
                           WHERE employee_id = 200);
--

-- (possible) multirows delete
select * from departments;

-- no row deleted in this case
DELETE FROM departments
WHERE department_name = 'Missing';

-- do you really want to do that?
--DELETE from copy_emp;

-- a new (and unique) employee in dep 70
select * from employees where employee_id = 207;

INSERT INTO employees(employee_id, 
                      first_name, last_name, 
                      email, phone_number,
                      hire_date, job_id, salary, 
                      commission_pct, manager_id,
                      department_id)
            VALUES   (207, 
                      'Eva', 'Jones', 
                      'EJONES', '515.124.4666', 
                       SYSDATE, 'AC_ACCOUNT', 3300, 
                       NULL, 205, 70);

-- delete all employees in dep 70
DELETE FROM employees
WHERE  department_id IN
                (SELECT department_id
                 FROM   departments
                 WHERE  department_name 
                 LIKE '%Public%');

--4

-- create a table from scratch
-- (slightly bugger, deptno shuldn't be null)
CREATE TABLE dept
        (deptno      NUMBER(2),
         dname       VARCHAR2(14),
         loc         VARCHAR2(13),
         create_date DATE DEFAULT SYSDATE);

DESCRIBE dept;
---

INSERT INTO dept(dname, loc)
VALUES('User Assist', 'Boston' ) ;

SELECT *
FROM dept;

--5

-- constraint type:
--C (check constraint on a table)
--P (primary key)
--U (unique key)
--R (referential integrity)
--V (with check option, on a view)
--O (with read only, on a view)
SELECT cons.constraint_type, cols.column_name, cols.position, cons.status, cons.owner
FROM all_constraints cons, all_cons_columns cols
WHERE cols.table_name = 'TEACH_EMP'
--AND cons.constraint_type = 'P'
AND cons.constraint_name = cols.constraint_name
AND cons.owner = cols.owner
ORDER BY cols.table_name, cols.position;

-- table with a PK constrain
CREATE TABLE dept2 (
    deptno NUMBER(2) CONSTRAINT dept_dept_id_pk PRIMARY KEY,
    dname VARCHAR2(14),
    loc VARCHAR2(13),
    create_date DATE DEFAULT SYSDATE
);

descr dept2;
drop table dept2;

-- again, but PK defined at table level
CREATE TABLE dept2 (
    deptno NUMBER(2),
    dname VARCHAR2(14),
    loc VARCHAR2(13),
    create_date DATE DEFAULT SYSDATE,
    CONSTRAINT dept_dept_id_pk PRIMARY KEY (deptno)
);


CREATE TABLE teach_emp(
    employee_id      NUMBER(6)
        CONSTRAINT teach_emp_id_pk PRIMARY KEY,
    last_name        VARCHAR2(25) NOT NULL,
    email            VARCHAR2(25),
    salary           NUMBER(8,2)
        CONSTRAINT empl_salary_min CHECK  (salary > 0),
    commission_pct   NUMBER(2,2),
    hire_date        DATE NOT NULL,
    department_id    NUMBER(4),
    CONSTRAINT empl_dept_fk FOREIGN KEY (department_id)
        REFERENCES departments(department_id),
    CONSTRAINT empl_email_uk UNIQUE(email));

DESCRIBE teach_emp;


CREATE TABLE teach_emp(
    employee_id      NUMBER(6) PRIMARY KEY,
    last_name        VARCHAR2(25) NOT NULL,
    email            VARCHAR2(25),
    salary           NUMBER(8,2) 
     CONSTRAINT emp_salary_min
     CHECK  (salary > 0),
    commission_pct   NUMBER(2,2),
    hire_date        DATE NOT NULL,
    department_id NUMBER(4) CONSTRAINT   emp_deptid_fk 
REFERENCES departments(department_id),
    CONSTRAINT emp_email_uk UNIQUE(email));

-- integrity constraint (ORA1.EMP_DEPT_FK) violated - parent key not found
UPDATE employees
SET    department_id = 55
WHERE  department_id = 110;

--integrity constraint (ORA1.JHIST_DEPT_FK) violated - child record found
DELETE FROM departments
WHERE department_id = 60;

-- no child, delete allowed
DELETE FROM  departments
WHERE department_id = 70;

-- create table w/ subquery
-- only not-null constraints are passed through
CREATE TABLE dept80 AS 
    SELECT  employee_id, last_name, 
            salary*12 ANNSAL, 
            hire_date
    FROM    employees
    WHERE   department_id = 80;

DESCRIBE dept80;
select * from dept80;
------------------------------------------------------

-- explicitly add constraints
CREATE TABLE dept80_copy(emp_id PRIMARY KEY, name , ANNSAL , DOJ) AS 
    SELECT  employee_id, last_name, 
            salary*12, 
            hire_date
    FROM    employees
    WHERE   department_id = 80;

-- buggy: must name this expression with a column alias
CREATE TABLE dept80_copy  AS 
    SELECT  employee_id, last_name, 
            salary*12, 
            hire_date
    FROM    employees
    WHERE   department_id = 80;

--6
descr dept80;

-- add row
ALTER TABLE dept80 ADD (job_id VARCHAR2(9));

SELECT * FROM dept80;

--alternative w/ default value
ALTER TABLE dept80 ADD (job_id VARCHAR2(9) DEFAULT 'UNDEFINED');

-- modify a col
ALTER TABLE dept80 MODIFY (last_name VARCHAR2(30));

-- drop a col
ALTER TABLE dept80 DROP (job_id); 

-- when required, use cascade constraints
-- to drop all referential integrity constraints that refer 
-- to primary and unique keys in the dropped table
ALTER TABLE  dept80
DROP (job_id) CASCADE CONSTRAINTS; 

-- faster, avoid locking table in production
ALTER TABLE  dept80
SET   UNUSED (job_id);

-- when safe ...
ALTER TABLE dept80 DROP  UNUSED COLUMNS;

ALTER TABLE dept80 READ ONLY;

-- if read only, it would fail
INSERT INTO dept80 VALUES (111, 'Jill', 10500, '05-May-2017');

RENAME dept80 to sales_emp;

-- make it available to full access
ALTER TABLE sales_emp READ WRITE;

CREATE TABLE dept80
  AS 
    SELECT  employee_id, last_name, 
            salary*12 ANNSAL, 
            hire_date
    FROM    employees
    WHERE   department_id = 80;


DROP TABLE dept80;

DROP TABLE dept80 PURGE;

SELECT * FROM RECYCLEBIN;

purge table dept80;

--7

CREATE TABLE emp2 AS
    SELECT * FROM employees;

UPDATE emp2 SET salary = 8500
WHERE employee_id = 206;

select salary from emp2 WHERE employee_id = 206;
--rollback;

SAVEPOINT del_emp;

DELETE FROM emp2;

ROLLBACK to del_emp;

DELETE FROM emp2 WHERE employee_id = 113;

SELECT * FROM  emp2
where employee_id between 100 and 115;

COMMIT;

--8

CREATE USER  demo IDENTIFIED BY demo;

GRANT  create session, create table, create sequence, create view
TO demo;

CREATE ROLE manager; 

GRANT create table, create view 		  
TO manager;  

GRANT manager TO demo;      

ALTER USER demo IDENTIFIED BY employ;

GRANT  select
ON     employees
TO     demo
WITH GRANT OPTION;

GRANT  update (department_name, location_id)
ON     departments
TO     demo, manager;


REVOKE  select
ON      employees
FROM    demo;

--9 data dictionary

DESCRIBE dictionary;

SELECT *
FROM   dictionary
WHERE  table_name = 'USER_OBJECTS';

SELECT table_name
FROM user_tables;

DESCRIBE user_tables;

DESCRIBE user_tab_columns;

SELECT column_name, data_type, data_length,
       data_precision, data_scale, nullable
FROM   user_tab_columns
WHERE  table_name = 'EMPLOYEES'; 


DESCRIBE user_constraints;

SELECT constraint_name, constraint_type,
       search_condition, r_constraint_name, 
       delete_rule, status
FROM   user_constraints
WHERE  table_name = 'EMPLOYEES'; 


DESCRIBE user_cons_columns;

SELECT constraint_name, column_name
FROM   user_cons_columns
WHERE  table_name = 'EMPLOYEES'; 

COMMENT ON TABLE employees
IS 'Employee Information';

COMMENT ON COLUMN employees.first_name
IS 'First name of the employee';

SELECT *
FROM user_tab_comments;
