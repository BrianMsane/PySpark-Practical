#!/bin/bash

start-dfs.sh && start-yarn.sh
nohup hive --service metastore   > ~/logs/metastore.log 2>&1 &
nohup hive --service hiveserver2 > ~/logs/hiveserver2.log 2>&1 &
