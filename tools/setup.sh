#!/usr/bin/env bash

mkdir -p logs work

chmod 777 work

docker network create barley

docker build --quiet -t local/airflow:2.8.0 - < docker/airflow.dockerfile

