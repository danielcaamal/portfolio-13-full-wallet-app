import 'package:wallet_app/src/domain/domain.dart';

import 'base.dart';

class Account extends Base {
  final String? netIncomeId;
  final String description;
  final double amount;
  final String icon;
  final String color;
  final bool includeInBalance;
  final String? userId;
  final String? lastTransactionId;
  final Transaction? lastTransaction;

  Account(
      {required super.id,
      required super.createdAt,
      required super.updatedAt,
      required super.isActive,
      required this.description,
      required this.amount,
      required this.icon,
      required this.color,
      required this.includeInBalance,
      this.userId,
      this.netIncomeId,
      this.lastTransactionId,
      this.lastTransaction});
}
