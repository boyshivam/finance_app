import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/data/lrs_data/source_of_funds_dropdown.dart";
import "package:aprreciate/features/LRS_flow/view_model/lrs_view_model/lrs_provider.dart";
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SourceOfFundsDropdown extends ConsumerWidget {
  const SourceOfFundsDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vmState = ref.watch(lrsProvider);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20, horizontal: 15
      ),
      color: Colors.white10,
      child: DropdownButton(
        value: vmState.selectedFundSource,
        items: vmState.sourceOfFunds.map((fund) {
          return DropdownMenuItem(value: fund, child: Text(fund));
        }).toList(),
        onChanged: (value) {
          ref.read(lrsProvider.notifier).selectSourceOfFund(value!);
        },
      ),
    );
  }
}
