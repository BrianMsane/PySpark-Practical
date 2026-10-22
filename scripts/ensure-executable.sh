#!/bin/bash

FILES=(
  "edit-hadoop-env.sh"
  "env-variables.sh"
  "hadoop-conf.sh"
  "hadoop-setup.sh"
  "hive-setup.sh"
  "java-install.sh"
  "metastore.sh"
  "python-setup.sh"
  "spark-setup.sh"
  "ssh-setup.sh"
  "start.sh"
  "stop.sh"
  "warehouse-setup.sh"
)

sudo chown data:data $SCRIPTS_HOME
sudo chmod -R 755 $SCRIPTS_HOME

for FILE in "${FILES[@]}"; do
  if [ -f "$SCRIPTS_HOME/$FILE" ]; then
    chmod +x "$SCRIPTS_HOME/$FILE"
    dos2unix "$SCRIPTS_HOME/$FILE"
    echo "$FILE is now executable"
  else
    echo "File not found: $FILE"
  fi
done
