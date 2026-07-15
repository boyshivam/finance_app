import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/models/profile_models/services_grid_model_items/services_grid_model.dart";
import "package:flutter/material.dart";

class ServiceGridCard extends StatelessWidget {
  const ServiceGridCard({super.key, required this.item});

  final ServicesGridModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: AppColorsCommon.appWhite),
      child: Column(
        children: [
          Icon(item.icon, size: 20),
          const SizedBox(height: 5),
          Text(
            item.name,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
