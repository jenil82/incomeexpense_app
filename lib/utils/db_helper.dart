import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DbHelper {
  Database? database;

  Future<Database> checkDb() async {
    if (database != null) {
      return database!;
    } else {
      return await createDb();
    }
  }

  Future<Database> createDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "database.db");
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query =
            "CREATE TABLE e_passbook (id INTEGER PRIMARY KEY AUTOINCREMENT,amount TEXT,date TEXT,category TEXT,paymentmethod TEXT,note TEXT,status INTEGER)";
        db.execute(query, null);
      },
    );
  }

  insertData({
    required amount,
    required date,
    required category,
    required paymentmethod,
    required note,
    required status,
  }) async {
    database = await checkDb();
    database!.insert("e_passbook", {
      "amount": amount,
      "date": date,
      "category": category,
      "paymentmethod": paymentmethod,
      "note": note,
      "status": status,
    });
  }

  Future<List<Map>> readData() async {
    database = await checkDb();
    String query = "SELECT * FROM e_passbook ORDER BY id DESC";
    List<Map> dataList = await database!.rawQuery(query);
    return dataList;
  }

  Future<void> deleteData({required id}) async {
    database = await checkDb();
    database!.delete('e_passbook', where: "id=?", whereArgs: [id]);
  }
}