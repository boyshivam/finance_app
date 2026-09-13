import 'package:aprreciate/features/trade_dashboard/model/trade_order_details_model/trade_order_details.dart';
import 'package:aprreciate/features/trade_dashboard/view_model/trade_orders/trade_order_details_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tradeOrderDetailsProvider =
    NotifierProvider<TradeOrderDetailsNotifier, List<TradeOrderDetailsModel>>(
      TradeOrderDetailsNotifier.new,
    );
