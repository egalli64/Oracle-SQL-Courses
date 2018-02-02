-- Oracle MOOC: SQL Fundamentals
-- Homework for Lesson 4
-- Assignment 4

--1. Query the USER_TABLES data dictionary view to see information about the tables
--that you own.
select table_name from user_tables;

--2. Query the ALL_TABLES data dictionary view to see information about all the
--tables that you can access. Exclude the tables that you own.

select table_name, owner
from all_tables
where owner != 'ORA1';

--3. For a specified table, create a script that reports the column names, data types,
--and data types' lengths, as well as whether nulls are allowed. Prompt the user to
--enter the table name. Give appropriate aliases to the DATA_PRECISION and
--DATA_SCALE columns. 
--hw4_task4_03.sql
SELECT column_name, data_type, data_length,
       data_precision as precision,
       data_scale as scale,
       nullable
FROM   user_tab_columns
WHERE  table_name = '&table_name';
-- DEPARTMENTS

--4. Create a script that reports the column name, constraint name, constraint type,
--search condition, and status for a specified table. You must join the
--USER_CONSTRAINTS and USER_CONS_COLUMNS tables to obtain all this
--information. Prompt the user to enter the table name. 
--hw4_task4_04.sql
SELECT column_name, data_type, data_length,
       data_precision as precision,
       data_scale as scale,
       nullable
FROM   user_tab_columns utc join user_constraints uc
ON utc.table_name = uc.table_name
WHERE  table_name = '&table_name'; 

select * from user_tab_columns where table_name = 'DEPARTMENTS';
-- Oracle MOOC: SQL Fundamentals
-- Homework for Lesson 4
-- Assignment 4

--1. Query the USER_TABLES data dictionary view to see information about the tables
--that you own.
select table_name from user_tables;

--2. Query the ALL_TABLES data dictionary view to see information about all the
--tables that you can access. Exclude the tables that you own.

select table_name, owner
from all_tables
where owner != 'ORA1';

--3. For a specified table, create a script that reports the column names, data types,
--and data types' lengths, as well as whether nulls are allowed. Prompt the user to
--enter the table name. Give appropriate aliases to the DATA_PRECISION and
--DATA_SCALE columns. 
--hw4_task4_03.sql
select column_name, data_type, data_length,
       data_precision as precision,
       data_scale as scale,
       nullable
from   user_tab_columns
where  table_name = '&table_name';
-- DEPARTMENTS

--4. Create a script that reports the column name, constraint name, constraint type,
--search condition, and status for a specified table. You must join the
--USER_CONSTRAINTS and USER_CONS_COLUMNS tables to obtain all this
--information. Prompt the user to enter the table name. 
--hw4_task4_04.sql
select utc.column_name, uc.constraint_name, uc.constraint_type,
       uc.search_condition, uc.status
from   user_tab_columns utc join user_cons_columns ucc
on utc.table_name = ucc.table_name and utc.column_name = ucc.column_name
join user_constraints uc
on uc.table_name = ucc.table_name and uc.constraint_name = ucc.constraint_name
where uc.table_name = '&table_name'; 

--5. Add a comment to the DEPARTMENTS table. Then query the
--USER_TAB_COMMENTS view to verify that the comment is present.
comment on table DEPARTMENTS is 'Hello';
SELECT COMMENTS FROM user_tab_comments where table_name = 'DEPARTMENTS';

--6. Run the lab_04_06_tab.sql script in the labs/lab_scripts folder as a
--prerequisite for exercises 6 through 9.

--7. Confirm that both the DEPT2 and EMP2 tables are stored in the data dictionary
select table_name
from user_tables
where table_name like '%2';

--8. Confirm that the constraints were added, by querying the USER_CONSTRAINTS
--view. Note the types and names of the constraints.
select constraint_name, constraint_type
from user_constraints
where table_name in ('DEPT2', 'EMP2');

--9. Display the object names and types from the USER_OBJECTS data dictionary
--view for the EMP2 and DEPT2 tables.
select object_name, object_type
from user_objects
where object_name in ('DEPT2', 'EMP2');
