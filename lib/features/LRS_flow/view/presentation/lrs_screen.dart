import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/LRS_flow/view/widgets/bottom_section_LRS.dart";
import "package:aprreciate/features/LRS_flow/view/widgets/enter_amount_container.dart";
import "package:aprreciate/features/LRS_flow/view/widgets/top_section_LRS.dart";
import "package:aprreciate/features/LRS_flow/view_model/lrs_view_model/lrs_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class LrsScreen extends ConsumerStatefulWidget {
  const LrsScreen({super.key});

  @override
  ConsumerState<LrsScreen> createState() => _LrsScreenState();
}

class _LrsScreenState extends ConsumerState<LrsScreen> {
  late TextEditingController amountController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    amountController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(lrsProvider, (previous, next) {
      if (amountController.text != next.amountText) {
        amountController.text == next.amountText;
      }
    });

    return Scaffold(
      body: Column(children: [TopSectionLrs(), EnterAmountContainer()]),
      backgroundColor: AppColorsCommon.scaffoldBackGroundColor,
      bottomNavigationBar: BottomSectionLrs(),
    );
  }
}
