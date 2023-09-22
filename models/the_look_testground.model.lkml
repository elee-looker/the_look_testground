connection: "ldeploy_the_look"

include: "/views/*.view"             # include all views in the views/ folder in this project

explore: orders {}

explore: orders_extended {
  join: users {
    sql_on: ${orders_extended.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: more_users {}

#testing git pulls
