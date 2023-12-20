# Data Engineering project

## Overview

This is a sample Data Engeneering project using [Apache Spark](https://spark.apache.org) and [Apache Airflow](https://airflow.apache.org) to consume data from the [Open Brewery DB API](https://openbrewerydb.org) and build a data lake with the [medallion architecture](https://www.databricks.com/glossary/medallion-architecture).


## Running

The only requirements are Bash for running the scripts and Docker (version 24.0.7).

To set up the environment and create the auxiliary directories, network and docker image, run:
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

