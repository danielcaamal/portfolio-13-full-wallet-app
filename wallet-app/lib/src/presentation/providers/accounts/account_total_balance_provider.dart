import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_app/src/domain/domain.dart';
import 'package:wallet_app/src/presentation/presentation.dart';

class AccountTotalBalanceNotifier extends StateNotifier<double> {
  final AccountsRepository movieCallBack;
  AccountTotalBalanceNotifier({
    required this.movieCallBack,
  }) : super(0);

  Future<void> loadTotalBalance() async {
    final result = await movieCallBack.getTotalBalance();
    state = result;
  }
}

final accountTotalBalanceProvider =
    StateNotifierProvider<AccountTotalBalanceNotifier, double>((ref) {
  final accountRepository = ref.watch(accountRepositoryProvider);
  return AccountTotalBalanceNotifier(movieCallBack: accountRepository);
});
