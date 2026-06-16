import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_features/app_colors_home_dashboard.dart";
import "package:aprreciate/models/home_dashboard/etf_category_model.dart";
import "package:flutter/material.dart";

class EtfCategoryPill extends StatelessWidget {
  const EtfCategoryPill({
    super.key,
    required this.etfCategory,
    required this.isSelected,
  });

  final EtfCategoryModel etfCategory;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: isSelected
              ? AppColorsHomeDashboard.activeCategoryBorderColor
              : AppColorsHomeDashboard.inactiveCategoryBorderColor,
        ),
        borderRadius: BorderRadius.circular(30),
        color: AppColorsCommon.appWhite,
      ),
      child: Row(
        children: [
          Image.asset(etfCategory.categoryIcon, width: 20, height: 20),
          const SizedBox(width: 10),
          Text(
            etfCategory.categoryName,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: isSelected
                  ? AppColorsHomeDashboard.activeCategoryTextColor
                  : AppColorsHomeDashboard.inactiveCategoryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
