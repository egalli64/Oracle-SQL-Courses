--Code examples for Lesson 2: Part 5: Computing with Single Row Functions

--Uncomment code below to run the code for example 1
/*
SELECT employee_id, last_name, department_id
FROM   employees
WHERE  last_name = 'higgins';
*/

--Uncomment code below to run the code for example 2
/*
SELECT employee_id, last_name, department_id
FROM   employees
WHERE  LOWER(last_name) = 'higgins';
*/

--Uncomment code below to run the code for example 3
/*
SELECT employee_id, UPPER(last_name), department_id
FROM   employees
WHERE  INITCAP(last_name) = 'Higgins';
*/

--Uncomment code below to run the code for example 4
/*
SELECT last_name, CONCAT('Job category is ', job_id)"Job" 
FROM   employees
WHERE  SUBSTR(job_id, 4) = 'REP';
*/

--Uncomment code below to run the code for example 5
/*
SELECT employee_id, CONCAT(first_name, last_name) NAME,LENGTH (last_name), INSTR(last_name, 'a') "Contains 'a'?"
FROM   employees
WHERE  SUBSTR(last_name, -1, 1) = 'n';
*/

--Uncomment code below to run the code for example 6
/*
SELECT first_name, last_name, UPPER(CONCAT(first_name ,SUBSTR(last_name,1,3))) 
FROM   employees
WHERE  department_id = 60;
*/

--Uncomment code below to run the code for example 7
/*
SELECT ROUND(45.923,2), ROUND(45.923,0), 
	   ROUND(455.923,-2)
FROM   DUAL;
*/

--Uncomment code below to run the code for example 8
/*
 SELECT * from DUAL;
*/

--Uncomment code below to run the code for example 9
/*
SELECT TRUNC(45.923), TRUNC(45.923, 2),
       TRUNC(45.923,-1)
FROM   DUAL;
*/


--Uncomment code below to run the code for example 10
/*
SELECT employee_id as "Even Numbers", last_name
FROM employees 
WHERE MOD(employee_id,2) = 0;
*/

