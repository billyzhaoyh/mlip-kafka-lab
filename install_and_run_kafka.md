On mac just run `brew install kafka` to install kafka which automatically installs zookeeper

In one terminal launch zookeeper and in another launch kafka
```bash
/opt/homebrew/opt/kafka/bin/zookeeper-server-start /opt/homebrew/etc/zookeeper/zoo.cfg
```

```bash
/opt/homebrew/opt/kafka/bin/kafka-server-start /opt/homebrew/etc/kafka/server.properties
```

Next we need to create a topic in yet another terminal
```bash
/opt/homebrew/opt/kafka/bin/kafka-topics --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic recitation-x
```

In case we need to reset all messages by deleting topic
```bash
/opt/homebrew/opt/kafka/bin/kafka-topics --bootstrap-server localhost:9092 --delete --topic recitation-x
```

When using kcat:
List all topics
```bash
kcat -b localhost:9092 -L
```
Read all messages from a topic
```bash
kcat -b localhost:9092 -t recitation-x
```