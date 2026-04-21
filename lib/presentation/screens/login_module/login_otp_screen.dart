import 'package:aprreciate/core/constants/app_assets/app_strings.dart';
import 'package:aprreciate/router/app_navigators.dart';
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



  @override
  Widget build(BuildContext context) {

    final userNumber = GoRouterState.of(context).extra as String ;

    void goToPasscodeScreen() {
      AppNavigators.goToPasscodeScreen;
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: scaffoldColor,
        body: SafeArea(
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


              // main body with validator
              Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(25, 30, 25, 40),
                decoration: BoxDecoration(color: Color(0xFFEFF1F4)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.log_otp_header,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineLarge
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text(AppStrings.log_otp_subt, style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 19
                        )),
                        const SizedBox(width: 3),
                        Text(userNumber, style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w600
                        )),
                        const SizedBox(width: 7),
                        InkWell(
                          onTap: (){context.push("/");},
                          child: Row(
                            children: [
                              Text("Edit", style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: theColor,
                                  fontWeight: FontWeight.w500
                              ),),
                              const SizedBox(width :7),
                              AssetImageHelper.image(AppAssets.lo_edit, width: 13, height: 13),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height : 20),
                    OtpValidator(),


                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
