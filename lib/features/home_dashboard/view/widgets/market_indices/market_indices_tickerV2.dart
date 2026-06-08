import "package:aprreciate/core/constants/app_assets/app_assets_common.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/core/utils/asset_helpers/asset_image_helpers.dart";
import "package:flutter/material.dart";

class MarketIndicesTickerV2 extends StatefulWidget {
  const MarketIndicesTickerV2({super.key});

  @override
  State<MarketIndicesTickerV2> createState() => _MarketIndicesTickerV2State();
}

class _MarketIndicesTickerV2State extends State<MarketIndicesTickerV2>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final List<Map<String, dynamic>> loopingList;

  static const double contentWidth = 800;

  // initiate the controller
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loopingList = [...marketIndices, ...marketIndices];
    animationController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
  }

  // market indices -
  final List<Map<String, dynamic>> marketIndices = [
    {'name': 'NASDAQ', 'value': '21,443', 'up': true},
    {'name': 'S&P 500', 'value': '28,933', 'up': true},
    {'name': 'RUSSELL 2000', 'value': '26,312', 'up': false},
  ];

  Widget _marketTickerItem(Map<String, dynamic> item) {
    return Padding(
      padding: EdgeInsets.only(right: 25),
      child: Row(
        children: [
          Text(
            item['name'],
            style: Theme.of(
              context,
            ).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w900),
          ),
          const SizedBox(width: 5,),
          Text(
            item['value'],
            style: Theme.of(
              context,
            ).textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w400,
                color: item['up'] ? AppColorsCommon.positiveGreen : AppColorsCommon.negativeRed),
          ),
          const SizedBox(width: 8,),
          Icon(
            item['up'] ? Icons.arrow_drop_up : Icons.arrow_drop_down,
            color: item['up']
                ? AppColorsCommon.positiveGreen
                : AppColorsCommon.negativeRed,
          ),
        ],
      ),
    );
  }

  // dispose the animation controller
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final duplicatedList = [...marketIndices, ...marketIndices];



    return Container(
      color: AppColorsCommon.appWhite,
      height: 50,
      child: ClipRect(
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            final dx = -(contentWidth * animationController.value);
            return Transform.translate(
              offset: Offset(dx, 0),
              child: child
              );
          },
          child: Row(
            children: duplicatedList.map(_marketTickerItem).toList()
          ),
        ),
      ),
    );
  }
}
