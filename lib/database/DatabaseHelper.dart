import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ua_com_knin/models/Advert.dart';

class DatabaseHelper {

  final String tableAdverts = 'adverts';

  final String id = 'id';
  final String cityId = 'city_id';
  final String typeId = 'type_id';
  final String price = 'price';
  final String dayPrice = 'day_price';
  final String monthPrice = 'month_price';
  final String spaceSqMeters = 'space_sq_meters';
  final String adress = 'address';
  final String name = 'name';
  final String description = 'description';
  final String imageUrls = 'image_urls';
  final String creationTimestamp = 'creation_date_timestamp';
  final String latitude = 'latitude';
  final String longitude = 'longitude';
  final String sellerId = 'seller_id';
  final String isVip = 'is_vip';
  final String isLiked = 'is_liked';
  final String categoryId = 'category_id';

  // This is the actual database filename that is saved in the docs directory.
  static final _databaseName = "like_list_database_v5.db";
  // Increment this version when you need to change the schema.
  static final _databaseVersion = 5;

  // Make this a singleton class.
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Only allow a single open connection to the database.
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // open the database
  _initDatabase() async {
    // The path_provider plugin gets the right directory for Android or iOS.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    // Open the database. Can also add an onUpdate callback parameter.
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // SQL string to create the database
  Future _onCreate(Database db, int version) async {
    await db.execute('''
              CREATE TABLE $tableAdverts (
                $id INTEGER PRIMARY KEY,
                $cityId INTEGER NOT NULL,
                $typeId INTEGER NOT NULL,
                $price INTEGER,
                $dayPrice INTEGER,
                $monthPrice INTEGER,
                $spaceSqMeters INTEGER,
                $adress TEXT,
                $name TEXT,
                $description TEXT,
                $imageUrls TEXT,
                $creationTimestamp INTEGER,
                $latitude TEXT,
                $longitude TEXT,
                $sellerId INTEGER,
                $isVip BOOLEAN,
                $isLiked BOOLEAN,
                $categoryId INTEGER
              )
              ''');
  }

  // Database helper methods:

  Future<int> insert(Advert advert) async {
    Database db = await database;
    int id = await db.insert(tableAdverts, advert.toMap());
    return id;
  }

  Future<List<Advert>> queryAllAdverts() async {
    Database db = await database;
    List<Map> maps = await db.query(tableAdverts,
        columns: [
          id,
          cityId,
          typeId,
          price,
          dayPrice,
          monthPrice,
          spaceSqMeters,
          adress,
          name,
          description,
          imageUrls,
          creationTimestamp,
          latitude,
          longitude,
          sellerId,
          isVip,
          isLiked,
          categoryId
        ]);

    List <Advert> list = new List();
    if (maps.length > 0) {

      for (int i = 0 ; i < maps.length; i++){
        list.add(Advert.fromMap(maps[i]));
      }

      return list;
    }
    return null;
  }

  Future<Advert> deleteByID(int id) async {
    Database db = await database;
    await db.rawDelete('DELETE FROM $tableAdverts WHERE id = ?', [id]);
    return null;
  }



// TODO: queryAllWords()
// TODO: delete(int id)
// TODO: update(Word word)
}