import "package:aprreciate/features/search_dashboard/view/widgets/recently%20viewed/item_card.dart";
import "package:aprreciate/models/stocks_model/stock_card_model.dart";
import "package:flutter/material.dart";

class RecentlyViewedList extends StatelessWidget {
  const RecentlyViewedList({super.key, required this.securities});

  final List<StockCardModel> securities;

  @override
  Widget build(BuildContext context) {



    return SizedBox(
      height: 400,
      child: ListView.builder(
        itemCount: securities.length,
        itemBuilder: (context, index) =>
            ItemCard(security: securities[index], liked: true),
      ),
    );
  }
}
