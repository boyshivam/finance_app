import 'package:aprreciate/features/profile_dashboard/view_model/view_model_orders/notifiers/orders_notifier.dart';
import 'package:aprreciate/features/profile_dashboard/view_model/view_model_orders/orders_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ordersProvider = NotifierProvider<OrdersNotifier, OrdersState>(
  OrdersNotifier.new,
);
