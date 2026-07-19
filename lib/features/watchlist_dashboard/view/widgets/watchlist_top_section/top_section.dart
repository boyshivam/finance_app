import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:flutter/material.dart";

class WatchlistTopSection extends StatelessWidget {
  const WatchlistTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        25,
        MediaQuery.of(context).padding.top + 16,
        25,
        20,
      ),
      decoration: BoxDecoration(color: AppColorsCommon.appWhite),
      child: Row(
        children: [

          Text(
            "Watchlist",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w900,
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
