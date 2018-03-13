CREATE OR REPLACE FUNCTION get_emp_sal(p_emp_id IN employees.employee_id%TYPE)
RETURN NUMBER
IS  
  v_emp_sal employees.salary%TYPE := 0;
BEGIN
  
  SELECT salary 
  INTO v_emp_sal 
  FROM employees 
  WHERE employee_id = p_emp_id;    
   
  RETURN v_emp_sal;
  
  EXCEPTION
    WHEN NO_DATA_FOUND THEN         
      RAISE_APPLICATION_ERROR(-20022,'No such employee exists!');  
    
END get_emp_sal;
/




