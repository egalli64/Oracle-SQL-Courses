SET SERVEROUTPUT ON;

DECLARE
v_emp_rec employees%ROWTYPE;
BEGIN
-- Record 1 which is valid
v_emp_rec.first_name := 'RUTH';
v_emp_rec.last_name := 'CORES';
v_emp_rec.job_id := 'ST_CLERK';
v_emp_rec.salary := 4000;
add_employee(v_emp_rec);

-- Record 2 which results in user-defined exception - salary out of range
v_emp_rec.first_name := 'CLARENCE';
v_emp_rec.last_name := 'ANN';
v_emp_rec.job_id := 'SA_REP';
v_emp_rec.salary := 25000;
add_employee(v_emp_rec);

-- Record 2 which results in predefined exception - no data found
v_emp_rec.first_name := 'JOSEPH';
v_emp_rec.last_name := 'ANTHONY';
v_emp_rec.job_id := 'SA_MGR';
v_emp_rec.salary := 20000;
add_employee(v_emp_rec);

END;
/

/* Uncomment & execute the below query to verify how many rows got inserted into the employees table as a result of executing the above block. */
/* SELECT *
   FROM employees
   WHERE hire_date = SYSDATE;
*/


