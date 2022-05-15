select orderid as order_id,status, sum(amount) as amount
from {{source('stripe','payment')}}
group by orderid,status