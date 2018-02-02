-- create users tablespace in PDB to
-- support PLSQL bundle schemas
-- ASSUMe this is being called from a PDB level connection
--  connected as sysdba
REM  Created: By Apoorva Srinivas on 15-June-17 

DROP TABLESPACE USERS 
    INCLUDING CONTENTS 
        CASCADE CONSTRAINTS; 

create tablespace USERS datafile '/u01/app/oracle/oradata/orcl/pdborcl/users01.dbf' size 50M;


