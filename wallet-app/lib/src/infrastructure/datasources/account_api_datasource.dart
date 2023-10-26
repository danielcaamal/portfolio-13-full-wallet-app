import 'package:dio/dio.dart';
import 'package:wallet_app/src/config/config.dart';
import 'package:wallet_app/src/domain/domain.dart';
import 'package:wallet_app/src/infrastructure/infrastructure.dart';

class AccountApiDataSource extends AccountDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: Environment.WALLET_API_V1,
    // TODO: Implement auth
  ));

  @override
  Future<List<Account>> getAccounts() async {
    final response = await dio.get('/accounts/by-user');
    if (response.statusCode == 200) {
      final castData = AccountsApiResponse.fromJson(response.data);
      return AccountsMapper.accountsApiResponseToAccount(castData);
    }
    // TODO: Implement exception
    return [];
  }

  @override
  Future<double> getTotalBalance() async {
    final response = await dio.get('/accounts/total-balance/by-user');
    if (response.statusCode == 200) {
      final castData = AccountsTotalBalanceApiResponse.fromJson(response.data);
      return double.parse(castData.result.total);
    }
    // TODO: Implement exception
    return 0;
  }

  @override
  Future<Account?> getAccountById(String accountId) async {
    final response = await dio.get('/accounts/by-user/$accountId');
    if (response.statusCode == 200) {
      final castData = AccountDetailApiResponse.fromJson(response.data);
      return AccountsMapper.accountDetailApiResponseToAccount(castData);
    }
    // TODO: Implement exception
    return null;
  }
}
