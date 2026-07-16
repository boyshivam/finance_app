

import 'package:aprreciate/models/profile_models/lrs/lrs_card_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LrsTransactionNotifier extends Notifier<List<UsWalletCardModel>>{

  @override
  List<UsWalletCardModel> build() => [];

  void addTransaction(UsWalletCardModel transaction){
    state = [...state, transaction];
  }
}