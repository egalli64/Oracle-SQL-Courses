-- record
SET SERVEROUTPUT ON

DECLARE
    TYPE rec_emp IS RECORD (
        first_name employees.first_name%TYPE,
        last_name employees.last_name%TYPE,
        jid employees.job_id%TYPE,
        salary employees.salary%TYPE );
    v_emprec rec_emp;
BEGIN
    SELECT first_name, last_name, job_id, salary
    INTO v_emprec 
    FROM employees 
    WHERE employee_id = 100;

    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_emprec.first_name || ' ' || v_emprec.last_name);
    DBMS_OUTPUT.PUT_LINE('Job id: ' || v_emprec.jid);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || v_emprec.salary);
END;
