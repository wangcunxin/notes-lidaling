# portal-loginlog portal-authorizedlog portal-jstrackinglog
1.agent的配置：agent和source、channel、sink的绑定
#define agent_portal
agent_portal.sources  = src_portal-loginlog src_portal-authorizedlog src_portal-jstrackinglog
agent_portal.channels = ch_portal-loginlog ch_portal-authorizedlog ch_portal-jstrackinglog
agent_portal.sinks    = sink_portal-loginlog sink_portal-authorizedlog sink_portal-jstrackinglog

#---------------portal-loginlog---------------1
2.source的配置：kafka的source
#define source
agent_portal.sources.src_portal-loginlog.type = org.apache.flume.source.kafka.KafkaSource
agent_portal.sources.src_portal-loginlog.zookeeperConnect = master:2181,cloud1:2181,cloud2:2181
topic和kafka的topic一致
agent_portal.sources.src_portal-loginlog.topic = portal-loginlog
agent_portal.sources.src_portal-loginlog.batchSize = 1000
agent_portal.sources.src_portal-loginlog.groupId = group_portal-loginlog

3.sink的配置：目的地=hdfs
#define sink
agent_portal.sinks.sink_portal-loginlog.type = hdfs
格式是文本
agent_portal.sinks.sink_portal-loginlog.hdfs.writeFormat = Text
agent_portal.sinks.sink_portal-loginlog.hdfs.fileType = DataStream
文件前缀
agent_portal.sinks.sink_portal-loginlog.hdfs.filePrefix =flume
agent_portal.sinks.sink_portal-loginlog.hdfs.useLocalTimeStamp = true
保存路径
agent_portal.sinks.sink_portal-loginlog.hdfs.path = hdfs://master:8020/logs_origin/kafka/portal-loginlog/%Y%m%d
按行数roll，关闭
agent_portal.sinks.sink_portal-loginlog.hdfs.rollCount=0
按文件大小roll：512m
agent_portal.sinks.sink_portal-loginlog.hdfs.rollSize=512000000
按时间间隔roll：10mins
agent_portal.sinks.sink_portal-loginlog.hdfs.rollInterval=600
处理批量：1000
agent_portal.sinks.sink_portal-loginlog.hdfs.batchSize=1000
闲置的文件超时就自动关闭：10s
agent_portal.sinks.sink_portal-loginlog.hdfs.idleTimeout=10000
HDFS operations的时间上限：默认10s
agent_portal.sinks.sink_portal-loginlog.hdfs.callTimeout=10000

4.channel的配置：缓存到可靠性高的磁盘
#define channel
agent_portal.channels.ch_portal-loginlog.type = file
checkpiont目录
agent_portal.channels.ch_portal-loginlog.checkpointDir = /data/tmp/flume/checkpoint_portal-loginlog
cache目录，不能和上面的相同
agent_portal.channels.ch_portal-loginlog.dataDirs = /data/tmp/flume/data_portal-loginlog

5.将source、sink和channel 绑定
#define source and sink match channel
agent_portal.sources.src_portal-loginlog.channels = ch_portal-loginlog
agent_portal.sinks.sink_portal-loginlog.channel = ch_portal-loginlog
