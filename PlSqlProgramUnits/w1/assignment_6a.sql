create or replace function valid_jobid(
    p_jid ad_faculty_details.job_id%type
)
return boolean
is
    v_count pls_integer;
begin
    select count(*)
    into v_count
    from ad_faculty_details
    where job_id = p_jid;
    
    if v_count = 0 then
        return false;
    end if;
    return true;
end valid_jobid;
