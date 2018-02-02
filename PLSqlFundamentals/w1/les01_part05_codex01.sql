SET SERVEROUTPUT ON

DECLARE
    v_myname   VARCHAR(20) := 'Steven';
BEGIN
    dbms_output.put_line('My name is: ' || v_myname);
    v_myname := 'John';
    dbms_output.put_line('My name is: ' || v_myname);
END;
/