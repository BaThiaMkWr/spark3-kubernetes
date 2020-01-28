#!/bin/bash

unset SPARK_MASTER_PORT
export SPARK_VERSION=3.0.0-preview2

if ! getent hosts spark-master; then
  sleep 5
  exit 0
fi

/usr/spark-${SPARK_VERSION}/bin/spark-class org.apache.spark.deploy.worker.Worker spark://spark-master:7077 --webui-port 8081 &

