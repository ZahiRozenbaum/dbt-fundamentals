select o.order_id,customer_id, amount
from {{ref('stg_payments')}} p inner join {{ref('stg_orders')}} o
where p.order_id=o.order_id
