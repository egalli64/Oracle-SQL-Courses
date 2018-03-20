CREATE OR REPLACE TRIGGER secure_employees
BEFORE INSERT OR UPDATE OR DELETE ON employees
BEGIN

  IF TO_CHAR (SYSDATE, 'HH24:MI') NOT BETWEEN '08:00' AND '18:00'
        OR TO_CHAR (SYSDATE, 'DY') IN ('SAT', 'SUN') THEN
	RAISE_APPLICATION_ERROR (-20205,
		'You may only make changes during normal office hours');
  END IF;

END;

-- Uncomment and execute the below query anytime after 18:00 and before 08:00 (Monday to Friday) or on a Saturday or Sunday, to test this trigger.

--UPDATE employees
--SET salary = 10500
--WHERE employee_id = 150;
