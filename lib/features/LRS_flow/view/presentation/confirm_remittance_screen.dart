import "package:aprreciate/features/LRS_flow/enums/remitanceValidityCheck.dart";
import "package:aprreciate/features/LRS_flow/view/widgets/confirm_lrs_screen_widgets/confirm_lrs_buttons.dart";
import "package:aprreciate/features/LRS_flow/view/widgets/confirm_lrs_screen_widgets/source_of_funds_dropdown.dart";
import "package:aprreciate/features/LRS_flow/view_model/lrs_view_model/lrs_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";


class ConfirmRemittanceScreen extends ConsumerStatefulWidget {
  const ConfirmRemittanceScreen({super.key});

  @override
  ConsumerState<ConfirmRemittanceScreen> createState() => _ConfirmRemittanceScreenState();
}

class _ConfirmRemittanceScreenState extends ConsumerState<ConfirmRemittanceScreen> {



  @override
  Widget build(BuildContext context) {

    final vmState = ref.watch(lrsProvider);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SourceOfFundsDropdown(),
          Padding(
            padding: EdgeInsets.fromLTRB(
              50,
              MediaQuery.of(context).padding.top + 160,
              50,
              50,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CheckboxListTile(
                title: Text("Confirm "
                    "orders"),
                tileColor: Colors.grey,
                value:
                vmState.remittanceValidityCheck ==
                    RemittanceValidityCheck.checked,
                onChanged: (value) {
                  final notifier = ref.read(lrsProvider.notifier);
                  notifier.remittanceCheckbox(value);
                },
              ),
            ),
          ),
          ConfirmLrsButtons()
        ],
      ),
    );
  }
}



