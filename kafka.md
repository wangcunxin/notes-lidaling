ref:
http://kafka.apache.org/081/quickstart.html

### list all topic
kafka-topics.sh --zookeeper cloud1:2181 --list
### view message under topicname
kafka-console-consumer.sh --zookeeper cloud1:2181 --topic topicName
kafka-console-consumer.sh --zookeeper localhost:2581 --topic back-portal-loginflowlog --from-beginning
### produce mess with topicname
kafka-console-producer.sh --broker-list cloud1:9092 --topic topicName
### create topic
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test

### delete topic

set topic property on brokers server-env.sh

    delete.topic.enable=true

then issue command :

    kafka-topics.sh --delete --zookeeper localhost:2181 --topic test

### zkCli.sh location in CDH

    /opt/cloudera/parcels/CDH/lib/zookeeper/bin/zkCli.sh


    kafka-topics.sh --create --zookeeper slave1:2181 --replication-factor 3 --partitions 3 --topic back-wechatNewFanDetails
    kafka-topics.sh --create --zookeeper slave1:2181 --replication-factor 3 --partitions 3 --topic site-sitePVv3
    kafka-topics.sh --zookeeper localhost:2181 --list
    kafka-console-producer.sh --broker-list cdh-slave2:9092 --topic back-wechatNewFanDetails
    kafka-console-consumer.sh --zookeeper cdh-slave1:2181 --topic back-wechatNewFanDetails

- one way to connect zk

  zookeeper-shell.sh cdh-slave1:2181

- get brokers info from zookeeper

  http://stackoverflow.com/questions/29490113/kafka-get-broker-host-from-zookeeper
