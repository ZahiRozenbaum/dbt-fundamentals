{% snapshot mock_orders %}

{% set new_schema = target.schema + '_snapshot' %}

{{
    config(
      target_database='analytics',
      target_schema=new_schema,
      unique_key='order_id',

      strategy='check',
      check_cols=['status'],
    )
}}

select * from RAW.JAFFLE_SHOP.mock_orders

{% endsnapshot %}