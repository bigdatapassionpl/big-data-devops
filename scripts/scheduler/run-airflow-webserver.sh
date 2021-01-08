#!/usr/bin/env bash

export AIRFLOW_HOME=/home/radek/projects/BigDataPassion/big-data-devops/scripts/scheduler/airflow

source airflow-venv/bin/activate

airflow webserver -p 8080