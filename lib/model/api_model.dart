// To parse this JSON data, do
//
//     final records = recordsFromJson(jsonString);

import 'dart:convert';

List<Records> recordsFromJson(String str) =>
    List<Records>.from(json.decode(str).map((x) => Records.fromJson(x)));

String recordsToJson(List<Records> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Records {
  Records({
    this.date,
    this.inventory,
  });

  DateTime date;
  List<Inventory> inventory;

  factory Records.fromJson(Map<String, dynamic> json) => Records(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        inventory: json["inventory"] == null
            ? null
            : List<Inventory>.from(
                json["inventory"].map((x) => Inventory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "date": date == null
            ? null
            : "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "inventory": inventory == null
            ? null
            : List<dynamic>.from(inventory.map((x) => x.toJson())),
      };
}

class Inventory {
  Inventory({
    this.inventoryId,
    this.inventoryName,
    this.amount,
    this.modified,
  });

  String inventoryId;
  String inventoryName;
  String amount;
  DateTime modified;

  factory Inventory.fromJson(Map<String, dynamic> json) => Inventory(
        inventoryId: json["inventory_id"] == null ? null : json["inventory_id"],
        inventoryName:
            json["inventory_name"] == null ? null : json["inventory_name"],
        amount: json["amount"] == null ? null : json["amount"],
        modified:
            json["modified"] == null ? null : DateTime.parse(json["modified"]),
      );

  Map<String, dynamic> toJson() => {
        "inventory_id": inventoryId == null ? null : inventoryId,
        "inventory_name": inventoryName == null ? null : inventoryName,
        "amount": amount == null ? null : amount,
        "modified": modified == null ? null : modified.toIso8601String(),
      };
}
