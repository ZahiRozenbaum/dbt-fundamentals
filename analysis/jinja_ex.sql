{#
Delimiters
{%....%} are for statements
{{....}} are expressions used to print to template output
#}
{#....#} {#are for comments which are not included in the template output
#....## are used as line statements#}


/*variable*/
{%- set  x = 2 %}
{%- set  y = 6 %}
first_ var is {{ x }}
sec var is {{ y }}
/*if */
{%- if x > 3 %}
  x - {{x}} is graeter than 3
{%- else %}
  x - {{x}} is lower than 3
{%- endif %}
/*loop */
{%- set list_name = ['zahi','lilach','or','shalev']%}
{%- for name_ in list_name%}
      the Name is {{name_}}
{%- endfor %}