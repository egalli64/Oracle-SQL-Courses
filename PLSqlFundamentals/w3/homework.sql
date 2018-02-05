--Oracle MOOC: PL/SQL Fundamentals
--Week 3

--Assignment 1: Write a PL/SQL block to print information about department 30.
--Use a PL/SQL record based on the structure of the AD_DEPARTMENTS table.
SET SERVEROUTPUT ON

declare
    rec_dept ad_departments%rowtype;
    c_dep_id constant ad_departments.department_id%type := 30;
begin
    select *
    into rec_dept
    from ad_departments
    where department_id = c_dep_id;

    dbms_output.put_line('Department id: ' || rec_dept.department_id);
    dbms_output.put_line('Department name: ' || rec_dept.department_name);
    dbms_output.put_line('HOD: ' || rec_dept.hod);
end;
/

--Assignment 4: Create a PL/SQL block to declare a cursor named c_parent_cursor,
--that retrieves the parent ID, father’s name, student ID, first name, 
--and student registration year. 
--Print the records from the cursor using a cursor FOR loop.
SET SERVEROUTPUT ON

declare
    cursor c_parent_cursor is
        select parent_id, p.father_name, s.student_id, s.first_name, s.student_reg_year
        from ad_student_details s natural join ad_parent_information p;
begin
    for rec in c_parent_cursor loop
        dbms_output.put(rec.parent_id || ', ');
        dbms_output.put(rec.father_name || ', ');
        dbms_output.put(rec.student_id || ', ');
        dbms_output.put(rec.first_name || ', ');
        dbms_output.put_line(rec.student_reg_year);
    end loop;
end;
/

--Assignment 4 (bis)
--Create a PL/SQL block to declare a cursor named c_student_cursor,
-- retrieves the student_id, first_name, and no_of_days_off.
--Use the cursor FOR loop to operate on the data retrieved.
--If the no_of_days_off is greater than 30, display the message 
-- <<first_name>> is Not Eligible for exam
--Otherwise, display the message
-- <<first_name>> is Eligible for exam
SET SERVEROUTPUT ON

declare
    cursor c_student_cursor is
        -- improvised solution, since no days_off in the data available
        select student_id, first_name, student_reg_year
        from ad_student_details;
begin
    for rec in c_student_cursor loop
        dbms_output.put(rec.first_name || ' is');
        if rec.student_reg_year > '01-JAN-15' then
            dbms_output.put(' not');
        end if;
        dbms_output.put(' eligible for exams');
        dbms_output.put_line(': ' || rec.student_reg_year);
    end loop;
end;
/


