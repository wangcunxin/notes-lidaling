# grep by gwid ,weekday 

select b.hosid,dayofweek(from_unixtime(cast((a.login_time/1000+8*3600) as BIGINT),"yyyy-MM-dd"))-1 as week,cast(count(distinct a.mac)/5 as int) as uv
 from back_portal_loginlog a,db_impala.gwhos b
 where a.dat<='20151110' and  a.dat>='20151007'
 and a.gw_id=b.gwid
 group by  b.hosid,dayofweek(from_unixtime(cast((a.login_time/1000+8*3600) as BIGINT),"yyyy-MM-dd"))-1
 order by  b.hosid,dayofweek(from_unixtime(cast((a.login_time/1000+8*3600) as BIGINT),"yyyy-MM-dd"))-1;
