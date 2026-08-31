import "package:flutter/material.dart";

class UsWalletOrderCard extends StatelessWidget {
  const UsWalletOrderCard({super.key, required this.usWalletOrder});

  final UsWalletOrderCardModel usWalletOrder;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      child: Column(
        children: [
          Text(usWalletOrder.transactionType),
          const SizedBox(height: 10),
          Row(children: [usWalletOrder.date, usWalletOrder.amount]),
        ],
      ),
    );
  }
}
