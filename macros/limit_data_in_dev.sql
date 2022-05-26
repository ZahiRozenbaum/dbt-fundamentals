{% macro limit_data_in_dev(column_name, num_of_days = 30) -%}
    {%- if target.name == 'default' -%}
    where {{column_name}} > dateadd(day, -{{num_of_days}},getdate()) 
    {%- endif -%}
{% endmacro %}



