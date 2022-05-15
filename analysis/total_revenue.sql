select *
from {{ref('stg_payments')}}
where status = 'success'