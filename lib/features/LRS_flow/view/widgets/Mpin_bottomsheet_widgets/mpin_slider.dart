import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/LRS_flow/view_model/mpin_view_model/mpin_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class MpinSlider extends ConsumerStatefulWidget {
  const MpinSlider({super.key});

  @override
  ConsumerState<MpinSlider> createState() => _MpinSliderState();
}

class _MpinSliderState extends ConsumerState<MpinSlider> {
  double offset = 0;



  @override
  Widget build(BuildContext context) {

    final vmState = ref.watch(mpinProvider);

    return SizedBox(
      height: 60,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double thumb = 50;
          final max = constraints.maxWidth - thumb;

          return GestureDetector(
            onHorizontalDragEnd: (_){
              ref.read(mpinProvider.notifier).submitMpin(max);
            },
            onHorizontalDragUpdate: (details) {
              ref.read(mpinProvider.notifier).sliderMovement(details, 0, max);
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(35)),
                    color: Colors.grey,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                    child: Text("Slide to proceed", style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColorsCommon.appWhite
                    ),)),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 100),
                  left: vmState.offset,
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Container(
                      height: thumb,
                      width: thumb,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.indigo,
                      ),
                    ),
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
