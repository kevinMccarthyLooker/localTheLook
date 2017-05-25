view: userattributepdt {
#   # Or, you could make this view a derived table, like this:
  derived_table: {
    sql: SELECT
        '{{_user_attributes["users_brand"]}}' as usersBrand
      ;;
  }
#
#   # Define your dimensions and measures here, like this:
  dimension: user_brand {
#     description: "Unique ID for each user that has ordered"
    type: string
    sql: ${TABLE}.users_brand ;;
  }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }

}
