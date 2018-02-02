--Code examples for Lesson 4: Part 8: Controlling User Access

--Uncomment code below to run the code for example 1
/*
CREATE USER  demo
IDENTIFIED BY demo;

*/

--Uncomment code below to run the code for example 2
/*
GRANT  create session, create table, 
       create sequence, create view
TO     demo;

*/

--Uncomment code below to run the code for example 3
/*
CREATE ROLE manager; 

GRANT create table, create view 		  
TO manager;  

GRANT manager TO demo;      

*/

--Uncomment code below to run the code for example 4
/*
ALTER USER demo         			  
IDENTIFIED BY employ;
*/

--Uncomment code below to run the code for example 5
/*
GRANT  select
ON     employees
TO     demo
WITH GRANT OPTION;
*/

--Uncomment code below to run the code for example 6
/*
GRANT  update (department_name, location_id)
ON     departments
TO     demo, manager;

*/

--Uncomment code below to run the code for example 7
/*
REVOKE  select
ON      employees
FROM    demo;

*/


