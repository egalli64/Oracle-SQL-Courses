set serveroutput on;

declare
    v_name ad_student_details.first_name%type;
    v_year ad_student_details.student_reg_year%type;
begin
    get_student(740, v_name, v_year);
    
    dbms_output.put_line(v_name || ': ' || v_year);
end;
/
