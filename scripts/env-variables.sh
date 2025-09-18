#!/bin/bash

BASHRC="$HOME/.bashrc"

EXPORT_LINES=(
'export HADOOP_HOME=/usr/local/hadoop'
'export HADOOP_INSTALL=$HADOOP_HOME'
'export HADOOP_MAPRED_HOME=$HADOOP_HOME'
'export HADOOP_COMMON_HOME=$HADOOP_HOME'
'export HADOOP_HDFS_HOME=$HADOOP_HOME'
'export YARN_HOME=$HADOOP_HOME'
'export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native'
'export PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin'
'export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib/native"'
'export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64'
'export PATH=$PATH:$JAVA_HOME/bin'
)

echo "Updating $BASHRC with Hadoop, Java, Yarn environment variables..."

nano "$BASHRC"

# Loop through each line and append if not already present
for LINE in "${EXPORT_LINES[@]}"; do
    if grep -Fxq "$LINE" "$BASHRC"; then
        echo "Already present: $LINE"
    else
        echo "$LINE" >> "$BASHRC"
    fi
done


if [[ $- == *i* ]]; then
    source "$BASHRC"
else
    echo "Note: Run 'source ~/.bashrc' manually to apply changes in your current session."
fi
