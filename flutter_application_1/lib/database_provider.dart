import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/custome_model.dart';
import 'package:flutter_application_1/food_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';



class DatabaseProvider {
  final databaseName = "todo.db";
  static Database? database;
  DatabaseProvider() {
    print("in constructor");
    createDatabase();
  }
  Future<Database> createDatabase() async {
    if (kIsWeb) {
      var databaseFactory = databaseFactoryFfiWeb;
      database = await databaseFactory.openDatabase(databaseName,
          options: OpenDatabaseOptions(
              version: 1,
              onCreate: (db, version) async {
                await db!.execute(
                    'CREATE TABLE FOODNAME (id INTEGER PRIMARY KEY, FoodName, FoodPrice INTEGER)');
                      await db!.execute(
                    'CREATE TABLE CUSTOMER (id INTEGER PRIMARY KEY, customerName, contacNumber TEXT)');
              }));
    } else {
      String path = join(await getDatabasesPath(), databaseName);
      database =
          await openDatabase(path, version: 1, onCreate: (db, version) async {
        await db!.execute(
            'CREATE TABLE FOODNAME (id INTEGER PRIMARY KEY, FoodName TEXT, FoodPrice REAL)');
            await db!.execute(
            'CREATE TABLE CUSTOMER(id INTEGER PRIMARY KEY, customerName TEXT, contacNumber TEXT)');
      });
    }
    return Future.value(database);
  }

  Future<void> insertFood(FoodModel foodmodel) async {
    var db = await createDatabase();
    db.insert("FOODNAME", foodmodel.toMap());
  }
  Future<void> insrtcustomer(CustomeModel customemodel) async {
    var db = await createDatabase();
    db.insert("CUSTOMER", customemodel.toMap());
  }

  Future<void> updatefood(FoodModel foodmodel) async {
    var db = await createDatabase();
    db.update("FOODNAME", foodmodel.toMap(),
        where: "id=?", whereArgs: [foodmodel.id]);
  }
  Future<void>updateCustomer(CustomeModel customemodel) async {
    var db = await createDatabase();
    db.update("CUSTOMER", customemodel.toMap(),
        where: "id=?", whereArgs: [customemodel.id]);
  }

  Future<void> deleteTodo(int id) async {
    var db = await createDatabase();
    db.delete("FOODNAME", where: "id=?", whereArgs: [id]);
  }
   Future<void> deleteCustomer(int id) async {
    var db = await createDatabase();
    db.delete("CUSTOMER", where: "id=?", whereArgs: [id]);
  }

  Future<List<FoodModel>> getlist() async {
    var db = await createDatabase();
    final List<Map<String, dynamic>> maps = await db.query("foodname");

    return List.generate(maps.length, (i) {
      return FoodModel.fromJson(maps[i]);
    });
  }
  Future<List<CustomeModel>> getList() async {
    var db = await createDatabase();
    final List<Map<String, dynamic>> maps = await db.query("CUSTOMER");

    return List.generate(maps.length, (i) {
      return CustomeModel.fromJson(maps[i]);
    });
  }
}