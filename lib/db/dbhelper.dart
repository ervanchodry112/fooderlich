import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

import '../models/simple_recipe_db.dart';
import '../models/simple_recipe.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  static Database? database;

  final String tableName = 'resep';
  final String id = 'id';
  final String dishImage = 'dishImage';
  final String title = 'title';
  final String duration = 'duration';
  final String source = 'source';
  final String information = 'information';

  DBHelper._internal();
  factory DBHelper() => _instance;

  Future<Database?> get _db async {
    if (database != null) {
      return database;
    } else {
      database = await _initDb();

      return database;
    }
  }

  Future<Database?> _initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'fooderlich.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    var sql = 'CREATE TABLE $tableName ($id INTEGER PRIMARY KEY, '
        '$dishImage TEXT, $title VARCHAR(255), $duration VARCHAR(255),'
        '$source TEXT, $information TEXT)';

    await db.execute(sql);
  }

  Future<int?> addResep(SimpleRecipeDB recipe) async {
    var dbClient = await database;
    return await dbClient.insert(
      tableName,
      recipe,
    );
  }
}
