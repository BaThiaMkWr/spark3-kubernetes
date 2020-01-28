#!/bin/bash

unset SPARK_MASTER_PORT
export SPARK_VERSION=3.0.0-preview2

echo "$(hostname -i) spark-master" >> /etc/hosts

/usr/spark-${SPARK_VERSION}/bin/spark-class org.apache.spark.deploy.master.Master --ip spark-master --port 7077 --webui-port 8080 &
