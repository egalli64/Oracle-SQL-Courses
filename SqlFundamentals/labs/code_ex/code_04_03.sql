--Code examples for Lesson 4: Part 3: Modifying and Deleting Data

--Uncomment code below to run the code for example 1
/*

UPDATE employees
SET department_id = 80
WHERE department_id = 60;


*/

--Uncomment code below to run the code for example 2a
/*

UPDATE copy_emp
SET department_id = 80;


*/

--Uncomment code below to run the code for example 2b
/*
SELECT * 
FROM copy_emp;

*/

--Uncomment code below to run the code for example 3
/*
UPDATE employees
	SET job_id = 'IT_PROG', commission_pct = NULL
	WHERE employee_id = 113; 
*/

--Uncomment code below to run the code for example 4a
/*
UPDATE   employees
SET      (job_id,salary)  = (SELECT  job_id,salary
                    	FROM    employees 
                    WHERE   employee_id = 205)
         WHERE    employee_id    =  103;
*/

--Uncomment code below to run the code for example 4b
/*
SELECT employee_id, job_id, salary
FROM employees
WHERE employee_id IN (103, 205);
*/

--Uncomment code below to run the code for example 5
/*
UPDATE  copy_emp
SET     department_id  =  (SELECT department_id
                           FROM employees
                           WHERE employee_id = 100)
WHERE   job_id         =  (SELECT job_id
                           FROM employees
                           WHERE employee_id = 200); 

*/

--Uncomment code below to run the code for example 6a
/*
DELETE FROM departments
 WHERE  department_name = 'Contracting';

*/

--Uncomment code below to run the code for example 6b
/*
SELECT  *
FROM    departments
WHERE   department_name = 'Contracting';
*/

--Uncomment code below to run the code for example 7
/*
DELETE from copy_emp;  
*/

--Uncomment code below to run the code for example 8
/*

-- Before deleting the row, insert the row into the EMPLOYEES table.

INSERT INTO employees(employee_id, 
                      first_name, last_name, 
                      email, phone_number,
                      hire_date, job_id, salary, 
                      commission_pct, manager_id,
                      department_id)
            VALUES   (207, 
                      'Eva', 'Jones', 
                      'EJONES', '515.124.4666', 
                       SYSDATE, 'AC_ACCOUNT', 3300, 
                       NULL, 205, 70);

-------------------------------------------------------------------------------------------------------------
DELETE FROM employees
WHERE  department_id IN
                (SELECT department_id
                 FROM   departments
                 WHERE  department_name 
                 LIKE '%Public%');
*/
