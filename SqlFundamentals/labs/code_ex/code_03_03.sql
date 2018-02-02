--Code examples for Lesson 3: Part 3: Retrieving Data from Multiple Tables: Part I

--Uncomment code below to run the code for example 1
/*

SELECT employee_id, first_name, job_id, job_title
FROM employees NATURAL JOIN jobs;


*/

--Uncomment code below to run the code for example 2
/*

SELECT employee_id, last_name, 
       department_name, department_id
FROM   employees JOIN departments
USING (department_id) ;


*/

--Uncomment code below to run the code for example 3a
/*
SELECT l.city, d.department_name, d.manager_id 
FROM   locations l JOIN departments d
USING (location_id)
WHERE d.location_id = 1400;

*/

--Uncomment code below to run the code for example 3b
/*
SELECT l.city, d.department_name, d.manager_id
FROM   locations l JOIN departments d USING (location_id)
WHERE  location_id = 1400;
*/

--Uncomment code below to run the code for example 4
/*
SELECT e.employee_id, e.last_name, e.department_id, 
       d.department_id, d.location_id
FROM   employees e JOIN departments d
ON     (e.department_id = d.department_id);

*/

--Uncomment code below to run the code for example 5a
/*
SELECT employee_id, city, department_name
FROM   employees e 
JOIN   departments d
ON     d.department_id = e.department_id 
JOIN   locations l
ON     d.location_id = l.location_id;

*/

--Uncomment code below to run the code for example 5b
/*
SELECT e.employee_id, l.city, d.department_name
FROM employees e
JOIN departments d
USING (department_id)
JOIN locations l
USING (location_id);
*/

--Uncomment code below to run the code for example 6a
/*
SELECT e.employee_id, e.last_name, e.department_id, 
       d.department_id, d.location_id
FROM   employees e JOIN departments d
ON     (e.department_id = d.department_id)
AND    e.manager_id = 149 ;

*/

--Uncomment code below to run the code for example 6b
/*
SELECT e.employee_id, e.last_name, e.department_id, 
       d.department_id, d.location_id
FROM   employees e JOIN departments d
ON     (e.department_id = d.department_id)
WHERE   e.manager_id = 149 ;
*/



