import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/LRS_flow/enums/source_of_funds_enums.dart";
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
              hint: Text(
                "-Select a source-",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColorsCommon.appWhite,
                ),
              ),
              value: vmState.selectedFundSource,
              items: vmState.sourceOfFunds.map((fund) {
                final entry = fund.entries.first;

                return DropdownMenuItem<SourceOfFundsEnums>(
                  value: entry.key,
                  child: Text(
                    fund.values.toString(),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColorsCommon.appWhite,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  ref.read(lrsProvider.notifier).selectSourceOfFund(value);
                }
              },
            ),
          ),
          if (vmState.selectedFundSource == SourceOfFundsEnums.none &&
              vmState.isFundsSourceNone == true)
            Text(
              "Select a source of fund",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w300,
                fontSize: 22,
                color: AppColorsCommon.appreciateThemeError,
              ),
            ),
        ],
      ),
    );
  }
}
