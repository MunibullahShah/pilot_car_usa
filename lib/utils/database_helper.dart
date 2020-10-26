import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;

  DatabaseHelper._createInstance();

  static Database _database;

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'pilot.db';

    var khataDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return khataDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('Create TABLE PDF(invoice Text PRIMARY KEY)');
  }

  Future<List<Map<String, dynamic>>> getPDFList() async {
    Database db = await this.database;
    var result = db.query("PDF");
    return result;
  }

  Future<List<String>> getSearchedpdf(String value) async {
    Database db = await this.database;
    List<Map<String, dynamic>> list =
        await db.rawQuery("Select * from PDF WHERE invoice LIKE ?", [value]);

    List<String> searchedPDFlist = List<String>();
    list.forEach((element) {
      String str = element["invoice"];
      searchedPDFlist.add(str);
    });
    return searchedPDFlist;
  }

  Future<int> insertPDF(String invoice) async {
    Database db = await this.database;
    var map = Map<String, String>();
    map["invoice"] = invoice;
    var result = await db.insert("PDF", map);
    return result;
  }

  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from PDF');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  //Get the map list and convert it to list of Customers
  Future<List<String>> getPDF() async {
    var pdfMapList = await getPDFList(); // Get 'Map List' from database
    int count =
        pdfMapList.length; // Count the number of map entries in db table

    List<String> pdfList = List<String>();

    pdfMapList.forEach((element) {
      String str = element['invoice'];
      pdfList.add(str);
    });
    return pdfList;
  }
}
