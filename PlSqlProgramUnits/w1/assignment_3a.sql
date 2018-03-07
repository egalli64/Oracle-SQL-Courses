create or replace procedure add_student(
    p_id ad_student_details.student_id%type,
    p_first_name ad_student_details.first_name%type,
    p_reg_year ad_student_details.student_reg_year%type
)
is
begin
insert into ad_student_details
            ( student_id, first_name, student_reg_year ) 
        values
            ( p_id, p_first_name, p_reg_year );
end add_student;
