{%- set list_PAYMENTMETHOD = ['credit_card', 'coupon', 'bank_transfer','gift_card'] -%}

with  stg_payments as
(select *
from {{ref('stg_payments')}})

select ORDER_ID, 
{% for PAYMENTMETHOD in  list_PAYMENTMETHOD %}
sum(case when PAYMENTMETHOD='{{PAYMENTMETHOD}}' then amount else 0 end) as {{PAYMENTMETHOD}}_amount
    {%- if not loop.last -%}
    ,
    {%- endif -%}

{%- endfor %}
from stg_payments
group by ORDER_ID
order by order_id
