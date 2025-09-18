#!/bin/bash

files=(
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

for file in "${files[@]}"; do
  if [ -f "$file" ]; then
    chmod +x "$file"
    echo "Ensured executable: $file"
  else
    echo "File not found: $file"
  fi
done
