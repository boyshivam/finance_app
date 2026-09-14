import "package:aprreciate/core/utils/helper_widgets/custom_top_section.dart";
import "package:aprreciate/core/utils/helper_widgets/header_text_helper.dart";
import "package:aprreciate/features/profile_dashboard/view/widgets/services_grid_section.dart";
import "package:aprreciate/features/profile_dashboard/view/widgets/us_wallet_&_upi.dart";
import "package:flutter/material.dart";

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomTopSection(childAlignment: MainAxisAlignment.start,child: HeaderTextHelper(text: "Menu", fontSize: 24,)),
            UsWalletUpi(),
            ServicesGridSection()
          ],
        ),
      ),
    );
  }
}
