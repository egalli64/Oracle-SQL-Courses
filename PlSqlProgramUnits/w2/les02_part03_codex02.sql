SET SERVEROUTPUT ON;

DECLARE
    v_min_sal NUMBER := 5000;

    -- internally defined exception  
    e_insert_excep EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_insert_excep,-01400);
BEGIN
    INSERT INTO employees ( employee_id, first_name, last_name, hire_date, job_id, salary ) 
    VALUES ( employees_seq.NEXTVAL, 'Ruth', 'Cores', current_date, 'AD_ASST', v_min_sal+4000 );
    
    EXCEPTION WHEN e_insert_excep THEN
        DBMS_OUTPUT.PUT_LINE('INSERT OPERATION FAILED...');
END;
/




