# convert svn project to git

	git svn init http://192.168.0.102:8090/svn/bblink/branches/bblink_bi/
 	git svn fetch
 	git log
	git remote add origin http://git.bblink.cn/lidaling/bblink_bi.git
	git push -u origin master
