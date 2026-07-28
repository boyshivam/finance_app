import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/models/watchlist_models/watchlist_model.dart";
import "package:flutter/material.dart";

class AddToWatchlistBottomSheetCard extends StatelessWidget {
  const AddToWatchlistBottomSheetCard({super.key, required this.watchlistItem});

  final IndividualWatchlistModel watchlistItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: 15, horizontal: 25
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5,
          color: AppColorsCommon.inactiveTextFieldBorderColor,
        ),
      ),
      child: Row(children: [
        Text(watchlistItem.watchlistName),
        const Spacer(),
        Checkbox(value: false, onChanged: (value){})
      ]),
    );
  }
}
