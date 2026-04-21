
import "package:aprreciate/core/utils/asset_helpers/asset_image_helpers.dart";
import "package:aprreciate/models/home_dashboard/our_offering_model.dart";
import "package:aprreciate/widgets/helper_widgets/size_config.dart";
import "package:flutter/material.dart";

class OurOfferingsCard extends StatelessWidget {
  const OurOfferingsCard({super.key, required this.ourOfferingsCard});

  final OurOfferingsModel ourOfferingsCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 146,
      height: 81,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xFFFFFFFF),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ourOfferingsCard.title,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 18
                ),
              ),
              const SizedBox(height: 10),
              Text(
                ourOfferingsCard.subtext,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          Positioned(
            top: 55,
            right: -14,
            child: AssetImageHelper.image(
              ourOfferingsCard.iconPath,
              width: SizeConfig.width(context)* 0.11,
              height: SizeConfig.width(context)* 0.12,
            ),
          ),
        ],
      ),
    );
  }
}
