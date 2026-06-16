import "package:aprreciate/features/home_dashboard/view/widgets/top%20ETFs/helper_etf_widgets/etf_category_pill.dart";
import "package:aprreciate/models/home_dashboard/etf_category_model.dart";
import "package:flutter/material.dart";

class EtfCategories extends StatelessWidget {
  const EtfCategories({
    super.key,
    required this.etfCategories,
    required this.onSelectedCategory,
    required this.selectedIndex,
    required this.scrollController
  });

  final List<EtfCategoryModel> etfCategories;
  final Function(int index) onSelectedCategory;
  final int selectedIndex;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ListView.separated(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            onSelectedCategory(index);
          },
          child: EtfCategoryPill(
            etfCategory: etfCategories[index],
            isSelected: selectedIndex == index,
          ),
        ),
        separatorBuilder: (_, _) => SizedBox(width: 20),
        itemCount: etfCategories.length,
      ),
    );
  }
}
