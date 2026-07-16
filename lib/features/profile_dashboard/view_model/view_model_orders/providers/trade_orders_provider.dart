import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:aprreciate/features/profile_dashboard/view_model/view_model_orders/notifiers/trade_orders_notifier.dart';
import 'package:aprreciate/models/profile_models/orders/order_card_model.dart';

final tradeOrderProvider =
    NotifierProvider<TradeOrdersNotifier, List<OrderCardModel>>(
      TradeOrdersNotifier.new,
    );
