CREATE OR REPLACE PROCEDURE UPD_STUDENT(
    p_id ad_student_details.student_id%type,
    p_email ad_student_details.email_addr%type
)
is
BEGIN
UPDATE ad_student_details
SET email_addr = p_email
where student_id = p_id;
END UPD_STUDENT;
