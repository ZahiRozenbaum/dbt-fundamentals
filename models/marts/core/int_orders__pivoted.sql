--{%- set list_PAYMENTMETHOD = ['credit_card', 'coupon', 'bank_transfer','gift_card'] -%}

-- Returns a list of the payment_methods in the stg_payments model_


with  stg_payments_cte as
(select *
from {{ref('stg_payments')}})

{% if execute %}
{%- set list_PAYMENTMETHOD = dbt_utils.get_column_values(table=ref('stg_payments'), column='PAYMENTMETHOD') -%}


select ORDER_ID, 
{% for PAYMENTMETHOD in  list_PAYMENTMETHOD %}
sum(case when PAYMENTMETHOD='{{PAYMENTMETHOD}}' then amount else 0 end) as {{PAYMENTMETHOD}}_amount
    {%- if not loop.last -%}
    ,
    {%- endif -%}

{%- endfor %}
from stg_payments_cte
group by ORDER_ID
order by order_id
{% endif %}
