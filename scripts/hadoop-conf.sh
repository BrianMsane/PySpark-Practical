#!/bin/bash

rm $HADOOP_CONF_DIR/core-site.xml
rm $HADOOP_CONF_DIR/hdfs-site.xml
rm $HADOOP_CONF_DIR/yarn-site.xml
rm $HADOOP_CONF_DIR/mapred-site.xml

cp $HOME/PySpark_Practical/conf/core-site.xml $HADOOP_CONF_DIR/core-site.xml
cp $HOME/PySpark_Practical/conf/hdfs-site.xml $HADOOP_CONF_DIR/hdfs-site.xml
cp $HOME/PySpark_Practical/conf/yarn-site.xml $HADOOP_CONF_DIR/yarn-site.xml
cp $HOME/PySpark_Practical/conf/mapred-site.xml $HADOOP_CONF_DIR/mapred-site.xml
