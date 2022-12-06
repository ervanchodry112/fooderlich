import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

import '../models/simple_recipe_db.dart';
import '../models/simple_recipe.dart';

class DBProvider {
  final String tableName = 'resep';
  final String id = 'id';
  final String dishImage = 'dishImage';
  final String title = 'title';
  final String duration = 'duration';
  final String source = 'source';
  final String information = 'information';

  static final DBProvider db = DBProvider();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'fooderlich.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    var sql = 'CREATE TABLE $tableName ($id TEXT PRIMARY KEY, '
        '$dishImage TEXT, $title TEXT, $duration TEXT,'
        '$source TEXT, $information TEXT)';

    await db.execute(sql);
  }

  Future<int> addResep(SimpleRecipe recipe) async {
    final dbClient = await database;

    final res = await dbClient!.insert(tableName, recipe.toMap());

    print(res);
    return res;
  }

  Future<int> delResep(String id) async {
    final dbClient = await database;
    final res = await dbClient!.delete(
      tableName,
      where: '$id = ?',
      whereArgs: [id],
    );
    return res;
  }
}
