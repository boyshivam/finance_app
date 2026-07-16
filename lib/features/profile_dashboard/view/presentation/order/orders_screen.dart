import "package:aprreciate/data/profile_data/orders/trade_orders_data.dart";
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

    return Scaffold(
      body: Column(
        children: [
          OrdersTopSection(),
          const SizedBox(height: 2),
          OrdersTabs(),
          SizedBox(
            height: 800,
            child: ListView.builder(
              itemCount: tradeOrdersState.length,
              itemBuilder: (context, index) =>
                  OrderCard(item: tradeOrdersState[index]),
            ),
          ),
        ],
      ),
    );
  }
}
