-- pl/sql delete

SELECT employee_id, first_name, last_name
FROM employees
WHERE first_name = 'Ruth';

DECLARE
    v_empname employees.first_name%type := 'Ruth';
BEGIN
    DELETE 
    FROM employees 
    WHERE first_name = v_empname;

END;
/

SELECT count(employee_id)
FROM employees
WHERE first_name = 'Ruth';

commit;
