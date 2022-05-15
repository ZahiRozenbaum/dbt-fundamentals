select *
from  {{source('jaffle_shop','customers')}};

select *
from  {{source('jaffle_shop','orders')}};

select *
from  {{source('stripe','payment')}}

 

