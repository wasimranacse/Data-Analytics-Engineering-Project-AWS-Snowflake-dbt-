-- Prevent the Duplication of the models names!
{% macro generate_schema_name(custom_schema_name, node) %}

    {%- if custom_schema_name is none -%}
        {{ target.schema }}
    {%- else -%}
        {{ custom_schema_name }}
    {%- endif -%}

{% endmacro %}