## reconfig bind ip or host 

The correct place in an Omnibus install is:

	/etc/gitlab/gitlab.rb
	external_url 'http://gitlab.example.com'

Finally, you'll need to execute 

	sudo gitlab-ctl reconfigure 

and 
	
	sudo gitlab-ctl restart
