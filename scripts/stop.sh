#!/bin/bash

pkill -f HiveServer2; pkill -f HiveMetaStore
stop-yarn.sh && stop-dfs.sh
