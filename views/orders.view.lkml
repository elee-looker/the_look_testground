view: orders {
  # sql_table_name: `looker-private-demo.thelook.orders`;;
  sql_table_name: `looker-private-demo.thelook.{% parameter users.testparam %}` ;;

  dimension: order_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_id ;;
    description: "Unique ID for the order"
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: raw {
    type: date_raw
    sql: ${TABLE}.created_at ;;
  }

  dimension: month_frame {
    sql: ${created_month} ;;
    html: {{ rendered_value | date: "%B %Y" }} ;;
  }

  dimension: month_frame2 {
    sql: ${created_month} ;;
    html: {{ rendered_value | date: "%c" }} ;;
  }

  dimension: date_test1 {
    sql: ${created_date} ;;
    html: {{ rendered_value | date: "%B %Y"}} ;;
  }

  dimension: date_test2 {
    sql: ${created_date} ;;
    html: {{ rendered_value | date: "%c"}} ;;
  }

  dimension: week_test1 {
    sql: ${created_week} ;;
    html: {{ rendered_value | date: "%B %Y"}} ;;
  }

  dimension: date_week2 {
    sql: ${created_week} ;;
    html: {{ rendered_value | date: "%c"}} ;;
  }

  dimension: timestamp_test {
    type: date_time
    datatype: timestamp
    sql: ${TABLE}.created_at ;;
  }

  dimension: datetime_test {
    type: date_time
    datatype: datetime
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: delivered {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.delivered_at ;;
  }

  dimension: gender {
    full_suggestions: no
    type: string
    sql: ${TABLE}.gender ;;
    drill_fields: [order_id, users.last_name, users.id, users.first_name, order_items.count]
  }

  dimension: num_of_item {
    type: number
    sql: ${TABLE}.num_of_item ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.returned_at ;;
  }

  dimension_group: shipped {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.shipped_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
    description: "User ID of the customer"
  }

  dimension: viewname_liquid {
    type: number
    # label: "{{ [_view._name] }}"
    # sql: {% if [_view._name]._in_query %} 1 {% else %} 2 {% endif %} ;;
    sql: ${TABLE}.status ;;
  }

  dimension: bad_sql {
    type: number
    sql: hi this is bad sql ;;
  }

  parameter: something {
    allowed_value: {
      label: "foo"
      value: "foo"
    }
  }

  measure: count {
    type: count
    # filters: [status: "Cancelled"]
    drill_fields: [order_id, users.last_name, users.id, users.first_name, order_items.count]
  }
}
