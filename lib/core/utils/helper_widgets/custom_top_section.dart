import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

class CustomTopSection extends StatelessWidget {
  const CustomTopSection({
    super.key,
    this.showSupportIcon,
    this.showBackCTA,
    required this.child,
    required this.childAlignment,
  });


  final bool? showSupportIcon;
  final bool? showBackCTA;
  final MainAxisAlignment childAlignment;
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
        mainAxisAlignment: childAlignment,
        children: [
          if (showBackCTA == true)
            InkWell(
              onTap: (){
                context.pop();
              },
              child: Icon(
                Icons.arrow_back_ios,
                size: 30,
                color: AppColorsCommon.appWhite,
              ),
            ),
          const SizedBox(width: 30,),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: child,
            ),
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
