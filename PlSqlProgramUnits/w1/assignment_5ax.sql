set serveroutput on;

begin
    dbms_output.put_line('Rating: ' || get_student_rating(720, 190));
end;
/
