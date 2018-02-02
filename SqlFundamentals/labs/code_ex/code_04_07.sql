--Code examples for Lesson 4: Part 7: Handling Transactions

--Uncomment code below to run the code for example 1
--Before running the below transaction, create the emp2 table as shown below:
/*
CREATE TABLE emp2
       AS SELECT * FROM employees;
*/

/*
UPDATE emp2 SET salary = 8500
WHERE employee_id = 206;

SAVEPOINT del_emp;

DELETE FROM emp2;

ROLLBACK to del_emp;

DELETE FROM emp2 WHERE employee_id = 113;

SELECT * FROM  emp2 ;

COMMIT;

*/



