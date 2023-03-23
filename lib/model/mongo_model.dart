// To parse this JSON data, do
//
//     final mongoModel = mongoModelFromJson(jsonString);

//import 'package:meta/meta.dart';
import 'dart:convert';

MongoModel mongoModelFromJson(String str) =>
    MongoModel.fromJson(json.decode(str));

String mongoModelToJson(MongoModel data) => json.encode(data.toJson());

class MongoModel {
  MongoModel({
    required this.name,
    required this.price,
  });

  String name;
  String price;

  factory MongoModel.fromJson(Map<String, dynamic> json) => MongoModel(
        name: json["name"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
      };
}
