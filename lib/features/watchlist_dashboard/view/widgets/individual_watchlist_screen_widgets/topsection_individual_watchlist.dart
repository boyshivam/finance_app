import "package:aprreciate/core/constants/app_assets/app_assets_common.dart";
import "package:flutter/material.dart";

class TopsectionIndividualWatchlist extends StatelessWidget {
  const TopsectionIndividualWatchlist({
    super.key,
    required this.watchlistHeader,
  });

  final String watchlistHeader;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(25, MediaQuery.of(context).padding.top + 16, 25, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(AppAssetsCommon.generic_back_cta, width: 30, height: 30),
          const SizedBox(height: 10),
          Text(
            watchlistHeader,
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(
                fontSize: 26,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),
          Text(
            "Build a portfolio to track your favourite US stocks.",
            style: Theme.of(
              context,
            ).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
