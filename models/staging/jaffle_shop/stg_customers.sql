 {{ config(
    materialized = 'incremental',
    unique_key = 'customer_id'
) }}
 
 
 select
        id as customer_id,
        first_name,
        last_name

from {{source('jaffle_shop','customers')}}
{% if is_incremental() %}
where id  >= (select max(customer_id) from {{ this }})
{% endif %}
