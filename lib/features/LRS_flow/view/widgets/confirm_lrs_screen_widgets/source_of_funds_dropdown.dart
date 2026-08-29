import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/data/lrs_data/source_of_funds_dropdown.dart";
import "package:aprreciate/features/LRS_flow/view_model/lrs_view_model/lrs_screen/lrs_provider.dart";
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SourceOfFundsDropdown extends ConsumerWidget {
  const SourceOfFundsDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vmState = ref.watch(lrsProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Source of Funds",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            color: Colors.blueAccent,
            child: DropdownButton(
              hint: Text("-Select a source-", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColorsCommon.appWhite
              ),),
              value: vmState.selectedFundSource,
              items: vmState.sourceOfFunds.map((fund) {
                return DropdownMenuItem(
                  value: fund,
                  
                  child: Text(
                    fund,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColorsCommon.appWhite
                    ),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                ref.read(lrsProvider.notifier).selectSourceOfFund(value!);
              },
            ),
          ),
        ],
      ),
    );
  }
}
