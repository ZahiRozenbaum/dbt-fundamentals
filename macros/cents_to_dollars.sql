{%- macro cents_to_dollars(column_name , num_dec = 2) -%}
round(1.0 * sum({{column_name}}) / 100 , {{num_dec}})as {{column_name}}
{%- endmacro -%}