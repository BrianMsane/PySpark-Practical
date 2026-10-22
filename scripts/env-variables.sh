#!/bin/bash

BASHRC="$HOME/.bashrc"

EXPORT_LINES=(
'export JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64'
'export HADOOP_HOME=/opt/hadoop'
'export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop'
'export YARN_CONF_DIR=$HADOOP_CONF_DIR'
'export HIVE_HOME=/opt/hive'
'export SPARK_HOME=/opt/spark'
'export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$HIVE_HOME/bin:$SPARK_HOME/bin:$SPARK_HOME/sbin'
)

for LINE in "${EXPORT_LINES[@]}"; do
    if grep -Fxq "$LINE" "$BASHRC"; then
        echo "Already present: $LINE"
    else
        echo "$LINE" >> "$BASHRC"
    fi
done
