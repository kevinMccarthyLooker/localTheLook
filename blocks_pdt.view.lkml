
view: blocks_pdt {
  derived_table: {
    sql:
select 1 as ID'blue' as Color, 'rectangular prism' as Shape, 4 as width, 6 as length, 20 as height, 480 as Volume, 'picture' as Comments union
select 2 as ID'green' as Color, 'rectangular prism' as Shape, 3 as width, 6 as length, 18 as height, 324 as Volume, '' as Comments union
select 3 as ID'blue' as Color, 'rectangular prism' as Shape, 3 as width, 6 as length, 12 as height, 216 as Volume, '' as Comments union
select 4 as ID'blue' as Color, 'rectangular prism' as Shape, 3 as width, 6 as length, 12 as height, 216 as Volume, '' as Comments union
select 5 as ID'light blue' as Color, 'rectangular prism' as Shape, 6 as width, 6 as length, 12 as height, 432 as Volume, '' as Comments union
select 6 as ID'green' as Color, 'rectangular prism' as Shape, 3 as width, 6 as length, 12 as height, 216 as Volume, '' as Comments union
select 7 as ID'yellow' as Color, 'rectangular prism' as Shape, 3 as width, 6 as length, 18 as height, 324 as Volume, '' as Comments union
select 8 as ID'green' as Color, 'rectangular prism' as Shape, 3 as width, 6 as length, 18 as height, 324 as Volume, '' as Comments union
select 9 as ID'light blue' as Color, 'cylinder' as Shape, 6 as width, 6 as length, 12 as height, 339.336 as Volume, '' as Comments union
select 10 as ID'brown' as Color, 'rectangular prism' as Shape, 1 as width, 3 as length, 14 as height, 42 as Volume, 'road' as Comments union
select 11 as ID'yellow' as Color, 'bridge' as Shape, 6 as width, 6 as length, 12 as height, 228 as Volume, 'cuboid with a half cylinder cut out (volume of 38 x 6)' as Comments union
select 12 as ID'green' as Color, 'cylinder' as Shape, 4 as width, 4 as length, 16 as height, 201.088 as Volume, '' as Comments union
select 13 as ID'light green' as Color, 'half circle prism' as Shape, 3 as width, 7 as length, 6 as height, 115.4685 as Volume, '' as Comments union
select 14 as ID'blue' as Color, 'triangular prism' as Shape, 8 as width, 8 as length, 6 as height, 192 as Volume, '' as Comments union
select 15 as ID'silver' as Color, 'cylinder' as Shape, 4 as width, 4 as length, 1 as height, 12.568 as Volume, 'coin' as Comments union
select 16 as ID'yellow' as Color, 'cube' as Shape, 6 as width, 6 as length, 6 as height, 216 as Volume, '' as Comments
      ;;
  }

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
