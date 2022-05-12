from datetime import datetime, timedelta

# [START import_module]
# The DAG object; we'll need this to instantiate a DAG
from airflow import DAG

# Operators; we need this to operate!
from airflow.providers.cncf.kubernetes.operators.spark_kubernetes import SparkKubernetesOperator
from airflow.providers.cncf.kubernetes.sensors.spark_kubernetes import SparkKubernetesSensor

# [END import_module]


# [START instantiate_dag]

dag = DAG(
    'osa_wiki_import',
    default_args={'max_active_runs': 1},
    description='submit osa-wiki-import as sparkApplication on kubernetes',
    schedule_interval=timedelta(days=1),
    start_date=datetime(2021, 1, 1),
    catchup=False,
)

t1 = SparkKubernetesOperator(
    task_id='osa_wiki_import_submit',
    namespace="airflow",
    application_file="osa_wiki_import.yaml",
    do_xcom_push=True,
    dag=dag,
)

t2 = SparkKubernetesSensor(
    task_id='osa_wiki_import_monitor',
    namespace="airflow",
    application_name="{{ task_instance.xcom_pull(task_ids='osa_wiki_import_submit')['metadata']['name'] }}",
    dag=dag,
)
t1 >> t2
