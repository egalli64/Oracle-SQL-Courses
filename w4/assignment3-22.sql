-- Oracle MOOC: SQL Fundamentals
-- Homework for Lesson 4
-- Assignment 3

--connected as ora22

--1. Grant another user query privilege on your table.
-- (b) Have the user query your REGIONS table.
select * from ora1.regions;

-- (c) Have the user pass on the query privilege to a third user, ora23.
grant select
on regions
to ora23
with grant option;

--2. Grant another user query and data manipulation privileges on your COUNTRIES
select * from ora1.countries;

--4. Grant another user access to your DEPARTMENTS table. Have the user grant you
--query access to his or her DEPARTMENTS table.
grant select
on departments
to ora1;

revoke select
on departments
from ora1;




