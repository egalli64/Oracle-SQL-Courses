create or replace procedure get_student(
    p_id ad_student_details.student_id%type,
    p_first_name out ad_student_details.first_name%type,
    p_reg_year out ad_student_details.student_reg_year%type
)
is
begin
    select first_name, student_reg_year
    into p_first_name, p_reg_year
    from ad_student_details
    where student_id = p_id;
end get_student;
