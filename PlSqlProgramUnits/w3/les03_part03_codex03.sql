SELECT * FROM departments;
EXECUTE dept_pkg.add_dept('TEST',100,1000);
SELECT * FROM departments WHERE department_id = (SELECT max(department_id) FROM departments);
------------
SELECT * FROM departments WHERE department_id =280;
EXECUTE dept_pkg.upd_dept(280,1400);
SELECT * FROM departments WHERE department_id =280;
------------
SELECT * FROM departments WHERE department_id =280;
EXECUTE dept_pkg.del_dept(280);
SELECT * FROM departments WHERE department_id =280;

