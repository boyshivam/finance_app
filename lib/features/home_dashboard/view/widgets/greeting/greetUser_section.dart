import "package:aprreciate/core/constants/app_strings/features/app_strings_homedashboard/app_strings.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
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
        bottom: 25,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColorsCommon.appreciateThemeColor,
            AppColorsCommon.blueColor,
            AppColorsCommon.appWhite,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Row(
        children: [
          Text(
            AppStrings.homeD_hi_user,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: AppColorsCommon.appWhite,
            ),
          ),
          const Spacer(),
          Icon(Icons.notifications, color: AppColorsCommon.appWhite, size: 30),
          const SizedBox(width: 15),
          Icon(Icons.card_giftcard, color: AppColorsCommon.appWhite, size: 30),
        ],
      ),
    );
  }
}
