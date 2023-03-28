// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  CartModel({
    required this.err,
    required this.data,
  });

  bool err;
  List<Datum> data;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        err: json["err"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "err": err,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.title,
    required this.category,
    required this.ourPrice,
    required this.price,
    required this.premium,
  });

  String id;
  String title;
  String category;
  int ourPrice;
  int price;
  bool premium;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        title: json["title"],
        category: json["category"],
        ourPrice: json["ourPrice"],
        price: json["price"],
        premium: json["premium"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "category": category,
        "ourPrice": ourPrice,
        "price": price,
        "premium": premium,
      };
}
