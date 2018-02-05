-- silly names for variables lead to errors
SET SERVEROUTPUT ON

DECLARE
--    hire_date employees.hire_date%TYPE;
    v_hire_date employees.hire_date%TYPE;
--    SYSDATE hire_date%TYPE;
    v_sysdate v_hire_date%TYPE;
--    employee_id employees.employee_id%TYPE := 176;
    v_employee_id employees.employee_id%TYPE := 176;
BEGIN
    SELECT hire_date, SYSDATE
    INTO v_hire_date, v_sysdate
    FROM employees
    WHERE employee_id = v_employee_id;

    dbms_output.put('Hired on ' || v_hire_date);
    dbms_output.put_line(', today is ' || v_sysdate);
END;
/