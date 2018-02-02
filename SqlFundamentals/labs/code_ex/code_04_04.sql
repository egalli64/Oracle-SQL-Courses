--Code examples for Lesson 4: Part 4: Creating Tables

--Uncomment code below to run the code for example 1
/*

CREATE TABLE dept
        (deptno      NUMBER(2),
         dname       VARCHAR2(14),
         loc         VARCHAR2(13),
         create_date DATE DEFAULT SYSDATE);

---------------------------------------------------------------------------------

DESCRIBE dept;

*/

--Uncomment code below to run the code for example 2
/*

INSERT INTO dept(dname, loc)
VALUES('User Assist', 'Boston' ) ;


*/


--Uncomment code below to run the code for example 3
/*

SELECT *
FROM dept;


*/