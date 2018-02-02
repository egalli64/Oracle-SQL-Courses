--Code examples for Lesson 2: Part 4: Sorting Data

--Uncomment code below to run the code for example 1
/*
SELECT   last_name, job_id, department_id, hire_date
FROM     employees
ORDER BY hire_date ;
*/

--Uncomment code below to run the code for example 2
/*
SELECT   last_name, job_id, department_id, hire_date
FROM     employees
ORDER BY hire_date DESC ;
*/

--Uncomment code below to run the code for example 3
/*
SELECT employee_id, last_name, salary*12 annsal
FROM   employees
ORDER BY annsal ;
*/

--Uncomment code below to run the code for example 4
/*
SELECT   last_name, job_id, department_id, hire_date
FROM     employees
ORDER BY 3;
*/

--Uncomment code below to run the code for example 5
/*
SELECT last_name, department_id, salary
FROM   employees
ORDER BY department_id, salary DESC;
*/

--Uncomment code below to run the code for example 6a
/*
SELECT employee_id, first_name
FROM employees
ORDER BY employee_id
FETCH FIRST 5 ROWS ONLY;
*/

--Uncomment code below to run the code for example 6b
/*
SELECT employee_id, first_name
FROM employees
ORDER BY employee_id
OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;
*/

--Uncomment code below to run the code for example 7
/*
SELECT employee_id, last_name, salary, department_id
FROM   employees
WHERE  employee_id = &employee_num ;
*/

--Uncomment code below to run the code for example 8
/*
SELECT last_name, department_id, salary*12
FROM   employees
WHERE  job_id = '&job_title' ;
*/

--Uncomment code below to run the code for example 9
/*
SELECT   employee_id, last_name, job_id, &&column_name
FROM     employees
ORDER BY &column_name ;
*/

--Uncomment code below to run the code for example 10
/*
DEFINE employee_num = 200
SELECT employee_id, last_name, salary, department_id
FROM   employees
WHERE  employee_id = &employee_num ;
*/

--Uncomment code below to run the code for example 11
/*
UNDEFINE employee_num
*/

--Uncomment code below to run the code for example 12
/*
SET VERIFY ON
SELECT employee_id, last_name, salary
FROM   employees
WHERE  employee_id = &employee_num;
*/

