--
-- $Id: //Infrastructure/GitHub/Database/asbo/web/sql/table_trim_check.sql#1 $
--
SELECT
  CASE
    WHEN last_delete_outcome LIKE 'ERROR%'    THEN 'CRITICAL'
    WHEN last_delete_outcome LIKE '%WARNING%' THEN 'CRITICAL'
    WHEN last_delete_outcome LIKE 'ORA%'      THEN 'CRITICAL'
    ELSE                                           'OK'
  END status
, TO_CHAR(th.oldest_record,'dd-mon-yyyy hh24:mi:ss') oldest_record_date
, th.*
FROM
  dbamgr.table_housekeeping th
