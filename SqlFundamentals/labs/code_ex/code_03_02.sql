--Code examples for Lesson 3: Part 2: Executing Group Functions

--Uncomment code below to run the code for example 1
/*
SELECT AVG(salary), MAX(salary),
       MIN(salary), SUM(salary)
FROM   employees
WHERE  job_id LIKE '%REP%';

*/

--Uncomment code below to run the code for example 2
/*
SELECT MIN(hire_date), MAX(hire_date)
FROM	  employees;

*/

--Uncomment code below to run the code for example 3
/*
SELECT COUNT(commission_pct)
FROM   employees
WHERE  department_id = 80;

*/

--Uncomment code below to run the code for example 4
/*
SELECT COUNT(DISTINCT department_id)
FROM   employees;

*/

--Uncomment code below to run the code for example 5a
/*
SELECT AVG(commission_pct)
FROM employees;

*/

--Uncomment code below to run the code for example 5b
/*
SELECT AVG(NVL(commission_pct, 0))
FROM   employees;
*/

--Uncomment code below to run the code for example 6
/*
SELECT   department_id, AVG(salary)
FROM     employees
GROUP BY department_id ;

*/

--Uncomment code below to run the code for example 7a
/*
SELECT   department_id, job_id, sum(salary)
FROM     employees
GROUP BY department_id, job_id;

*/

--Uncomment code below to run the code for example 7b
/*
SELECT   department_id, job_id, sum(salary)
FROM     employees
GROUP BY department_id, job_id
ORDER BY job_id;
*/

--Uncomment code below to run the code for example 8
/*
SELECT   department_id, MAX(salary)
FROM     employees
GROUP BY department_id
HAVING   MAX(salary)> 10000 ;
*/

--Uncomment code below to run the code for example 9
/*
SELECT   MAX(AVG(salary))
FROM     employees
GROUP BY department_id;

*/


