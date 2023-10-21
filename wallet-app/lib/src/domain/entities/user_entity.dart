import 'base.dart';

class User extends Base {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  User({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required super.isActive,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });
}
