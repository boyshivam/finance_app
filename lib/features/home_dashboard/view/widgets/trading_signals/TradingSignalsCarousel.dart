import "package:aprreciate/core/constants/app_assets/app_assets.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_features/app_colors_home_dashboard.dart";
import "package:aprreciate/data/home_dash_data/trading_signals_data.dart";
import "package:aprreciate/features/home_dashboard/view/widgets/trading_signals/trading_signals_card.dart";
import "package:flutter/material.dart";

class TradingSignalsCarousel extends StatefulWidget {
  const TradingSignalsCarousel({super.key});

  @override
  State<TradingSignalsCarousel> createState() => _TradingSignalsCarouselState();
}

class _TradingSignalsCarouselState extends State<TradingSignalsCarousel> {
  late final PageController controller;

  double currentPage = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = PageController(viewportFraction: 0.7);

    controller.addListener(() {
      setState(() {
        currentPage = controller.page ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColorsCommon.scaffoldBackGroundColor,
            AppColorsHomeDashboard.tradingSignalGradientGreen,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Row(
              children: [
                Text(
                  "Trading Signals",
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                const Spacer(),
                Row(
                  children: [
                    Text("Explore", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColorsCommon.appreciateThemeColor
                    ),),
                    const SizedBox(width: 5),
                    Image.asset(
                      AppAssets.ho_blue_forward_icon,
                      width: 30,
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: PageView.builder(
              controller: controller,
              itemCount: trading_signals_data.length,
              itemBuilder: (context, index) {
                final difference = (currentPage - index).abs();

                double scale = (1 - (difference * .15)).clamp(0.75, 1);

                return Transform.scale(
                  scale: scale,
                  child: TradingSignalsCard(card: trading_signals_data[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
