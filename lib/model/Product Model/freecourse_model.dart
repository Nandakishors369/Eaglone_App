// To parse this JSON data, do
//
//     final freeProductModel = freeProductModelFromJson(jsonString);

import 'dart:convert';

FreeProductModel freeProductModelFromJson(String str) =>
    FreeProductModel.fromJson(json.decode(str));

String freeProductModelToJson(FreeProductModel data) =>
    json.encode(data.toJson());

class FreeProductModel {
  FreeProductModel({
    required this.err,
    required this.message,
    required this.data,
  });

  bool err;
  String message;
  List<Datum> data;

  factory FreeProductModel.fromJson(Map<String, dynamic> json) =>
      FreeProductModel(
        err: json["err"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "err": err,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.title,
    required this.courseId,
    required this.image,
    required this.description,
    required this.classes,
    required this.views,
    required this.price,
    required this.percentage,
    required this.ourPrice,
    required this.category,
    required this.premium,
    required this.v,
    required this.rating,
  });

  String id;
  String title;
  String courseId;
  String image;
  String description;
  int? classes;
  int? views;
  int? price;
  int? percentage;
  int? ourPrice;
  String category;
  bool premium;
  int? v;
  List<Rating> rating;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        title: json["title"],
        courseId: json["courseId"],
        image: json["image"],
        description: json["description"],
        classes: json["classes"],
        views: json["views"],
        price: json["price"],
        percentage: json["percentage"],
        ourPrice: json["ourPrice"],
        category: json["category"],
        premium: json["premium"],
        v: json["__v"],
        rating:
            List<Rating>.from(json["rating"].map((x) => Rating.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "courseId": courseId,
        "image": image,
        "description": description,
        "classes": classes,
        "views": views,
        "price": price,
        "percentage": percentage,
        "ourPrice": ourPrice,
        "category": category,
        "premium": premium,
        "__v": v,
        "rating": List<dynamic>.from(rating.map((x) => x.toJson())),
      };
}

class Rating {
  Rating({
    required this.user,
    required this.rating,
    required this.comment,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  String user;
  int rating;
  String comment;
  String id;
  DateTime createdAt;
  DateTime updatedAt;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        user: json["user"],
        rating: json["rating"],
        comment: json["comment"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "rating": rating,
        "comment": comment,
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
