import "package:aprreciate/core/constants/app_assets/app_assets.dart";
import "package:aprreciate/core/constants/app_strings/features/app_strings_homedashboard/app_strings.dart" show AppStrings;
import "package:aprreciate/models/home_dashboard_models/our_offering_model.dart";

const ourOfferingsData = [
  OurOfferingsModel(
    title: AppStrings.homeD_ourOf_US,
    subtext: AppStrings.homeD_ourOf_US_subt,
    iconPath: AppAssets.ho_us_stocks_icon,
  ),
  OurOfferingsModel(
    title: AppStrings.homeD_ourOf_Goals,
    subtext: AppStrings.homeD_ourOf_Goals_subt,
    iconPath: AppAssets.ho_goals_icon,
  ),
  OurOfferingsModel(
    title: AppStrings.homeD_ourOf_MF,
    subtext: AppStrings.homeD_ourOf_MF_subt,
    iconPath: AppAssets.ho_mf_icon,
  ),
];


