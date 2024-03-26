connection: "ldeploy_the_look"

include: "/views/*.view"             # include all views in the views/ folder in this project

explore: orders {
  # conditionally_filter: {
  #   filters: [user_id: "123"]
  #   unless: [users.id]
  # }
  always_join: [users]
  join: users {
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: orders_extended {
  # always_join: [users]
  sql_always_where: ${users.city} LIKE 'San%' ;;
  join: users {
    sql_on: ${orders_extended.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: dt {
    sql_on: ${orders_extended.order_id} = ${dt.id} ;;
    relationship: one_to_one
  }
}

explore: more_users {
  conditionally_filter: {
    filters: [more_users.created_date: "7 days ago for 7 days"]
  }
  join: empty {}
  fields: [ALL_FIELDS*, -empty.myset*]
}

explore: empty {
  conditionally_filter: {
    # filters: [more_users.created_date: "7 days ago for 7 days"]
    filters: []
  }
  # join: more_users {}
}
