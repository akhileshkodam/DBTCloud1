select payment_id,
        {{cents_to_dollars('amount')}} as amount_in_dollars
        from {{ ref('stg_payments') }}