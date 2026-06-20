import "package:aprreciate/features/search_dashboard/view/widgets/recently%20viewed/item_card.dart";
import "package:aprreciate/models/search_dashboard_models/search_dashboard_card_model.dart";
import "package:flutter/material.dart";

class RecentlyViewedList extends StatelessWidget {
  const RecentlyViewedList({super.key, required this.items});

  final List<SearchDashboardCardModel> items;

  @override
  Widget build(BuildContext context) {



    return SizedBox(
      height: 400,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) =>
            ItemCard(item: items[index], liked: true),
      ),
    );
  }
}
