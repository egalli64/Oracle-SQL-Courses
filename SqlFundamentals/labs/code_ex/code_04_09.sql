--Code examples for Lesson 4: Part 9: Introducing Data Dictionary Views

--Uncomment code below to run the code for example 1
/*
DESCRIBE dictionary;
*/

--Uncomment code below to run the code for example 2
/*
SELECT *
FROM   dictionary
WHERE  table_name = 'USER_OBJECTS';

*/

--Uncomment code below to run the code for example 3
/*
SELECT table_name
FROM user_tables;

*/

--Uncomment code below to run the code for example 4
/*
DESCRIBE user_tables;
*/

--Uncomment code below to run the code for example 5
/*
DESCRIBE user_tab_columns;
*/

--Uncomment code below to run the code for example 6
/*
SELECT column_name, data_type, data_length,
       data_precision, data_scale, nullable
FROM   user_tab_columns
WHERE  table_name = 'EMPLOYEES'; 

*/

--Uncomment code below to run the code for example 7
/*
DESCRIBE user_constraints;
*/

--Uncomment code below to run the code for example 8
/*
SELECT constraint_name, constraint_type,
       search_condition, r_constraint_name, 
       delete_rule, status
FROM   user_constraints
WHERE  table_name = 'EMPLOYEES'; 

*/

--Uncomment code below to run the code for example 9
/*
DESCRIBE user_cons_columns;
*/

--Uncomment code below to run the code for example 10
/*
SELECT constraint_name, column_name
FROM   user_cons_columns
WHERE  table_name = 'EMPLOYEES'; 

*/

--Uncomment code below to run the code for example 11
/*
COMMENT ON TABLE employees
IS 'Employee Information';

*/

--Uncomment code below to run the code for example 12
/*
COMMENT ON COLUMN employees.first_name
IS 'First name of the employee';
*/

--Uncomment code below to run the code for example 13
/*
SELECT *
FROM user_tab_comments;
*/

