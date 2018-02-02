REM  Script:  create_tables.sql
REM  Created: By Apoorva Srinivas on 15-June-17 
REM  This script creates tables for users ora1, ora21, ora22, ora23
--Please modify the path according to the location of hr_main1


set echo on
spool ora1.log
connect ora1/ora1@&pdbname
set echo off
@@hr_main1.sql
@@del_data.sql
spool off

set echo on
spool ora21.log
connect ora21/ora21@&pdbname
set echo off
@@hr_main1.sql
@@del_data.sql
spool off

set echo on
spool ora22.log
connect ora22/ora22@&pdbname
set echo off
@@hr_main1.sql
@@del_data.sql
spool off

set echo on
spool ora23.log
connect ora23/ora23@&pdbname
set echo off
@@hr_main1.sql
@@del_data.sql
spool off
         


