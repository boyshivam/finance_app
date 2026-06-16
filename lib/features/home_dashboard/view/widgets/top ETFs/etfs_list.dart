import "package:aprreciate/features/home_dashboard/view/widgets/top%20ETFs/helper_etf_widgets/etf_card.dart";
import "package:aprreciate/models/home_dashboard/top_etfs_model.dart";
import "package:flutter/material.dart";


class EtfList extends StatelessWidget {
  const EtfList({super.key, required this.etfList});

  final List<TopEtfModel> etfList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400
      ,
      child: ListView.builder(
          itemCount: etfList.length,
          itemBuilder: (context, index) => EtfCard(etfCard: etfList[index])),
    );
  }
}
