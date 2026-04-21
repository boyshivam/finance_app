import "package:aprreciate/core/constants/app_assets/app_strings.dart";
import "package:aprreciate/core/themes/app_theme/app_theme.dart";
import "package:aprreciate/router/app_navigators.dart";
import "package:aprreciate/widgets/helper_widgets/custom_elevated_button.dart";
import "package:aprreciate/widgets/module_widgets/login_module_widgets/passcode_validator.dart";
import "package:flutter/material.dart";

import "../../../core/constants/app_assets/app_assets.dart";
import "../../../core/utils/asset_helpers/asset_image_helpers.dart";

const String signOut = "Sign out";

class PasscodeScreen extends StatefulWidget {
  const PasscodeScreen({super.key});

  @override
  State<PasscodeScreen> createState() => _PasscodeScreenState();
}

class _PasscodeScreenState extends State<PasscodeScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void checkPasscode(){
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      AppNavigators.goToHomeDashBoard(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
              const SizedBox(height: 20),

              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.passcode_subtext,
                            style: Theme.of(context).textTheme.bodySmall!
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(width: 15),
                          InkWell(
                            onTap: (){AppNavigators.goToLogin;},
                            child: Text(
                              signOut,
                              style: Theme.of(context).textTheme.bodySmall!
                                  .copyWith(
                                    color: theColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      PasscodeValidator(),
                      const Spacer(),
                      CustomElevatedButton(function: (){AppNavigators.goToHomeDashBoard(context);}, text: "Confirm")

                    ],
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
