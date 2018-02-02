SET SERVEROUTPUT ON

DECLARE
    v_new_empid   NUMBER;
BEGIN
    v_new_empid := employees_seq.nextval;
    dbms_output.put_line('The new employee ID is: ' || v_new_empid);
END;
/