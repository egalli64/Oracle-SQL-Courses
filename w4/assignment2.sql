-- Oracle MOOC: SQL Fundamentals
-- Homework for Lesson 4
-- Assignment 2


--before starting this task, 
-- execute the cleanup_4b.sql script from the labs/cleanup_scripts folder

--1. Create the DEPT table based on the following table instance chart. Save the
--statement in the hw4_task2_01.sql script, and then execute the statement in
--the script to create the table. Confirm that the table is created.
CREATE TABLE DEPT (
    id NUMBER(7) CONSTRAINT my_dept_id_pk PRIMARY KEY,
    name VARCHAR2(25)
);

descr dept;

--2. Create the EMP table based on the following table instance chart
--Confirm that the table is created
--hw4_task2_02.sql
CREATE TABLE EMP (
    id NUMBER(7),
    last_name VARCHAR2(25),
    first_name VARCHAR2(25),
    dept_id NUMBER(7),
    CONSTRAINT emp_dept_id_fk FOREIGN KEY (dept_id)
        REFERENCES dept(id)
);

desc emp;

--3. Modify the EMP table. Add a COMMISSION column of the NUMBER data type, with
--precision 2 and scale 2. Confirm your modification.
alter table emp add(
    commission number(2,2)
);

desc emp;

--4. Modify the EMP table to allow for longer employee last names (50)
--Confirm your modification.
alter table emp modify(
    last_name varchar2(50)
);

desc emp;

--5. Drop the FIRST_NAME column from the EMP table. Confirm your modification by
--checking the description of the table.

alter table emp drop(first_name);

desc emp;

--6. In the EMP table, mark the DEPT_ID column as UNUSED. Confirm your
--modification by checking the description of the table.
alter table emp set unused (dept_id);

desc emp;

--7. Drop all of the UNUSED columns from the EMP table.
alter table emp drop unused columns;

--8. Create the EMPLOYEES2 table based on the structure of the EMPLOYEES table.
--Include only the EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY and
--DEPARTMENT_ID columns. Name the columns in your new table ID,
--FIRST_NAME, LAST_NAME, SALARY and DEPT_ID respectively. Confirm
--that the table is created.
create table employees2(id, first_name, last_name, salary, dept_id) as 
    select  employee_id,
            first_name,
            last_name, 
            salary, 
            department_id
    from    employees;

desc employees2;
select * from employees2;

--9. Alter the status of the EMPLOYEES2 table to READ ONLY.
alter table employees2 read only;

--10. Try to delete all rows in the EMPLOYEES2 table. Observe what happens.
-- ORA-12081: update operation not allowed on table
delete from employees2;

--11. Revert the EMPLOYEES2 table to the READ WRITE status. Now try to truncate the
--rows again.
alter table employees2 read write;
delete from employees2;
select count(*) from employees2;

--12. Drop the EMP, DEPT, and EMPLOYEES2 table.
drop table emp;
drop table dept;
drop table employees2;

