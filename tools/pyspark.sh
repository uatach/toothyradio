#!/usr/bin/env bash

#docker run -it apache/spark-py:v3.4.0 /opt/spark/bin/pyspark --help
#docker run -it apache/spark-py:v3.4.0 /bin/bash

docker run \
  --rm \
  --network barley \
  --name spark \
  -p 8081:8080 \
  apache/spark-py:v3.4.0 \
  /opt/spark/bin/spark-class org.apache.spark.deploy.master.Master -h 0.0.0.0 \
  &> logs/spark.txt &

docker run \
  --rm \
  --network barley \
  --name worker1 \
  -v `pwd`/work:/opt/spark/work \
  apache/spark-py:v3.4.0 \
  /opt/spark/bin/spark-class org.apache.spark.deploy.worker.Worker spark://spark:7077 -c 2 -m 4G \
  &> logs/worker1.txt &

docker run \
  --rm \
  --network barley \
  --name worker2 \
  -v `pwd`/work:/opt/spark/work \
  apache/spark-py:v3.4.0 \
  /opt/spark/bin/spark-class org.apache.spark.deploy.worker.Worker spark://spark:7077 -c 2 -m 4G \
  &> logs/worker2.txt &

#docker run --rm --network barley -it -p 8082:4040 apache/spark-py:v3.4.0 /opt/spark/bin/pyspark --master spark://spark:7077
