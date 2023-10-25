import 'dart:convert';

AccountsTotalBalanceApiResponse accountsTotalBalanceApiResponseFromJson(
        String str) =>
    AccountsTotalBalanceApiResponse.fromJson(json.decode(str));

String accountsTotalBalanceApiResponseToJson(
        AccountsTotalBalanceApiResponse data) =>
    json.encode(data.toJson());

class AccountsTotalBalanceApiResponse {
  final String id;
  final AccountsTotalBalanceApiResponseResult result;
  final DateTime timestamp;
  final bool done;

  AccountsTotalBalanceApiResponse({
    required this.id,
    required this.result,
    required this.timestamp,
    required this.done,
  });

  factory AccountsTotalBalanceApiResponse.fromJson(Map<String, dynamic> json) =>
      AccountsTotalBalanceApiResponse(
        id: json["id"],
        result: AccountsTotalBalanceApiResponseResult.fromJson(json["result"]),
        timestamp: DateTime.parse(json["timestamp"]),
        done: json["done"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "result": result.toJson(),
        "timestamp": timestamp.toIso8601String(),
        "done": done,
      };
}

class AccountsTotalBalanceApiResponseResult {
  final String total;

  AccountsTotalBalanceApiResponseResult({
    required this.total,
  });

  factory AccountsTotalBalanceApiResponseResult.fromJson(Map<String, dynamic> json) => AccountsTotalBalanceApiResponseResult(
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
      };
}
