CREATE OR REPLACE PACKAGE dept_pkg IS

  PROCEDURE add_dept(p_new_dept departments.department_name%TYPE,
                     p_new_mgr departments.manager_id%TYPE,
                     p_new_loc departments.location_id%TYPE);
                     
  PROCEDURE upd_dept(p_dept_id departments.department_id%TYPE,
                     p_new_loc departments.location_id%TYPE);
                     
  PROCEDURE del_dept(p_dept_id departments.department_id%TYPE);                   
  
END dept_pkg;
/

                      