import "package:aprreciate/core/constants/app_assets/app_assets.dart";
import "package:aprreciate/models/home_dashboard/continue_where_left_model.dart";
import "package:aprreciate/widgets/helper_widgets/size_config.dart";
import "package:flutter/material.dart";

import "../../../../core/utils/asset_helpers/asset_image_helpers.dart";

class ContinueWhereLeftCard extends StatelessWidget {
  const ContinueWhereLeftCard({super.key, required this.card});

  final ContinueWhereLeftModel card;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            color: Color(0xFFE1ECFC),
            borderRadius: BorderRadius.circular(26),
            border: Border.all(color: Color(0xFF6D9FF7), width: 2),
          ),
          child: Row(
            children: [
              AssetImageHelper.image(card.icon, height: 35, width: 35),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 290,
                    child: Text(
                      card.title,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  Text(
                    card.actionCTA,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
            top: -10,
            left: 365,
            child: AssetImageHelper.image(AppAssets.cross_icon, height: 33, width: 33)),
        Positioned(
          left: 170,
            top: 60,
            child: Text("hello"),)
      ],
      
    );
  }
}
