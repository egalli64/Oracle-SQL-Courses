-- Oracle MOOC: SQL Fundamentals
-- Homework for Lesson 2
-- Assignment 2

--1. Write a query to display the system date. Label the column Date.
select sysdate as "Date"
from dual;

--2. The HR department needs a report to display the employee number, last name,
--salary, and salary increased by 15.5% (expressed as a whole number)
--for each employee. Label the column New Salary. 
--hw2_task3_02.sql
select employee_id, last_name, salary, round(salary + salary * 0.155) as "New Salary"
from employees
order by 1;

--3. Modify your query in hw2_task3_02.sql to add a column that subtracts
--the old salary from the new salary. Label the column Increase.
select employee_id, last_name, salary,
    round(salary + salary * 0.155) as "New Salary",
    round(salary * 0.155) as "Increase"
from employees
order by 1;

--4. Write a query that displays the last name (with the first letter in uppercase
--and all the other letters in lowercase) and the length of the last name for
--all employees whose last name starts with the letter entered by the user
--when prompted. Write a query such that the case of the letter that is entered
--does not affect the output. Give each column an appropriate label.
select last_name as "Name", length(last_name) as "Length"
from employees
where substr(last_name, 0, 1) = upper('&first_letter');

--5. The HR department wants to find the duration of employment for each employee.
--For each employee, display the last name and calculate the number of months
--between today and the date on which the employee was hired.
--Label the column as MONTHS_WORKED.
--Order your results by the number of months employed.
--The number of months must be rounded to the closest whole number.
select last_name, round(months_between (sysdate, hire_date)) as months_worked
from employees
order by 2;

--6. Create a query to display the last name and salary for all employees.
--Format the salary to be 15 characters long, left-padded with the $ symbol.
--Label the column SALARY.
select last_name, lpad(salary, 15, '$') as salary
from employees
order by employee_id;

--7. Create a query that displays the employees’ last names, and indicates
--the amounts of their salaries with asterisks (*).
--Each asterisk (*) signifies a thousand dollars.
--Sort the data in descending order of salary.
--Label the column SALARIES_IN_ASTERISK.
select last_name, lpad('*', salary / 1000, '*') as salaries_in_asterisk
from employees
order by salary desc;

--8. Create a query to display the last name and the number of weeks employed
--for all employees in department 90. Label this column as TENURE.
--Truncate the number of weeks value to 0 decimal places.
--Show the records in descending order of the employee’s tenure.
select last_name, trunc((sysdate - hire_date)/7) as tenure
from employees
where department_id = 90
order by tenure desc;

