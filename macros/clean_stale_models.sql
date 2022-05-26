{% macro clean_stale_models(database=target.database, schema=target.schema, days=7, dry_run=True) %}

    {% set get_drop_commands_query %}
      select case when TABLE_TYPE = 'VIEW' THEN 'VIEW' ELSE 'TABLE' END AS TYPE,
      'DROP ' || TYPE || ' {{ database | upper }}.' || table_schema || '.' || table_name || ';' AS DROP_COL
      from INFORMATION_SCHEMA.tables
      where  TABLE_CATALOG =upper('{{target.database}}')
      AND TABLE_SCHEMA = upper('{{target.schema}}')
    {% endset %}

    {{ log('\nGenerating cleanup queries...\n', info=True) }}
    {% if execute  %}

      {% set drop_queries = run_query(get_drop_commands_query).columns[1].values() %}
  
      {% for drop_query in drop_queries %}
            {{ log( drop_query, info=True) }}

          {% if execute and not dry_run %}
              {{ log('Dropping table/view with command: ' ~drop_query, info=True) }}
              {% do run_query(drop_query) %}    
          {% else %}
              {{ log(drop_query, info=True) }}          
          {% endif %}
      {% endfor %}

   {% endif %}
{% endmacro %}