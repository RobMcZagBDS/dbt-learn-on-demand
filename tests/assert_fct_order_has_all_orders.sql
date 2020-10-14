WITH stg as (
    select distinct order_id from {{ ref('stg_orders') }}
),
fact as (
    select order_id from {{ ref('fct_orders') }}
)
select * from stg
except
select * from fact
