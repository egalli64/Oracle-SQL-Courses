create or replace procedure greet_ex(
    p_name varchar2
)
is
   v_today date:=sysdate;
   v_tomorrow v_today%type;
begin
   v_tomorrow:=v_today +1;
   dbms_output.put_line('Hello ' || p_name);
   dbms_output.put_line('TODAY IS : '|| v_today);
   dbms_output.put_line('TOMORROW IS : ' || v_tomorrow);
end greet_ex;
