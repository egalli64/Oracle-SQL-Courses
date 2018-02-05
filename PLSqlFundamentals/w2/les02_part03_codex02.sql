-- pl/sql update

-- check a ST_CLERK
SELECT job_id, employee_id, salary
FROM employees
WHERE employee_id = 125;

DECLARE
    sal_increase employees.salary%type := 800;
BEGIN
    -- UPDATE query to increment the salary of all employees with job_title = 'ST_CLERK' by 800.
    UPDATE employees
    SET salary = salary + sal_increase
    WHERE job_id = 'ST_CLERK';
END;
/

SELECT job_id, employee_id, salary
FROM employees
WHERE employee_id = 125;

rollback;

SELECT job_id, salary
FROM employees
WHERE employee_id = 125;
