#!/bin/bash

HDENVS="$HADOOP_HOME/etc/hadoop/hadoop-env.sh"

LINES = (
'export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64'
'export HADOOP_CLASSPATH+=" $HADOOP_HOME/lib/*.jar"'
)

nano "$HDENVS"

# Loop through each line and append if not already present
for LINE in "${LINES[@]}"; do
    if grep -Fxq "$LINE" "$HDENVS"; then
        echo "Already present: $LINE"
    else
        echo "$LINE" >> "$HDENVS"
    fi
done

# Use 'source' only if the script is run in an interactive shell
if [[ $- == *i* ]]; then
    source "$HDENVS"
    echo "Environment updated in current shell."
else
    echo "Note: Run 'source $HADOOP_HOME/etc/hadoop/hadoop-env.sh' manually to apply changes in your current session."
fi

