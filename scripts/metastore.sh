#!/bin/bash

sudo -u postgres psql <<'SQL'
CREATE USER hive WITH PASSWORD 'hivepass';
CREATE DATABASE metastore_db OWNER hive;
SQL

wget https://jdbc.postgresql.org/download/postgresql-42.7.10.jar -P $HIVE_HOME/lib/

rm $HIVE_HOME/lib/guava-*.jar
cp $HADOOP_HOME/share/hadoop/common/lib/guava-*.jar $HIVE_HOME/lib/

schematool -dbType postgres -initSchema

mkdir -p ~/logs
nohup hive --service metastore   > ~/logs/metastore.log  2>&1 &
sleep 15
nohup hive --service hiveserver2 > ~/logs/hiveserver2.log 2>&1 &
