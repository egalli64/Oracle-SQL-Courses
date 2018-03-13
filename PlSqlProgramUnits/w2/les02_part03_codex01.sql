SET SERVEROUTPUT ON;

DECLARE
  v_min_sal NUMBER := 5000; 
  
BEGIN
    -- ORA-01400: cannot insert NULL into ("ORA1"."EMPLOYEES"."EMAIL")
    INSERT INTO employees (
    employee_id,
    first_name,
    last_name,
    hire_date,
    job_id,
    salary
) VALUES (
    employees_seq.NEXTVAL,
    'Ruth',
    'Cores',
    current_date,
    'AD_ASST',
    v_min_sal + 4000
);
    
END;
/




