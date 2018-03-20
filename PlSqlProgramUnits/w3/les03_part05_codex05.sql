CREATE OR REPLACE TRIGGER salary_check
BEFORE UPDATE OF salary ON employees
FOR EACH ROW
CALL salary_check(:NEW.salary, :OLD.job_id)

-- Uncomment and execute the below query to test each event of this trigger.
-- Expected output: New salary value not within valid range!
--UPDATE employees
--SET salary = 20000
--WHERE employee_id = 150;
