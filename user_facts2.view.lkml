view: user_facts2 {
  derived_table: {
    sql: select user_id,min(orders.created_at) ,max(orders.created_at),count(orders.id)
      from orders
      left join users on users.id=orders.user_id
      where
      {% condition date_control %} orders.created_at {% endcondition %}
      and
      {% condition orders.status %} orders.status {% endcondition %}
      group by 1
       ;;
  }

  filter: date_control {
    type: date
  }

  dimension: user_id_inquery {
    type: string
    sql: '{{user_id._in_query}}' ;;
  }

  dimension: user_id_inquery_ref {
    type: string
    sql: 'Hi' ;;
    html:
        {% if user_id_inquery._value == 'true' %}
        yes: {{user_id_inquery._value}}
        {% else %}
        else: {{user_id_inquery._value}}
        {% endif %}
         ;;
  }

  dimension: test_filter_passing {
    type: string
    sql: ${user_id} ;;
    link: {
      label: "test link"
      url: "/looks/4?f[orders.status]={{_filters['orders.status']}}"
    }
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: user_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension_group: minorders_created_at {
    type: time
    sql: ${TABLE}.`min(orders.created_at)` ;;
  }

  dimension_group: maxorders_created_at {
    type: time
    sql: ${TABLE}.`max(orders.created_at)` ;;
  }

  dimension: countorders_id {
    type: number
    sql: ${TABLE}.`count(orders.id)` ;;
  }

  set: detail {
    fields: [user_id, minorders_created_at_time, maxorders_created_at_time, countorders_id]
  }
}
