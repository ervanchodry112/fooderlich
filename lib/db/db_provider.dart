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

  Future<int> delResep(String id_recipe) async {
    final dbClient = await database;
    final res = await dbClient!.delete(
      tableName,
      where: '$id = ?',
      whereArgs: [id_recipe],
    );
    return res;
  }

  // Create get resep by id
  Future<bool> getResepByID(String id_recipe) async {
    final dbClient = await database;
    final res = await dbClient!.query(
      tableName,
      where: '$id = ?',
      whereArgs: [id_recipe],
    );

    return res.isNotEmpty ? true : false;
  }

  // Create get all resep
  Future<List<SimpleRecipe>> getAllResep() async {
    final dbClient = await database;
    final res = await dbClient!.query(tableName);

    var recipes = <SimpleRecipe>[];
    if (recipes != null) {
      recipes = parseResep(res);
    }
    return recipes;
  }

  List<SimpleRecipe> parseResep(List<Map<String, dynamic>> res) {
    final recipes = <SimpleRecipe>[];
    for (final recipeMap in res) {
      final recipe = SimpleRecipe.fromJson(recipeMap);
      recipes.add(recipe);
    }

    return recipes;
  }
}
