import "package:aprreciate/core/constants/app_assets/app_assets.dart";
import "package:aprreciate/core/constants/app_assets/app_strings.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/core/utils/asset_helpers/asset_image_helpers.dart";
import "package:aprreciate/features/mobile_otp_validator/enums/mobile_otp_enum.dart";
import "package:aprreciate/features/mobile_otp_validator/view/widgets/helper_widgets/otp_timer.dart";
import "package:aprreciate/features/mobile_otp_validator/view/widgets/otp_validator.dart";
import "package:aprreciate/features/mobile_otp_validator/view_model/mobile_otp_view_model.dart";
import "package:aprreciate/router/app_navigators.dart";
import "package:flutter/material.dart";

class MobileOtpScreen extends StatefulWidget {
  const MobileOtpScreen({super.key});

  @override
  State<MobileOtpScreen> createState() => _MobileOtpScreenState();
}

class _MobileOtpScreenState extends State<MobileOtpScreen> {
  final vm = MobileOtpViewModel();

  // declare controllers and focus nodes
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  // initialise controllers and focus nodes of otp validator
  @override
  void initState() {
    controllers = List.generate(
      MobileOtpViewModel.otpLength,
      (index) => TextEditingController(),
    );
    focusNodes = List.generate(
      MobileOtpViewModel.otpLength,
      (index) => FocusNode(),
    );

    super.initState();
  }

  // dispose the controllers and focus nodes of otp validator
  @override
  void dispose() {
    for (final c in controllers) {
      c.dispose();
    }
    for (final f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  // map the forward movement of the cursor
  void cursorMovementInOtp(String value, int index) {
    if (controllers[index].text.isNotEmpty &&
        index < MobileOtpViewModel.otpLength - 1) {
      focusNodes[index + 1].requestFocus();
    }
  }

  // reset OTP
  void resetOtp() {
    Future.delayed(Duration(seconds: 2), () {
      for (final c in controllers) {
        c.clear();
      }
      focusNodes.first.requestFocus();
      vm.validationState = MobileOtpValidationState.inactive;
      setState(() {});
    });
  }

  // getter to derive OTP from users input
  String get derivedOtp => controllers.map((c) => c.text).join();

  // proceed to next screen if otp is correct
  void proceedToNextScreen() {
    bool validate = vm.validateOtp(derivedOtp);
    setState(() {});
    if (validate) {
      AppNavigators.goToPasscodeScreen(context);
    } else {
      resetOtp();
    }
  }

  // go to mobileNum screen to edit number
  void gotoMobileNumScreen() {
    AppNavigators.goToLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsCommon.scaffoldBackGroundColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      // top section with appreciate logo and support icon
                      Container(
                        // height: 80,
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 25,
                        ),
                        decoration: BoxDecoration(color: Color(0xFFFFFFFF)),
                        child: Row(
                          children: [
                            AssetImageHelper.image(
                              AppAssets.lo_ap_logo,
                              height: 24,
                            ),
                            const Spacer(),
                            AssetImageHelper.image(
                              AppAssets.lo_support,
                              height: 24,
                              width: 24,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // main body with otp validator
                      Container(
                        // height: SizeConfig.height(context) * 0.4,
                        // width: SizeConfig.width(context) * 0.87,
                        padding: EdgeInsets.only(left: 25, right: 25),
                        decoration: BoxDecoration(color: Color(0xFFEFF1F4)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.log_otp_header,
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            const SizedBox(height: 20),
                            Wrap(
                              children: [
                                Text(
                                  AppStrings.log_otp_subt,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodySmall!.copyWith(fontSize: 18),
                                ),
                                const SizedBox(width: 3),

                                // users number
                                Text(
                                  "userNumber",
                                  style: Theme.of(context).textTheme.bodySmall!
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(width: 7),

                                // edit the users number
                                InkWell(
                                  onTap: gotoMobileNumScreen,
                                  child: Row(
                                    children: [
                                      AssetImageHelper.image(
                                        AppAssets.lo_edit,
                                        width: 13,
                                        height: 13,
                                      ),
                                      const SizedBox(width: 7),
                                      Text(
                                        "Edit",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              color: AppColorsCommon
                                                  .appreciateThemeColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),

                            // Widget contains the otp UI
                            OtpValidator(
                              validationState: vm.validationState,
                              controllers: controllers,
                              focusNodes: focusNodes,
                              otpLength: MobileOtpViewModel.otpLength,
                              otpNavigator: cursorMovementInOtp,),


                            //resend OTP countdown timer
                            OtpTimer(
                              initialTime: 10,
                              resendText: 'resend OTP',
                            ),
                          ],
                        ),
                      ),

                      // const Spacer(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25, right: 25, bottom: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: proceedToNextScreen,
                    child: Text("Confirm"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
