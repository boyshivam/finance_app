import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/core/utils/helper_widgets/company_trademark.dart";
import "package:aprreciate/core/utils/helper_widgets/custom_navigation_button_helper.dart";
import "package:aprreciate/features/mobile_num_validator/view_model/mobile_num_validator_provider.dart";
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
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vmMobileNumProvider = ref.watch(mobileNumProvider);
    final mobileNumNotifier = ref.read(mobileNumProvider.notifier);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColorsCommon.appreciateThemeColor,
              Color(0xFFe5daf7),
              AppColorsCommon.appWhite.withValues(alpha: 0.1),
              AppColorsCommon.appWhite.withValues(alpha: 0.1),
              AppColorsCommon.appWhite.withValues(alpha: 0.1),
              Color(0xFFe5daf7),
              AppColorsCommon.appreciateThemeColor


            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Container with number field
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(
                  25,
                  MediaQuery.of(context).padding.top + 20,
                  25,
                  20,
                ),
                // decoration: BoxDecoration(color: Color(0xFFEFF1F4)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CompanyTrademark(
                      paddingLeft: 25,
                      paddingRight: 25,
                      paddingTop: 15,
                      paddingBottom: 15,
                      fontSize: 35,
                      containerWidth: double.infinity,
                    ),

                    const SizedBox(height: 90),
                    Text(
                      "Start with entering your number",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w700,
                          fontSize: 24),
                    ),
                    const SizedBox(height: 25),

                    // Mobile number widget -
                    MobileNumValidator(onController: controller),

                    const Spacer(),
                    // Padding(
                    //   padding: EdgeInsets.only(
                    //     bottom: MediaQuery.of(context).padding.bottom + 10,
                    //   ),
                    //   child: SizedBox(
                    //     width: double.infinity,
                    //     child: ElevatedButton(
                    //       onPressed: () {
                    //         context.push(
                    //           AppRoutes.otpScreen,
                    //           extra: OtpScreenArgs(
                    //             userNumber: vmMobileNumProvider.mobileNumber,
                    //           ),
                    //         );
                    //       },
                    //       child: Text("Proceed"),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                      child: CustomNavigationButtonHelper(buttonText: "Proceed", secondaryButton: true),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
