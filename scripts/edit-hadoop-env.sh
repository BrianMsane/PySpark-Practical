#!/bin/bash

HDENVS="$HADOOP_CONF_DIR/hadoop-env.sh"

LINES=(
'export JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64'
)

for LINE in "${LINES[@]}"; do
    if grep -Fxq "$LINE" "$HDENVS"; then
        echo "Already present: $LINE"
    else
        echo "$LINE" >> "$HDENVS"
    fi
done
