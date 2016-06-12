### backup

  gitlab-rake gitlab:backup:create

generate one file named as '1465719746_gitlab_backup.tar' at /var/opt/gitlab/backups

### restore

  gitlab-rake gitlab:backup:restore BACKUP=1465719746

### specify gitlab port

change value of external_url in file `/etc/gitlab/gitlab.rb`

  external_url 'http://192.168.0.6:9999'
