- dashboard: test_lookml_dash
  title: test lookml dash
  layout: newspaper
  elements:
  - name: test lookmldash
    title: test lookmldash
    model: thelook
    explore: order_items
    type: single_value
    fields:
    - orders.count
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: message
      label: message
      expression: concat("testing lookml dash access. order count:", ${orders.count})
      value_format:
      value_format_name:
      _kind_hint: measure
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields:
    - orders.count
    row:
    col:
    width:
    height:
