import 'entities.dart';

class Transfer extends Base {
  final String userId;
  final String netIncomeId;
  final String description;
  final double amount;
  final DateTime movementDate;
  final String accountSourceId;
  final Account? accountSource;
  final String accountDestinationId;
  final Account? accountDestination;

  Transfer({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required super.isActive,
    required this.userId,
    required this.netIncomeId,
    required this.description,
    required this.amount,
    required this.movementDate,
    required this.accountSourceId,
    this.accountSource,
    required this.accountDestinationId,
    this.accountDestination,
  });
}
