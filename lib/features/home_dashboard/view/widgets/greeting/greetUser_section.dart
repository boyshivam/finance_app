import "package:aprreciate/core/constants/app_assets/app_assets.dart";
import "package:aprreciate/core/constants/app_assets/app_strings/app_strings.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_module.dart";
import "package:aprreciate/core/utils/asset_helpers/asset_image_helpers.dart";
import "package:flutter/material.dart";

class GreetUserSection extends StatelessWidget {
  const GreetUserSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 16,
        left: 24,
        right: 24,
          bottom: 14
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [AppColorsModule.greetContainerGradientColor1, AppColorsModule.greetContainerGradientColor2],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight)
      ),
      child: Row(
        children: [

          Text(AppStrings.homeD_hi_user),
          const Spacer(),
          AssetImageHelper.image(AppAssets.ho_bell_icon, width: 24, height: 24),
          const SizedBox(width: 15),
          AssetImageHelper.image(AppAssets.ho_rewards_icon, width:  24, height: 24)
        ],
      ),
    );
  }
}
