--Code examples for Lesson 3: Part 6: Working with Advanced Subqueries

--Uncomment code below to run the code for example 1a
/*
SELECT last_name, salary, department_id
   FROM   employees
   WHERE  salary IN (SELECT   MIN(salary)
                     FROM     employees
                     GROUP BY department_id);

*/

--Uncomment code below to run the code for example 1b
/*
SELECT last_name, salary, department_id
   FROM   employees
   WHERE  salary IN (2500, 4200, 4400, 6000, 7000,   8300, 	8600, 17000);
*/

--Uncomment code below to run the code for example 2
/*
SELECT employee_id, last_name, job_id, salary
FROM   employees
WHERE  salary < ANY
                    (SELECT salary
                     FROM   employees
                     WHERE  job_id = 'IT_PROG')
AND    job_id <> 'IT_PROG';

*/

--Uncomment code below to run the code for example 3
/*
SELECT employee_id, last_name, job_id, salary
FROM   employees
WHERE  salary < ALL
                    (SELECT salary
                     FROM   employees
                     WHERE  job_id = 'IT_PROG')
AND    job_id <> 'IT_PROG';

*/

--Uncomment code below to run the code for example 4
/*
SELECT first_name, department_id, salary
FROM employees
WHERE (salary, department_id) IN
      (SELECT min(salary), department_id
       FROM employees
       GROUP BY department_id)
ORDER BY department_id;

*/

--Uncomment code below to run the code for example 5
/*
SELECT emp.last_name
FROM   employees emp
WHERE  emp.employee_id NOT IN
                           (SELECT mgr.manager_id
                            FROM   employees mgr);

*/

--Uncomment code below to run the code for example 6
/*
SELECT last_name FROM employees
WHERE  employee_id NOT IN
                        (SELECT manager_id 
                         FROM   employees 
                         WHERE  manager_id IS NOT NULL);

*/

--Uncomment code below to run the code for example 7
/*
SELECT emp.last_name
    FROM   employees emp
    WHERE  emp.employee_id  IN
                              (SELECT mgr.manager_id
                               FROM   employees mgr);
*/


