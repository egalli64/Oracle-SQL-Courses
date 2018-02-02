--Code examples for Lesson 4: Part 5: Defining Constraints

--Uncomment code below to run the code for example 1
/*
CREATE TABLE dept2
        (deptno      NUMBER(2)
          CONSTRAINT dept_dept_id_pk PRIMARY KEY,
         dname       VARCHAR2(14),
         loc         VARCHAR2(13),
         create_date DATE DEFAULT SYSDATE);

*/

--Uncomment code below to run the code for example 2
/*
CREATE TABLE dept2
        (deptno      NUMBER(2),
         dname       VARCHAR2(14),
         loc         VARCHAR2(13),
         create_date DATE DEFAULT SYSDATE,
         CONSTRAINT dept_dept_id_pk 
         PRIMARY KEY (deptno));

*/

--Uncomment code below to run the code for example 3a
/*
CREATE TABLE teach_emp(
    employee_id      NUMBER(6)
    CONSTRAINT teach_emp_id_pk PRIMARY KEY,
    last_name        VARCHAR2(25) NOT NULL,
    email            VARCHAR2(25),
    salary           NUMBER(8,2)
    CONSTRAINT empl_salary_min
     CHECK  (salary > 0),
    commission_pct   NUMBER(2,2),
    hire_date        DATE NOT NULL,
    department_id    NUMBER(4),
    CONSTRAINT empl_dept_fk FOREIGN KEY (department_id)
      REFERENCES departments(department_id),
    CONSTRAINT empl_email_uk UNIQUE(email));

*/

--Uncomment code below to run the code for example 3b
/*
	DESCRIBE teach_emp;
*/

--Uncomment code below to run the code for example 4
/*
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

*/

--Uncomment code below to run the code for example 5
/*
UPDATE employees
SET    department_id = 55
WHERE  department_id = 110;

*/

--Uncomment code below to run the code for example 6a
/*
DELETE FROM departments
WHERE department_id = 60;

*/

--Uncomment code below to run the code for example 6b
/*
DELETE FROM  departments
WHERE department_id = 70;
*/


--Uncomment code below to run the code for example 7a
/*
CREATE TABLE dept80
  AS 
    SELECT  employee_id, last_name, 
            salary*12 ANNSAL, 
            hire_date
    FROM    employees
    WHERE   department_id = 80;
	
------------------------------------------------------

DESCRIBE dept80;
*/

--Uncomment code below to run the code for example 7b
/*
CREATE TABLE dept80_copy(emp_id PRIMARY KEY, name , ANNSAL , DOJ)
  AS 
    SELECT  employee_id, last_name, 
            salary*12, 
            hire_date
    FROM    employees
    WHERE   department_id = 80;
*/


--Uncomment code below to run the code for example 8
/*
CREATE TABLE dept80_copy  AS 
    SELECT  employee_id, last_name, 
            salary*12, 
            hire_date
    FROM    employees
    WHERE   department_id = 80;
*/


