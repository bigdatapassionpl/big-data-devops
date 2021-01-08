from airflow import DAG
from airflow.operators.dummy_operator import DummyOperator
from airflow.operators.python_operator import PythonOperator
from datetime import datetime


def print_hello():
    return 'Hello world!'


dag = DAG('radek_hello_world',
          description='Simple tutorial DAG',
          schedule_interval='*/5 * * * *',
          start_date=datetime(2020, 3, 20),
          catchup=False
          )

dummy_operator = DummyOperator(task_id='dummy_task', retries=3, dag=dag)

hello_operator = PythonOperator(task_id='hello_task', python_callable=print_hello, dag=dag)

dummy_operator >> hello_operator
