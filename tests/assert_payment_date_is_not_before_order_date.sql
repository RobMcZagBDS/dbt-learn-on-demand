WITH orders as (
    select 
        order_id, 
        order_date
    from {{ ref('stg_orders') }}
),
payments as (
    select 
        order_id, 
        created_date as payment_date 
    from {{ ref('stg_payments') }}
),
final as (
    select
        o.order_id,
        o.order_date,
        p.payment_date
    from orders as o
    left join payments as p using(order_id)
    where payment_date < order_date
)
select * from final
