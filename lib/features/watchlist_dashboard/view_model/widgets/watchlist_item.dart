import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/models/watchlist_models/watchlist_model.dart";
import "package:flutter/material.dart";


class WatchlistItem extends StatelessWidget {
  const WatchlistItem({super.key, required this.watchlist});

  final WatchlistModel watchlist;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
      child: Column(
        children: [
          Row(
            children: [
              Text(watchlist.watchlistName),
              const Spacer(),
              Text("View all")
            ],
          ),
          const SizedBox(height: 20,),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColorsCommon.appWhite
              ),
              child: Row(
                children: [
                  Icon(Icons.inventory_2, size: 30,),
                  const SizedBox(width: 15,),
                  Column(
                    children: [
                      Text("Your Watchlist is Empty!"),
                      const SizedBox(height: 5,),
                      Text(
                          "Keep an eye on your favourite stocks by adding them here."),
                      const SizedBox(),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                width: 1.5,
                                color: AppColorsCommon.appreciateThemeColor
                            )
                        ),
                        child: Text("Add stock"),
                      )
                    ],
                  )
                ],
              )

          )
        ],
      ),);
  }
}

