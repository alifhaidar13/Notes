tee PM_MySQLDB_22012024.txt;

SELECT '### SCRIPT BY PT.MII ###' FROM DUAL;


SELECT '### 1. Status MySQL ###' FROM DUAL;
SELECT NOW();
SELECT VERSION();
SHOW VARIABLES LIKE '%log%';
SHOW VARIABLES LIKE '%HOSTNAME%';
SHOW VARIABLES LIKE '%LICENSE%';
SHOW VARIABLES LIKE '%DATADIR%';

SHOW GLOBAL VARIABLES;
SHOW GLOBAL STATUS;
SHOW FULL PROCESSLIST;

SELECT '### 2. Check Informasi Size database ###' FROM DUAL;
SELECT table_schema "database", sum(data_length + index_length)/1024/1024/1024 "size in GB" FROM information_schema.TABLES GROUP BY table_schema;

SELECT DBName,CONCAT(LPAD(FORMAT(SDSize/POWER(1024,pw),3),17,' '),' ',
SUBSTR(' KMGTP',pw+1,1),'B') "Data Size",CONCAT(LPAD(
FORMAT(SXSize/POWER(1024,pw),3),17,' '),' ',SUBSTR(' KMGTP',pw+1,1),'B') "Index Size",
CONCAT(LPAD(FORMAT(STSize/POWER(1024,pw),3),17,' '),' ',
SUBSTR(' KMGTP',pw+1,1),'B') "Total Size" FROM
(SELECT IFNULL(DB,'All Databases') DBName,SUM(DSize) SDSize,SUM(XSize) SXSize,
SUM(TSize) STSize FROM (SELECT table_schema DB,data_length DSize,
index_length XSize,data_length+index_length TSize FROM information_schema.tables
WHERE table_schema NOT IN ('mysql','information_schema','performance_schema')) AAA
GROUP BY DB WITH ROLLUP) AA,(SELECT 3 pw) BB ORDER BY (SDSize+SXSize);

SELECT IFNULL(B.engine,'Total') "Storage Engine",
CONCAT(LPAD(REPLACE(FORMAT(B.DSize/POWER(1024,pw),3),',',''),17,' '),' ',
SUBSTR(' KMGTP',pw+1,1),'B') "Data Size", CONCAT(LPAD(REPLACE(
FORMAT(B.ISize/POWER(1024,pw),3),',',''),17,' '),' ',
SUBSTR(' KMGTP',pw+1,1),'B') "Index Size", CONCAT(LPAD(REPLACE(
FORMAT(B.TSize/POWER(1024,pw),3),',',''),17,' '),' ',
SUBSTR(' KMGTP',pw+1,1),'B') "Table Size" FROM
(SELECT engine,SUM(data_length) DSize,SUM(index_length) ISize,
SUM(data_length+index_length) TSize FROM
information_schema.tables WHERE table_schema NOT IN
('mysql','information_schema','performance_schema') AND
engine IS NOT NULL GROUP BY engine WITH ROLLUP) B,
(SELECT 3 pw) A ORDER BY TSize;

SELECT '### 3. Check Engine Size ###' FROM DUAL;
SELECT  ENGINE,
    ROUND(SUM(data_length) /1024/1024, 1) AS "Data MB",
    ROUND(SUM(index_length)/1024/1024, 1) AS "Index MB",
    ROUND(SUM(data_length + index_length)/1024/1024, 1) AS "Total MB",
    COUNT(*) "Num Tables"
FROM  INFORMATION_SCHEMA.TABLES
WHERE  table_schema not in ("information_schema", "PERFORMANCE_SCHEMA", "SYS_SCHEMA", "ndbinfo")
GROUP BY  ENGINE;

SELECT '### 4. Check User MySQL ###' FROM DUAL;
SELECT user,host FROM mysql.user;

SELECT '### 5. Innodb memory utilization ###' FROM DUAL;
SHOW ENGINE INNODB STATUS\G

SHOW VARIABLES LIKE 'INNODB_BUFFER_POOL_SIZE%'\G;
SHOW VARIABLES LIKE 'INNODB_BUFFER_POOL_INSTANCES'\G;
SHOW VARIABLES LIKE 'INNODB_OLD_BLOCKS_TIME'\G;
SHOW GLOBAL STATUS LIKE '%INNODB_BUFFER_%';


SELECT '### 7. Check Status Master-Slave ###' FROM DUAL;
SHOW master STATUS\G;
SHOW slave STATUS\G;

SHOW VARIABLES LIKE '%server_id%';
SHOW VARIABLES LIKE '%gtid_mode%';
SHOW VARIABLES LIKE 'log_bin';
SHOW VARIABLES LIKE 'INNODB_LOG_FILE_SIZE';
SHOW WARNINGS;

SELECT '### 8. Check GTID ###' FROM DUAL;
SELECT @@global.hostname, @@global.port, @@global.server_uuid, @@global.gtid_purged, @@global.gtid_executed, GTID_SUBTRACT(@@global.gtid_executed, @@global.gtid_purged) AS InBinaryLog\G

SELECT '### 9. Check Slow Query ###' FROM DUAL;
show global variables like '%slow%';

SELECT '### 10. Check Invalid Object ###' FROM DUAL;
SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_comment like '%invalid%';

SELECT '### 11. Check Fragmented Object ###' FROM DUAL;
SELECT engine,
CONCAT(table_schema, '.', table_name) as table_name,
ROUND(data_length/1024/1024, 2) as data_length,
ROUND(index_length/1024/1024, 2) as index_length,
ROUND(data_free/1024/1024, 2) as data_free,
(data_free/(index_length+data_length)) frag_ratio
FROM information_schema.tables
WHERE data_free > 0
ORDER BY frag_ratio DESC;

SELECT '### 12. Check Backup status (MEB) ###' FROM DUAL;
SELECT * from mysql.backup_history\G;

\s

SELECT NOW();
NOTEE;
\q;
