 include: "order_items_explore.lkml"
# include: "thelook.*"
view: user_facts_lookml_derived {
  derived_table: {
    explore_source: order_items2 {
      column: user_id {field: orders.user_id}
      column: order_count {field:orders.count}
      column: order_item_count {field: order_items2.count}
      filters: {
        field: orders.status
        value: "'{{ orders.status._value }}'"
      }
    }
  }
  dimension: user_id {type:number primary_key:yes}
  dimension: order_count {type:number}
  dimension: order_item_count {type:number}
}
