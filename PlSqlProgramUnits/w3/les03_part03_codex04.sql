create or replace PACKAGE user_exceptions_pkg IS

  e_salary_out_of_range EXCEPTION;
  e_insufficient_service EXCEPTION;
  e_invalid_commission EXCEPTION;

END user_exceptions_pkg;