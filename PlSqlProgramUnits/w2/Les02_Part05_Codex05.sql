SET SERVEROUTPUT ON;

DECLARE
v_emp_sal employees.salary%TYPE;

BEGIN
-- valid employee
v_emp_sal := get_emp_sal(100);
DBMS_OUTPUT.PUT_LINE(' salary for the employee with ID 100 is: '|| v_emp_sal);

-- invalid employee
v_emp_sal := get_emp_sal(300);
DBMS_OUTPUT.PUT_LINE(' salary for the employee with ID 100 is: '|| v_emp_sal);

END;
/

