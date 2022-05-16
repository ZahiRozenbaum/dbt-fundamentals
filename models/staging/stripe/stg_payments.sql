select orderid as order_id,status,PAYMENTMETHOD
, {{cents_to_dollars(column_name = 'amount',num_dec = 2 )}}
 from {{source('stripe','payment')}}
where status='success'
group by orderid,status,PAYMENTMETHOD
order by order_id