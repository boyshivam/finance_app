import "package:aprreciate/core/constants/app_assets/app_assets.dart"
    show AppAssets;
import "package:aprreciate/core/constants/app_assets/app_strings.dart";
import "package:aprreciate/core/themes/app_theme/AppColors.dart";
import "package:aprreciate/core/themes/app_theme/app_theme.dart";
import "package:aprreciate/core/utils/asset_helpers/asset_image_helpers.dart";
import "package:aprreciate/router/app_navigators.dart";
import "package:aprreciate/widgets/module_widgets/login_module_widgets/passcode_numpad/passcode_numpad.dart";
import "package:aprreciate/widgets/module_widgets/login_module_widgets/passcodeUI.dart";
import "package:flutter/material.dart";

class PasscodeScreen extends StatefulWidget {
  const PasscodeScreen({super.key});

  @override
  State<PasscodeScreen> createState() => _PasscodeScreenState();
}

class _PasscodeScreenState extends State<PasscodeScreen> {
  // passcode circle

  // final passcode
  String passcode = "";

  // passcode length
  final int passcodeLength = 4;

  // correct passcode
  final String correctPass = "6666";

  // validation message
  String message = "";

  // current color of container border
  Color currentContainerBorderColor =
      AppColors.passcodeDefaultContainerBorderColor;

  // current color of pass circles
  Color currentCircleBorder = AppColors.passcodeDefaultCircleBorderColor;
  Color currentCircleBG = AppColors.passcodeDefaultCircleBorderColor;

  // read and edit entered passcode
  void enteredPasscode(String value) {
    setState(() {
      if (value == "00") {
        if (passcode.isNotEmpty) {
          passcode = passcode.substring(0, passcode.length - 1);
          validationColorContainer("empty");
        }
      } else if (passcode.length < passcodeLength) {
        passcode += value;
        if (passcode.length == passcodeLength) {
          verifyPasscode();
        }
      }
    });
  }
  void checkIfPasscodeEmpty(){
    if (passcode.isEmpty) {
      if (passcode == "") {
        currentContainerBorderColor =
            AppColors.passcodeDefaultContainerBorderColor;
      }
    }
  }

  void validationColorContainer(String value) {
    if(value == "empty"){
      if(passcode.trim().isEmpty || passcode == ""){
        currentContainerBorderColor = AppColors.passcodeDefaultContainerBorderColor;
      }
    }else if(value == "incorrect"){
      currentContainerBorderColor = AppColors.passcodeIncorrectContainerBorderColor;
    }
  }

  void validationColorCircles(String value){
    setState(() {
      if(value == 'incorrect') {
        currentCircleBorder = AppColors.passcodeIncorrectCircleBorderColor;
        currentCircleBG = AppColors.passcodeIncorrectCircleBGColor;
      }else if(value == "correct") {
        currentCircleBG = AppColors.passcodeActiveCircleBGColor;
        currentCircleBorder = AppColors.passcodeActiveCircleBorderColor;
      }
    });
  }

  void validationMessages(String value){
    setState(() {
      if(value == "incorrect"){
        message = "Wrong passcode";
      } else if(value == "correct"){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Row(
                  children: [
                    Icon(Icons.check_circle_outline),
                    Text("Passcode verified", style: Theme.of(context).textTheme.bodySmall,),
                  ],
                ))
        );
      }
    });
  }


  // verify the entered passcode
  void verifyPasscode() {
    if (passcode == correctPass) {
      validationMessages("correct");
      AppNavigators.goToHomeDashBoard(context);
    } else if (passcode != correctPass) {
      setState(() {
        validationMessages("incorrect");
        validationColorCircles("incorrect");
        validationColorContainer("incorrect");
      });
    }
  }

  // change the passcode UI
  void changePassUI() {
    // fill a blue circle
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
                                  color: AppColors.appreciateThemeColor,
                                ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    PasscodeUI(
                      passcode: passcode,
                      currentCircleBorder: currentCircleBorder,
                      currentCircleBG: currentCircleBG,
                      currentContainerBorderColor: currentContainerBorderColor,
                    ),
                  ],
                ),
              ),
            ),

            // This is the numpad
            PasscodeNumpad(enteredPasscode: enteredPasscode),
          ],
        ),
      ),
    );
  }
}
