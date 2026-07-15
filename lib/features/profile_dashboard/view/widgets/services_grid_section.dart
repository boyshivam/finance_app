import "package:aprreciate/data/profile_data/services_grid_data.dart";
import "package:aprreciate/models/profile_models/services_grid_model_items/service_grid_card.dart";
import "package:aprreciate/router/app_routes.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

class ServicesGridSection extends StatelessWidget {
  const ServicesGridSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: SizedBox(
        height: 400,
        child: GridView.builder(
          itemCount: servicesGridData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 30,
            crossAxisSpacing: 30,
            childAspectRatio: 1.9,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                if (index == 0) {
                  context.go(AppRoutes.orderScreen);
                }
              },
              child: ServiceGridCard(item: servicesGridData[index]),
            );
          },
        ),
      ),
    );
  }
}
