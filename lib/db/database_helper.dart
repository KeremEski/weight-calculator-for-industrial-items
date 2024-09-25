import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
abstract class DatabaseHelper  {
  static Database? _database;

  static Future<void> init() async {
    try {
      if(_database != null){
      return;
    }
    String dbPath = await getDatabasesPath();
    String myDbPath = join(dbPath,"mydb.db");
    _database = await openDatabase(myDbPath,singleInstance: true);
  }
    catch (e) {
      print("Hata");
    }
     }
}