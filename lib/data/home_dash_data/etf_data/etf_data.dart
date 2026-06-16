import 'package:aprreciate/core/constants/app_assets/home_dashboard/top_etf_icons_assets/etf_categories.dart';
import 'package:aprreciate/core/constants/app_assets/home_dashboard/top_etf_icons_assets/etf_icons_assets.dart';
import 'package:aprreciate/core/constants/app_strings/features/app_strings_homedashboard/etfs/app_strings_etf.dart';
import 'package:aprreciate/core/constants/app_strings/features/app_strings_homedashboard/etfs/app_strings_etf_category.dart';
import 'package:aprreciate/models/home_dashboard/etf_category_model.dart';
import 'package:aprreciate/models/home_dashboard/top_etfs_model.dart';

const Map<EtfCategoryModel, List<TopEtfModel>> etfs_Data = {
  EtfCategoryModel(
    categoryIcon: EtfCategoriesIconAssets.popularEtfIcon,
    categoryName: AppStringsEtfCategory.popularCategory,
  ): [
    TopEtfModel(
      etfIcon: EtfIconAssets.etf_VOO_icon,
      etfSymbol: AppStringsEtf.etfSymbol,
      etfName: AppStringsEtf.etfName,
      etfPrice: AppStringsEtf.etfPrice,
      etfChangePerc: AppStringsEtf.etfChange,
      etfChange: true
    ),
    TopEtfModel(
        etfIcon: EtfIconAssets.etf_DIA_icon,
        etfSymbol: AppStringsEtf.etfSymbol2,
        etfName: AppStringsEtf.etfName2,
        etfPrice: AppStringsEtf.etfPrice2,
        etfChangePerc: AppStringsEtf.etfChange2,
        etfChange: false
    ),
    TopEtfModel(
        etfIcon: EtfIconAssets.etf_DIA_icon,
        etfSymbol: AppStringsEtf.etfSymbol2,
        etfName: AppStringsEtf.etfName2,
        etfPrice: AppStringsEtf.etfPrice2,
        etfChangePerc: AppStringsEtf.etfChange2,
        etfChange: false
    ),
    TopEtfModel(
        etfIcon: EtfIconAssets.etf_DIA_icon,
        etfSymbol: AppStringsEtf.etfSymbol2,
        etfName: AppStringsEtf.etfName2,
        etfPrice: AppStringsEtf.etfPrice2,
        etfChangePerc: AppStringsEtf.etfChange2,
        etfChange: false
    ),
  ],
  EtfCategoryModel(
    categoryIcon: EtfCategoriesIconAssets.indexEtfIcon,
    categoryName: AppStringsEtfCategory.indexCategory,
  ): [
    TopEtfModel(
        etfIcon: EtfIconAssets.etf_DIA_icon,
        etfSymbol: AppStringsEtf.etfSymbol2,
        etfName: AppStringsEtf.etfName2,
        etfPrice: AppStringsEtf.etfPrice2,
        etfChangePerc: AppStringsEtf.etfChange2,
        etfChange: false
    ),
    TopEtfModel(
        etfIcon: EtfIconAssets.etf_VOO_icon,
        etfSymbol: AppStringsEtf.etfSymbol,
        etfName: AppStringsEtf.etfName,
        etfPrice: AppStringsEtf.etfPrice,
        etfChangePerc: AppStringsEtf.etfChange,
        etfChange: true
    ),
    TopEtfModel(
        etfIcon: EtfIconAssets.etf_VOO_icon,
        etfSymbol: AppStringsEtf.etfSymbol,
        etfName: AppStringsEtf.etfName,
        etfPrice: AppStringsEtf.etfPrice,
        etfChangePerc: AppStringsEtf.etfChange,
        etfChange: true
    ),
    TopEtfModel(
        etfIcon: EtfIconAssets.etf_VOO_icon,
        etfSymbol: AppStringsEtf.etfSymbol,
        etfName: AppStringsEtf.etfName,
        etfPrice: AppStringsEtf.etfPrice,
        etfChangePerc: AppStringsEtf.etfChange,
        etfChange: true
    ),
  ],
  EtfCategoryModel(
    categoryIcon: EtfCategoriesIconAssets.euroEtfIcon,
    categoryName: AppStringsEtfCategory.europeanCategory,
  ): [
    TopEtfModel(
        etfIcon: EtfIconAssets.etf_VOO_icon,
        etfSymbol: AppStringsEtf.etfSymbol3,
        etfName: AppStringsEtf.etfName3,
        etfPrice: AppStringsEtf.etfPrice3,
        etfChangePerc: AppStringsEtf.etfChange3,
        etfChange: true
    ),
    TopEtfModel(
        etfIcon: EtfIconAssets.etf_VOO_icon,
        etfSymbol: AppStringsEtf.etfSymbol,
        etfName: AppStringsEtf.etfName,
        etfPrice: AppStringsEtf.etfPrice,
        etfChangePerc: AppStringsEtf.etfChange,
        etfChange: true
    ),
    TopEtfModel(
        etfIcon: EtfIconAssets.etf_DIA_icon,
        etfSymbol: AppStringsEtf.etfSymbol4,
        etfName: AppStringsEtf.etfName4,
        etfPrice: AppStringsEtf.etfPrice4,
        etfChangePerc: AppStringsEtf.etfChange4,
        etfChange: false
    ),
    TopEtfModel(
        etfIcon: EtfIconAssets.etf_DIA_icon,
        etfSymbol: AppStringsEtf.etfSymbol4,
        etfName: AppStringsEtf.etfName4,
        etfPrice: AppStringsEtf.etfPrice4,
        etfChangePerc: AppStringsEtf.etfChange4,
        etfChange: false
    ),
  ],
  EtfCategoryModel(
    categoryIcon: EtfCategoriesIconAssets.techEtfIcon,
    categoryName: AppStringsEtfCategory.techCategory,
  ): [
    TopEtfModel(
        etfIcon: EtfIconAssets.etf_DIA_icon,
        etfSymbol: AppStringsEtf.etfSymbol4,
        etfName: AppStringsEtf.etfName4,
        etfPrice: AppStringsEtf.etfPrice4,
        etfChangePerc: AppStringsEtf.etfChange4,
        etfChange: false
    ),
    TopEtfModel(
        etfIcon: EtfIconAssets.etf_DIA_icon,
        etfSymbol: AppStringsEtf.etfSymbol2,
        etfName: AppStringsEtf.etfName2,
        etfPrice: AppStringsEtf.etfPrice2,
        etfChangePerc: AppStringsEtf.etfChange2,
        etfChange: false
    ),
    TopEtfModel(
        etfIcon: EtfIconAssets.etf_VOO_icon,
        etfSymbol: AppStringsEtf.etfSymbol,
        etfName: AppStringsEtf.etfName,
        etfPrice: AppStringsEtf.etfPrice,
        etfChangePerc: AppStringsEtf.etfChange,
        etfChange: true
    ),
    TopEtfModel(
        etfIcon: EtfIconAssets.etf_VOO_icon,
        etfSymbol: AppStringsEtf.etfSymbol,
        etfName: AppStringsEtf.etfName,
        etfPrice: AppStringsEtf.etfPrice,
        etfChangePerc: AppStringsEtf.etfChange,
        etfChange: true
    ),
  ],

};
