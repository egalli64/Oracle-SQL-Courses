begin
    upd_student(800, 'nancy.student@example.com');
end;
/

select *
from AD_STUDENT_DETAILS
where student_id = 800;