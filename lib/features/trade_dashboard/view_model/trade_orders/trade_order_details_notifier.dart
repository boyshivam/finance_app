import 'package:aprreciate/features/trade_dashboard/model/trade_order_details_model/trade_order_details.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

class TradeOrderDetailsNotifier extends Notifier<List<TradeOrderDetailsModel>> {
  @override
  List<TradeOrderDetailsModel> build() {
    return [];
  }

  void addTradeOrder(TradeOrderDetailsModel order) {
    state = [...state, order];
  }
}
