-- pl/sql insert into

DECLARE
  v_min_sal SIMPLE_INTEGER := 5000;
BEGIN
    INSERT INTO employees ( employee_id, first_name, last_name, email, hire_date, job_id, salary ) 
    VALUES ( employees_seq.NEXTVAL, 'Bill', 'Cores', 'BCORES', sysdate /* or: current_date*/, 'AD_ASST', v_min_sal + 4000 );
END;
/

SELECT employee_id, first_name, last_name, hire_date, salary 
FROM employees 
WHERE employee_id = (SELECT MAX(employee_id) FROM employees);

--commit;
rollback;

SELECT employee_id, first_name, last_name, hire_date, salary 
FROM employees 
WHERE employee_id = (SELECT MAX(employee_id) FROM employees);
