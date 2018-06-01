view: order_items {
  sql_table_name: demo_db.order_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
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
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  measure: avg_price {
    type: average
    sql: ${sale_price}  ;;
  }

  measure: count {
    type: count
    drill_fields: [id, inventory_items.id, orders.id]

  }

  # dimension: sale_price_in_query {
  #   sql: '{{ sale_price._in_query}}' ;;
  # }

  # dimension: orders_in_query {
  #   sql: case when {{ order_items._in_query}}  then 'yay' else 'nope' end ;;
  # }

  measure: bar_graph_test {# doesn't quite work... The actual width isn't constant or proportional and there's width when the value is 0.
    type: number
    sql: sum(case when ${sale_price}>20 then 1 else 0 end) *1.0/nullif(${count},0) ;;
    html:


<table width="100%">

  <tr>
    <td style="background-color: rgb(255,0,255);" width="{{ value | times: 100 }}%">{{value}}</td>
    <td style="background-color: rgb(255,255,255);" width="{{ value | times: -100 | plus: 100 }}%"></td>
  </tr>
</table>


;;

  }


}
