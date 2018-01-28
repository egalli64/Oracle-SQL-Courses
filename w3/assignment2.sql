--Oracle MOOC: SQL Fundamentals
--Homework for Lesson 3
--Assignment 2

--1. Write a query for the HR department to produce the addresses of all the
--departments. Use the LOCATIONS and COUNTRIES tables. Show the location ID,
--street address, city, state or province, and country in the output.
--Use a NATURAL JOIN to produce the results.
select lc.location_id, lc.street_address, lc.city, lc.state_province, c.country_name
from locations lc natural join countries c;

--2. The HR department needs a report of all employees with corresponding
--departments. Write a query to display the last name, department number, and
--department name for these employees.
select e.last_name, department_id, d.department_name
from employees e join departments d
using (department_id)
order by department_id;

--3. The HR department needs a report of employees in Toronto. Display the last
--name, job, department number, and the department name for all employees who
--work in Toronto.
select e.last_name, e.job_id, e.department_id, d.department_name
from employees e join departments d
on e.department_id = d.department_id
join locations lc
on d.location_id = lc.location_id
where lc.city = 'Toronto';

--4. Create a report to display employees' last names and employee numbers along
--with their managers' last names and manager numbers. Label the columns
--Employee, Emp#, Manager and Mgr# respectively.
--hw3_task2_04.sql
select e.last_name as "Employee",
       e.employee_id as "Emp#",
       m.last_name as "Manager",
       m.employee_id as "Mgr#"
from employees e join employees m
on e.manager_id = m.employee_id
order by m.last_name;

--5. Modify hw3_task2_04.sql to display all employees, including King, who has
--no manager. Order the results by employee number
--hw3_task2_05.sql
select e.last_name as "Employee",
       e.employee_id as "Emp#",
       m.last_name as "Manager",
       m.employee_id as "Mgr#"
from employees e left join employees m
on e.manager_id = m.employee_id
order by e.employee_id;

--6. Create a report for the HR department that displays employee last names,
--department numbers, and all the employees who work in the same department
--as a given employee. Give each column an appropriate label.
--hw3_task2_06.sql
select e.department_id as "Department",
       e.last_name as "Employee",
       c.last_name as "Colleague"
from employees e join employees c
on c.department_id = e.department_id
where e.employee_id != c.employee_id
order by e.department_id, e.last_name;

--7. The HR department needs a report on job grades and salaries. To familiarize
--yourself with the JOB_GRADES table, first query the structure of the JOB_GRADES
--table. Then create a query that displays the name, job, department name, salary,
--and grade for all employees.
desc job_grades;

select e.last_name, e.job_id, d.department_name, e.salary, j.grade_level
from employees e natural join departments d
join job_grades j
on e.salary
between j.lowest_sal and j.highest_sal
order by salary desc;

--8. The HR department wants to determine the names of all employees who were
--hired after Davies. Create a query to display the name and hire date of any
--employee hired after employee Davies.
select last_name, hire_date
from employees
where hire_date > (
    select hire_date
    from employees
    where last_name = 'Davies'
)
order by last_name;

--9. The HR department needs to find the names and hire dates of all employees who
--were hired before their managers, along with their managers' names and hire
--dates
--hw3_task2_09.sql
select e.last_name,
       e.hire_date,
       m.last_name as "Manager",
       m.hire_date as "M hired"
from employees e join employees m
on e.manager_id = m.employee_id
where e.hire_date < m.hire_date
order by m.last_name;

