ref: http://kafka.apache.org/081/quickstart.html

### list all topic
kafka-topics.sh --zookeeper cloud1:2181 --list
### view message under topicname
kafka-console-consumer.sh --zookeeper cloud1:2181 --topic topicName
### produce mess with topicname
kafka-console-producer.sh --broker-list cloud1:9092 --topic topicName
### create topic
kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test
