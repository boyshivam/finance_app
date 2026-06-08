import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/models/home_dashboard/our_offering_model.dart";
import "package:flutter/material.dart";

class OurOfferingsCard extends StatelessWidget {
  const OurOfferingsCard({super.key, required this.card});

  final OurOfferingsModel card;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          decoration: BoxDecoration(
            color: AppColorsCommon.appWhite,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                card.title,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w900),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 10),
              Text(
                card.subtext,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(width: 26),
            ],
          ),
        ),
        Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset(card.iconPath, width: 40, height: 40)),
      ],
    );
  }
}
