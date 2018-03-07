create or replace function get_student_rating(
    p_sid ad_student_details.student_id%type,
    p_cid ad_student_course_details.course_id%type
)
return varchar2
is
    -- workaround, having no marks
    v_stars pls_integer;
    v_courses pls_integer;
begin
    select count(*)
    into v_courses
    from ad_student_course_details
    where student_id = p_sid and course_id = p_cid;
    
    if v_courses = 0 then
        return '_';
    end if;

    select count(*)
    into v_stars
    from ad_student_course_details
    where student_id = p_sid;
    
    return rpad('*', v_stars, '*');
end get_student_rating;
