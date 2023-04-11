// To parse this JSON data, do
//
//     final allCoursePageModel = allCoursePageModelFromJson(jsonString);

import 'dart:convert';

AllCoursePageModel allCoursePageModelFromJson(String str) =>
    AllCoursePageModel.fromJson(json.decode(str));

String allCoursePageModelToJson(AllCoursePageModel data) =>
    json.encode(data.toJson());

class AllCoursePageModel {
  AllCoursePageModel({
    required this.message,
    required this.data,
    required this.totalPages,
    required this.currentPage,
  });

  String message;
  List<Datum> data;
  int totalPages;
  String currentPage;

  factory AllCoursePageModel.fromJson(Map<String, dynamic> json) =>
      AllCoursePageModel(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        totalPages: json["totalPages"],
        currentPage: json["currentPage"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "totalPages": totalPages,
        "currentPage": currentPage,
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
    required this.category,
    required this.premium,
    required this.v,
    this.price,
    this.percentage,
    this.ourPrice,
  });

  String id;
  String title;
  String courseId;
  String image;
  String description;
  int classes;
  int views;
  String category;
  bool premium;
  int v;
  int? price;
  int? percentage;
  int? ourPrice;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        title: json["title"],
        courseId: json["courseId"],
        image: json["image"],
        description: json["description"],
        classes: json["classes"],
        views: json["views"],
        category: json["category"],
        premium: json["premium"],
        v: json["__v"],
        price: json["price"],
        percentage: json["percentage"],
        ourPrice: json["ourPrice"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "courseId": courseId,
        "image": image,
        "description": description,
        "classes": classes,
        "views": views,
        "category": category,
        "premium": premium,
        "__v": v,
        "price": price,
        "percentage": percentage,
        "ourPrice": ourPrice,
      };
}
