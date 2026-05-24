import "package:aprreciate/core/constants/app_assets/app_assets.dart";
import "package:aprreciate/core/constants/app_assets/app_strings.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/core/utils/asset_helpers/asset_image_helpers.dart"
    show AssetImageHelper;
import "package:aprreciate/features/passcode/enums/passcode_enums.dart";
import "package:aprreciate/features/passcode/view/widgets/passcode_UI.dart";
import "package:aprreciate/features/passcode/view_model/passcode_view_model.dart";
import "package:aprreciate/router/app_navigators.dart";
import "package:flutter/material.dart";
import "package:aprreciate/core/themes/app_theme/app_theme.dart";

import "../widgets/passcode_numpad.dart";

class PasscodeScreen extends StatefulWidget {
  const PasscodeScreen({super.key});

  @override
  State<PasscodeScreen> createState() => _PasscodeScreenState();
}

class _PasscodeScreenState extends State<PasscodeScreen> {
  final vm = PasscodeViewModel();

  Future<void> onKeyPressed(String value) async {

    final enteredPasscode = vm.onKeyPress(value);
    setState(() {});
    if(vm.passcodeFullLength(enteredPasscode)){
      final verifyPasscode = vm.validatePasscode(enteredPasscode);
      if(verifyPasscode){
        AppNavigators.goToHomeDashBoard(context);
      }else{
        if(!vm.locked){
          await Future.delayed(Duration(seconds: 1));
          vm.resetPasscode(PasscodeValidationState.empty);
          setState(() {});
        }else{
          setState(() {});
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // top header section with appreciate text and logo
            Container(
              // height: 80,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              decoration: BoxDecoration(color: Color(0xFFFFFFFF)),
              child: Row(
                children: [
                  AssetImageHelper.image(AppAssets.lo_ap_logo, height: 24),
                  const Spacer(),
                  AssetImageHelper.image(
                    AppAssets.lo_support,
                    height: 24,
                    width: 24,
                  ),
                ],
              ),
            ),
            // This container has the passcode UI
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 40, 25, 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          AppStrings.passcode_subtext,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            AppNavigators.goToLogin(context);
                          },
                          child: Text(
                            AppStrings.passcode_sign_out,
                            style: Theme.of(context).textTheme.bodySmall!
                                .copyWith(
                                  color: AppColorsCommon.appreciateThemeColor,
                                ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    PasscodeUI(vm: vm),
                  ],
                ),
              ),
            ),

            // This is the numpad
            PasscodeNumpad(enteredPasscode: onKeyPressed),
          ],
        ),
      ),
    );
  }
}
