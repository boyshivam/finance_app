import "package:aprreciate/features/profile_dashboard/enums/order_tab_selected_enum.dart";
import "package:flutter/material.dart";

class OrderTabsModel {
  const OrderTabsModel({
    required this.tabName,
    this.tabIcon,
    required this.tab

});


  final String tabName;
  final IconData? tabIcon;
  final OrderTabSelectedEnum tab;
}
