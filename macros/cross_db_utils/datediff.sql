{% macro datediff(first_date, second_date, datepart) %}
  {{ adapter_macro('dbt_utils.datediff', first_date, second_date, datepart) }}
{% endmacro %}


{% macro default__datediff(first_date, second_date, datepart) %}

    datediff(
        {{ datepart }},
        {{ first_date }},
        {{ second_date }}
        )

{% endmacro %}


{% macro bigquery__datediff(first_date, second_date, datepart) %}

    datetime_diff(
        cast({{second_date}} as datetime),
        cast({{first_date}} as datetime),
        {{datepart}}
    ) 

{% endmacro %}


{% macro postgres__datediff(first_date, second_date, datepart) %}

    DATE_PART('{{datepart}}', cast({{second_date}} as timestamptz) - cast({{first_date}} as timestamptz))

{% endmacro %}
