--Code examples for Lesson 2: Part 2: Retrieving Data

--Uncomment code below to run the code for example 1
/*
SELECT * 
FROM departments;
*/

--Uncomment code below to run the code for example 2
/*
SELECT  department_id, department_name, manager_id, location_id
FROM    departments;
*/

--Uncomment code below to run the code for example 3a
/*
SELECT department_id, location_id
FROM   departments;
*/

--Uncomment code below to run the code for example 3b
/*
SELECT  location_id, department_id
FROM   departments;
*/

--Uncomment code below to run the code for example 4
/*
SELECT last_name, salary, salary * 12
FROM   employees;
*/

--Uncomment code below to run the code for example 5
/*
SELECT last_name Name, salary, salary * 12 "Annual Salary"
FROM   employees;
*/

--Uncomment code below to run the code for example 6
/*
SELECT last_name || job_id  as "Employee Details"
FROM employees;
*/

--Uncomment code below to run the code for example 7
/*
SELECT last_name ||' is a '||job_id 
       AS "Employee Details"
FROM   employees;
*/

--Uncomment code below to run the code for example 8
/*
SELECT DISTINCT department_id
FROM employees;
*/

--Uncomment code below to run the code for example 9
/*
SELECT  DISTINCT department_id, job_id
FROM    employees;
*/

--Uncomment code below to run the code for example 10
/*
DESCRIBE employees;
*/