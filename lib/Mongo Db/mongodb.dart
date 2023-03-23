import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:eaglone/model/mongo_model.dart';
import 'package:eaglone/view/const.dart';
import 'package:mongo_dart/mongo_dart.dart';

//var db = Db.create(MONGO_URL);

class MongoDatabase {
  static var collection;
  static connect() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    var status = db.serverStatus();
    print(status);
    inspect(db);
    collection = db.collection(COLLECTION);
  }
}

Future<void> insertUser(String name, String price) async {
  var db = await Db.create(MONGO_URL);
  await db.open();
  var collection = db.collection(COLLECTION);
  await collection.insert({"name": name, "price": price});
  await db.close();
}

Future<List> getMongo() async {
  try {
    var db = await Db.create(MONGO_URL);
    await db.open();
    var collection = db.collection(COLLECTION);
    var data = await collection.find().toList();
    // var hello = MongoModel.fromJson(data);
    log("working mongo");

    return data;
  } catch (e) {
    print(e);
    log("failed");
    log(e.toString());
    return Future.value(e as FutureOr<List<Map<String, dynamic>>>?);
  }
}
