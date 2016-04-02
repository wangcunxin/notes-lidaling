replicaset with sharding 
	1.	有可能 数据库 启动不了
		a.	注意 [initandlisten] exception in initAndListen std::exception: locale::facet::_S_create_c_locale name not valid, terminating
			i.	solution A
				1.	如果有以上错误 那么需要处理一下服务器的字符集 添加LC_ALL=en_US.UTF-8 
				2.	执行sudo dpkg-reconfigure locales ,enable en_US.UTF-8 
			ii.	solution B
				1.	「在.profile中添加」export HISTTIMEFORMAT='%F %T ' export LANGUAGE="en_US.UTF-8" export LANG="en_US.UTF-8" export LC_ALL="en_US.UTF-8"
	2.	replicaset
		a.	ref http://www.cnblogs.com/oubo/archive/2012/03/01/2394669.html

---配置集群 开始 
注意事项：
	以我的经验，
	1\先走一遍以下的命令 （mongod,mongos ）,不要带keyfile参数 （加上后 可以需要用户名密码，这个我还未来得及确认，应该 是的）.
	2\以上配置完后，连入mongos --port 30000,use amdin;... (即设置 root,admin用户名 密码，参考我记的另外一份文档　mongoshell)
	３\然后 所有配置结束后，停止 所有 mongod,mongos，再加上keyfile启动　即可
	
	---20150522---
	经过证实，以上过程可以忽略．直接执行以下命令，然后最后在配置完mongos后
	连接　mongos --port 30000 ;use　admin;...直接创建管理账号即可．因为mongos会发现系统没有配置管理员账号时，会在你连接后有权限创建管理账号．
	需要注意的是配置完系统管理员账号后，要执行分片命令．然后创建业务数据库和用户，再设置具体分片信息．或者继续执行分片命令完成后　再创建业务数据库及用户．注意　所有分片命令需要在admin数据库下执行
	－－－
	3.	replica set with shard 「配置3个shards，仅供参考」
		a.	ref links
			i.	http://hi.baidu.com/lzpsky/item/2418d8c2fa9ebd47a8ba942b
			ii.	http://janephp.blog.51cto.com/4439680/1332140
			iii.	http://database.51cto.com/art/201207/350522.htm
			iv.	http://www.cnblogs.com/yaoxing/p/mongodb-replica-set-setup.html
			v.	http://virusswb.blog.51cto.com/115214/792897
		b.	mkdir
			i.	mkdir -p /home/mongo/data/shard1_1 /home/mongo/data/shard2_1 /home/mongo/data/shard3_1 /home/mongo/data/config
			ii.	mkdir -p /home/mongo/data/shard1_2 /home/mongo/data/shard2_2 /home/mongo/data/shard3_2 /home/mongo/data/config
			iii.mkdir -p /home/mongo/data/shard1_3 /home/mongo/data/shard2_3 /home/mongo/data/shard3_3 /home/mongo/data/config
			
			---
			创建 keyfile
			openssl rand -base64 741 > /home/mongo/data/keyfile
			chmod 600 /home/mongo/data/keyfile
			
		c.	shard 1 start && config
			i.	mongod --shardsvr --replSet shard1_rs --port 27017 --dbpath /home/mongo/data/shard1_1 --logpath /home/mongo/data/shard1_1/shard1_1.log --logappend --fork --keyFile /home/mongo/data/keyfile
			ii.	mongod --shardsvr --replSet shard1_rs --port 27017 --dbpath /home/mongo/data/shard1_2 --logpath /home/mongo/data/shard1_2/shard1_2.log --logappend --fork --keyFile /home/mongo/data/keyfile
			iii.mongod --shardsvr --replSet shard1_rs --port 27017 --dbpath /home/mongo/data/shard1_3 --logpath /home/mongo/data/shard1_3/shard1_3.log --logappend --fork --keyFile /home/mongo/data/keyfile
			iv.	mongo --port 27017  #在任意 机上
				1.	config={_id:'shard1_rs',members:[{_id:0,host:'cluster1:27017'},{_id:1,host:'cluster2:27017'},{_id:2,host:'cluster3:27017'}]}
				2.	rs.initiate(config)
		d.	shard 2 start && config
			i.	mongod --shardsvr --replSet shard2_rs --port 27018 --dbpath /home/mongo/data/shard2_1 --logpath /home/mongo/data/shard2_1/shard2_1.log --logappend --fork --keyFile /home/mongo/data/keyfile
			ii.	mongod --shardsvr --replSet shard2_rs --port 27018 --dbpath /home/mongo/data/shard2_2 --logpath /home/mongo/data/shard2_2/shard2_2.log --logappend --fork --keyFile /home/mongo/data/keyfile
			iii.	mongod --shardsvr --replSet shard2_rs --port 27018 --dbpath /home/mongo/data/shard2_3 --logpath /home/mongo/data/shard2_3/shard2_3.log --logappend --fork --keyFile /home/mongo/data/keyfile
			iv.	mongo --port 27018 #在任意机上
				1.	config={_id:'shard2_rs',members:[{_id:0,host:'cluster1:27018'},{_id:1,host:'cluster2:27018'},{_id:2,host:'cluster3:27018'}]}
				2.	rs.initiate(config)
		e.	shard 3 start && config…

			i.	mongod --shardsvr --replSet shard3_rs --port 27019 --dbpath /home/mongo/data/shard3_1 --logpath /home/mongo/data/shard3_1/shard3_1.log --logappend --fork --keyFile /home/mongo/data/keyfile
			ii.	mongod --shardsvr --replSet shard3_rs --port 27019 --dbpath /home/mongo/data/shard3_2 --logpath /home/mongo/data/shard3_2/shard3_2.log --logappend --fork --keyFile /home/mongo/data/keyfile
			iii.mongod --shardsvr --replSet shard3_rs --port 27019 --dbpath /home/mongo/data/shard3_3 --logpath /home/mongo/data/shard3_3/shard3_3.log --logappend --fork --keyFile /home/mongo/data/keyfile
			iv.	mongo --port 27019 #在任意机上
				1.	config={_id:'shard3_rs',members:[{_id:0,host:'cluster1:27019'},{_id:1,host:'cluster2:27019'},{_id:2,host:'cluster3:27019'}]}
				2.	rs.initiate(config)
		f.	the config server configure 「在三台机上 均执行」
			i.	mongod --configsvr --dbpath /home/mongo/data/config --port 20000 --logpath /home/mongo/data/config/config.log --logappend --fork --keyFile /home/mongo/data/keyfile
		g.	the route server configure 「在三台机上均执行」
			i.	mongos --configdb cluster1:20000,cluster2:20000,cluster3:20000 --port 30000 --chunkSize 1 --logpath /home/mongo/data/mongos.log --logappend --fork --keyFile /home/mongo/data/keyfile
		h.	config shard cluster
			i.	mongo --port 30000
				1.	use admin
				2.	db.runCommand({addshard:'shard1_rs/cluster1:27017,cluster2:27017,cluster3:27017'})
				3.	db.runCommand({addshard:'shard2_rs/cluster1:27018,cluster2:27018,cluster3:27018'})
				4.	db.runCommand({addshard:'shard3_rs/cluster1:27019,cluster2:27019,cluster3:27019'})
				5.	激活数据库及集合分片
					a.	db.runCommand({enablesharding:'bblinklogs'}) # 可能需要root用户去执行。。。
					---要确保　对应的表执行了　shard命令．否则　不会进行分片　
					b.	db.runCommand({shardcollection:'bblinklogs.userAuthorizedLog',key:{_id:1}})
		i.	some usefull command
			i.	printShardingStatus()
			ii.	db.runCommand({listShards:1})
			iii.	 printShardingStatus(db.getSisterDB("config"),1)
