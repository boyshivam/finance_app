import "package:flutter/material.dart";

class UsWalletOrdersViewer extends StatelessWidget {
  const UsWalletOrdersViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
        itemBuilder: UsWalletOrderCard());
  }
}
