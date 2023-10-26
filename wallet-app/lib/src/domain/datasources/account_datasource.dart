import 'package:wallet_app/src/domain/domain.dart';

abstract class AccountDataSource {
  Future<List<Account>> getAccounts();
  Future<Account?> getAccountById(String accountId);
  Future<double> getTotalBalance();
}
