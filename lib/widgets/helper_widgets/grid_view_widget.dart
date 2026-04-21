import "package:aprreciate/data/home_dash_data/home_dash_data.dart";
import "package:aprreciate/widgets/module_widgets/home_dashboard_widgets/our_offerings_card.dart";
import "package:flutter/material.dart";
import "package:aprreciate/models/home_dashboard/our_offering_model.dart";

class GridViewWidget extends StatefulWidget {
  const GridViewWidget({super.key, required this.ourOfferingCards});

  final List<OurOfferingsModel> ourOfferingCards;

  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 1.5
      ),
      children: [
        for(final card in widget.ourOfferingCards)
          OurOfferingsCard(ourOfferingsCard: card)
      ],
    );
  }
}
