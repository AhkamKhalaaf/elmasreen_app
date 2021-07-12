import 'dart:core';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'AttributeDbModel.dart';
import 'AttributeDbModelFake.dart';
import 'CartLDBModel.dart';

class DbHelper {
  static final DbHelper _instnce = DbHelper.internal();

  factory DbHelper() => _instnce;

  DbHelper.internal();

  static Database _db;

  Future<Database> createDatabase() async {
    if (_db != null) {
      return _db;
    }
    //define the path to database img
    String path = join(await getDatabasesPath(), 'elmasreeenAppv5.db');
    _db = await openDatabase(path, version: 1, onCreate: (Database db, int v) {
      db.execute("CREATE TABLE Favorite ("
          "itemId TEXT PRIMARY KEY,"
          "idProduct TEXT,"
          "quantity INTEGER,"
          "price REAL,"
          "oldprice REAL,"
          "total REAL,"
          "title TEXT,"
          "description TEXT,"
          "img TEXT,"
          "isSelected INTEGER,"
          "note TEXT"
          ")");
//idProduct isSelected
      db.execute("CREATE TABLE Products ("
          "itemId TEXT PRIMARY KEY,"
          "idProduct TEXT,"
          "quantity INTEGER,"
          "price REAL,"
          "oldprice REAL,"
          "total REAL,"
          "title TEXT,"
          "description TEXT,"
          "img TEXT,"
          "isSelected INTEGER,"
          "note TEXT"
          ")");
//that will use when add to cart
      db.execute("CREATE TABLE attributesFake ("
          "productId TEXT,"
          "attributeId TEXT,"
          "id TEXT,"
          "value TEXT,"
          "price REAL,"
          "title TEXT"
          ")");

      db.execute("CREATE TABLE attributes ("
          "productId TEXT,"
          "attributeId TEXT PRIMARY KEY,"
          "id TEXT,"
          "value TEXT,"
          "price REAL,"
          "title TEXT"
          ")");



    });
    return _db;
  }

//fake table



  Future<int> addAttributeLDBModelToCartFake(AttributeDbModelFake attributeDbModelFake) async {
    Database db = await createDatabase();
    return db.insert('attributesFake', attributeDbModelFake.toMap()
      //,conflictAlgorithm: ConflictAlgorithm.replace
    );
  }
  Future<int> deleteAttributeLDBModelItemFake(String productId) async {
    Database db = await createDatabase();
    return db.delete('attributesFake', where: 'productId = ?', whereArgs: [productId]);
  }

  Future<List<AttributeDbModelFake>> getAllAttributesByProductIdFake(String itemID) async {
    final db = await createDatabase();
    var response = await db.query('attributesFake',where: 'productId = ?', whereArgs: [itemID]);
    List<AttributeDbModelFake> list = response.isNotEmpty
        ? response.map((e) => AttributeDbModelFake.fromMap(e)).toList()
        : [];
    return list;
  }

  Future<List> getAllAttributesFake () async {
    Database db = await createDatabase();
    return db.query('attributesFake'
    );
  }
  Future<int> deleteAllAttributesFake() async {
    Database db = await createDatabase();
    return db.delete('attributesFake');
  }
  updateAttributeLDBModelFake(AttributeDbModelFake attributeDbModelFake) async {
    Database db = await createDatabase();
    return await db.update('attributesFake', attributeDbModelFake.toMap(),
        where: 'attributeId = ?', whereArgs: [attributeDbModelFake.attributeId]);
  }

  ///
  updateAttributeLDBModel(AttributeLDBModel attributeLDBModel) async {
    Database db = await createDatabase();
    return await db.update('attributes', attributeLDBModel.toMap(),
        where: 'attributeId = ?', whereArgs: [attributeLDBModel.attributeId]);
  }


