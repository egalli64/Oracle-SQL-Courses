REM  Script:  setup.sql
REM  Created: By Apoorva Srinivas on 15-June-17 
REM  This script creates users ora1, ora21, ora22, ora23
REM                            teach_a
--Please replace the password for 'SYS'if it is different.
define pdbname = 'orclpdb';    -- Enter the PDB name. If PDB was not created, enter value of database name (orcl).
--define password = 'oracle';

alter session set container = &pdbname;

@@create_users.sql
@@create_tables.sql  -- calls hr_main1.sql
@@creteach.sql
commit;
EXIT
