
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:flutter/material.dart";


class PortfolioDashTopSection extends StatelessWidget {
  const PortfolioDashTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1),
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(25, MediaQuery.of(context).viewInsets.top + 60, 25, 25),
      color: AppColorsCommon.appWhite,
      child: Text("Portfolio", style: Theme.of(context).textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 25
      ),),
    );
  }
}
