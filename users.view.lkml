view: users {
  sql_table_name: demo_db.users ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }


  measure: count2 {
    label: "Campaign Invites"
    type: count
  }
  measure: count_over_20 {type: count filters: {field:age value:">20"} }
  measure: count_over_30 {type: count filters: {field:age value:">30"} }
  measure: count_over_40 {type: count filters: {field:age value:">40"}label:"Site Visits"}
  measure: count_over_50 {type: count filters: {field:age value:">50"}label:"Product Page Views"}
  measure: count_over_55 {type: count filters: {field:age value:">55"}label:"Added to Cart"}
  measure: count_over_60 {type: count filters: {field:age value:">60"}label:"Purchase Complete"}



  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
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

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: state {
    map_layer_name: us_states
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

dimension: currentUserBrand {
  type: string
  sql: case when ${products.brand} like '{{_user_attributes["users_brand"]}}' then 'happy' else 'Other Brands' end  ;;
}


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      last_name,
      first_name,
      events.count,
      orders.count,
      user_data.count
    ]
  }
}
