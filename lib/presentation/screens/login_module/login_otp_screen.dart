import 'package:aprreciate/core/constants/app_assets/app_strings.dart';
import 'package:aprreciate/router/app_navigators.dart';
import 'package:aprreciate/widgets/helper_widgets/countdown_timer.dart';
import 'package:aprreciate/widgets/helper_widgets/custom_elevated_button.dart';
import 'package:aprreciate/widgets/module_widgets/login_module_widgets/otp_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import "package:aprreciate/core/themes/app_theme/app_theme.dart";
import '../../../core/constants/app_assets/app_assets.dart';
import '../../../core/utils/asset_helpers/asset_image_helpers.dart';



// box border colors
const  Color incorrectBorderColor = Color(0xFFEA3636);
const  Color neutralBorderColor = Color(0xFFE1ECFC);


class LoginOTPScreen extends StatefulWidget {
  const LoginOTPScreen({super.key});

  @override
  State<LoginOTPScreen> createState() => _LoginOTPScreenState();
}

class _LoginOTPScreenState extends State<LoginOTPScreen> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;


  // length of otp
  int otpLength = 6;

  // 1 pf 6 chars in each box
  String? finalOtp ;

  // correct otp
  final String correctOTP = "666666";

  // input box border color
  Color? defaultBorderColor = neutralBorderColor;

  // otp error message
  String? errorMsg = "";

  // conditional show otp message
  bool wrongOtp = false;

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
  void navigateOtp(String otp, int index) {
    if (otp.isNotEmpty) {
      if (index < otpLength - 1 ) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          focusNodes[index + 1].requestFocus();
        });
      }else {
        focusNodes[index].unfocus();
      }
    }else if (otp.isEmpty) {
      if(index > 0) {
        focusNodes[index - 1].requestFocus();
      }
    }

    // final otp entered by user -
    finalOtp = controllers.map((c) => c.text).join();
  }

  // verify the OTP entered by user
  void verifyOtp(){
    if(finalOtp == correctOTP){
      setState(() {
        wrongOtp = false;
      });
      AppNavigators.goToHomeDashBoard(context);
    }else{
      setState(() {
        wrongOtp = true;
        errorMsg = "Incorrect OTP entered, please retry";
        defaultBorderColor = incorrectBorderColor;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    final userNumber = GoRouterState.of(context).extra as String;

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


                            // Widget contains the otp UI
                            OtpValidator(
                              controllers: controllers,
                              focusNodes: focusNodes,
                              defaultBorderColor: defaultBorderColor!,
                              errorMessage: errorMsg!,
                              otpLength: otpLength,
                              wrongOtp: wrongOtp,
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
                                const SizedBox(width: 5),

                                //resend OTP countdown timer
                                Expanded(child: OtpTimer())
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
                padding: EdgeInsets.only(left: 25, right: 25, bottom: 20),
                child: CustomElevatedButton(function: verifyOtp, text: "Confirm"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
