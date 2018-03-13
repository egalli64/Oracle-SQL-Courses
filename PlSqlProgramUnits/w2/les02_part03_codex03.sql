DECLARE
  v_min_sal NUMBER := 5000;
  
  e_insert_excep EXCEPTION;
  PRAGMA EXCEPTION_INIT(e_insert_excep,-01400);
  
  v_err_code NUMBER;
  v_err_msg VARCHAR2(255);
  
BEGIN
    INSERT INTO employees ( employee_id, first_name, last_name, hire_date, job_id, salary ) 
    VALUES ( employees_seq.NEXTVAL, 'Ruth', 'Cores', current_date, 'AD_ASST', v_min_sal+4000 );
    
    EXCEPTION
      WHEN e_insert_excep THEN
        v_err_code := SQLCODE;
        v_err_msg := SQLERRM;
        DBMS_OUTPUT.PUT_LINE('Insert operation failed because of a runtime errror.');
        DBMS_OUTPUT.PUT_LINE('Error Code: '||v_err_code);
        DBMS_OUTPUT.PUT_LINE('Error Message: '||v_err_msg);
END;
/




