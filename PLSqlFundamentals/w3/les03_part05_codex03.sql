-- cursor FOR loops using subquery
SET SERVEROUTPUT ON;

DECLARE
    v_bonus NUMBER(8,2) := 0;
BEGIN  
    FOR emp_record IN (SELECT employee_id, salary, hire_date FROM copy_emp2) LOOP
        v_bonus := CASE 
        WHEN ROUND((MONTHS_BETWEEN(SYSDATE, emp_record.hire_date) / 12), 0) = 10 THEN               
            emp_record.salary * 0.5
        WHEN ROUND((MONTHS_BETWEEN(SYSDATE, emp_record.hire_date) / 12), 0) > 5 AND 
             ROUND((MONTHS_BETWEEN(SYSDATE, emp_record.hire_date) / 12), 0) < 10 THEN           
            emp_record.salary * 0.25
        ELSE          
            emp_record.salary * 0.1
        END;
        DBMS_OUTPUT.PUT_LINE('Employee ' || emp_record.employee_id || ' bonus: ' || v_bonus);
    END LOOP;
END;
/

