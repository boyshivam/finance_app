import "package:aprreciate/data/profile_data/orders/trade_orders_data.dart";
import "package:aprreciate/features/LRS_flow/view/widgets/confirm_lrs_screen_widgets/us_wallet_transaction_card.dart";
import "package:aprreciate/features/LRS_flow/view_model/lrs_view_model/lrs_order/lrs_transaction_provider.dart";
import "package:aprreciate/features/profile_dashboard/enums/order_tab_selected_enum.dart";
import "package:aprreciate/features/profile_dashboard/view/presentation/order/order_cards.dart";
import "package:aprreciate/features/profile_dashboard/view/widgets/orders_widgets/orders_tabs.dart";
import "package:aprreciate/features/profile_dashboard/view/widgets/orders_widgets/top_section.dart";
import "package:aprreciate/features/profile_dashboard/view_model/view_model_orders/providers/orders_provider.dart";
import "package:aprreciate/features/profile_dashboard/view_model/view_model_orders/providers/trade_orders_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class OrderScreen extends ConsumerStatefulWidget {
  const OrderScreen({super.key});

  @override
  ConsumerState<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends ConsumerState<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    final vmState = ref.watch(ordersProvider);

    final tradeOrdersState = ref.watch(tradeOrderProvider);

    final usWalletOrdersState = ref.watch(lrsTransactionProvider);

    return Scaffold(
      body: Column(
        children: [
          OrdersTopSection(),
          const SizedBox(height: 2),
          OrdersTabs(),
          if (vmState.orderTabSelected == OrderTabSelectedEnum.all)
            SizedBox(
              height: 800,
              child: ListView.builder(
                itemCount: tradeOrdersState.length,
                itemBuilder: (context, index) =>
                    OrderCard(item: tradeOrdersState[index]),
              ),
            ),
          if (vmState.orderTabSelected == OrderTabSelectedEnum.goals)
            SizedBox(
              height: 800,
              child: ListView.builder(
                itemCount: usWalletOrdersState.length,
                itemBuilder: (context, index) =>
                    UsWalletTransactionCard(item: usWalletOrdersState[index]),
              ),
            ),
        ],
      ),
    );
  }
}
