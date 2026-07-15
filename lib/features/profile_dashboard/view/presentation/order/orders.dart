import "package:aprreciate/features/profile_dashboard/view/widgets/orders_widgets/orders_tabs.dart";
import "package:aprreciate/features/profile_dashboard/view/widgets/orders_widgets/top_section.dart";
import "package:flutter/material.dart";

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [OrdersTopSection(), const SizedBox(height: 2), OrdersTabs()],
      ),
    );
  }
}
