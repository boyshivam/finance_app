import "package:aprreciate/core/constants/app_assets/assets_home_dashboard/continue_where_you_left/assets_continue_where_left.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/models/home_dashboard_models/continue_where_left_model.dart";
import "package:aprreciate/router/app_navigators.dart";
import "package:flutter/material.dart";

class ContinueWhereLeftCard extends StatelessWidget {
  const ContinueWhereLeftCard({super.key, required this.item});

  final ContinueWhereLeftModel item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          // margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26),
            color: AppColorsCommon.lightBlueBackground,
            border: Border.all(
              width: 1.5,
              color: AppColorsCommon.appreciateThemeColor,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(item.icon, width: 40, height: 40),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.title,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                    ),

                    InkWell(
                      onTap: (){
                        AppNavigators.goToStockDetailsScreen(context);
                      },
                      child: Text(
                        item.actionCTA,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColorsCommon.appreciateThemeColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: -10,
          top:-10,
          child: Image.asset(
            AssetsContinueWhereLeft.close_card_icon,
            width: 35,
            height: 35,
          ),
        ),
      ],
    );
  }
}
