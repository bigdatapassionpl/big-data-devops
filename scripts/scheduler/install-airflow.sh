#!/usr/bin/env bash

#sudo apt install python3.6
#sudo apt install python3.6-dev

#cd /home/radek/projects/OSA/osa-master/scheduler

export AIRFLOW_HOME=/home/radek/projects/BigDataPassion/big-data-devops/scripts/scheduler/airflow

rm -rf airflow-venv
virtualenv -p python3.8 airflow-venv
#virtualenv -p python3.6 airflow-venv
#virtualenv -p python3.6m airflow-venv
#virtualenv -p python3 airflow-venv

source airflow-venv/bin/activate

python --version

pip install apache-airflow

#airflow initdb
airflow db init

#airflow create_user -r Admin -u admin -e admin@acme.com -f admin -l user -p password123
airflow users create -r Admin -u admin -e admin@acme.com -f admin -l user -p password123

echo "source airflow-venv/bin/activate"
echo "airflow webserver -p 8080"
echo "airflow scheduler"

deactivate