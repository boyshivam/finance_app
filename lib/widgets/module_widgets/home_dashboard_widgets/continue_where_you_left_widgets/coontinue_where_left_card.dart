import "package:aprreciate/core/constants/app_assets/app_assets.dart";
import "package:aprreciate/core/themes/app_theme/AppColors.dart";
import "package:aprreciate/models/home_dashboard/continue_where_left_model.dart";
import "package:aprreciate/widgets/helper_widgets/cross_cta.dart";
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
        AspectRatio(
          aspectRatio: 4.46,
          child: Container(

            padding: EdgeInsets.symmetric( horizontal: 10),
            decoration: BoxDecoration(
              color: Color(0xFFE1ECFC),
              borderRadius: BorderRadius.circular(20),
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
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
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
        ),
        Positioned(
          right: -5,
            top: -5,
            child: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: AppColors.crossCtaBgColor ,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.crossCtaBorderColor,
              width: 2
            )
          ),
          child: Center(
            child: CustomPaint(
              size: Size(8, 8),
              painter: CrossCta(),
            )
          ),
        ))



      ],
      
    );
  }
}
