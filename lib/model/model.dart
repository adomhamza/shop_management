import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.inventoryName,
    this.inventoryDescription,
  });

  String inventoryName;
  String inventoryDescription;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        inventoryName: json["inventory_name"],
        inventoryDescription: json["inventory_description"],
      );

  Map<String, dynamic> toJson() => {
        "inventory_name": inventoryName,
        "inventory_description": inventoryDescription,
      };
}
