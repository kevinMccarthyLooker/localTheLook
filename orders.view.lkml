view: orders {
  sql_table_name: demo_db.orders ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      month_name
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  dimension: user_id_testing_old{
    type: string
    # hidden: yes
#     sql: ${TABLE}.user_id ;;

#     link: {
#       label: "test link: _in_query: {{status._in_query}}, _is_selected: {{status._is_selected}}, _is_filtered:{{status._is_filtered}}"
#       url: "
#       {% if count._value==true %}
#       /explore/yes
#       {% else %}
#       /explore/{{_model._name}}/{{_explore._name}}?fields={{_view._name}}.detail*&f[{{_field._name}}]={{ value }}
#       {% endif%}
#       "
#     }
#     link: {
#       label: "test link: _in_query: {% if status._in_query %} haha {% else %} false {% endif %}"
#       url: "
#       foo
#       "
#     }

#    sql: 'test link: _is_filtered: {% if status._is_filtered %} sql TRUE {% else %} sql false {% endif %}' ;;

#   html: test link: _is_filtered: {% if status._is_filtered %} html TRUE {% else %} html false {% endif %} ;;

  }

  dimension: user_id_link_testing{
    type: string
    sql: ${TABLE}.user_id ;;

    link: {
      label: "test liquid: _in_query value: {{status._in_query}}, _is_selected: {{status._is_selected}}, _is_filtered:{{status._is_filtered}}"
      url: "
      {% if status._is_selected==true %}
      go to some special URL that is better for people who care about status
      {% else %}
      /explore/{{_model._name}}/{{_explore._name}}?fields={{_view._name}}.detail*&f[{{_field._name}}]={{ value }}
      {% endif%}
      "
    }
#    sql: 'test link: _is_filtered: {% if status._is_filtered %} sql TRUE {% else %} sql false {% endif %}' ;;
#   html: test link: _is_filtered: {% if status._is_filtered %} html TRUE {% else %} html false {% endif %} ;;
  }

  measure: count {
    type: count
    drill_fields: [id, users.last_name, users.first_name, users.id, order_items.count]




#     html:
#     {{value}}
#
#     {% if status._in_query %}
#     ({{status._value}})
#     {% else %}
#     {% endif %}
#     ;;
# html:
# {% if value == 'Complete' %}
# <span style ="color: darkgreen">{{ value }}</span>
# {% elsif value == 'Cancelled' %}
# <span style  ="color: darkred">{{ value }}</span>
# {% elsif value == 'Returned' %}
# <span style ="color: darkred">{{ value }}</span>
# {% else %}
# <span style  ="color: goldenrod">{{ value }}</span>
# {% endif %} ;;
  }
  set: detail {
    fields: [id]
  }

  filter: x {
    type: string
  }

  dimension: my_selected_value {
    type: string
    sql: power(cast({% parameter x %} as DECIMAL(11,5)),datediff(current_date,${created_date}))  ;;
  }

}
