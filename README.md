# Rome2Rio dbt Analytics Project

## Overview
This project models travel booking data for analytics and experimentation. It includes:
- Staging models for raw seed data
- Fact and dimension tables for bookings, passengers, and segments
- Data quality tests
- Airflow DAG for orchestration

## Models
- **fact_bookings**: Aggregates bookings, passenger counts, and revenue
- **dim_passenger**: Passenger attributes
- **dim_segment**: Segment attributes

## Data Quality Tests
- Not null and unique constraints on IDs
- Relationship tests between fact and dimension tables
- Accepted values and positive price checks

## Orchestration
See `dags/rome2rio_dbt_dag.py` for Airflow DAG pseudocode

## Documentation
Model-level docs are in the YAML files in `models/marts/`

## Code Review & Leadership
See `code_review.md` and `leadership_scenario.md` for responses
