import 'package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CashFreeScreen extends StatelessWidget {
  const CashFreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(
              25,
              MediaQuery.of(context).padding.top + 16,
              25,
              20,
            ),

            decoration: BoxDecoration(
              color: AppColorsCommon.snackBarMsgBlue,
              borderRadius: BorderRadius.only(
                topRight: Radius.zero,
                topLeft: Radius.zero,
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 25,
                    color: AppColorsCommon.appWhite,
                  ),
                ),
                const SizedBox(height: 10),
                Icon(
                  Icons.account_balance,
                  color: AppColorsCommon.appreciateThemeColor,
                  size: 70,
                ),
                const SizedBox(height: 10),
                Text(
                  "CashFree funding",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w900,
                    color: AppColorsCommon.appWhite,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                color: AppColorsCommon.appWhite,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(width: 2.5, color: AppColorsCommon.textGrey),
              ),
              child: Column(
                children: [
                  Text("Enter amount to transfer"),
                  const SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        width: 1.5,
                        color: AppColorsCommon.textGrey,
                      ),
                    ),
                    child: TextField(
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^\d*\.?\d{0,2}$'),
                        ),
                      ],
                      decoration: InputDecoration(
                        prefix: Text(
                          "₹  ",
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text("Enter UPI ID or Phone number"),
                  const SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        width: 1.5,
                        color: AppColorsCommon.textGrey,
                      ),
                    ),
                    child: TextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[a-zA-Z0-9._@-]'),
                        ),
                      ],
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColorsCommon.snackBarMsgBlue,
                    ),
                    child: Text(
                      "Proceed To Pay",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColorsCommon.appWhite,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AppColorsCommon.scaffoldBackGroundColor,
    );
  }
}
