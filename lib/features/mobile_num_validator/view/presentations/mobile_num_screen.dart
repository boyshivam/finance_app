import "package:aprreciate/core/constants/app_assets/app_assets.dart";
import "package:aprreciate/core/constants/app_strings/features/app_strings_homedashboard/app_strings.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/core/utils/asset_helpers/asset_image_helpers.dart";
import "package:aprreciate/features/mobile_num_validator/view_model/provider.dart";
import "package:aprreciate/router/app_navigators.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";


import "../widgets/mobile_num_validator.dart";


class MobileNumScreen extends ConsumerStatefulWidget {
  const MobileNumScreen({super.key});

  @override
  ConsumerState<MobileNumScreen> createState() => _MobileNumScreenState();
}

class _MobileNumScreenState extends ConsumerState<MobileNumScreen> {


  late TextEditingController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String deriveMobileNum() {
    final user_num = controller.text.trim();
    return user_num;
  }


  void validate() {
    final checkNum = ref.watch(mobileNumProvider.notifier).validateNumber(
        deriveMobileNum());
    setState(() {});

    if (checkNum) {
      AppNavigators.goToOTPScreen(context);
    }
  }


  @override
  Widget build(BuildContext context) {
    final validationState = ref.watch(mobileNumProvider);

    return Scaffold(
      backgroundColor: AppColorsCommon.scaffoldBackGroundColor,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // top container with logo and support -
            Container(
              // height: 80,
              padding: EdgeInsets.only(
                  top: MediaQuery
                      .of(context)
                      .padding
                      .top + 15,
                  bottom: 20,
                  right: 25,
                  left: 25
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

            // Container with number field
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(25, 30, 25, 20),
                decoration: BoxDecoration(color: Color(0xFFEFF1F4)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.log_header,
                      style: Theme
                          .of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      AppStrings.log_subt,
                      style: Theme
                          .of(
                        context,
                      )
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 19),
                    ),
                    const SizedBox(height: 25),

                    // Mobile number widget -

                    MobileNumValidator(
                      onController: controller,
                      onChanged: (value) {
                        ref.read(mobileNumProvider.notifier).onChanged(value);
                      },
                      validationState: validationState,
                    ),

                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery
                              .of(context)
                              .padding
                              .bottom + 10
                      ),
                      child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: validate, child: Text("Confirm"))),
                    )
                  ],
                ),
              ),
            ),
          ]
      ),
    );
  }
}

