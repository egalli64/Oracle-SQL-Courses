REM  Script:  create_users.sql
REM  Created: By Apoorva Srinivas on 15-June-17 
REM  This script creates users ora1, ora 21, ora22 and ora23
REM  This script creates a role orax
REM  orax is then granted to the users ora users

set echo on
spool create_ora.log

drop role orax;
create role orax;
grant alter session to orax;
grant create session to orax;
grant create table to orax;
grant create view to orax;
grant create sequence to orax;
grant create synonym to orax;
grant create procedure to orax; 
grant create trigger to orax;
grant create type to orax;
grant query rewrite to orax;
grant create any index to orax;
grant create role to orax;
grant create user to orax;
grant create any directory to orax;
grant drop public synonym to orax;
grant create public synonym to orax;
grant create job to orax;
grant manage scheduler to orax;

grant execute on sys.dbms_stats to orax;

GRANT DEBUG CONNECT SESSION TO orax;
GRANT DEBUG ANY PROCEDURE TO orax;
GRANT EXECUTE ANY PROCEDURE TO orax;

drop user ora1 cascade;
create user ora1 identified by ora1;
grant orax to ora1;
grant create job to ora1;
grant create table to ora1;
alter user ora1 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora21 cascade;
create user ora21 identified by ora21;
grant orax to ora21;
grant create job to ora21;
grant create table to ora21;
alter user ora21 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora22 cascade;
create user ora22 identified by ora22;
grant orax to ora22;
grant create job to ora22;
grant create table to ora22;
alter user ora22 default tablespace users temporary tablespace temp
quota unlimited on users;

drop user ora23 cascade;
create user ora23 identified by ora23;
grant orax to ora23;
grant create job to ora23;
grant create table to ora23;
alter user ora23 default tablespace users temporary tablespace temp
quota unlimited on users;

spool off
set echo off