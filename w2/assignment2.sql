-- Oracle MOOC: SQL Fundamentals
-- Homework for Lesson 2
-- Assignment 2

--1. Because of budget issues, the HR department needs a report that displays
--the last name and salary of employees who earn more than $12,000
--hw2_task2_01.sql
select last_name, salary
from employees
where salary > 12000
order by salary desc;

--2. Create a report that displays the last name and department number for employee number 176.
select last_name, department_id
from employees
where employee_id = 176;

--3. The HR department needs to find high-salaried and low-salaried employees.
--Modify hw2_task2_01.sql to display the last name and salary for any employee
--whose salary is not in the range $5,000 through $12,000
--hw2_task2_03.sql
select last_name, salary
from employees
where salary not between 5000 and 12000
order by employee_id;

-- alternative version, sort of less compliant with implicit requirements
SELECT LAST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY < 5000 OR SALARY > 12000
ORDER BY salary desc;

--4. Create a report to display the last name, job ID, and hire date for
--employees with the last names of Matos and Taylor.
--Order the query in ascending order by hire date.
select last_name, job_id, hire_date
from employees
--where last_name = 'Matos' or last_name = 'Taylor'
where last_name in ('Matos', 'Taylor')
order by hire_date;
-- OR vs. IN: what do you prefer?

--5. Display the last name and department ID of all employees in
--department 20 or department 50 in ascending alphabetical order by last_name.
select last_name, department_id
from employees
--where department_id = 20 or department_id = 50
where department_id in (20, 50)
order by last_name;

--6. Modify hw2_task2_03.sql to display the last name and salary of employees
--who earn between $5,000 and $12,000, and are in department 20 or department 50.
--Label the columns Employee and Monthly Salary, respectively.
select last_name as "Employee", salary as "Monthly Salary"
from employees
where (salary between 5000 and 12000) and
--    (department_id = 20 or department_id = 50)
    department_id in (20, 50)    
order by employee_id;

--7. The HR department needs a report that displays the last name and hire date
--of all employees who were hired in 2010.
select last_name, hire_date
from employees
where hire_date between '01-JAN-10' and '31-DEC-10';

--8. Create a report to display the last name and job title of all employees
--who do not have a manager.
select last_name, job_id
from employees
where manager_id is null;

--9. Create a report to display the last name, salary, and commission of all
--employees who earn commissions. Sort the data in descending order of salary
--and commissions. Use the column’s numeric position in the ORDER BY clause.
select last_name, salary, commission_pct
from employees
where commission_pct is not null
order by 2 desc, 3;

--10. Members of the HR department want to have more flexibility with the
--queries that you are writing. They would like a report that displays the
--last name and salary of employees who earn more than an amount that the
--user specifies after a prompt. Enter 12000 when prompted
select last_name, salary
from employees
where salary > &amount
order by salary desc;

--11. The HR department wants to run reports based on a manager.
--Create a query that prompts the user for a manager ID, and generates the
--employee ID, last name, salary, and department for that manager’s employees.
--The HR department wants the ability to sort the report on a selected column.
--Test the data with the following values:
--a. manager_id = 103, sorted by last_name
--b. manager_id = 201, sorted by salary
--c. manager_id = 124, sorted by employee_id
select employee_id, last_name, salary, department_id
from employees
where manager_id = &id
order by &column;

--12. Display the last names of all employees
--who have both an “a” and an “e” in their last name
select last_name
from employees
where last_name like '%a%' and last_name like '%e%';

--13. Display the last name, job, and salary for all employees whose jobs
--are either that of a sales representative or a stock clerk, and whose salaries
--are not equal to $2,500, $3,500, or $7,000.
select last_name, job_id, salary
from employees
-- where (job_id = 'SA_REP' or job_id = 'ST_CLERK')
where job_id in ('SA_REP', 'ST_CLERK')
and salary not in (2500, 3500, 7000)
order by salary desc;
