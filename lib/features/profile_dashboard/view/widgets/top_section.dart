import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

class TopSection extends StatelessWidget {
  const TopSection({super.key, required this.child});

  final Widget child;

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
      child: Row(
        children: [
          InkWell(
            onTap: () {
              context.pop();
            },
            child: Icon(
              Icons.arrow_back,
              size: 35,
              color: AppColorsCommon.appWhite,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(child: child),
          const SizedBox(width: 30),
          Icon(
            Icons.support_agent_outlined,
            size: 30,
            color: AppColorsCommon.appWhite,
          ),
        ],
      ),
    );
  }
}
