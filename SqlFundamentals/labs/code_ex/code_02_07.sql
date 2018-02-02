--Code examples for Lesson 2: Part 7: Understanding Conversion Functions

--Uncomment code below to run the code for example 1
/*
SELECT employee_id, TO_CHAR(hire_date, 'MM/YY') Month_Hired
FROM   employees
WHERE  last_name = 'Higgins';
*/

--Uncomment code below to run the code for example 2
/*
SELECT last_name,
       TO_CHAR(hire_date, 'fmDD Month YYYY')
       AS HIREDATE
FROM   employees;
*/

--Uncomment code below to run the code for example 3
/*
SELECT  last_name,
	TO_CHAR(hire_date, 
		'fmDdspth "of" Month YYYY fmHH:MI:SS AM')
	HIREDATE
FROM    employees;
*/

--Uncomment code below to run the code for example 4
/*
SELECT TO_CHAR(salary, '$99,999.00') SALARY
FROM   employees;
*/

--Uncomment code below to run the code for example 5
/*
SELECT last_name, hire_date
FROM   employees
WHERE  hire_date = TO_DATE('May  24, 2015', 'fxMonth DD, YYYY');
*/

