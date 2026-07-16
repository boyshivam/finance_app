import "package:aprreciate/features/LRS_flow/view_model/lrs_view_model/lrs_order/lr_transaction_notifier.dart";
import "package:aprreciate/models/profile_models/lrs/lrs_card_model.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

final lrsTransactionProvider =
    NotifierProvider<LrsTransactionNotifier, List<UsWalletCardModel>>(
      LrsTransactionNotifier.new,
    );
