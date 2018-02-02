--Code examples for Lesson 4: Part 6: Modifying Data Structures

--Uncomment code below to run the code for example 1a
/*
ALTER TABLE dept80
ADD   (job_id VARCHAR2(9));


SELECT * 
FROM dept80;
*/

--Uncomment code below to run the code for example 1b
/*
ALTER TABLE dept80
ADD   (job_id VARCHAR2(9) DEFAULT 'UNDEFINED');
*/

--Uncomment code below to run the code for example 2a
/*
DESCRIBE dept80;
*/

--Uncomment code below to run the code for example 2b
/*
ALTER TABLE dept80
MODIFY  (last_name VARCHAR2(30));
*/

--Uncomment code below to run the code for example 3a
/*
ALTER TABLE  dept80
DROP (job_id); 
*/

--Uncomment code below to run the code for example 3b
/*
ALTER TABLE  dept80
DROP (job_id) CASCADE CONSTRAINTS; 
*/


--Uncomment code below to run the code for example 4a
/*
ALTER TABLE  dept80
SET   UNUSED (job_id);

*/

--Uncomment code below to run the code for example 4b
/*
ALTER TABLE  dept80
DROP  UNUSED COLUMNS;
*/


--Uncomment code below to run the code for example 5a
/*
ALTER TABLE dept80 READ ONLY;

INSERT INTO dept80
VALUES (111, 'Jill', 10500, '05-May-2017');

*/

--Uncomment code below to run the code for example 5b
/*
RENAME dept80 to sales_emp;

ALTER TABLE sales_emp READ WRITE;

*/

--Uncomment code below to run the code for example 6a
-- Note: Since we renamed the table to SALES_EMP in the previous statement, create the DEPT80 table again before deleting. 
/*
CREATE TABLE dept80
  AS 
    SELECT  employee_id, last_name, 
            salary*12 ANNSAL, 
            hire_date
    FROM    employees
    WHERE   department_id = 80;


DROP TABLE dept80;
*/

--Uncomment code below to run the code for example 6b
/*
DROP TABLE dept80 PURGE;
*/

