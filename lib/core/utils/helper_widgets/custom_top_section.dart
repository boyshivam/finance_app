import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/router/app_routes.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

class CustomTopSection extends StatelessWidget {
  const CustomTopSection({
    super.key,
    this.showSupportIcon,
    this.showBackCTA,
    required this.child,
    required this.childAlignment,
    required this.paddingTop,
    required this.paddingLeft,
    required this.paddingRight,
    required this.paddingBottom
  });

  final bool? showSupportIcon;
  final bool? showBackCTA;
  final MainAxisAlignment childAlignment;
  final Widget child;
  final double paddingTop;
  final double paddingBottom;
  final double paddingLeft;
  final double paddingRight;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        paddingLeft,
        MediaQuery.of(context).padding.top + 10,
        paddingRight,
        paddingBottom,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColorsCommon.snackBarMsgBlue,
            AppColorsCommon.appreciateThemeColor,
            AppColorsCommon.scaffoldBackGroundColor
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        mainAxisAlignment: childAlignment,
        children: [
          if (showBackCTA == true)
            InkWell(
              onTap: () {
                context.go(AppRoutes.profileDashboardScreen);
              },
              child: Icon(
                Icons.arrow_back_ios,
                size: 30,
                color: AppColorsCommon.appWhite,
              ),
            ),
          const SizedBox(width: 30),
          Expanded(
            child: Align(alignment: Alignment.center, child: child),
          ),
          const SizedBox(width: 30),
          if (showSupportIcon == true)
            Icon(
              Icons.live_help_outlined,
              size: 30,
              color: AppColorsCommon.appWhite,
            ),
        ],
      ),
    );
  }
}
