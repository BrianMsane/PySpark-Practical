#!/bin/bash

HDENVS="$HADOOP_HOME/etc/hadoop/hadoop-env.sh"

LINES=(
'export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64'
'export HADOOP_CLASSPATH+="$HADOOP_HOME/lib/*.jar"'
)

for LINE in "${LINES[@]}"; do
    if grep -Fxq "$LINE" "$HDENVS"; then
        echo "Already present: $LINE"
    else
        echo "$LINE" >> "$HDENVS"
    fi
done

if [[ $- == *i* ]]; then
    source "$HDENVS"
    echo "Environment updated in current shell."
else
    echo "Note: Run 'source $HADOOP_HOME/etc/hadoop/hadoop-env.sh' manually to apply changes in your current session."
fi

