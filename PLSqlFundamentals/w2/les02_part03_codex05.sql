SET SERVEROUTPUT ON;

select employee_id, first_name, last_name, salary
from employees
where employee_id = (
    select max(employee_id)
    from employees
    where job_id = 'ST_CLERK');

DECLARE
    sal_increase   employees.salary%type := 800;
    v_rows_updated VARCHAR2(30);
BEGIN
    -- UPDATE query to increment the salary of all employees with job_title = 'ST_CLERK' by 800.
    UPDATE employees
    SET salary = salary + sal_increase
    WHERE job_id = 'ST_CLERK';
    
    v_rows_updated := (SQL%ROWCOUNT || ' rows updated.');
    DBMS_OUTPUT.PUT_LINE(v_rows_updated);
    
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
