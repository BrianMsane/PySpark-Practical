#!/bin/bash

wget https://archive.apache.org/dist/hive/hive-4.2.1/apache-hive-4.2.1-bin.tar.gz
tar xzf apache-hive-4.2.1-bin.tar.gz
mv apache-hive-4.2.1-bin hive
rm apache-hive-4.2.1-bin.tar.gz

cp $HOME/PySpark_Practical/conf/hive-site.xml $HIVE_HOME/conf/hive-site.xml
cp $HIVE_HOME/conf/hive-site.xml $SPARK_HOME/conf/
