set serveroutput on;

declare
    v_status varchar(35);
begin
    v_status := get_exam_eligibility(740);
    dbms_output.put_line(v_status);

    v_status := get_exam_eligibility(720);
    dbms_output.put_line(v_status);
end;
/
