connection: "thelook"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

# explore: inventory_items {
#   join: products {
#     type: left_outer
#     sql_on: ${inventory_items.product_id} = ${products.id} ;;
#     relationship: many_to_one
#   }
# }

explore: user_facts2 {
  join: orders {
    type: left_outer
    relationship: one_to_one
    sql_on: ${user_facts2.user_id}=${orders.user_id} ;;
  }
}

explore: order_items {
  access_filter: {
    field: products.brand
#     user_attribute: brand_string_filter
    user_attribute: brand
#     user_attribute: users_brand
  }

#   access_filter: {
#     field: products.brand
#     user_attribute: users_brand
#   }

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

  join: user_facts_lookml_derived {
    type: left_outer
    relationship: one_to_one
    sql_on: ${users.id}=${user_facts_lookml_derived.user_id} ;;
  }

}

explore: recent_order_items {
  extends: [order_items]
  from: order_items
  view_name: order_items
  sql_always_where:  DATE(orders.created_at ) > CURRENT_DATE()-10 ;;
  always_join: [orders]

}

explore: user_facts_lookml_derived {}

# explore: orders {
#   join: users {
#     type: left_outer
#     sql_on: ${orders.user_id} = ${users.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: products {}
#
# explore: users {}
