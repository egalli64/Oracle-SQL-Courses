--Code examples for Lesson 3: Part 4: Retrieving Data from Multiple Tables: Part II

--Uncomment code below to run the code for example 1
/*

SELECT worker.last_name emp, manager.last_name mgr
FROM   employees worker JOIN employees manager
ON    (worker.manager_id = manager.employee_id);



*/

--Uncomment code below to run the code for example 2
/*

SELECT e.last_name, e.salary, j.grade_level
FROM   employees e JOIN job_grades j
ON     e.salary 
       BETWEEN j.lowest_sal AND j.highest_sal;


*/

--Uncomment code below to run the code for example 3
/*
SELECT e.last_name, e.department_id, d.department_name
FROM   employees e LEFT OUTER JOIN departments d
ON   (e.department_id = d.department_id) ;

*/

--Uncomment code below to run the code for example 4
/*
SELECT e.last_name, d.department_id, d.department_name
FROM   employees e RIGHT OUTER JOIN departments d
ON    (e.department_id = d.department_id) ;

*/

--Uncomment code below to run the code for example 5
/*
SELECT e.last_name, d.department_id, d.department_name
FROM   employees e FULL OUTER JOIN departments d
ON   (e.department_id = d.department_id) ;

*/

--Uncomment code below to run the code for example 6
/*
SELECT last_name, department_name
FROM   employees
CROSS JOIN departments ;

*/



