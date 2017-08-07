connection: "thelook"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

label: "Orders"

explore: order_items {
  fields: [ALL_FIELDS*,-orders.orders_per_person]
  access_filter: {
    field: products.brand
    user_attribute: brand
  }
  join: users {
    relationship: many_to_one
    sql_on: ${orders.user_id}=${users.id} ;;
  }


  hidden: yes
#   sql_always_where: ${orders.status}='complete' ;;
#   conditionally_filter: {
#     filters:{
#       field:  orders.status
#       value: "complete"
#     }
#     unless: [orders.created_date]
#   }
#   always_filter: {
#     filters:{
#       field:  orders.status
#       value: "complete"
#     }
#   }
#   always_join: [orders]



  group_label: "Orders restricted"
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

explore:  inventory_items {}
