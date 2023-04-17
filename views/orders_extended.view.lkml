include: "/views/orders.view"

view: orders_extended {
  extends: [orders]

  measure: total {
    type: number
    sql: ${count} + ${users.count} ;;
  }
}
