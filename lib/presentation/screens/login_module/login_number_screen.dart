import "package:aprreciate/app.dart";
import "package:aprreciate/router/app_navigators.dart";
import "package:aprreciate/widgets/helper_widgets/custom_elevated_button.dart";
import "package:aprreciate/widgets/module_widgets/login_module_widgets/mobile_num_validator.dart";
import "package:flutter/material.dart";
import "package:aprreciate/core/constants/app_assets/app_assets.dart";
import "package:aprreciate/core/utils/asset_helpers/asset_image_helpers.dart";
import "package:aprreciate/core/constants/app_assets/app_strings.dart";

const Color scaffoldColor = Color(0xFFEFF1F4);

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String userNum = "";

  void checkNumber(){
    if(_formKey.currentState!.validate()){
        _formKey.currentState!.save();
        AppNavigators.goToOTPScreen(context, extra: userNum);
    }
  }

  @override
  Widget build(BuildContext context) {
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
              // login screen content
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(25, 30, 25, 40),
                  decoration: BoxDecoration(color: Color(0xFFEFF1F4)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.log_header,
                        style: Theme.of(context).textTheme.headlineLarge!
                            .copyWith(fontSize: 35, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        AppStrings.log_subt,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium!.copyWith(fontSize: 19),
                      ),
                      const SizedBox(height: 25),

                      // Mobile number widget -
                      MobileNumValidator(
                        formKey: _formKey,
                        onSaved: (value){userNum = value ?? "";},),
                      const Spacer(),
                      CustomElevatedButton(function: checkNumber, text: "Confirm")
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
