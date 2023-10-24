import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get WALLET_API_V1 => dotenv.env['WALLET_API_V1'] ?? '';
}
