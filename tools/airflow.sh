#!/usr/bin/env bash

#docker run -it --entrypoint /bin/bash -p 8080:8080 -v `pwd`/dags:/opt/airflow/dags apache/airflow:2.8.0

docker run \
  --rm \
  --network barley \
  --name airflow \
  -p 8080:8080 \
  -v `pwd`/dags:/opt/airflow/dags \
  -e AIRFLOW_CONN_SPARK_DEFAULT='spark://spark:7077' \
  local/airflow:2.8.0 standalone &> logs/airflow.txt &
