// To parse this JSON data, do
//
//     final accountsApiResponse = accountsApiResponseFromJson(jsonString);

import 'dart:convert';

AccountsApiResponse accountsApiResponseFromJson(String str) => AccountsApiResponse.fromJson(json.decode(str));

String accountsApiResponseToJson(AccountsApiResponse data) => json.encode(data.toJson());

class AccountsApiResponse {
    final String id;
    final List<AccountsApiResponseResult> result;
    final DateTime timestamp;
    final bool done;

    AccountsApiResponse({
        required this.id,
        required this.result,
        required this.timestamp,
        required this.done,
    });

    factory AccountsApiResponse.fromJson(Map<String, dynamic> json) => AccountsApiResponse(
        id: json["id"],
        result: List<AccountsApiResponseResult>.from(json["result"].map((x) => AccountsApiResponseResult.fromJson(x))),
        timestamp: DateTime.parse(json["timestamp"]),
        done: json["done"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
        "timestamp": timestamp.toIso8601String(),
        "done": done,
    };
}

class AccountsApiResponseResult {
    final String id;
    final String description;
    final String amount;
    final String color;
    final String icon;
    final String user;
    final bool isActive;
    final DateTime createdAt;
    final DateTime updatedAt;
    final bool includeInBalance;

    AccountsApiResponseResult({
        required this.id,
        required this.description,
        required this.amount,
        required this.color,
        required this.icon,
        required this.user,
        required this.isActive,
        required this.createdAt,
        required this.updatedAt,
        required this.includeInBalance,
    });

    factory AccountsApiResponseResult.fromJson(Map<String, dynamic> json) => AccountsApiResponseResult(
        id: json["_id"],
        description: json["description"],
        amount: json["amount"],
        color: json["color"],
        icon: json["icon"],
        user: json["user"],
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
        "user": user,
        "isActive": isActive,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "includeInBalance": includeInBalance,
    };
}
