import 'package:dio/dio.dart';
import 'package:wallet_app/src/config/config.dart';
import 'package:wallet_app/src/domain/domain.dart';
import 'package:wallet_app/src/infrastructure/infrastructure.dart';

class AccountApiDataSource extends AccountDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: Environment.WALLET_API_V1,
    
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
}
