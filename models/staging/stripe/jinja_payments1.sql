with payments as(
    select * from {{ ref('stg_payments') }}
)

{% set payment_methods=['bank_transfer','credit_card','coupon','gift_card'] %}

select 
    order_id,
    {% for payment_method in payment_methods %}

        sum(case 
            when payment_method = '{{payment_method}}' then amount
            else 0
        end) as {{payment_method}}_method

        {% if not loop.last %}
            ,
        {% endif %}
    {% endfor %}

from payments
group by 1
        