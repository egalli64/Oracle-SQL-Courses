-- Oracle MOOC: SQL Fundamentals
-- Homework for Lesson 2
-- Assignment 1

--1. Determine the structure of the DEPARTMENTS table and its contents
desc departments;

select * from departments;

--2. The HR department wants a query to display the last name, job ID, hire date,
--and employee ID for each employee, with the employee ID appearing first.
--Provide an alias STARTDATE for the HIRE_DATE column. 
--hw2_task1_02.sql
select employee_id, last_name, job_id, hire_date as "STARTDATE"
from employees
order by employee_id;
-- not explicitely required, but the solution is shown sorted by employee id.

--3. The HR department wants a query to display all unique job IDs from EMPLOYEES
select distinct job_id
from employees;

--4. The HR department wants more descriptive column headings for its report on employees.
--Copy the statement from hw2_task1_02.sql to a new SQL Worksheet.
--Name the columns Emp #, Employee, Job, and Hire Date, respectively.
select employee_id as "Emp #",
       last_name as "Employee",
       job_id as "Job",
       hire_date as "Hire Date"
from employees
order by employee_id;

--5. The HR department has requested a report of all employees and their job IDs.
--Display the last name concatenated with the job ID (separated by a comma and space)
--and name the column Employee and Title.
select (last_name || ', ' || job_id) as "Employee and Title"
from employees;

--6. To familiarize yourself with the data in the EMPLOYEES table,
--create a query to display all the data from that table.
--Separate each column output by a comma. Name the column THE_OUTPUT.
select (
    employee_id || ',' ||
    first_name || ',' ||
    last_name || ',' ||
    email || ',' ||
    phone_number || ',' ||
    hire_date || ',' ||
    job_id || ',' ||
    salary || ',' ||
    commission_pct || ',' ||
    manager_id || ',' ||
    department_id ) as "THE_OUTPUT"
from employees
order by employee_id;