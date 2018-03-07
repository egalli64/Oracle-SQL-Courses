begin
    add_student(800, 'NANCY', '01-JUN-2018');
end;
/

select *
from ad_student_details
where student_id = 800;

begin
    add_student(740, 'JOANN', '01-JAN-16');
end;
/

select *
from ad_student_details
where student_id = 740;
