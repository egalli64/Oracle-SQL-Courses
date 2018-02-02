VARIABLE b_emp_salary NUMBER
SET AUTOPRINT ON

-- try it for id 100
DECLARE
    v_empno NUMBER(6) := &empno;
BEGIN
    SELECT salary
    INTO   :b_emp_salary
    FROM   employees
    WHERE  employee_id = v_empno;
END;
/
