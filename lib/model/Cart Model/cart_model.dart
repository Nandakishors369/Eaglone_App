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
    required this.message,
  });

  bool err;
  List<Datum> data;
  String? message;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
      err: json["err"],
      data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      message: json["message"]);

  Map<String, dynamic> toJson() => {
        "err": err,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message
      };
}

class Datum {
  Datum({
    required this.id,
    required this.title,
    required this.category,
    required this.image,
    required this.ourPrice,
    required this.price,
    required this.percentage,
    required this.premium,
  });

  String id;
  String title;
  String category;
  String image;
  int ourPrice;
  int price;
  int percentage;
  bool premium;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        title: json["title"],
        category: json["category"],
        image: json["image"],
        ourPrice: json["ourPrice"],
        price: json["price"],
        percentage: json["percentage"],
        premium: json["premium"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "category": category,
        "image": image,
        "ourPrice": ourPrice,
        "price": price,
        "percentage": percentage,
        "premium": premium,
      };
}
