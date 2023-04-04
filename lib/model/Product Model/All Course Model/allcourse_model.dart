// To parse this JSON data, do
//
//     final allcourse = allcourseFromJson(jsonString);

import 'dart:convert';

Allcourse allcourseFromJson(String str) => Allcourse.fromJson(json.decode(str));

String allcourseToJson(Allcourse data) => json.encode(data.toJson());

class Allcourse {
  Allcourse({
    required this.message,
    required this.data,
    required this.totalPages,
    required this.currentPage,
  });

  String message;
  List<Datum> data;
  int totalPages;
  int currentPage;

  factory Allcourse.fromJson(Map<String, dynamic> json) => Allcourse(
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
    this.price,
    this.percentage,
    this.ourPrice,
    required this.category,
    required this.premium,
    required this.rating,
    required this.v,
  });

  String id;
  String title;
  String courseId;
  String image;
  String description;
  int classes;
  int views;
  int? price;
  int? percentage;
  int? ourPrice;
  Category category;
  bool premium;
  int rating;
  int v;

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
        category: categoryValues.map[json["category"]]!,
        premium: json["premium"],
        rating: json["rating"],
        v: json["__v"],
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
        "category": categoryValues.reverse[category],
        "premium": premium,
        "rating": rating,
        "__v": v,
      };
}

enum Category { MOBILE_APP_DEVELOPMENT, WEB_DEVELOPMENT, PROGRAMMING }

final categoryValues = EnumValues({
  "MOBILE APP DEVELOPMENT": Category.MOBILE_APP_DEVELOPMENT,
  "PROGRAMMING": Category.PROGRAMMING,
  "WEB DEVELOPMENT": Category.WEB_DEVELOPMENT
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
