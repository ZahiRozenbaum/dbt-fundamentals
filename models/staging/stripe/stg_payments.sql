select orderid as order_id,status,PAYMENTMETHOD, sum(amount) as amount
from {{source('stripe','payment')}}
where status='success'
group by orderid,status,PAYMENTMETHOD
order by order_id