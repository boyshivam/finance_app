import "package:aprreciate/core/constants/app_assets/app_assets_common.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:flutter/material.dart";

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        25,
        MediaQuery.of(context).padding.top + 20,
        25,
        20,
      ),
      decoration: BoxDecoration(color: AppColorsCommon.appWhite),
      child: Row(
        children: [
          Image.asset(AppAssetsCommon.generic_back_cta, width: 30, height: 30),
          const SizedBox(width: 25),
          Text(
            "Menu",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w800,
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}
