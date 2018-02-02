--Code examples for Lesson 3: Part 5: Nesting Queries

--Uncomment code below to run the code for example 1
/*
SELECT last_name, hire_date
FROM   employees 
WHERE  hire_date > (SELECT hire_date 
                    FROM   employees
                    WHERE  last_name = 'Davies');
*/

--Uncomment code below to run the code for example 2
/*
SELECT last_name, job_id, salary
FROM   employees
WHERE  job_id =  
                (SELECT job_id
                 FROM   employees
                 WHERE  last_name = 'Taylor')
AND    salary >
                (SELECT salary
                 FROM   employees
                 WHERE  last_name = 'Taylor');

*/

--Uncomment code below to run the code for example 3
/*
SELECT last_name, job_id, salary
FROM   employees
WHERE  salary = 
                (SELECT MIN(salary)
                 FROM   employees);

*/

--Uncomment code below to run the code for example 4
/*
SELECT   department_id, MIN(salary)
FROM     employees
GROUP BY department_id
HAVING   MIN(salary) >
                       (SELECT MIN(salary)
                        FROM   employees
                        WHERE  department_id = 50);

*/

--Uncomment code below to run the code for example 5
/*
SELECT employee_id, last_name
FROM   employees
WHERE  salary =
                (SELECT   MIN(salary)
                 FROM     employees
                 GROUP BY department_id);

*/


--Uncomment code below to run the code for example 6
/*
SELECT last_name, job_id 
FROM   employees
WHERE job_id = 
                (SELECT job_id
                 FROM   jobs 
                 WHERE  job_title = 'Architect'); 

*/




