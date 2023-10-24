
import 'package:wallet_app/src/domain/domain.dart';

abstract class AccountsRepository {
  Future<List<Account>> getAccounts();
}