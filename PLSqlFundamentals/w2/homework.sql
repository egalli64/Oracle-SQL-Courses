--Oracle MOOC: PL/SQL Fundamentals
--Week 2

--Assignment 1:
--Create an anonymous block that calculates the Provident Fund (PF) contribution
--amount for the faculty whose faculty_id is 105.
--Provident Fund (PF) is 12% of the base salary,
-- and the base salary is 45% of the salary.
--Declare PL/SQL variables v_basic_percent and v_pf_percent to hold
-- these percentage values, and assign the values 45 and 12 respectively.
--Declare two additional variables to hold the values of faculty’s first name and
-- salary. Use %TYPE attribute in this declaration.
--Write a SELECT query to retrieve the first name and salary of the faculty whose
-- faculty_ id is 105.
--Calculate the contribution of the faculty towards PF. Try to use only one
--expression to calculate the PF.
--Write statements to print the values as per the expected output.
set serveroutput on

declare
    c_basic_percent constant simple_float := 0.45;
    c_pf_percent constant simple_float := 0.12;
    v_first_name ad_faculty_details.first_name%type;
    v_salary ad_faculty_details.salary%type;
begin
    select first_name, salary
    into v_first_name, v_salary
    from ad_faculty_details
    where faculty_id = 105;
    
    dbms_output.put_line('Hello ' || v_first_name);
    dbms_output.put_line('Your salary is ' || v_salary);
    dbms_output.put_line('Your contribution to PF is ' || v_salary * 0.45 * 0.12);
end;
/

--Assignment 2: Create a PL/SQL block that selects the maximum department ID
--in the ad_departments table and displays it.
--soln_02_02.sql
set serveroutput on

declare
    v_max_dep_id ad_departments.department_id%type;
begin
    select max(department_id)
    into v_max_dep_id
    from ad_departments;

    dbms_output.put_line('The maximum department id is ' || v_max_dep_id);
end;
/

--Assignment 3: Modify soln_02_02.sql to insert a new record 
--in the ad_departments table with the following values:
--Department ID: maximum department ID in the ad_departments table + 10
--Department Name: Education
--HOD: null

--Print the following in the output:
-- Value of the maximum department id
-- Number of rows inserted into the ad_departments table.
-- New department record that is inserted.
set serveroutput on

declare
    v_max_dep_id ad_departments.department_id%type;
    c_new_dept_name ad_departments.department_name%type := 'Education';
    c_id_gap constant simple_integer := 10;
begin
    select max(department_id)
    into v_max_dep_id
    from ad_departments;

    dbms_output.put_line('The maximum department id is ' || v_max_dep_id);
    insert into ad_departments (department_id, department_name)
    values (v_max_dep_id + c_id_gap, c_new_dept_name);
    
    dbms_output.put_line('Inserted rows in table: ' || SQL%ROWCOUNT);
end;
/

select *
from ad_departments
where department_id = (select max(department_id) from ad_departments);

--Assignment 4: Update the HOD value for the new record (inserted into the
--ad_departments table in the above assignment) to 'JEN YAM'. Print the updated
--record.
declare
    v_max_dep_id ad_departments.department_id%type;
    c_new_hod ad_departments.hod%type := 'JEN YAM';
begin
    select max(department_id)
    into v_max_dep_id
    from ad_departments;

    update ad_departments
    set hod = c_new_hod
    where department_id = v_max_dep_id;
end;
/

select *
from ad_departments
where department_id = (select max(department_id) from ad_departments);


-- cleanup 3 & 4
rollback;

--Assignment 5:
--Execute the following command to create the messages table.

CREATE TABLE messages (results VARCHAR2(80));

--Write a PL/SQL block to insert numbers 1 through 10 excluding 6 and 8,
-- into the messages table.
--Write a select query outside the PL/SQL block to print the numbers from the
-- messages table.

begin
    for i in 1 .. 10 loop
        if i not in (6, 8) then
            insert into messages values(i);
        end if;
    end loop;
end;
/

select *
from messages;

-- cleanup
drop table messages;
