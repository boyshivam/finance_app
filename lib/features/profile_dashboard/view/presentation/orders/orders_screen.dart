import "package:aprreciate/core/utils/helper_widgets/custom_top_section.dart";
import "package:aprreciate/core/utils/helper_widgets/header_text_helper.dart";
import "package:aprreciate/features/profile_dashboard/enums/order_tab_selected_enum.dart";
import "package:aprreciate/features/profile_dashboard/view/presentation/orders/trade_order_card.dart";
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

    final vmTradeOrdersProvider = ref.watch(tradeOrderProvider);

    return Scaffold(
      body: Column(
        children: [
          CustomTopSection(
              showBackCTA: true,
              child: HeaderTextHelper(text: "Orders", fontSize: 26),
              childAlignment: MainAxisAlignment.center,
              paddingTop: 30,
              paddingLeft: 20,
              paddingRight: 20,
              paddingBottom: 30),
          const SizedBox(height: 2),
          OrdersTabs(),
          if (vmState.orderTabSelected == OrderTabSelectedEnum.usStocks)
            SizedBox(
              height: 800,
              child: ListView.builder(
                itemCount: vmTradeOrdersProvider.length,
                itemBuilder: (context, index) =>
                    TradeOrderCard(item: vmTradeOrdersProvider[index]),
              ),
            ),
        ],
      ),
    );
  }
}
