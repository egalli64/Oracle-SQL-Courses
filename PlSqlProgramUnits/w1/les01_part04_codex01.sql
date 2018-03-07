CREATE OR REPLACE FUNCTION validate_job( p_job_id jobs.job_id%TYPE ) 
    RETURN BOOLEAN
IS
    v_rec_count NUMBER := 0;
BEGIN  
    SELECT count(*) INTO v_rec_count FROM jobs WHERE job_id = p_job_id;
    RETURN ( v_rec_count > 0 );    
END validate_job;