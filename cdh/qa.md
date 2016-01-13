- /var/lib/cloudera-service-monitor/ts/stream/partitions big size space

  [solution](http://community.cloudera.com/t5/Cloudera-Manager-Installation/Service-Monitor-doesn-t-start/m-p/29575#M5000)

'''
  1. Stop Service Monitor
  2. [bash]$ mv /var/lib/cloudera-service-monitor /var/lib/cloudera-service-monitor.moved
  3. Start SMON, this will initialise your Service Monitor LevelDB/ts data
'''

  SMON is service monitor

  I think `cloudera-host-monitor` can be fixed in the same way
