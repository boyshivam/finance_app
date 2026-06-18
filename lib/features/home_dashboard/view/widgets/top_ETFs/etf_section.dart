

import 'package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart';
import 'package:aprreciate/data/home_dash_data/etf_data/etf_data.dart';
import 'package:aprreciate/features/home_dashboard/view/widgets/top_ETFs/etf_categories.dart';
import 'package:aprreciate/features/home_dashboard/view/widgets/top_ETFs/etfs_list.dart';
import 'package:flutter/material.dart';

class EtfSection extends StatefulWidget {
  const EtfSection({super.key});

  @override
  State<EtfSection> createState() => _EtfSectionState();
}

class _EtfSectionState extends State<EtfSection> {
  final categories = etfs_Data.keys.toList();

  int selectedIndex = 0;

  final scrollController = ScrollController();

  void selectCategory(int index) {
    setState(() {
      selectedIndex = index;
    });

    scrollController.animateTo(
      index * 170,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {

    final selectedCategory = categories[selectedIndex];
    final selectedEtfsList = etfs_Data[selectedCategory] ?? [];

    return Container(
      margin: EdgeInsets.fromLTRB(25, 40, 0, 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              children: [
                Text(
                  "Top ETFs",
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  "View all",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColorsCommon.appreciateThemeColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          EtfCategories(
            etfCategories: categories,
            onSelectedCategory: selectCategory,
            selectedIndex: selectedIndex,
            scrollController: scrollController
          ),
          const SizedBox(height: 20),
          EtfList(etfList: selectedEtfsList),
        ],
      ),
    );
  }
}
