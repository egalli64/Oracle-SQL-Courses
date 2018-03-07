create or replace procedure add_faculty(
    p_first_name ad_faculty_details.first_name%type,
    p_last_name ad_faculty_details.last_name%type,
    p_email ad_faculty_details.email%type,
    p_job ad_faculty_details.job_id%type default 'FA_ST',
    p_sal ad_faculty_details.salary%type default 4500
)
is
begin
    if not valid_jobid(p_job) then
        dbms_output.put_line('job id not found');
        return;
    end if;
    
    insert into ad_faculty_details
    (faculty_id, first_name, last_name, email, hire_date, job_id, salary)
    values(
        FACULTY_SEQ.nextval, p_first_name, p_last_name, p_email,
        trunc(sysdate), p_job, p_sal
    );
end add_faculty;
