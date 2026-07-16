import "package:aprreciate/core/constants/app_assets/app_assets_common.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/router/app_routes.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

class OrdersTopSection extends StatelessWidget {
  const OrdersTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        25,
        MediaQuery
            .of(context)
            .padding
            .top + 16,
        25,
        20,
      ),
      decoration: BoxDecoration(color: AppColorsCommon.appWhite),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              context.go(AppRoutes.profileDashboardScreen);
            },
            child: Image.asset(
              AppAssetsCommon.generic_back_cta,
              width: 30,
              height: 30,
            ),
          ),
          const SizedBox(width: 30),
          Text(
            "Orders",
            style: Theme
                .of(context)
                .textTheme
                .bodySmall!
                .copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
