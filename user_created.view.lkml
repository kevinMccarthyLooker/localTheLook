view: user_created {
 derived_table: {
   sql:
  select user_id, min(created_at) created
  from public.users
  group by user_id;;
 }
dimension: user_id {
  primary_key: yes
  sql: ${TABLE}.user_id ;;
}
dimension: created {
  type: date
  sql: ${TABLE}.created ;;
}
}
