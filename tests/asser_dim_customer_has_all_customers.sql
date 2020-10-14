WITH stg as (
    select distinct customer_id from {{ ref('stg_customers') }}
),
fact as (
    select customer_id from {{ ref('dim_customers') }}
)
select * from stg
except
select * from fact