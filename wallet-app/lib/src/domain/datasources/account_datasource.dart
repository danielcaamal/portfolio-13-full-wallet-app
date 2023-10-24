import 'package:wallet_app/src/domain/domain.dart';

abstract class AccountDataSource {
  Future<List<Account>> getAccounts();
}
