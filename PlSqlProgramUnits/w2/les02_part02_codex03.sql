DECLARE
    v_emp_record   employees%rowtype;
    v_last_name    employees.last_name%type;
BEGIN
  
  /* Let's consider a case where v_last_name = 'green'.It is prefixed and suffixed with the SQL wild character % */
    v_last_name := '%'||'green'||'%';
    SELECT *
    INTO v_emp_record
    FROM employees
    WHERE lower(last_name) like lower(v_last_name);
    DBMS_OUTPUT.PUT_LINE(v_emp_record.first_name);
    
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('The search returns no results.');
      WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Your select statement retrieved multiple rows. Consider using a cursor.');  
END;
/