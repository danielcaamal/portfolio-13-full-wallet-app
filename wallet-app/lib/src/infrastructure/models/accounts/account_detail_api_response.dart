import 'dart:convert';

AccountDetailApiResponse accountDetailApiResponseFromJson(String str) => AccountDetailApiResponse.fromJson(json.decode(str));

String accountDetailApiResponseToJson(AccountDetailApiResponse data) => json.encode(data.toJson());

class AccountDetailApiResponse {
    final String id;
    final AccountDetailApiResponseResult result;
    final DateTime timestamp;
    final bool done;

    AccountDetailApiResponse({
        required this.id,
        required this.result,
        required this.timestamp,
        required this.done,
    });

    factory AccountDetailApiResponse.fromJson(Map<String, dynamic> json) => AccountDetailApiResponse(
        id: json["id"],
        result: AccountDetailApiResponseResult.fromJson(json["result"]),
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

class AccountDetailApiResponseResult {
    final String id;
    final String description;
    final String amount;
    final String color;
    final String icon;
    final bool isActive;
    final DateTime createdAt;
    final DateTime updatedAt;
    final bool includeInBalance;

    AccountDetailApiResponseResult({
        required this.id,
        required this.description,
        required this.amount,
        required this.color,
        required this.icon,
        required this.isActive,
        required this.createdAt,
        required this.updatedAt,
        required this.includeInBalance,
    });

    factory AccountDetailApiResponseResult.fromJson(Map<String, dynamic> json) => AccountDetailApiResponseResult(
        id: json["_id"],
        description: json["description"],
        amount: json["amount"],
        color: json["color"],
        icon: json["icon"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        includeInBalance: json["includeInBalance"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "description": description,
        "amount": amount,
        "color": color,
        "icon": icon,
        "isActive": isActive,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "includeInBalance": includeInBalance,
    };
}
