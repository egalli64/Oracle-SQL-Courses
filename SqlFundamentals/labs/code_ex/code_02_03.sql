--Code examples for Lesson 2: Part 3: Restricting Data

--Uncomment code below to run the code for example 1
/*
SELECT employee_id, last_name, job_id, department_id
FROM   employees
WHERE  department_id = 90 ;
*/

--Uncomment code below to run the code for example 2a
/*
SELECT last_name, job_id, department_id
FROM   employees
WHERE  last_name = 'Whalen' ;
*/

--Uncomment code below to run the code for example 2b
/*
SELECT last_name, job_id, department_id
FROM   employees
WHERE  last_name = 'WHALEN' ;
*/

--Uncomment code below to run the code for example 3
/*
SELECT last_name 
FROM   employees
WHERE  hire_date = '17-OCT-11' ;
*/

--Uncomment code below to run the code for example 4
/*
SELECT last_name, salary
FROM   employees
WHERE  salary <= 3000 ;
*/

--Uncomment code below to run the code for example 5
/*
SELECT * 
FROM   employees
WHERE  last_name = 'Abel'; 
*/

--Uncomment code below to run the code for example 6
/*
SELECT last_name, salary
FROM   employees
WHERE  salary BETWEEN 2500 AND 3500 ;
*/

--Uncomment code below to run the code for example 7
/*
SELECT last_name FROM employees
WHERE last_name BETWEEN 'K' AND 'N';
*/

--Uncomment code below to run the code for example 8
/*
SELECT employee_id, last_name, salary, manager_id
FROM   employees
WHERE  manager_id IN (100, 101, 201) ;
*/

--Uncomment code below to run the code for example 9
/*
SELECT	first_name
FROM 	employees
WHERE	first_name LIKE 'S%' ;
*/

--Uncomment code below to run the code for example 10
/*
SELECT last_name
FROM   employees
WHERE  last_name LIKE '_o%' ;
*/

--Uncomment code below to run the code for example 11
/*
SELECT last_name, job_id, commission_pct
FROM   employees
WHERE  commission_pct IS NULL;
*/

--Uncomment code below to run the code for example 12
/*
SELECT employee_id, last_name, job_id, salary
FROM   employees
WHERE  salary >= 10000
AND    job_id LIKE '%MAN%' ;
*/

--Uncomment code below to run the code for example 13
/*
SELECT employee_id, last_name, job_id, salary
FROM   employees
WHERE  salary >= 10000
OR     job_id LIKE '%MAN%' ;
*/

--Uncomment code below to run the code for example 14
/*
SELECT last_name, job_id
FROM   employees
WHERE  job_id NOT IN ('IT_PROG', 'ST_CLERK', 'SA_REP') ;
*/

--Uncomment code below to run the code for example 15a
/*
SELECT last_name, department_id, salary
FROM   employees
WHERE  department_id = 60
OR     department_id = 80
AND    salary > 10000;
*/

--Uncomment code below to run the code for example 15b
/*
SELECT last_name, department_id, salary
FROM   employees
WHERE  (department_id = 60
OR     department_id = 80)
AND    salary > 10000;
*/

