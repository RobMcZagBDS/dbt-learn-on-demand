WITH orders as (
    select * from {{ ref('stg_orders') }}
),
order_payments as (
    select
        order_id,
        sum(case when status = 'success' then amount else 0 end) as amount
    from {{ ref('stg_payments') }}
    group by order_id
    
),
final as (
    select
        o.order_id,
        o.customer_id,
        coalesce(p.amount, 0) as amount
    from orders as o
    left outer join order_payments as p on (o.order_id = p.order_id)
)
select * from final