import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/watchlist_dashboard/view_model/watchlist_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class CreateWatchlistBottomSheet extends ConsumerWidget {
  const CreateWatchlistBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vmState = ref.watch(watchlistProvider);

    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
      child: Column(
        children: [
          Text("Create new watchlist"),
          const SizedBox(height: 15),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColorsCommon.appreciateThemeColor,
                width: 2.5,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Enter watchlist name", style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColorsCommon.textGrey
                ),),
                TextField(
                  decoration: InputDecoration(
                    counterText: "",
                    border: InputBorder.none,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
