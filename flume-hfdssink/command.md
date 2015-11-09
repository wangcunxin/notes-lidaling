bin/flume-ng agent -c conf -f conf/flume-conf-wifi.properties -name agent_wifi &
bin/flume-ng agent -c conf -f conf/flume-conf-back.properties -name agent_back &
bin/flume-ng agent -c conf -f conf/flume-conf-site.properties -name agent_site &
