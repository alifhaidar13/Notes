### Database Information
![image](https://github.com/alifhaidar13/Notes/assets/142615365/402312e6-2f41-4a9c-b713-8ef659cdcaf9)

```
select   NAME,
         CREATED,
         LOG_MODE,
         CHECKPOINT_CHANGE#,
         ARCHIVE_CHANGE#
from     sys.v_$database;
```

### Database Startup Time
![image](https://github.com/alifhaidar13/Notes/assets/142615365/48c0b84b-764c-4d11-9a5f-d8748d0c26b0)

```
col started format a20
col uptime format a50
select   STARTUP_TIME AS started,
         trunc(SYSDATE-(STARTUP_TIME) ) || ' day(s), ' ||
         trunc(24*((SYSDATE-STARTUP_TIME) - trunc(SYSDATE-STARTUP_TIME)))||' hour(s), ' ||
         mod(trunc(1440*((SYSDATE-STARTUP_TIME) - trunc(SYSDATE-STARTUP_TIME))), 60) ||' minute(s), ' ||
         mod(trunc(86400*((SYSDATE-STARTUP_TIME) - trunc(SYSDATE-STARTUP_TIME))), 60) ||' seconds' AS uptime
from     sys.v_$instance;
```

### Auto Extent Information
![image](https://github.com/alifhaidar13/Notes/assets/142615365/8fd0991c-5966-4e4d-97db-cbaac9f6ad2e)

```
set linesize 120
col file_name format a50
col tablespace_name format a15
col maxbytes format 999999999999999
select   FILE_NAME,
         TABLESPACE_NAME,
         BYTES,
         STATUS,
         MAXBYTES,
         INCREMENT_BY
from     dba_data_files
where    AUTOEXTENSIBLE = 'YES'
order by TABLESPACE_NAME, FILE_NAME;
```

### Redo Log Switch History (Hourly)
![image](https://github.com/alifhaidar13/Notes/assets/142615365/a46d934e-b7ea-43fa-b16f-31071eb10d1a)
```
set linesize 100
col DAY format a15
col 00 format a2
col 01 format a2
col 02 format a2
col 03 format a2
col 04 format a2
col 05 format a2
col 06 format a2
col 07 format a2
col 08 format a2
col 09 format a2
col 10 format a2
col 11 format a2
col 12 format a2
col 13 format a2
col 14 format a2
col 15 format a2
col 16 format a2
col 17 format a2
col 18 format a2
col 19 format a2
col 20 format a2
col 21 format a2
col 22 format a2
col 23 format a2
select substr(to_char(FIRST_TIME,'DY, YYYY/MM/DD'),1,15) AS "DAY",
decode(sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'00',1,0)),0,'-',sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'00',1,0))) AS "00",
decode(sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'01',1,0)),0,'-',sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'01',1,0))) AS "01",
decode(sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'02',1,0)),0,'-',sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'02',1,0))) AS "02",
decode(sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'03',1,0)),0,'-',sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'03',1,0))) AS "03",
decode(sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'04',1,0)),0,'-',sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'04',1,0))) AS "04",
decode(sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'05',1,0)),0,'-',sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'05',1,0))) AS "05",
decode(sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'06',1,0)),0,'-',sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'06',1,0))) AS "06",
decode(sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'07',1,0)),0,'-',sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'07',1,0))) AS "07",
decode(sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'08',1,0)),0,'-',sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'08',1,0))) AS "08",
decode(sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'09',1,0)),0,'-',sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'09',1,0))) AS "09",
decode(sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'10',1,0)),0,'-',sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'10',1,0))) AS "10",
decode(sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'11',1,0)),0,'-',sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'11',1,0))) AS "11",
decode(sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'12',1,0)),0,'-',sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'12',1,0))) AS "12",
decode(sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'13',1,0)),0,'-',sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'13',1,0))) AS "13",
decode(sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'14',1,0)),0,'-',sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'14',1,0))) AS "14",
decode(sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'15',1,0)),0,'-',sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'15',1,0))) AS "15",
decode(sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'16',1,0)),0,'-',sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'16',1,0))) AS "16",
decode(sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'17',1,0)),0,'-',sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'17',1,0))) AS "17",
decode(sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'18',1,0)),0,'-',sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'18',1,0))) AS "18",
decode(sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'19',1,0)),0,'-',sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'19',1,0))) AS "19",
decode(sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'20',1,0)),0,'-',sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'20',1,0))) AS "20",
decode(sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'21',1,0)),0,'-',sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'21',1,0))) AS "21",
decode(sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'22',1,0)),0,'-',sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'22',1,0))) AS "22",
decode(sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'22',1,0)),0,'-',sum(decode(substr(to_char(FIRST_TIME,'HH24'),1,2),'23',1,0))) AS "23"
from sys.v_$log_history
group by substr(to_char(FIRST_TIME,'DY, YYYY/MM/DD'),1,15)
order by substr(to_char(FIRST_TIME,'DY, YYYY/MM/DD'),1,15) desc;
```
