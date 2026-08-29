import "package:aprreciate/core/constants/app_assets/app_assets_common.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/router/app_routes.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        25,
        MediaQuery.of(context).padding.top + 20,
        25,
        35,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColorsCommon.appreciateThemeColor,
            AppColorsCommon.snackBarMsgBlue,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Text(
        "Menu",
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.w800,
          fontSize: 45,
          color: AppColorsCommon.appWhite
        ),
      ),
    );
  }
}
