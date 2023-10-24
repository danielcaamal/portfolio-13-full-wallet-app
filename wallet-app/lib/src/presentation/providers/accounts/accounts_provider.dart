import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_app/src/domain/domain.dart';
import 'package:wallet_app/src/infrastructure/infrastructure.dart';

final accountRepositoryProvider = Provider<AccountsRepository>((ref) {
  return AccountsRepositoryImpl(dataSource: AccountApiDataSource());
});

class AccountsNotifier extends StateNotifier<List<Account>> {
  final AccountsRepository movieCallBack;
  AccountsNotifier({
    required this.movieCallBack,
  }) : super([]);

  Future<void> loadAccounts() async {
    final result = await movieCallBack.getAccounts();
    state = result;
  }
}


final accountsProvider =
    StateNotifierProvider<AccountsNotifier, List<Account>>((ref) {
  final accountRepository = ref.watch(accountRepositoryProvider);
  return AccountsNotifier(movieCallBack: accountRepository);
});