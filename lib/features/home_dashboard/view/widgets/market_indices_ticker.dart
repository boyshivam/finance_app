import "package:aprreciate/core/constants/app_assets/app_assets.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/core/utils/asset_helpers/asset_image_helpers.dart";
import "package:flutter/material.dart";

class MarketIndicesTicker extends StatefulWidget {
  const MarketIndicesTicker({super.key});

  @override
  State<MarketIndicesTicker> createState() => _MarketIndicesTickerState();
}

class _MarketIndicesTickerState extends State<MarketIndicesTicker> {
  late final ScrollController _scrollController;
  late final List<Map<String, dynamic>> loopingList;

  final List<Map<String, dynamic>> marketIndices = [
    {'name': 'Nasdaq', 'value': "28,123", 'up': true},
    {'name': 'S&P 500', 'value': "24,533", 'up': false},
    {'name': 'Russel 2000', 'value': "18,123", 'up': true},
    {'name': 'DOW', 'value': "31,343", 'up': false},
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    loopingList = [...marketIndices, ...marketIndices];
    startScrollingAnimation();
  }

  // this runs the animation
  Future<void> startScrollingAnimation() async {
    while (mounted) {
      await Future.delayed(const Duration(milliseconds: 14));
      double scrollOffset = _scrollController.offset + 1;
      double maxExtent = _scrollController.position.maxScrollExtent;

      if (_scrollController.hasClients) {
        if (scrollOffset >= maxExtent) {
          scrollOffset = 0;
        }
        _scrollController.jumpTo(scrollOffset);
      }
    }
  }

  // dispose scroll controller after use
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        physics: NeverScrollableScrollPhysics(),
        separatorBuilder: (_, _) => SizedBox(width: 20),
        itemCount: loopingList.length,
        itemBuilder: (context, index) {
          final item = loopingList[index];
          return Row(
            children: [
              Text(item['name']),
              const SizedBox(width: 5),
              item['up']
                  ? AssetImageHelper.image(
                      AppAssets.value_growth_icon,
                      width: 24,
                      height: 24,
                    )
                  : AssetImageHelper.image(
                      AppAssets.value_fall_icon,
                      width: 24,
                      height: 24,
                    ),
              const SizedBox(width: 5),
              Text(
                item['value'],
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: item["up"]
                      ? AppColorsCommon.positiveGreen
                      : AppColorsCommon.negativeRed,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

