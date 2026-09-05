import 'package:aprreciate/features/cashfree_flow/view/widgets/cash_free_dashboard_widgets/cashFree_balance_section.dart';
import 'package:flutter/material.dart';

class BalanceSliverDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get maxExtent => 180;

  @override
  double get minExtent => 70;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: CashfreeBalanceSection(),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
