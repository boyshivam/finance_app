import 'package:aprreciate/features/profile_dashboard/enums/order_tab_selected_enum.dart';
import 'package:aprreciate/features/profile_dashboard/view_model/view_model_orders/orders_state.dart';
import 'package:aprreciate/features/profile_dashboard/view_model/view_model_orders/providers/trade_orders_provider.dart';
import 'package:aprreciate/models/profile_models/orders/order_card_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrdersNotifier extends Notifier<OrdersState> {
  @override
  OrdersState build() {
    return OrdersState(
      orderTabSelected: OrderTabSelectedEnum.all,
      orderQuantity: 0,
      orderValue: 0,
      orderCards: [],
    );
  }

  // select a tab in  pill bar
  void onSelectTab(OrderTabSelectedEnum tab) {
    state = state.copyWith(orderTabSelected: tab);
  }

  void addOrderDetailsToCard(TradeOrderCardModel order) {
    final newCard = TradeOrderCardModel(
      transactionID: order.transactionID,
      orderStatus: order.orderStatus,
      security: order.security,
      orderAmount: order.orderAmount,
      orderType: order.orderType,
      orderQuantity: order.orderQuantity,
    );

    ref.read(tradeOrderProvider.notifier).add(newCard);
  }
}
