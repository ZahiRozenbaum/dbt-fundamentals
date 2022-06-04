with payment as
(
    select *  from {{source('stripe','payment')}}
  --
  --  {{limit_data_in_dev('_BATCHED_AT', 30)}}
)


select orderid as order_id,status,PAYMENTMETHOD
, {{cents_to_dollars(column_name = 'amount',num_dec = 2 )}}
 from payment
where status='success'
group by orderid,status,PAYMENTMETHOD
order by order_id

