--Code examples for Lesson 4: Part 2: Inserting Data

--Uncomment code below to run the code for example 1a
/*
INSERT INTO departments(department_id, 
       department_name, manager_id, location_id)
VALUES (70, 'Public Relations', 100, 1700);
*/

--Uncomment code below to run the code for example 1b
/*
	SELECT *
	FROM departments
	WHERE department_id = 70;
*/
--Uncomment code below to run the code for example 2
/*
DESCRIBE departments;
*/

--Uncomment code below to run the code for example 3a
/*
INSERT INTO	departments (department_id, department_name)
VALUES  (30, 'Purchasing');

*/

--Uncomment code below to run the code for example 3b
/*
	SELECT *
	FROM departments
	WHERE department_id = 30;
*/

--Uncomment code below to run the code for example 4a
/*
INSERT INTO	departments
VALUES (100, 'Finance', NULL, NULL);
*/

--Uncomment code below to run the code for example 4b
/*
SELECT * 
FROM departments
WHERE department_id = 100;
*/

--Uncomment code below to run the code for example 5a
/*
INSERT INTO employees (employee_id, 
                 first_name, last_name, 
                 email, phone_number,
                 hire_date, job_id, salary, 
                 commission_pct, manager_id,
                 department_id)
VALUES		   (113, 
                 'Louis', 'Popp', 
                 'LPOPP', '515.124.4567', 
                 SYSDATE, 'AC_ACCOUNT', 6900, 
                 NULL, 205, 110);
*/

--Uncomment code below to run the code for example 5b
/*
SELECT employee_id, last_name, job_id, hire_date,    commission_pct
FROM   employees
WHERE  employee_id = 113;
*/

--Uncomment code below to run the code for example 6
/*
INSERT INTO departments 
           (department_id, department_name, location_id)
VALUES     (&department_id, '&department_name', &location);
*/

--Uncomment code below to run the code for example 7
/*
--Code to create sales_reps table. Ensure to run this statement to create the sales_reps table before inserting rows into it.

CREATE TABLE sales_reps AS
    SELECT employee_id id, last_name name, salary, commission_pct
    FROM   employees 
    WHERE 1=2;
---------------------------------------------------------------------------------------------

INSERT INTO sales_reps(id, name, salary, commission_pct)
 SELECT employee_id, last_name, salary, commission_pct
  FROM   employees
  WHERE  job_id LIKE '%REP%';
*/

--Uncomment code below to run the code for example 8
/*
--Code to create copy_emp table. Ensure to run this statement to create the copy_emp table before inserting rows into it.
CREATE TABLE copy_emp
                    AS SELECT * FROM employees
                          WHERE 1=2;
--------------------------------------------------------------------------

INSERT INTO copy_emp
   SELECT * 
   FROM   employees;

*/

