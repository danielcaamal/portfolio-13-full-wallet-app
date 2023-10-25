import 'package:wallet_app/src/domain/domain.dart';

class AccountsRepositoryImpl extends AccountsRepository {
  final AccountDataSource dataSource;
  AccountsRepositoryImpl({required this.dataSource});

  @override
  Future<List<Account>> getAccounts() async {
    return await dataSource.getAccounts();
  }
  
  @override
  Future<double> getTotalBalance() async {
    return await dataSource.getTotalBalance();
  }
}
