import "package:aprreciate/features/watchlist_dashboard/view_model/widgets/watchlist_item.dart";
import "package:flutter/material.dart";

class WatchlistViewer extends StatelessWidget {
  const WatchlistViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: ListView.builder(
          itemCount: ,
          itemBuilder: (context, index) => WatchlistItem(watchlist: watchlist) ),
    );
  }
}
