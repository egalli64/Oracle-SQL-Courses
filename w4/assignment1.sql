-- Oracle MOOC: SQL Fundamentals
-- Homework for Lesson 4
-- Assignment 1

--before starting this task, 
-- execute the cleanup_4a.sql script from the labs/cleanup_scripts folder

--1. Run the lab_04_01.sql script from labs/lab_scripts folder to create
--the MY_EMPLOYEE table. Describe the structure of the MY_EMPLOYEE table
--to identify the column names
desc my_employee;

--2. Create an INSERT statement to add the first row of data to the MY_EMPLOYEE
--table from the following sample data. Do not list the columns in the INSERT
--clause.
--ID, LAST_NAME, FIRST_NAME, USERID, SALARY
-- 1, Patel, Ralph, rpatel, 895
insert into my_employee values (1, 'Patel', 'Ralph', 'rpatel', 895);

--3. Populate the MY_EMPLOYEE table with the second row of the sample data from
--the preceding list. This time, list the columns explicitly in the INSERT clause.
--ID, LAST_NAME, FIRST_NAME, USERID, SALARY
-- 2, Dancs, Betty, bdancs, 860
insert into my_employee(ID, LAST_NAME, FIRST_NAME, USERID, SALARY)
values(2, 'Dancs', 'Betty', 'bdancs', 860);

--4. Confirm your addition to the table
select * from my_employee;

--5. Write an INSERT statement in a dynamic reusable script file to load the next two
--rows of sample data into the MY_EMPLOYEE table. The script should prompt for
--all the columns (ID, LAST_NAME, FIRST_NAME, USERID, and SALARY).
--hw4_task1_05.sql file.
--ID, LAST_NAME, FIRST_NAME, USERID, SALARY
--3, Biri, Ben, bbiri, 1100
--4, Newman, Chad, cnewman, 750
insert into my_employee(ID, LAST_NAME, FIRST_NAME, USERID, SALARY)
values(&id, '&last', '&first', '&uid', &salary);

--7. Confirm your additions to the table and make the data additions permanent.
select * from my_employee;
commit;

--8. Change the last name of employee 3 to Drexler
update my_employee
set last_name = 'Drexler'
where id = 3;

--9. Change the salary to $1,000 for all employees who have a salary less than $900.
update my_employee
set salary = 1000
where salary < 900;

--10. Verify your changes to the table.
select * from my_employee;

--11. Delete Betty Dancs from the MY_EMPLOYEE table. Confirm your changes
delete from my_employee
where first_name = 'Betty' and last_name = 'Dancs';

select * from my_employee;

--12. Commit all pending changes
commit;

--13. Populate the table with the last row of the sample data listed in step 3
--by using the statements in the script that you created in step 6.
--Run the statements in the script.
--Note: Perform the steps (15-21) in one session only.
--5, Ropeburn, Audrey, aropebur, 1550

-- a plain script is, in my opinion, more handy here
insert into my_employee(ID, LAST_NAME, FIRST_NAME, USERID, SALARY)
values(5, 'Ropeburn', 'Audrey', 'aropebur', 1550);

--14. Confirm your addition to the table.
select * from my_employee;

--15. Mark an intermediate point in the processing of the transaction.
savepoint point15;

--16. Delete all the rows from the MY_EMPLOYEE table.
delete from my_employee;

--17. Confirm that the table is empty.
select count(*) from my_employee;

--18. Discard the most recent DELETE operation without discarding the earlier INSERT
--operation.
rollback to point15;

--19. Confirm that the new row is still intact.
select * from my_employee;

--20. Make the data addition permanent.
commit;

--21. Modify the hw4_task1_05.sql script such that the USERID is generated
--automatically by concatenating the first letter of the first name and the first seven
--characters of the last name. The generated USERID must be in lowercase.
--Therefore, the script should not prompt for the USERID
--hw4_task1_21.sql
-- 6 Anthony Mark manthony 1230
insert into my_employee(ID, LAST_NAME, FIRST_NAME, USERID, SALARY)
values(&id, '&&last', '&&first', 
    lower(
        substr('&&first', 0, 1) || '&&last'),
    &salary);
undefine first;
undefine last;

--23. Confirm that the new row was added with the correct USERID.
select * from my_employee where id = 6;

