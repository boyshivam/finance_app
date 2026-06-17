import "package:aprreciate/data/search_dashboard_data/search_tabs.dart";
import "package:aprreciate/features/search_dashboard/view/widgets/search_tab_pill.dart";
import "package:flutter/material.dart";

class SearchTabs extends StatelessWidget {
  const SearchTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => SearchTabPill(tab: searchTabs[index]),
        separatorBuilder: (_,_) => const SizedBox(width: 50,),
        itemCount: searchTabs.length,
      ),
    );
  }
}
