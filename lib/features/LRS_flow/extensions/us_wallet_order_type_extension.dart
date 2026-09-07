

import 'package:aprreciate/features/LRS_flow/enums/us_wallet_order_enum.dart';

extension UsWalletOrderTypeExtension on UsWalletOrderEnum {

  String get getOrderTypeText {

    switch(this) {

      case UsWalletOrderEnum.bankToUsWallet:
        return "Bank to wallet transfer";

      case UsWalletOrderEnum.usWalletToBank:
        return "Wallet to bank transfer";


      default:
        return "";

    }

  }


}