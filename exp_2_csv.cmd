db2 "EXPORT TO logs.csv OF DEL MODIFIED BY NOCHARDEL select substr(to_char(timestamp(end_time),'MM-DD-YY HH24:MM'),1,16) as DAY, substr(to_char(sum(decode(substr(to_char(timestamp(end_time),'DDMMYYYY:HH24:MI'),10,2),'00',1,0)),'9999'),1,5) "q" from table(admin_list_hist()) where operation = 'X' and end_time is not null group by to_char(timestamp(end_time),'MM-DD-YY HH24:MM')"