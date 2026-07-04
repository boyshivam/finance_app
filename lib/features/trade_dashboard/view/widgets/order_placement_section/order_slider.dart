import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/trade_dashboard/view_model/trade_screen_provider.dart";
import "package:aprreciate/router/app_navigators.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class OrderSlider extends ConsumerStatefulWidget {
  const OrderSlider({
    super.key,

  });


  @override
  ConsumerState<OrderSlider> createState() => _OrderSliderState();
}

class _OrderSliderState extends ConsumerState<OrderSlider> {

  double offset = 0;

  void placeOrder(double maxWidth) {
    if (offset >= maxWidth - 20) {
      setState(() {
        offset = 0;
      });
    } else {
      setState(() {
        offset = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: LayoutBuilder(
        builder: (context, constrains) {
          const double thumb = 50;
          final max = constrains.maxWidth - thumb;
          return GestureDetector(
            onHorizontalDragEnd: (_) {
              placeOrder(max);
            },
            onHorizontalDragUpdate: (details) {
              setState(() {
                offset += details.delta.dx;

                offset = offset.clamp(0, max);
              });
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColorsCommon.appreciateThemeColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                Center(
                  child: Text(
                    "Slide to buy",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColorsCommon.appWhite,
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 1),
                  curve: Curves.bounceInOut,
                  top: 5,
                  left: offset,
                  child: Container(
                    width: thumb,
                    height: thumb,
                    decoration: BoxDecoration(
                      color: AppColorsCommon.appWhite,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.arrow_right_alt_rounded),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
