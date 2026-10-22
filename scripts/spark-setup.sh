#!/bin/bash

wget https://archive.apache.org/dist/spark/spark-4.2.0/spark-4.2.0-bin-hadoop3.tgz
tar xzf spark-4.2.0-bin-hadoop3.tgz
mv spark-4.2.0-bin-hadoop3 spark
rm spark-4.2.0-bin-hadoop3.tgz

cp $HOME/PYSPARK_Practical/conf/spark-defaults.conf $SPARK_HOME/conf/spark-defaults.conf
