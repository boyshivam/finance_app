import "package:aprreciate/features/LRS_flow/enums/remitanceValidityCheck.dart";
import "package:aprreciate/features/LRS_flow/view/widgets/confirm_lrs_screen_widgets/confirm_lrs_buttons.dart";
import "package:aprreciate/features/LRS_flow/view/widgets/confirm_lrs_screen_widgets/header_section.dart";
import "package:aprreciate/features/LRS_flow/view/widgets/confirm_lrs_screen_widgets/purpose_remittance.dart";
import "package:aprreciate/features/LRS_flow/view/widgets/confirm_lrs_screen_widgets/source_of_funds_dropdown.dart";
import "package:aprreciate/features/LRS_flow/view_model/lrs_view_model/lrs_screen/lrs_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class ConfirmRemittanceScreen extends ConsumerStatefulWidget {
  const ConfirmRemittanceScreen({super.key});

  @override
  ConsumerState<ConfirmRemittanceScreen> createState() =>
      _ConfirmRemittanceScreenState();
}

class _ConfirmRemittanceScreenState
    extends ConsumerState<ConfirmRemittanceScreen> {


  // in case T&C checkbox not ticket, show this snack bar message
  void checkBoxSnackBarMsg() {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: 1500),
        content: Text("Accept T&C to proceed with transaction"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vmState = ref.watch(lrsProvider);
    return Scaffold(
      body: Column(
        children: [
          HeaderSectionLRSConfirm(),
          PurposeRemittanceSection(),
          SourceOfFundsDropdown(),
          const Spacer(),
          ConfirmLrsButtons(checkboxSnackBar: checkBoxSnackBarMsg),
        ],
      ),
    );
  }
}
