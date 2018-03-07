create or replace procedure del_student(
    p_id ad_student_details.student_id%type
)
is
begin
    delete from ad_student_details
    where student_id = p_id;
end del_student;
