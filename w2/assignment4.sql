-- Oracle MOOC: SQL Fundamentals
-- Homework for Lesson 2
-- Assignment 4

--1. Create a report that produces the following for each employee:
--<employee last name> earns <salary> monthly but wants <3 times salary.>.
--Label the column Dream Salaries.
select last_name || ' earns ' ||
       to_char(salary, 'fm$99,999.00') || ' monthly but wants ' ||
       to_char(salary * 3, 'fm$99,999.00') as "Dream Salaries"
from employees
order by employee_id;

--2. Display each employee’s last name, hire date, and salary review date,
--which is the first Monday after six months of service.
--Label the column REVIEW.
--Format the dates to appear in a format that is similar to
--“Monday, the Thirty-First of July, 2000.”
select last_name, hire_date, 
    to_char(next_day(add_months(hire_date, 6), 'MONDAY'),
        'fmDay, "the" fmDdspth "of" fmMonth, YYYY') as review
from employees
order by employee_id;

--3. Create a query that displays employees’ last names and commission amounts.
--If an employee does not earn commission, show “No Commission.”
--Label the column COMM.
select last_name, nvl(to_char(commission_pct), 'No Commission') as comm
from employees
order by employee_id;

--4. Using the CASE function, write a query that displays the grade
--of all employees based on the value of the JOB_ID column,
--using the following data:
-- JOB_ID, Grade
-- AD_PRES A
-- ST_MAN B
-- IT_PROG C
-- SA_REP D
-- ST_CLERK E
-- None of the above 0
select job_id,
    case job_id
        when 'AD_PRES' then 'A'
        when 'ST_MAN' then 'B'
        when 'IT_PROG' then 'C'
        when 'SA_REP' then 'D'
        when 'ST_CLERK' then 'E'
        else '0'
    end as grade
from employees;

--5. Rewrite the statement in the preceding exercise
--by using the searched CASE syntax.
select job_id,
    case
        when job_id = 'AD_PRES' then 'A'
        when job_id = 'ST_MAN' then 'B'
        when job_id = 'IT_PROG' then 'C'
        when job_id = 'SA_REP' then 'D'
        when job_id = 'ST_CLERK' then 'E'
        else '0'
    end as grade
from employees;

--6. Rewrite the statement in the preceding exercise by using the DECODE syntax.
select job_id,
    decode (job_id,
        'AD_PRES', 'A',
        'ST_MAN', 'B',
        'IT_PROG', 'C',
        'SA_REP', 'D',
        'ST_CLERK', 'E',
        '0') as grade
from employees; 
