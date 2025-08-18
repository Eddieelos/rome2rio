"""
Airflow DAG for dbt pipeline orchestration (pseudocode)
"""
from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

default_args = {
    'owner': 'rome2rio',
    'start_date': datetime(2025, 8, 18),
}

dag = DAG(
    'rome2rio_dbt_pipeline',
    default_args=default_args,
    schedule_interval='@daily',
    catchup=False,
)

dbt_run = BashOperator(
    task_id='dbt_run',
    bash_command='dbt run',
    dag=dag,
)

dbt_test = BashOperator(
    task_id='dbt_test',
    bash_command='dbt test',
    dag=dag,
)

dbt_docs = BashOperator(
    task_id='dbt_docs',
    bash_command='dbt docs generate',
    dag=dag,
)

dbt_run >> dbt_test >> dbt_docs
