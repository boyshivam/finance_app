import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:flutter/material.dart";

class AddFundsToWalletCta extends StatelessWidget {
  const AddFundsToWalletCta({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 10, horizontal: 30
          ),
          height: 50,
          decoration: BoxDecoration(
            color: AppColorsCommon.appreciateThemeColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Text(
            "Add funds to US wallet",
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: AppColorsCommon.appWhite),
            textAlign: TextAlign.center,
          ),

                ),
        ),
    );
  }
}
