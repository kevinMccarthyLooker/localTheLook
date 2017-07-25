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
      year
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
  dimension: user_id_testing {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
    link: {
      label: "test link: _in_query: {{status._in_query}}, _is_selected: {{status._is_selected}}, _is_filtered:{{status._is_filtered}}"
      url: "
      {% if count._value==true %}
      /explore/yes
      {% else %}
      /explore/{{_model._name}}/{{_explore._name}}?fields={{_view._name}}.detail*&f[{{_field._name}}]={{ value }}
      {% endif%}

      "
    }
  }

#   status._in_query

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
}
