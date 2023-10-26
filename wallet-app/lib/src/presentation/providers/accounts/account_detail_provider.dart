import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_app/src/domain/domain.dart';
import 'package:wallet_app/src/presentation/presentation.dart';

class AccountDetailNotifier extends StateNotifier<Account?> {
  final AccountsRepository movieCallBack;
  AccountDetailNotifier({
    required this.movieCallBack,
  }) : super(null);

  Future<void> loadAccount(String accountId) async {
    final result = await movieCallBack.getAccountById(accountId);
    state = result;
  }
}

final accountDetailProvider =
    StateNotifierProvider<AccountDetailNotifier, Account?>((ref) {
  final accountRepository = ref.watch(accountRepositoryProvider);
  return AccountDetailNotifier(movieCallBack: accountRepository);
});
