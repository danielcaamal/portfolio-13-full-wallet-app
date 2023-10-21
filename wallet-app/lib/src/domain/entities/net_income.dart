import 'base.dart';

class NetIncome extends Base {
  final String userId;

  NetIncome({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required super.isActive,
    required this.userId,
  });
}
