CREATE OR REPLACE TRIGGER salary_check
BEFORE UPDATE OF salary ON employees
FOR EACH ROW
DECLARE

v_job_rec jobs%ROWTYPE;

BEGIN

  SELECT * INTO v_job_rec FROM jobs WHERE job_id = :OLD.job_id;
  
  IF :NEW.salary < v_job_rec.min_salary 
     OR :NEW.salary > v_job_rec.max_salary THEN     
       RAISE_APPLICATION_ERROR(-20201,'New salary value not within valid range!');
  END IF;

END;

-- Uncomment and execute the below queries anytime after 18:00 and before 08:00 (Monday to Friday) or on a Saturday or Sunday, to test each event of this trigger.
-- Expected output: New salary value not within valid range!
--UPDATE employees
--SET salary = 20000
--WHERE employee_id = 150;
