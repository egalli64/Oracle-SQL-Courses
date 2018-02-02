--Code examples for Lesson 2: Part 8: Working with Conditional Expressions

--Uncomment code below to run the code for example 1
/*
SELECT last_name, salary, NVL(commission_pct, 0),
       (salary*12) + (salary*12*NVL(commission_pct, 0)) AN_SAL
FROM employees;
*/

--Uncomment code below to run the code for example 2
/*
SELECT last_name,  salary, commission_pct,
       NVL2(commission_pct, 
       'SAL+COMM', 'SAL') income
FROM   employees WHERE department_id IN (50, 80);
*/

--Uncomment code below to run the code for example 3
/*
SELECT first_name, LENGTH(first_name) "expr1", 
       last_name,  LENGTH(last_name)  "expr2",
       NULLIF(LENGTH(first_name), LENGTH(last_name)) result
FROM   employees;
*/

--Uncomment code below to run the code for example 4
/*
SELECT last_name, salary, commission_pct,
COALESCE((salary+(commission_pct*salary)), salary+2000)"New Salary"
FROM   employees;

*/

--Uncomment code below to run the code for example 5
/*
SELECT last_name, job_id, salary,
       CASE job_id WHEN 'IT_PROG'  THEN  1.10*salary
                   WHEN 'ST_CLERK' THEN  1.15*salary
                   WHEN 'SA_REP'   THEN  1.20*salary
       ELSE      salary END     "REVISED_SALARY"
FROM   employees;

*/

--Uncomment code below to run the code for example 6
/*
SELECT last_name,salary, 
(CASE WHEN salary<5000 THEN 'Low' 
      WHEN salary<10000 THEN 'Medium' 
      WHEN salary<20000 THEN 'Good' 
      ELSE 'Excellent' 
END) qualified_salary 
FROM employees;

*/

--Uncomment code below to run the code for example 7
/*
SELECT last_name, job_id, salary,
       DECODE(job_id, 'IT_PROG',  1.10*salary,
                      'ST_CLERK', 1.15*salary,
                      'SA_REP',   1.20*salary,
              salary)
       REVISED_SALARY
FROM   employees;

*/

--Uncomment code below to run the code for example 8
/*
SELECT last_name, salary,
       DECODE (TRUNC(salary/2000, 0),
                         0, 0.00,
                         1, 0.09,
                         2, 0.20,
                         3, 0.30,
                         4, 0.40,
                         5, 0.42,
                         6, 0.44,
                            0.45) TAX_RATE
FROM   employees
WHERE  department_id = 80;

*/

