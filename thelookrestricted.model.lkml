connection: "thelook"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"


explore: recent_order_items {
  from: order_items
  view_name: order_items
  sql_always_where:  DATE(${orders.created_raw} ) > CURRENT_DATE()-10;;
#   sql_always_where:  DATE(${orders.created_raw} ) > CURRENT_DATE()-10 and ${products.brand} like '{{_user_attributes["users_brand"]}}';;


  access_filter: {
    field: products.brand
    user_attribute: users_brand
  }

  always_join: [orders,products]

  join: orders {sql_on: ${order_items.order_id} = ${orders.id} ;;
    type: left_outer
    relationship: many_to_one
  }
  join: users {sql_on: ${orders.user_id} = ${users.id} ;;
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

# explore: userattributepdt {}
