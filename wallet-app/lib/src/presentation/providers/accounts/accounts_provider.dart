import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_app/src/domain/domain.dart';
import 'package:wallet_app/src/infrastructure/infrastructure.dart';

final movieRepositoryProvider = Provider<AccountsRepository>((ref) {
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
