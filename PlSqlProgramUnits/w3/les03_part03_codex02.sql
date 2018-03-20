create or replace PACKAGE BODY dept_pkg IS

  -- private
  FUNCTION validate_loc(p_location departments.location_id%TYPE) 
  RETURN BOOLEAN IS
  v_rec_count NUMBER := 0;
  BEGIN  
    SELECT count(*) INTO v_rec_count FROM locations WHERE location_id = p_location;
    RETURN ( v_rec_count > 0 );    
  END validate_loc;  

  PROCEDURE add_dept(p_new_dept departments.department_name%TYPE,
                     p_new_mgr departments.manager_id%TYPE,
                     p_new_loc departments.location_id%TYPE) IS
  BEGIN  

  IF validate_loc(p_new_loc) THEN
      INSERT INTO departments(department_id, department_name, manager_id, location_id)
      VALUES (departments_seq.NEXTVAL, p_new_dept, p_new_mgr, p_new_loc);
    END IF;    

  END add_dept;  

  PROCEDURE upd_dept(p_dept_id departments.department_id%TYPE,
                     p_new_loc departments.location_id%TYPE) IS
  BEGIN

  IF validate_loc(p_new_loc) THEN
    UPDATE departments SET location_id = p_new_loc WHERE department_id = p_dept_id;
  END IF;

  END upd_dept;                     

  PROCEDURE del_dept(p_dept_id departments.department_id%TYPE) IS
  BEGIN

    DELETE FROM departments WHERE department_id = p_dept_id;

  END del_dept;

END dept_pkg;