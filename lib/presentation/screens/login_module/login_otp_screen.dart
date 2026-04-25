import 'package:aprreciate/core/constants/app_assets/app_strings.dart';
import 'package:aprreciate/router/app_navigators.dart';
import 'package:aprreciate/widgets/helper_widgets/custom_elevated_button.dart';
import 'package:aprreciate/widgets/helper_widgets/size_config.dart';
import 'package:aprreciate/widgets/module_widgets/login_module_widgets/otp_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import "package:aprreciate/core/themes/app_theme/app_theme.dart";
import '../../../core/constants/app_assets/app_assets.dart';
import '../../../core/utils/asset_helpers/asset_image_helpers.dart';

class LoginOTPScreen extends StatefulWidget {
  const LoginOTPScreen({super.key});

  @override
  State<LoginOTPScreen> createState() => _LoginOTPScreenState();
}

class _LoginOTPScreenState extends State<LoginOTPScreen> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;
  int otpLength = 6;
  String? otpVal;

  // initialise controllers and focus nodes of otp validator
  @override
  void initState() {
    controllers = List.generate(otpLength, (index) => TextEditingController());
    focusNodes = List.generate(otpLength, (index) => FocusNode());
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

  // movement of cursor in the otp field
  void navigateOtp(String otpVal, int index) {
    if (otpVal.isNotEmpty) {
      if (index < otpLength - 1) {
        WidgetsBinding.instance.addPostFrameCallback((_){
          focusNodes[index + 1].requestFocus();
        });

      }
    } else if (otpVal.isEmpty) {
      if (index > 0) {
        WidgetsBinding.instance.addPostFrameCallback((_){
          focusNodes[index - 1].requestFocus();
        });
      }
    }
  }

  // resend OTP
  void resendOTP() {}

  @override
  Widget build(BuildContext context) {
    final userNumber = GoRouterState.of(context).extra as String;

    void goToPasscodeScreen() {
      AppNavigators.goToPasscodeScreen;
    }

    return Scaffold(
      backgroundColor: scaffoldColor,
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

                      // main body with validator
                      Container(
                        // height: SizeConfig.height(context) * 0.4,
                        // width: SizeConfig.width(context) * 0.87,
                        padding: EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(color: Color(0xFFEFF1F4)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.log_otp_header,
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                // subtext of otp
                                Text(
                                  AppStrings.log_otp_subt,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodySmall!.copyWith(fontSize: 19),
                                ),
                                const SizedBox(width: 3),

                                // users number
                                Text(
                                  userNumber,
                                  style: Theme.of(context).textTheme.bodySmall!
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(width: 7),

                                // edit the users number
                                InkWell(
                                  onTap: () {
                                    context.push("/");
                                  },
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
                                              color: theColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            OtpValidator(
                              controllers: controllers,
                              focusNodes: focusNodes,
                              otpLength: otpLength,
                              otpNavigator: (otpVal, index) {
                                navigateOtp(otpVal, index);
                              },
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Text(
                                  AppStrings.log_otp_resend_txt,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
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
                padding: EdgeInsets.only(left: 20, right: 20),
                child: CustomElevatedButton(function: () {}, text: "Confirm"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
