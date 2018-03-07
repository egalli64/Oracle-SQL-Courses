create or replace function get_exam_eligibility(p_id ad_student_details.student_id%type)
return varchar2
is
    -- workaround, since eligibility_for_exams column is missing
    v_first_name ad_student_details.first_name%type;
begin
    select first_name
    into v_first_name
    from ad_student_details
    where p_id = student_id;

    if(length(v_first_name) = 4) then
        return 'Eligible for Exams';
    else
        return 'Not Eligible for Exams';
    end if;
end get_exam_eligibility;
