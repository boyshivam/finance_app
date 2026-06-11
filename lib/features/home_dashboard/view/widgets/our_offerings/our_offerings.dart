import "package:aprreciate/core/constants/app_strings/features/app_strings_homedashboard/app_strings.dart";
import "package:aprreciate/data/home_dash_data/our_offerings_data.dart";
import "package:aprreciate/features/home_dashboard/view/widgets/our_offerings/our_offerings_card.dart";
import "package:flutter/material.dart";

class OurOfferings extends StatelessWidget {
  const OurOfferings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.homeD_ourOf, style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold
          ),),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: ourOfferingsData.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20
            ),
            itemBuilder: (context, index) {
              return OurOfferingsCard(card: ourOfferingsData[index]);
            },
          ),
        ],
      ),
    );
  }
}
