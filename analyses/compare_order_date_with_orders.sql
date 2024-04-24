with orders as (
    select order_date,
    count(order_id)
    from {{ ref('stg_orders') }}
    group by order_date
)

select * from orders order by order_date