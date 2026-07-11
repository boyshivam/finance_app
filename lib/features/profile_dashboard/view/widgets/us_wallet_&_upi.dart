import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/router/app_navigators.dart";
import "package:flutter/material.dart";

class UsWalletUpi extends StatelessWidget {
  const UsWalletUpi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      decoration: BoxDecoration(color: AppColorsCommon.appWhite),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  Icon(Icons.person, color: Colors.lightBlue, size: 40),
                  const SizedBox(width: 15),
                  Column(
                    children: [
                      Text("Shivam"),
                      const SizedBox(height: 5),
                      Text("7005092020"),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Icon(Icons.arrow_circle_right_outlined, size: 30),
            ],
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: (){
              AppNavigators.gotoLrsScreen(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15, vertical: 15
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xffDDE4F3),
              ),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.wallet, size: 40, color: Colors.green,),
                        const SizedBox(width: 15,),
                        Column(
                          children: [
                            Text("US wallet"),
                            const SizedBox(height: 5),
                            Text("\$1,456"),
                          ]

                        )
                      ],
                    ),
                    const Spacer(),
                    Icon(Icons.arrow_circle_right_outlined)
                  ],
                ),
            ),
          ),
        ],
      ),
    );
  }
}
