
import 'package:auto_shop/data/models/car_item_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/cached_item_model.dart';

class LocalDataBase {
  static final LocalDataBase getInstance = LocalDataBase._();

  LocalDataBase._();

  factory LocalDataBase() {
    return getInstance;
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initializeDB("database.db");
      return _database!;
    }
  }

  Future<Database> _initializeDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const intType = "INTEGER DEFAULT 0";

    print("JADVALL YARATILYAPDI");

    await db.execute('''
    CREATE TABLE $carTable (
    ${CachedCarField.id} $idType,
    ${CachedCarField.year} $intType,
    ${CachedCarField.name} $textType,
    ${CachedCarField.description} $textType,
    ${CachedCarField.logo} $textType,
    ${CachedCarField.price} $intType
    )
    ''');
  }

  //-------------------------------------------Cached Users Table------------------------------------

  static Future<CachedCar> insertCachedCar(CachedCar cachedUser) async {
    final db = await getInstance.database;
    final id = await db.insert(carTable, cachedUser.toJson());
    return cachedUser.copyWith(id: id);
  }

  static Future<CachedCar> insertCachedCarFromApi(CarItem carItemData) async {
    final db = await getInstance.database;
    CachedCar cachedUser = CachedCar(
      year: carItemData.id!.toInt(),
      name: carItemData.description.toString(),
      price: carItemData.id!.toInt(),
      description: carItemData.description.toString(),
      logo: carItemData.logo.toString()
    );
    final id = await db.insert(carTable, cachedUser.toJson());
    return cachedUser.copyWith(id: id);
  }

  static Future<int> deleteCachedCarById(int id) async {
    final db = await getInstance.database;
    var t = await db.delete(carTable,
        where: '${CachedCarField.id} = ?', whereArgs: [id]);
    return (t > 0) ? t : (-1);
  }

  static Future<List<CachedCar>> getAllCachedCars() async {
    final db = await getInstance.database;
    const orderBy = CachedCarField.id;
    final result = await db.query(carTable, orderBy: orderBy);
    return result.map((json) => CachedCar.fromJson(json)).toList();
  }

  static Future<int> deleteAllCachedCars() async {
    final db = await getInstance.database;
    return await db.delete(carTable);
  }
}