with payments as (
    
    select 
        ID as payment_id,
        ORDERID as order_id,
        PAYMENTMETHOD as payment_method,
        STATUS,
        AMOUNT / 100 as AMOUNT,     -- amount is in cents, we want it in dollars
        CREATED as created_date,
        _BATCHED_AT as batched_ts
    from raw.STRIPE.PAYMENT
)

select * from payments