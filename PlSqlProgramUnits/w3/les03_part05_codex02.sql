CREATE OR REPLACE TRIGGER secure_employees
BEFORE INSERT OR UPDATE OR DELETE ON employees
BEGIN

  IF TO_CHAR (SYSDATE, 'HH24:MI') NOT BETWEEN '08:00' AND '18:00'
     OR TO_CHAR (SYSDATE, 'DY') IN ('SAT', 'SUN') THEN
       IF DELETING THEN 
         RAISE_APPLICATION_ERROR(-20502,'You may delete from EMPLOYEES table'||
                                 'only during normal business hours.');
       ELSIF INSERTING  THEN 
         RAISE_APPLICATION_ERROR(-20500,'You may insert into EMPLOYEES table'|| 
                                 'only during normal business hours.');
       ELSIF UPDATING  ('SALARY') THEN
         RAISE_APPLICATION_ERROR(-20503, 'You may update SALARY only normal during business hours.');
       ELSE 
         RAISE_APPLICATION_ERROR(-20504,'You may update EMPLOYEES table only during'||
                                 ' normal business hours.');
      END IF;
  END IF;

END;

-- Uncomment and execute the below queries anytime after 18:00 and before 08:00 (Monday to Friday) or on a Saturday or Sunday, to test each event of this trigger.

-- TO TEST THE UPDATE OF (SALARY). 
-- Expected output: You may update SALARY only normal during business hours.
--UPDATE employees
--SET salary = 10500
--WHERE employee_id = 150;

-- TO TEST ANY COLUMN UPDATE.
-- Expected output: You may update EMPLOYEES table only during normal business -- -- hours.
--UPDATE employees
--SET job_id = 'ST_MAN'
--WHERE employee_id = 150;

-- TO TEST ROW DELETE.
-- Expected output: You may delete from EMPLOYEES table only during normal -- -- -- business hours.
--DELETE FROM employees WHERE employee_id = 150;