# Data Engineering project

## Overview

This is a sample Data Engeneering project using [Apache Spark](https://spark.apache.org) and [Apache Airflow](https://airflow.apache.org) to consume data from the [Open Brewery DB API](https://openbrewerydb.org) and build a data lake with the [medallion architecture](https://www.databricks.com/glossary/medallion-architecture).


## Running

The only requirements are Bash for running the scripts and Docker (version 24.0.7).

To set up the environment and create the auxiliary directories and docker network and images, run:

```bash
tools/setup.sh
```

Next, to start Airflow in standalone mode, and the Spark Master and 2 Workers, run:

```bash
tools/start.sh
```

To stop all containers, run:

```bash
tools/stop.sh
```


## Viewing DAGs

After having started the services, go to <http://localhost:8080> to access Airflow, this will start Airflow's init and after some seconds, refresh the browser to generate the admin user, in the terminal run:

```bash
grep "username: admin" logs/airflow.txt
```

Copy the password for the admin user from the command's outuput, that will be something like:

```
standalone | Login with username: admin  password: NscVespEYeshX28k
```

After login in, there should be 2 DAGs listed in the DAGs screen: `hello_python` and `hello_spark`.

Enabling any of the DAGs and they will start to backfill automatically, the `hello_python` should work fine but the `hello_spark` currently just generate errors.


## Spark connection

Accessing the [Connections page](http://localhost:8080/connection/list/), find the `spark_default` connection and edit the connection:

Field|Value
--|--
Host|spark://spark
Port|7077
Extra|Add the contents from config/spark.json


## Current problems

### Spark connection

The `spark_default` connection is not being loaded from the `AIRFLOW_CONN_SPARK_DEFAULT` environment variable.


### Missing dependencies

Airflow is unable to launch Spark jobs, there are missing dependencies, after enabling the `hello_spark` DAG, task's logs generate the error:

```
/home/airflow/.local/lib/python3.8/site-packages/pyspark/bin/load-spark-env.sh: line 68: ps: command not found
```
