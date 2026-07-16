import 'package:aprreciate/features/profile_dashboard/enums/order_tab_selected_enum.dart';
import 'package:aprreciate/models/profile_models/orders/order_tabs_model.dart';
import "package:flutter/material.dart";

const orderTabsData = [
  OrderTabsModel(
    tabName: 'All',
    tabIcon: Icons.filter_alt_outlined,
    tab: OrderTabSelectedEnum.all,
  ),
  OrderTabsModel(
    tabName: 'US Stocks ',
    tabIcon: Icons.filter_alt_outlined,
    tab: OrderTabSelectedEnum.usStocks,
  ),
  OrderTabsModel(
    tabName: 'Mutual Funds',
    tabIcon: Icons.filter_alt_outlined,
    tab: OrderTabSelectedEnum.mutualFunds,
  ),
  OrderTabsModel(
    tabName: 'Indian Stocks',
    tabIcon: Icons.filter_alt_outlined,
    tab: OrderTabSelectedEnum.indianStocks,
  ),
  OrderTabsModel(
    tabName: 'Goals',
    tabIcon: Icons.filter_alt_outlined,
    tab: OrderTabSelectedEnum.goals,
  ),
];
