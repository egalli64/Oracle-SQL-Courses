--Code examples for Lesson 2: Part 6: Working with Date Functions

--Uncomment code below to run the code for example 1
/*
SELECT last_name, hire_date
FROM   employees
WHERE  hire_date < '01-FEB-2013'; 
*/

--Uncomment code below to run the code for example 2
/*
SELECT sysdate
FROM   dual;
*/

--Uncomment code below to run the code for example 3
/*
SELECT SESSIONTIMEZONE, CURRENT_DATE 
FROM DUAL; 
*/

--Uncomment code below to run the code for example 4
/*
SELECT last_name, (SYSDATE-hire_date)/7 AS WEEKS
FROM   employees
WHERE  department_id = 90;
*/

--Uncomment code below to run the code for example 5
/*
SELECT employee_id, hire_date, MONTHS_BETWEEN (SYSDATE, hire_date) TENURE, 
	   ADD_MONTHS (hire_date, 6) REVIEW,  NEXT_DAY (hire_date, 'FRIDAY'), 
	   LAST_DAY(hire_date) 
FROM employees 
WHERE  MONTHS_BETWEEN (SYSDATE, hire_date) < 150;
*/

