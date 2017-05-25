connection: "thelook"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: order_items {
  fields:[ALL_FIELDS*,-orders.user_id]
  join: orders {sql_on: ${order_items.order_id} = ${orders.id} ;;
    type: left_outer
    relationship: many_to_one
  }
  join: inventory_items {sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    type: left_outer
    relationship: many_to_one
  }
  join: products {sql_on: ${inventory_items.product_id} = ${products.id} ;;
    type: left_outer
    relationship: many_to_one
  }
}