  Future<int> addAttributeLDBModelToCart(AttributeLDBModel attributeLDBModel) async {
    Database db = await createDatabase();
    return db.insert('attributes', attributeLDBModel.toMap()
      //,conflictAlgorithm: ConflictAlgorithm.replace
    );
  }
  Future<int> deleteAttributeLDBModelItem(String productId) async {
    Database db = await createDatabase();
    return db.delete('attributes', where: 'productId = ?', whereArgs: [productId]);
  }

  Future<List<AttributeLDBModel>> getAllAttributesByProductId(String productID) async {
    final db = await createDatabase();
    var response = await db.query('attributes',where: 'productId = ?', whereArgs: [productID]);
    List<AttributeLDBModel> list = response.isNotEmpty
        ? response.map((e) => AttributeLDBModel.fromMap(e)).toList()
        : [];
    return list;
  }

  Future<List> getAllAttributes () async {
    Database db = await createDatabase();
    return db.query('attributes'
    );
  }
  Future<int> deleteAllAttributes() async {
    Database db = await createDatabase();
    return db.delete('attributes');
  }


  Future<int> addCartLDBModelToCart(CartLDBModel cartLDBModel) async {
    Database db = await createDatabase();
     return db.insert('Products', cartLDBModel.toMap()
        //,conflictAlgorithm: ConflictAlgorithm.replace
    );



  }

  Future<List<CartLDBModel>> allCartLDBModel() async {
    final db = await createDatabase();
    var response = await db.query("Products");
    List<CartLDBModel> list = response.isNotEmpty
        ? response.map((e) => CartLDBModel.fromMap(e)).toList()
        : [];
    return list;
  }

  Future<int> deleteCartLDBModelItem(String itemId) async {
    Database db = await createDatabase();
    return db.delete('Products', where: 'itemId = ?', whereArgs: [itemId]);
  }

  Future<int> deleteAllCartLDBModelItem() async {
    Database db = await createDatabase();
    return db.delete('Products');
  }

  updateCartLDBModelItem(CartLDBModel cartLDBModel) async {
    Database db = await createDatabase();
    return await db.update('Products', cartLDBModel.toMap(),
        where: 'itemId = ?', whereArgs: [cartLDBModel.itemId]);
  }
   updateCartLDBModelItemByProductID(CartLDBModel cartLDBModel) async {
    Database db = await createDatabase();
    return await db.update('Products', cartLDBModel.toMap(),
        where: 'idProduct = ?', whereArgs: [cartLDBModel.idProduct]);
  }
  Future<int> addFavoriteItem(CartLDBModel cartLDBModel) async {
    Database db = await createDatabase();
    return db.insert('Favorite', cartLDBModel.toMap());
  }

  Future<List<CartLDBModel>> getAllFavoriteDb() async {
    final db = await createDatabase();
    var response = await db.query("Favorite");
    List<CartLDBModel> list = response.isNotEmpty
        ? response.map((e) => CartLDBModel.fromMap(e)).toList()
        : [];
    return list;
  }

  Future<int> deleteFavoriteItem(String id) async {
    Database db = await createDatabase();
    return db.delete('Favorite', where: 'itemId = ?', whereArgs: [id]);
  }

  Future<int> deleteAllFavoriteItem() async {
    Database db = await createDatabase();
    return db.delete('Favorite');
  }

  Future<bool> isProductFoundInFavouriteTable(String id) async {
    Database db = await createDatabase();
    List<Map> productList = await db
        .rawQuery('SELECT * FROM Favorite where itemId = ?', [id]);
    if (productList.length > 0) {
      return true;
    }
    return false;
  }

  Future<int> isProductFoundInCartTable(String itemId) async {
    Database db = await createDatabase();
    List productList = await db
        .rawQuery('SELECT * FROM Products where itemId = ?', [itemId]);
    if (productList.length > 0) {
      CartLDBModel c=CartLDBModel.fromMap(productList[0]);
      return c.quantity;
    }
    return 0;
  }
}
