{% macro grant_select() %}
  {% set sql_grant %}
   grant select on all tables in schema {{target.schema}}  to role {{ target.role }};
  {% endset %}

  {{ log('grant tables start:', info=True) }}
  {% do run_query(sql_grant) %}  
  {{ log('grant tables finish:', info=True) }}
{% endmacro %}