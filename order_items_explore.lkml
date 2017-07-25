include: "order_items.view"
include: "orders.view"
include: "users.view"
include: "inventory_items.view"
include: "products.view"

explore: order_items2 {
  from: order_items
  join: orders {sql_on: ${order_items2.order_id} = ${orders.id} ;;
    type: left_outer
    relationship: many_to_one
  }
    join: users {sql_on: ${orders.user_id} = ${users.id} ;;
    type: left_outer
    relationship: many_to_one
  }
  join: inventory_items {sql_on: ${order_items2.inventory_item_id} = ${inventory_items.id} ;;
    type: left_outer
    relationship: many_to_one
  }
    join: products {sql_on: ${inventory_items.product_id} = ${products.id} ;;
    type: left_outer
    relationship: many_to_one
  }

}
