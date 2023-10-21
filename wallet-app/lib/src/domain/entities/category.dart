import '/src/domain/enums/enums.dart';
import 'base.dart';

class Category extends Base {
  final String userId;
  final String netIncomeId;
  final String description;
  final OperationTypeEnum operationType;
  final String icon;
  final String color;
  final double plannedExpensePerMonth;
  final String? lastMovementId;

  Category(
      {required super.id,
      required super.createdAt,
      required super.updatedAt,
      required super.isActive,
      required this.userId,
      required this.netIncomeId,
      required this.description,
      required this.operationType,
      required this.icon,
      required this.color,
      required this.plannedExpensePerMonth,
      this.lastMovementId});
}
