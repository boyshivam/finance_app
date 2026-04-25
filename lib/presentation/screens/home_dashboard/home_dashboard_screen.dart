import "package:aprreciate/core/constants/app_assets/app_assets.dart";
import "package:aprreciate/core/constants/app_assets/app_strings.dart";
import "package:aprreciate/core/utils/asset_helpers/asset_image_helpers.dart";
import "package:aprreciate/data/home_dash_data/continue_where_left_data.dart";
import "package:aprreciate/data/home_dash_data/home_dash_data.dart";
import "package:aprreciate/widgets/helper_widgets/size_config.dart";
import "package:aprreciate/widgets/module_widgets/home_dashboard_widgets/continue_where_you_left_widgets/continue_where_left_builder.dart";
import "package:flutter/material.dart";
import "package:aprreciate/widgets/helper_widgets/grid_view_widget.dart";

class HomeDashboardScreen extends StatefulWidget {
  const HomeDashboardScreen({super.key});

  @override
  State<HomeDashboardScreen> createState() => _HomeDashboardScreenState();
}

class _HomeDashboardScreenState extends State<HomeDashboardScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // contains the top section with user name, bell icon and rewards icon
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.width(context) * 0.069,
                  vertical: SizeConfig.width(context) * 0.03,
                ),
                height: SizeConfig.height(context) * 0.090,
                width: SizeConfig.width(context) * 1,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFE1ECFC), Color(0xFFFFFFFF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.homeD_hi_user,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        AssetImageHelper.image(
                          AppAssets.ho_bell_icon,
                          width: SizeConfig.width(context) * 0.069,
                          height: SizeConfig.width(context) * 0.069,
                        ),
                        const SizedBox(width: 25),
                        AssetImageHelper.image(
                          AppAssets.ho_rewards_icon,
                          width: SizeConfig.width(context) * 0.069,
                          height: SizeConfig.width(context) * 0.069,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // contains the indices ticker
              Container(
                height: SizeConfig.height(context) * 0.053,
                width: SizeConfig.width(context) * 1,
                color: Color(0xFFFFFFFF),
              ),
              const SizedBox(height: 30),

              // contains our offerings section
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.width(context) * 0.069,
                  vertical: SizeConfig.width(context) * 0.03,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.homeD_ourOf,
                      style: Theme.of(
                        context,
                      ).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 22),
                    ),
                    const SizedBox(height: 15),
                    GridViewWidget(ourOfferingCards: ourOfferingsData),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.width(context) * 0.069,
                  vertical: SizeConfig.width(context) * 0.03,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.continue_where_you_left_title, style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w500
                    ),),
                    const SizedBox(height: 15,),
                    ContinueWhereLeftBuilder(cards: continue_where_left_data ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
