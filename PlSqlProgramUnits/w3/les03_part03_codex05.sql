SET SERVEROUTPUT ON;
DECLARE
  v_input_jobid employees.job_id%TYPE := 'SA_REP';
  v_input_sal employees.salary%TYPE := 25000;  
  v_jobs_rec JOBS%ROWTYPE;     
    
BEGIN

    -- validating input salary. 
    SELECT * INTO v_jobs_rec FROM jobs WHERE job_id = v_input_jobid;
    
    IF v_input_sal < v_jobs_rec.min_salary OR v_input_sal > v_jobs_rec.max_salary  THEN    
      RAISE user_exceptions_pkg.e_salary_out_of_range;    
    END IF;
    
    -- If exception is not raised, insert the record into employees table.
    INSERT INTO employees ( employee_id, first_name, last_name, hire_date, job_id, salary ) 
    VALUES ( employees_seq.NEXTVAL, 'Ruth', 'Cores', current_date, v_input_jobid, v_input_sal );
    
    EXCEPTION
      WHEN user_exceptions_pkg.e_salary_out_of_range THEN        
        DBMS_OUTPUT.PUT_LINE('Input salary not in valid range for the input job id.');
        
END;
/
