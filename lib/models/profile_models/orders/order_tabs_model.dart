import "package:flutter/material.dart";

class OrderTabsModel {
  const OrderTabsModel({
    required this.tabName,
    this.tabIcon,

});


  final String tabName;
  final IconData? tabIcon;
}
