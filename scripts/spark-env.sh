#!/bin/bash

BASHRC="$HOME/.bashrc"

LINES = (
    'export SPARK_HOME=/usr/local/spark'
    'export PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin'
)

for LINE in "${LINES[@]}"; do
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
