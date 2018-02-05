-- SQL%ROWCOUNT to check the number of rows affected from the latest SQL command
SET SERVEROUTPUT ON;

-- check a ST_CLERK salary
select employee_id, first_name, last_name, salary
from employees
where employee_id = (
    select max(employee_id)
    from employees
    where job_id = 'ST_CLERK');

DECLARE
    c_increase constant employees.salary%type := 800;
BEGIN
    -- UPDATE query to increment the salary of all employees with job_title = 'ST_CLERK' by 800.
    UPDATE employees
    SET salary = salary + c_increase
    WHERE job_id = 'ST_CLERK';
    
    DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' rows updated.');
END;
/

select employee_id, first_name, last_name, salary
from employees
where employee_id = (
    select max(employee_id)
    from employees
    where job_id = 'ST_CLERK');

rollback;

select employee_id, first_name, last_name, salary
from employees
where employee_id = (
    select max(employee_id)
    from employees
    where job_id = 'ST_CLERK');
