import 'package:wallet_app/src/domain/domain.dart';

import 'base.dart';

class Account extends Base {
  final String userId;
  final String netIncomeId;
  final String description;
  final double amount;
  final String icon;
  final String color;
  final bool includeInBalance;
  final String? lastTransactionId;
  final Transaction? lastTransaction;

  Account(
      {required super.id,
      required super.createdAt,
      required super.updatedAt,
      required super.isActive,
      required this.userId,
      required this.netIncomeId,
      required this.description,
      required this.amount,
      required this.icon,
      required this.color,
      required this.includeInBalance,
      this.lastTransactionId,
      this.lastTransaction});
}
