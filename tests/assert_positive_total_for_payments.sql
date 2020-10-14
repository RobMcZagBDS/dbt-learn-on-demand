WITH payments as (
    select * from {{ ref('stg_payments') }}
),
total_by_order as (
    select
        order_id,
        sum(amount) as total_amount
    from payments
    group by order_id
)
select * from total_by_order
where total_amount < 0