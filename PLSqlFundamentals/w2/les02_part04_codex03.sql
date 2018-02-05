-- careful! if the value is null, simply take the else branch

DECLARE
    v_bonus NUMBER(8,2) NOT NULL := 0;
    v_service_period NUMBER;
    v_salary NUMBER(8,2) := 11000;
BEGIN
    IF v_service_period = 10 THEN
        -- This employee is with the organization since its inception.
        v_bonus := v_salary * 0.5;
    ELSIF v_service_period < 10 and v_service_period >= 5 THEN 
        -- This employee has a service period between 5 to 9 years.
        v_bonus := v_salary * 0.25;
    ELSE
        -- This employee has a service period less than 5 years.
        v_bonus := v_salary * 0.1;
    END IF;
      
    DBMS_OUTPUT.PUT_LINE('Service Period is ' || NVL(to_char(v_service_period), 'not set!'));
    DBMS_OUTPUT.PUT_LINE('Bonus amount = '||v_bonus);
END;
/