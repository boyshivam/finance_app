import 'package:aprreciate/core/utils/common_helper_enums/order_stage_enum.dart';
import 'package:aprreciate/features/profile_dashboard/enums/order_tab_selected_enum.dart';
import 'package:aprreciate/features/profile_dashboard/enums/trade_order_type_enums.dart';
import 'package:aprreciate/features/profile_dashboard/view_model/view_model_orders/orders_state.dart';
import 'package:aprreciate/features/profile_dashboard/view_model/view_model_orders/providers/trade_orders_provider.dart';
import 'package:aprreciate/features/trade_dashboard/view_model/trade_screen_provider.dart';
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

  void addOrderDetailsToCard() {
    final vmTradeNotifier = ref.watch(tradeScreenProvider);

    double orderQuantityTrade =
        double.tryParse(vmTradeNotifier.quantityText) ?? 0;
    double orderValueTrade =
        double.tryParse(vmTradeNotifier.orderValueText) ?? 0;

    final newCard = TradeOrderCardModel(
      orderStatus: OrderStageEnums.submitted,
      security: "APPL",
      orderAmount: orderValueTrade,
      orderType: TradeOrderTypeEnums.buyFraction,
      orderQuantity: orderQuantityTrade,
    );

    ref.read(tradeOrderProvider.notifier).add(newCard);

    state = state.copyWith(
      orderQuantity: orderQuantityTrade,
      orderValue: orderValueTrade,
      orderCards: [...state.orderCards, newCard],
    );
  }
}
