select orderid as order_id, sum(amount) as amount
from {{source('stripe','payment')}}
group by orderid