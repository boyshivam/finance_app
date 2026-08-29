import "package:aprreciate/core/constants/app_assets/assets_home_dashboard/continue_where_you_left/assets_continue_where_left.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

class HeaderSectionLRSConfirm extends StatelessWidget {
  const HeaderSectionLRSConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        25,
        MediaQuery.of(context).padding.top + 16,
        25,
        15,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFe6e7fa), Colors.blueAccent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: (){context.pop();},
            child: Icon(
              Icons.arrow_back_ios,
              size: 25,
              color: AppColorsCommon.appWhite,
            ),
          ),
          const SizedBox(width: 20),
          Text(
            "Confirm Remittance",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: AppColorsCommon.appWhite,
              fontSize: 23,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(width: 20),
          Image.asset(
            AssetsContinueWhereLeft.yes_Bank_icon,
            width: 25,
            height: 25,
          ),
          const SizedBox(width: 5),
          Text(
            "YES Bank",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: AppColorsCommon.appWhite,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
