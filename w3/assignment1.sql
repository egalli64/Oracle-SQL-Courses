-- Oracle MOOC: SQL Fundamentals
-- Homework for Lesson 3
-- Assignment 1

-- 1. Find the highest, lowest, sum, and average salary of all employees.
-- Label the columns Maximum, Minimum, Sum, and Average, respectively.
-- Round your results to the nearest whole number.
-- hw3_task1_01.sql
select max(salary) as "Maximum",
       min(salary) as "Minimum",
       sum(salary) as "Sum",
       round(avg(salary)) as "Average"
from employees;

-- 2. Modify the query in hw3_task1_01.sql to display
-- the minimum, maximum, sum, and average salary for each job type.
-- hw3_task1_02.sql
select job_id,
       max(salary) as "Maximum",
       min(salary) as "Minimum",
       sum(salary) as "Sum",
       round(avg(salary)) as "Average"
from employees group by job_id;

-- 3. Write a query to display the number of people with the same job.
-- Generalize the query so that the user is prompted for job title
-- hw3_task1_03.sql
select job_id, count(*)
from employees
group by job_id;

-- 3a. test it against IT_PROG
select job_id, count(*)
from employees
where job_id = '&job_id'
group by job_id;

-- 4. Determine the number of managers without listing them.
-- Label the column Number of Managers.
select count(distinct manager_id) as "Number of Managers"
from employees;

-- 5. Find the difference between the highest and lowest salaries.
-- Label the column DIFFERENCE
select max(salary) - min(salary) as "DIFFERENCE"
from employees;

-- 6. Create a report to display the manager number and the salary of the
-- lowest-paid employee for that manager.
-- Exclude anyone whose manager is not known.
-- Exclude any groups where the minimum salary is $6,000 or less.
-- Sort the output in descending order of salary.
select manager_id, min(salary)
from employees group by manager_id
having manager_id is not null and
       min(salary) > 6000
order by 2 desc;

select trunc(sysdate, 'YYYY')
from dual;

-- 7. Create a query to display the total number of employees and,
-- of that total, the number of employees hired in 2009, 2010, 2011, and 2012.
-- Create appropriate column headings.
select count(*) as "Total",
       count(case when hire_date between '01-JAN-09' and '31-DEC-09' then 1
             else null end) as "2009",
       count(case when hire_date between '01-JAN-10' and '31-DEC-10' then 1
             else null end) as "2010",
       count(case when hire_date between '01-JAN-11' and '31-DEC-11' then 1
             else null end) as "2011",
       count(case when hire_date between '01-JAN-12' and '31-DEC-12' then 1
             else null end) as "2012"
from employees;
-- does make sense get rid of between truncating the date:
-- case when trunc(hire_date, 'YYYY') = '01-JAN-09' then ...
-- ?

-- 8. Create a matrix query to display the job, the salary for that job
-- based on the department numbers 20, 50, 80, and 90,
-- and the total salary for that job.
-- Ensure to give each column an appropriate heading
select job_id as "Job",
       sum(case when department_id = 20 then salary else 0 end) as "Dept 20",
       sum(case when department_id = 50 then salary else 0 end) as "Dept 50",
       sum(case when department_id = 80 then salary else 0 end) as "Dept 80",
       sum(case when department_id = 90 then salary else 0 end) as "Dept 90",
       sum(salary) as "Total"
from employees group by job_id;
-- I'd say that putting 0 when no salary is there is more readable than (null)  
