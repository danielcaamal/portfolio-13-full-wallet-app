import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_app/src/domain/domain.dart';
import 'package:wallet_app/src/infrastructure/infrastructure.dart';

final accountRepositoryProvider = Provider<AccountsRepository>((ref) {
  return AccountsRepositoryImpl(dataSource: AccountApiDataSource());
});
