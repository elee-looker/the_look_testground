view: dt {
  derived_table: {
    sql: SELECT
    (DATE(orders_extended.created_at , 'America/Denver')) AS orders_extended_created_date,
    orders_extended.order_id  AS orders_extended_order_id,
    COUNT(*) AS orders_extended_count
    FROM `looker-private-demo.thelook.orders` AS orders_extended
    GROUP BY
        1
    ORDER BY
        1 DESC
    LIMIT 500 ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.orders_extended_order_id ;;
  }

  dimension: date {
    sql: ${TABLE}.orders_extended_created_date ;;
  }

  dimension: count {
    sql: ${TABLE}.orders_extended_count ;;
  }
}

# view: dt {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
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
# }
