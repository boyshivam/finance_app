import "package:aprreciate/features/profile_dashboard/view/widgets/top_section.dart";
import "package:aprreciate/features/profile_dashboard/view/widgets/us_wallet_&_upi.dart";
import "package:flutter/material.dart";

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopSection(),
          UsWalletUpi()
        ],
      ),
    );
  }
}
