
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:flutter/material.dart";

class CashfreeTopSection extends StatelessWidget {
  const CashfreeTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        25,
        MediaQuery.of(context).padding.top + 16,
        25,
        20,
      ),

      decoration: BoxDecoration(
        color: AppColorsCommon.snackBarMsgBlue,
        borderRadius: BorderRadius.only(
          topRight: Radius.zero,
          topLeft: Radius.zero,
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.arrow_back_ios,
              size: 25,
              color: AppColorsCommon.appWhite,
            ),
          ),
          const SizedBox(height: 10),
          Icon(
            Icons.account_balance,
            color: AppColorsCommon.appreciateThemeColor,
            size: 70,
          ),
          const SizedBox(height: 10),
          Text(
            "CashFree funding",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w900,
              color: AppColorsCommon.appWhite,
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
