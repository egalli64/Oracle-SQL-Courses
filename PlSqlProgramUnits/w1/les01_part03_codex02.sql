SET SERVEROUTPUT ON;

BEGIN
--    add_employee('RUTH','CORES','ST_REP',6100,'RC@email.com');
--    add_employee('RUTH','CORES','SA_REP',6100,'RC@email.com');  
    add_emp('RUTH','CORES','ST_REP',6100,'RC@email.com');
    add_emp('RUTH','CORES','SA_REP',6100,'RC@email.com');  
END;
/

SELECT *
FROM employees
WHERE email = 'RC@email.com';

rollback;
