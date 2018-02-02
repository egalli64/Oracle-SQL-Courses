-- Oracle MOOC: SQL Fundamentals
-- Homework for Lesson 4
-- Assignment 3

select * from regions;

--1. Grant another user query privilege on your table.
--Then, verify whether that user can use the privilege.
--Note: For this exercise, open another SQL Developer session and connect as a
--different user. For example, if you are currently using ora1, open another SQL
--Developer session and connect as ora22.

-- (a) Grant another user (for example, ora22) privilege to view records in
--your REGIONS table. Include an option for this user to further grant this
--privilege to other users.

grant select
on regions
to ora22
with grant option;

-- (b) Have the user query your REGIONS table.
-- (c) Have the user pass on the query privilege to a third user, ora23.
-- see sheet 3-22

-- (d) Take back the privilege from the user who performs step b.
revoke select
on regions
from ora22;

--2. Grant another user query and data manipulation privileges on your COUNTRIES
--table. Make sure that the user cannot pass on these privileges to other users.
grant select, insert, update
on countries
to ora22;

--3. Take back the privileges on the COUNTRIES table granted to another user.
revoke select, insert, update
on countries
from ora22;

--4. Grant another user access to your DEPARTMENTS table. Have the user grant you
--query access to his or her DEPARTMENTS table.
grant select
on departments
to ora22;

select * from departments order by department_id;
select * from ora22.departments order by department_id;

revoke select
on departments
from ora22;

-- blah blah blah