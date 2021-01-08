#!/usr/bin/env bash

export AIRFLOW_HOME=/home/radek/projects/OSA/osa-master/scheduler/airflow

source airflow-venv/bin/activate

airflow webserver -p 8080