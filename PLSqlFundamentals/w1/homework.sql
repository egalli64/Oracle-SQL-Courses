--Oracle MOOC: PL/SQL Fundamentals
--Week 1

--Assignment 1:
--Which of the following PL/SQL blocks executes successfully?
--a. NO: at least a statement expected in a block
BEGIN
END;

--b. NO: missing BEGIN
DECLARE
    v_amount INTEGER(10);
END;

--c. NO: again, empty block
DECLARE
BEGIN
END;

--d. YES (slightly changed to have more fun)
SET SERVEROUTPUT ON

DECLARE
    v_amount   INTEGER(10) := 42;
BEGIN
    dbms_output.put_line(v_amount);
END;
/

--Assignment 2:
--Create and execute a simple anonymous block that prints "Hello World"
--save this script as soln_01_02.sql
SET SERVEROUTPUT ON

begin
    dbms_output.put_line('Hello World');
end;
/

--Assignment 3: Which of the below identifiers are invalid, and why?
declare
    today INTEGER := 42; -- (a) ok
    last_name INTEGER := 42; -- (b) ok
--    today’s_date INTEGER := 42; -- (c) ko: quote
    Number_of_days_in_February_this_year INTEGER := 42; -- (d) ok, size limit removed?
    Isleap$year INTEGER := 42; -- (e) ok, but confusing
--    #number INTEGER := 42; -- (f) ko: sharp at the beginning
    NUMBER# INTEGER := 42; -- (g) ok, but confusing
    number1to7 INTEGER := 42; -- (h) ok, but confusing
begin
    dbms_output.put_line(today + last_name + Number_of_days_in_February_this_year + Isleap$year + NUMBER# + number1to7);
end;
/

--Assignment 4:
--Identify which of the following declarations and initializations are invalid,
--and why?
declare
    number_of_copies PLS_INTEGER; -- (a) ok
--    PRINTER_NAME constant VARCHAR2(10); -- (b) ko: missing initialization
    PRINTER_NAME constant VARCHAR2(10) := 'Turtle';
--    deliver_to VARCHAR2(10):=Johnson; -- (c) ko: Johnson not declared (or, missing quotes)
    deliver_to VARCHAR2(10):= 'Johnson';
    by_when DATE:= CURRENT_DATE+1; -- (d) ok
begin
    number_of_copies := 42;
    dbms_output.put_line(number_of_copies);

    dbms_output.put_line(PRINTER_NAME);
    dbms_output.put_line(deliver_to);
    dbms_output.put_line(by_when);
end;
/

--Assignment 5:
--Examine this anonymous block. Which statement is correct?
DECLARE
    v_fname   VARCHAR2(20);
    v_lname   VARCHAR2(15) DEFAULT 'fernandez';
BEGIN
    dbms_output.put_line(v_fname || ' ' || v_lname);
END;
/

--Assignment 6:
--Modify soln_01_02.sql so that it prints "Hello World"
--followed by today's date and tomorrow's date.
--soln_01_06.sql
--Declare a variable to hold the value of today's date. You can initialize it to SYSDATE.
--Declare a variable to hold the value of tomorrow's date. You can use %TYPE attribute in its declaration.
--Increment today's date by 1 and assign it to tomorrow's date, in the executable section.
--Print the value of today's date and tomorrow's date after printing "Hello World".
SET SERVEROUTPUT ON

declare
    today DATE := SYSDATE;
    tomorrow today%TYPE;
begin
    tomorrow := today + 1;
    dbms_output.put_line('Hello World');
    dbms_output.put_line(concat('Today is ', to_char(today)));
    dbms_output.put_line(concat('Tomorrow will be ', to_char(tomorrow)));
end;
/

--Assignment 7: Declare and assign values to bind variables.
--Print their values in the output.
--Create two bind variables, b_basic_percent and b_pf_percent
-- and assign the values 45 and 12 respectively.
--Display the value of the bind variables by using the PRINT command.
--soln_01_07.sql
variable b_basic_percent number
variable b_pf_percent number

begin
    :b_basic_percent := 45;
    :b_pf_percent := 12;
end;
/

print b_basic_percent;
print b_pf_percent;

--Assignment 8: Evaluate this PL/SQL block:
DECLARE
    v_weight    NUMBER(3) := 600; -- position 1
    v_message   VARCHAR2(255) := 'Product 10012';
BEGIN
    DECLARE
        v_weight     NUMBER(3) := 1; -- position 2 
        v_message    VARCHAR2(255) := 'Product 11001';
        v_new_locn  VARCHAR2(50) := 'Europe';
    BEGIN
        v_weight := v_weight + 1;
        v_new_locn := 'Western ' || v_new_locn;
    END;

    v_weight := v_weight + 1;
    v_message := v_message || ' is in stock';
--    v_new_locn := 'Western ' || v_new_locn;
END;
/

--Assignment 9: Evaluate this PL/SQL block
DECLARE
    v_customer        VARCHAR2(50) := 'Womansport';
    v_credit_rating   VARCHAR2(50) := 'EXCELLENT';
BEGIN
    DECLARE
        v_customer   NUMBER(7) := 201;
        v_name       VARCHAR2(25) := 'Unsorts';
    BEGIN
        v_credit_rating := 'GOOD';
        -- ...
    END;
    -- ...
END;
/
