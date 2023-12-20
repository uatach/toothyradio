import datetime

from airflow import DAG
from airflow.operators.python import PythonOperator

def print_context(ds=None, **kwargs):
    print(ds)
    print(kwargs)
    return "Whatever you return gets printed in the logs"

with DAG(
    dag_id="hello_python",
    start_date=datetime.datetime(2021, 1, 1),
    schedule="@daily",
):
    run_this = PythonOperator(task_id="print_the_context", python_callable=print_context)

