CREATE OR REPLACE PROCEDURE salary_check( p_salary employees.salary%TYPE,
                                          p_jobid employees.job_id%TYPE )
IS
v_job_rec jobs%ROWTYPE;

BEGIN

  SELECT * INTO v_job_rec FROM jobs WHERE job_id = p_jobid;
  
  IF p_salary < v_job_rec.min_salary 
     OR p_salary > v_job_rec.max_salary THEN     
       RAISE_APPLICATION_ERROR(-20201,'New salary value not within valid range!');
  END IF;

END;

