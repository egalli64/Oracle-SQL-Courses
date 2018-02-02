--Oracle MOOC: SQL Fundamentals
--Homework for Lesson 3
--Assignment 3

--1. The HR department needs a query that prompts the user for an employee's last
--name. The query then displays the last name and hire date of any employee in
--the same department as the employee whose name the user supplies (excluding
--that employee). For example, if the user enters Zlotkey, find all employees who
--work with Zlotkey (excluding Zlotkey).
select last_name, hire_date
from employees
where department_id = ( select department_id
                        from employees
                        where last_name = '&&colleague') and
      last_name != '&&colleague';
undefine colleague;

--2. Create a report that displays the employee number, last name, and salary of all
--employees who earn more than the average salary. Sort the results in ascending
--order by salary.
select employee_id, last_name, salary
from employees
where salary > (select avg(salary) from employees)
order by salary;

--3. Write a query that displays the employee number and last name of all employees
--who work in a department with any employee whose last name contains the letter
--"u"
--hw3_task3_03.sql
select employee_id, last_name
from employees
where department_id in (
    select department_id
    from employees
    where last_name like '%u%');

--4. The HR department needs a report that displays the last name, department
--number, and job ID of all employees whose department location ID is 1700.
--Modify the query so that the user is prompted for a location ID.
--hw3_task3_04.sql
select e.last_name, e.department_id, e.job_id
from employees e join departments d
on e.department_id = d.department_id
where d.location_id = 1700
order by e.department_id;

select e.last_name, e.department_id, e.job_id
from employees e join departments d
on e.department_id = d.department_id
where d.location_id = &location
order by e.department_id;

--5. Create a report for HR that displays the last name and salary of every employee
--who reports to King.
select last_name, salary
from employees
where manager_id = (select employee_id from employees where last_name = 'King')
order by 1;

--6. Create a report for HR that displays the department number, last name, and job
--ID for every employee in the Executive department.
select department_id, last_name, job_id
from employees
where department_id = (
    select department_id
    from departments
    where department_name = 'Executive');

--7. Create a report that displays a list of all employees whose salary is more than the
--salary of any employee from department 60.
select last_name, salary
from employees
where salary > (select min(salary) from employees where department_id = 60)
order by 2 desc;

--8. Modify the query in hw3_task3_03.sql to display the employee number, last
--name, and salary of all employees who earn more than the average salary, and
--who work in a department with any employee whose last name contains the letter
--"u"
--hw3_task3_08.sql
select employee_id, last_name, salary
from employees
where department_id in (
                    select department_id
                    from employees
                    where last_name like '%u%') and
      salary > (select avg(salary) from employees);
