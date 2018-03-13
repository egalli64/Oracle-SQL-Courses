CREATE OR REPLACE PROCEDURE add_employee(
                            p_emp_rec IN OUT employees%ROWTYPE )
IS
  v_jobs_rec JOBS%ROWTYPE;  
  e_salary_out_of_range EXCEPTION;
BEGIN
  -- validating input salary. 
  SELECT * INTO v_jobs_rec FROM jobs WHERE job_id = p_emp_rec.job_id;
    
  IF p_emp_rec.salary < v_jobs_rec.min_salary OR p_emp_rec.salary > v_jobs_rec.max_salary  THEN    
    RAISE e_salary_out_of_range;    
  END IF;
    
  -- If exception is not raised, insert the record into employees table.
  p_emp_rec.employee_id := employees_seq.NEXTVAL;
  p_emp_rec.hire_date := SYSDATE;
  p_emp_rec.email := p_emp_rec.first_name || p_emp_rec.last_name ||'@abc.com';
  
  INSERT INTO employees VALUES p_emp_rec;
  
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('No records found in jobs table for '||p_emp_rec.job_id);
      
    WHEN e_salary_out_of_range THEN        
      DBMS_OUTPUT.PUT_LINE('Input salary not in valid range for the input job id.');

END add_employee;
/





