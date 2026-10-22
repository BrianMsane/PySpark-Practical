#!/bin/bash

cd $HADOOP_HOME/bin/hadoop

hdfs dfs -mkdir -p /processed
hdfs dfs -mkdir -p /warehouse
hdfs dfs -mkdir -p /tmp/hive /user/hive /user/hadoop
hdfs dfs -chmod -R 777 /tmp /processed /warehouse
