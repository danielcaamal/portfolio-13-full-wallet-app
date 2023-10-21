import 'package:wallet_app/src/domain/enums/enums.dart';
import 'entities.dart';

class Transaction extends Base {
  final String userId;
  final String netIncomeId;
  final String accountId;
  final Account? account;
  final String categoryId;
  final Category? category;
  final OperationTypeEnum operationType;
  final String description;
  final double amount;
  final DateTime movementDate;
  final DateTime? movementScheduleDate;
  final int totalMovements;
  final int movementNumber;

  Transaction(
      {required super.id,
      required super.createdAt,
      required super.updatedAt,
      required super.isActive,
      required this.userId,
      required this.netIncomeId,
      required this.accountId,
      required this.categoryId,
      required this.description,
      required this.operationType,
      required this.amount,
      required this.movementDate,
      required this.totalMovements,
      required this.movementNumber,
      this.movementScheduleDate,
      this.account,
      this.category});
}
