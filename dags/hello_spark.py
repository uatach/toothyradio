import datetime

from airflow import DAG
from airflow.providers.apache.spark.operators.spark_submit import SparkSubmitOperator


with DAG(
    dag_id="hello_spark",
    start_date=datetime.datetime(2021, 1, 1),
    schedule="@daily",
):
    submit_job = SparkSubmitOperator(
        #application="${SPARK_HOME}/examples/src/main/python/pi.py",
        application="/home/airflow/.local/lib/python3.8/site-packages/pyspark/examples/src/main/python/pi.py",
        #/opt/airflow/scripts/some.py
        task_id="submit_job",
        verbose=True,
    )



# {
#   "queue": "root.default",
#   "deploy-mode": "cluster",
#   "spark_home": "",
#   "spark_binary": "spark-submit",
#   "namespace": "default"
# }
