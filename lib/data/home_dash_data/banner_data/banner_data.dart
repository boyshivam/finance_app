import 'package:aprreciate/core/constants/app_assets/assets_home_dashboard/banners_assets/app_assets_banners.dart';
import 'package:aprreciate/core/constants/app_strings/features/app_strings_homedashboard/app_strings_banners.dart';
import 'package:aprreciate/models/home_dashboard_models/banners_model.dart';


const List<BannersModel> bannerData = [
  BannersModel(bannerTitle: AppStringsBanners.completeKycHeader,
      bannerSubtext: AppStringsBanners.completeKycSubtext,
      iconPath: AppAssetsBanners.completeKycIcon,
      buttonText: AppStringsBanners.completeKycButtonText),

  BannersModel(bannerTitle: AppStringsBanners.addFundsToUsWalletHeader,
      bannerSubtext: AppStringsBanners.addFundsToUsWalletSubtext,
      iconPath: AppAssetsBanners.referralGiftIcon,
      buttonText: AppStringsBanners.addFundsToUsWalletButtonText),

  BannersModel(bannerTitle: AppStringsBanners.completeKycHeader,
      bannerSubtext: AppStringsBanners.completeKycSubtext,
      iconPath: AppAssetsBanners.zeroTransactionFeeIcon,
      buttonText: AppStringsBanners.completeKycButtonText)
];