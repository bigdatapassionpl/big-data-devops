#!/usr/bin/env bash

#sudo apt install python3.6
#sudo apt install python3.6-dev

#cd /home/radek/projects/OSA/osa-master/scheduler

export AIRFLOW_HOME=/home/radek/projects/BigDataPassion/big-data-devops/scripts/scheduler/airflow

rm -rf airflow-venv
virtualenv -p python3.6 airflow-venv
#virtualenv -p python3.6m airflow-venv
#virtualenv -p python3 airflow-venv

source airflow-venv/bin/activate

python --version

pip install apache-airflow

airflow initdb

echo "source airflow-venv/bin/activate"
echo "airflow webserver -p 8080"
echo "airflow scheduler"

deactivate