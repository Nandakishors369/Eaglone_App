// To parse this JSON data, do
//
//     final orderHistory = orderHistoryFromJson(jsonString);

import 'dart:convert';

OrderHistory orderHistoryFromJson(String str) =>
    OrderHistory.fromJson(json.decode(str));

String orderHistoryToJson(OrderHistory data) => json.encode(data.toJson());

class OrderHistory {
  OrderHistory({
    required this.err,
    required this.message,
    required this.data,
  });

  bool err;
  String message;
  List<Datum> data;

  factory OrderHistory.fromJson(Map<String, dynamic> json) => OrderHistory(
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
    required this.user,
    required this.client,
    required this.courses,
    required this.coupon,
    required this.payment,
    required this.createdAt,
    required this.v,
    required this.totalAmount,
    required this.datumId,
  });

  String id;
  String user;
  String client;
  List<Course> courses;
  Coupon coupon;
  Payment payment;
  DateTime createdAt;
  int v;
  int totalAmount;
  String datumId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        user: json["user"],
        client: json["client"],
        courses:
            List<Course>.from(json["courses"].map((x) => Course.fromJson(x))),
        coupon: Coupon.fromJson(json["coupon"]),
        payment: Payment.fromJson(json["payment"]),
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
        totalAmount: json["totalAmount"],
        datumId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "client": client,
        "courses": List<dynamic>.from(courses.map((x) => x.toJson())),
        "coupon": coupon.toJson(),
        "payment": payment.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
        "totalAmount": totalAmount,
        "id": datumId,
      };
}

class Coupon {
  Coupon({
    required this.code,
    this.discount,
    required this.id,
  });

  String code;
  dynamic discount;
  String id;

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
        code: json["code"],
        discount: json["discount"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "discount": discount,
        "_id": id,
      };
}

class Course {
  Course({
    required this.course,
    required this.price,
    required this.id,
  });

  String course;
  int price;
  String id;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        course: json["course"],
        price: json["price"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "course": course,
        "price": price,
        "_id": id,
      };
}

class Payment {
  Payment({
    required this.method,
    required this.transactionId,
    required this.amount,
    required this.id,
  });

  String method;
  String transactionId;
  int amount;
  String id;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        method: json["method"],
        transactionId: json["transactionId"],
        amount: json["amount"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "method": method,
        "transactionId": transactionId,
        "amount": amount,
        "_id": id,
      };
}
