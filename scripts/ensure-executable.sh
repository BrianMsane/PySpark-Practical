#!/bin/bash

FILES=(
  "apache-install.sh"
  "edit-hadoop-env.sh"
  "env-variables.sh"
  "hadoop-setup.sh"
  "java-install.sh"
  "python-setup.sh"
  "spark-env.sh"
  "ssh-setup.sh"
)

sudo chown hadoop:hadoop $SCRIPTS_HOME
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
