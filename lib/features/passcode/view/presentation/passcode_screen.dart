import "package:aprreciate/core/constants/app_assets/app_assets.dart";
import "package:aprreciate/core/constants/app_assets/app_assets_common.dart";
import "package:aprreciate/core/constants/app_strings/features/app_strings_homedashboard/app_strings.dart";
import "package:aprreciate/core/constants/app_strings/features/passcode/passcode_constants.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/core/utils/asset_helpers/asset_image_helpers.dart"
    show AssetImageHelper;
import "package:aprreciate/features/passcode/view/widgets/passcode_UI.dart";
import "package:aprreciate/features/passcode/view_model/passcode_provider/passcode_provider.dart";
import "package:aprreciate/router/app_navigators.dart";
import "package:flutter/material.dart";
import "package:aprreciate/core/themes/app_theme/app_theme.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "../widgets/passcode_numpad.dart";

class PasscodeScreen extends ConsumerStatefulWidget {
  const PasscodeScreen({super.key});

  @override
  ConsumerState<PasscodeScreen> createState() => _PasscodeScreenState();
}

class _PasscodeScreenState extends ConsumerState<PasscodeScreen> {


  // validate passcode with every key press
  void onKeyPress(String char) {
    final notifier = ref.read(passcodeProvider.notifier);
    notifier.enterPasscode(char);
    final passcode = ref.read(passcodeProvider).userPasscode;
    if (passcode.length == PasscodeConstants.reqPasscodeLength) {
      final isCorrect = ref.read(passcodeProvider.notifier).validatePasscode(passcode);
      if(isCorrect){
        proceedToNextScreen();
      }
      ref.read(passcodeProvider.notifier).resetPasscode();
    }
  }


 // // proceed to next screen
 //  Future<void> proceedToNextScreen() async {
 //    await Future.delayed(Duration(seconds: 1));
 //    if(!context.mounted) return;
 //    ScaffoldMessenger.of(context).clearSnackBars();
 //    ScaffoldMessenger.of(context).showSnackBar(
 //        SnackBar(content: Center(
 //          child: Text("Passcode verified"),
 //        ))
 //    );
 //    AppNavigators.goToHomeDashBoard(context);
 //  }


  void proceedToNextScreen() {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColorsCommon.snackBarMsgBlue,

            duration: Duration(seconds: 1),
            content: Row(
              children: [
                AssetImageHelper.image(AppAssetsCommon.snackBarTick,
                width: 24, height: 24),
                const SizedBox(width: 10),
                Text("Mobile number verified successfully!", style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.white
                ),),
              ],
            ))
    );
    AppNavigators.goToHomeScreen(context);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // top header section with appreciate text and logo
          Container(
            // height: 80,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 15,
              bottom: 20,
              left: 25,
              right: 25,
            ),
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
                  const PasscodeUI(),
                ],
              ),
            ),
          ),

          // This is the numpad
          PasscodeNumpad(enteredPasscode: onKeyPress),
        ],
      ),
    );
  }
}
