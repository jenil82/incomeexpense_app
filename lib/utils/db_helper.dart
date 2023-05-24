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
        String categoryquery =
            "CREATE TABLE category (id INTEGER PRIMARY KEY AUTOINCREMENT,category TEXT)";
        db.execute(query);
        db.execute(categoryquery);
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
    database!.insert(
      "e_passbook",
      {
        "amount": amount,
        "date": date,
        "category": category,
        "paymentmethod": paymentmethod,
        "note": note,
        "status": status,
      },
    );
  }

  insertCategory({
    required category,
  }) async {
    database = await checkDb();
    database!.insert("categorytable", {
      "category": "Gpay",
      "category": "Online",
      "category": category,
    });
  }

  Future<List<Map>> readData() async {
    database = await checkDb();
    String query = "SELECT * FROM e_passbook ORDER BY id DESC";
    List<Map> dataList = await database!.rawQuery(query);
    return dataList;
  }

  Future<List<Map>> readCategory() async {
    database = await checkDb();
    String query = "SELECT * FROM category";
    List<Map> categoryDataList = await database!.rawQuery(query);
    return categoryDataList;
  }

  Future<List<Map>> oldData({
    required id,
  }) async {
    database = await checkDb();
    String query = "SELECT * FROM e_passbook WHERE id = '$id'";
    List<Map> oldDataList = await database!.rawQuery(query);
    return oldDataList;
  }

  Future<void> updateData({
    required id,
    required amount,
    required date,
    required category,
    required paymentmethod,
    required note,
    required status,
  }) async {
    database = await checkDb();
    database!.update(
      "e_passbook",
      {
        "amount": amount,
        "date": date,
        "category": category,
        "paymentmethod": paymentmethod,
        "note": note,
        "status": status,
      },
      where: "id=?",
      whereArgs: [id],
    );
  }

  Future<void> deleteData({
    required id,
  }) async {
    database = await checkDb();
    database!.delete(
      'e_passbook',
      where: "id=?",
      whereArgs: [id],
    );
  }

  Future<List> calculateIncomeBalance() async {
    database = await checkDb();
    String query =
        "SELECT SUM(amount) AS total_income FROM e_passbook WHERE status = '0'";
    List incomeDataTotal = await database!.rawQuery(query);
    return incomeDataTotal;
  }

  Future<List> calculateExpenseBalance() async {
    database = await checkDb();
    String query =
        "SELECT SUM(amount) AS total_expense FROM e_passbook WHERE status = '1'";
    List expenseDataTotal = await database!.rawQuery(query);
    return expenseDataTotal;
  }

  Future<List<Map>> filterIncomeExpense({
    required status,
  }) async {
    database = await checkDb();
    String query = "SELECT * FROM e_passbook WHERE status = '$status'";
    List<Map> dataList = await database!.rawQuery(query);
    return dataList;
  }

  Future<List<Map>> filterDate({
    required startingDate,
    required endingDate,
  }) async {
    database = await checkDb();
    String query =
        "SELECT * FROM e_passbook WHERE date >= '$startingDate' AND date <= '$endingDate'";
    List<Map> dataList = await database!.rawQuery(query);
    return dataList;
  }

  Future<List<Map>> filterCategory({
    required category,
  }) async {
    database = await checkDb();
    String query = "SELECT * FROM e_passbook WHERE category = '$category'";
    List<Map> dataList = await database!.rawQuery(query);
    return dataList;
  }

  Future<List<Map>> filterPaymentMethod({
    required paymentmethod,
  }) async {
    database = await checkDb();
    String query =
        "SELECT * FROM e_passbook WHERE paymentmethod = '$paymentmethod'";
    List<Map> dataList = await database!.rawQuery(query);
    return dataList;
  }

  void filterMaster() {}
}