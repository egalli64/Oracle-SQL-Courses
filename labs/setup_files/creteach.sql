REM  Script:  creteach.sql
REM  Purpose: To create the "teach" accounts for SQL1, SQL2, PLFU, and PLPU courses and bundles
REM  Created: By Apoorva Srinivas on 15-June-17 
REM  This script is invoked by the setup.sql script
--Please replace the password for 'SYSTEM' and 
--connect string with your values.

--If the name of default tablespace, name of temporary tablespace
--are different, replace them with your values.
spool teach.log

-- ****TEACH_A setup****

CONNECT sys/&password@&pdbname as sysdba

DROP USER teach_a CASCADE;
CREATE USER teach_a IDENTIFIED BY teach_a;
ALTER USER teach_a DEFAULT TABLESPACE users
temporary tablespace temp quota unlimited on users;

GRANT CREATE SESSION, CREATE TABLE, CREATE PROCEDURE
    , CREATE SEQUENCE, CREATE TRIGGER, CREATE VIEW
    , CREATE SYNONYM, ALTER SESSION, CREATE ANY INDEX 
    , CREATE PUBLIC SYNONYM, CREATE USER, CREATE ROLE
TO  teach_a;

REM  connect to teach_a account and invoke the scripts that create schema objects.

CONNECT teach_a/teach_a@&pdbname
@@hr_cre.sql
@@hr_popul.sql
@@hr_idx.sql
@@hr_comnt.sql
@@del_data.sql

CONNECT sys/&password@&pdbname as sysdba

GRANT CREATE ANY DIRECTORY, QUERY REWRITE, DROP PUBLIC SYNONYM, DROP USER TO teach_a;
GRANT SCHEDULER_ADMIN TO teach_a;
GRANT DBA To teach_a;

REM  verify the number of rows created for each table
CONNECT teach_a/teach_a@&pdbname
spool teach_a.txt
@@confidence.sql
spool off
-- **** END OF TEACH_A setup****

spool off
