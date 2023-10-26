import 'package:wallet_app/src/domain/domain.dart';
import 'package:wallet_app/src/infrastructure/infrastructure.dart';

class AccountsMapper {
  static List<Account> accountsApiResponseToAccount(
      AccountsApiResponse accountsApiResponse) {
    return accountsApiResponse.result
        .map((account) => Account(
              id: account.id,
              description: account.description,
              amount: double.parse(account.amount),
              color: account.color,
              icon: account.icon,
              isActive: account.isActive,
              createdAt: account.createdAt,
              updatedAt: account.updatedAt,
              includeInBalance: account.includeInBalance,
              userId: account.user,
            ))
        .toList();
  }

  static Account accountDetailApiResponseToAccount(
      AccountDetailApiResponse accountDetailApiResponse) {
    return Account(
      id: accountDetailApiResponse.result.id,
      description: accountDetailApiResponse.result.description,
      amount: double.parse(accountDetailApiResponse.result.amount),
      color: accountDetailApiResponse.result.color,
      icon: accountDetailApiResponse.result.icon,
      isActive: accountDetailApiResponse.result.isActive,
      createdAt: accountDetailApiResponse.result.createdAt,
      updatedAt: accountDetailApiResponse.result.updatedAt,
      includeInBalance: accountDetailApiResponse.result.includeInBalance,
    );
  }
}
