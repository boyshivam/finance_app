import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/models/home_dashboard_models/top_etfs_model.dart";
import "package:flutter/material.dart";

class EtfCard extends StatelessWidget {
  const EtfCard({super.key, required this.etfCard});
  
  final TopEtfModel etfCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColorsCommon.appWhite
      ),
      child: Row(
        children: [
          Image.asset(etfCard.etfIcon),
          const SizedBox(width: 5,),
          Column(
            children: [
              Text(etfCard.etfSymbol),
              const SizedBox(height: 5,),
              Text(etfCard.etfName)
            ],
          ),
          const SizedBox(width: 15,),
          Column(
            children: [
              Text(etfCard.etfPrice),
              const SizedBox(height: 5,),
              Text(etfCard.etfChangePerc)
            ],
          )
        ],
      ),
    );
  }
}
