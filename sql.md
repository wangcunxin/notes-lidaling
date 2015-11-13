select count(u.mac),u.supp_id from bblink_hos.bblink_wxcity_user_info u 
where year(login_time)=2015 and month(login_time)=4 group by u.supp_id ;

select * from bblink_hos.bblink_wxcity_user_info u 
where year(login_time)=2015 and month(login_time)=4 and day(login_time)=9;

select count(id) from bblink_hos.bblink_wxcity_user_info u 
where year(login_time)=2015 and month(login_time)=6 and day(login_time)=3;

select * from bblink_hos.bblink_wxcity_user_info u where supp_id=5;

select * from bblink_user_net_log limit 1,10;


select count(id) from bblink_user_net_log where gw_id='345584953F' and year(login_time)=2015 and month(login_time)=6 
and day(login_time)=3;


select count(id) from bblink_wxcity_user_info 
where login_time>='2015-06-03 00:00:00' and login_time<='2015-06-03 23:59:59'

select * from bblink_hos.bblink_user_net_log 
where gw_id='001631f1b54c' 
and login_time>='2015-07-02 12:00:00' and login_time<'2015-07-02 13:00:00'

---

select * from bblink_hos.bblink_user_net_log 
where gw_id='001631f1b54c' 
and login_time>='2015-07-02 12:00:00' and login_time<'2015-07-02 13:00:00';

select * from bblink_hos.bblink_hospital_info;
  SELECT * FROM bblink_user_net_log 
    where year(login_time)=2015 and month(login_time)=6 and day(login_time)=13;
    
  SELECT * FROM bblink_wxcity_count_info 
    where gw_id='61060300FF0BE6D0';
    
    select * from bblink_wifi_info where gw_id='03FCBF7551';
	select * from bblink_wifi_info where hospital_id='738';

---
根据医院下的设备 是否有登录数据上传 判断医院数据 
select * from (select hospital_name,sum(logintimes) as logintimes from (
select 
t1.gw_id ,
t1.gw_mac ,
t1.gw_ip ,
t1.hospital_id ,
t1.gw_status ,
t1.gw_is_work ,
t1.gw_is_change ,
t2.hospital_name ,
ifnull(sum(tmp.logintimes),0) as logintimes 
from (
    SELECT gw_id,count(gw_id) as logintimes FROM bblink_user_net_log l
    where l.login_time>'2015-07-07' group by l.gw_id
    ) tmp 
right JOIN
bblink_wifi_info t1
on tmp.gw_id=t1.gw_id
left join bblink_hospital_info t2 on t1.hospital_id = t2.hospital_id 
group by t1.gw_id) tt
 where tt.hospital_name is not null group by hospital_name) tttmp where tttmp.logintimes=0; 
---
根据医院下的设备 是否有PV数据上传 判断医院数据 
select * from (select hospital_name,sum(sumpv) hospv from (select 
t1.gw_id '设备ID',
t1.gw_mac '设备MAC地址',
t1.gw_ip '设备IP地址',
t1.hospital_id '医院ID',
t1.gw_status '设备状态',
t1.gw_is_change '设备是否已更换',
t2.hospital_name,
ifnull(sum(tmp.pv),0) sumpv 
from (
    SELECT gw_id,pv FROM bblink_website_forward_ad_page_by_day where day= '2015-07-12'
    UNION
    SELECT gw_id,pv FROM bblink_website_login_page_by_day where day= '2015-07-12' 
    ) tmp 
right JOIN
bblink_wifi_info t1
on tmp.gw_id=t1.gw_id
left join bblink_hospital_info t2 on t1.hospital_id = t2.hospital_id 
group by t1.gw_id) hostmp group by hospital_name) zerotmp where zerotmp.hospv=0;

---
根据时间 查找 中苗 本地portal设备ID

select distinct gw_id from bblink_wxcity_user_info where login_time > '2015-07-07' and supp_id=1 and gw_id not in(
select distinct gw_id from bblink_user_net_log l where login_time > '2015-07-07' and supp_id=1
)

---
根据医院名称 查找 设备 信息
select h.hospital_name,w.gw_id,w.gw_is_change,w.gw_is_work from bblink_hospital_info h
left join bblink_wifi_info w
on h.hospital_id=w.hospital_id 
where hospital_name='重庆市妇幼保健院（北部妇产医院）' ;
根据医院名称 查找 登录日志
select l.* from bblink_user_net_log l left join bblink_wifi_info w 
on l.gw_id=w.gw_id left join bblink_hospital_info h 
on w.hospital_id=h.hospital_id 
where hospital_name='重庆市妇幼保健院（北部妇产医院）' ;
- 根据设备ID查找 医院信息
select h.hospital_name,w.gw_id from bblink_hospital_info h 
right join bblink_wifi_info w 
on w.hospital_id=h.hospital_id 
where w.gw_id='4971A7218F';

- get user login log by mac 

select * from bblink_wxcity_user_info where mac='20:A2:E4:3E:26:6D' order by login_time desc limit 20;

---
sql if condation
SELECT  if(now()>'2015-07-14 15:00',10,1)


