import 'package:dukaan/modals/cart_product_modal.dart';
import 'package:dukaan/modals/product_modals.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';

import '../modals/login_modals.dart';

enum TableName { login, fav, cart }

enum DbLogin { id, email, password }

enum FavProducts {
  id,
  title,
  description,
  category,
  price,
  discountPercentage,
  brand,
  warrantyInformation,
  availabilityStatus,
  returnPolicy,
  thumbnail,
}

enum CartProducts {
  id,
  title,
  description,
  category,
  price,
  discountPercentage,
  brand,
  warrantyInformation,
  availabilityStatus,
  returnPolicy,
  thumbnail,
}

class LoginHelper {
  LoginHelper._();

  static LoginHelper loginHelper = LoginHelper._();
  String dbName = 'my_database.db';
  late Database database;
  late Database table;
  late Database cart;
  Logger logger = Logger();

  Future<void> initdb() async {
    String dbPath = await getDatabasesPath();
    database = await openDatabase(
      '${TableName.login.name}/$dbPath',
      version: 1,
      onCreate: (db, version) async {
        String sql = """CREATE TABLE IF NOT EXISTS ${TableName.login.name} 
            (${DbLogin.id.name} INTEGER PRIMARY KEY AUTOINCREMENT,
             ${DbLogin.email.name} TEXT UNIQUE NOT NULL,
             ${DbLogin.password.name} TEXT NOT NULL);""";
        await db
            .execute(
              sql,
            )
            .then((value) => logger.i('${TableName.login.name} Table Created'))
            .onError((error, stackTrace) =>
                logger.e('${TableName.login.name} table not created $error'));
      },
      onUpgrade: (db, v1, v2) {},
      onDowngrade: (db, v1, v2) {},
    );
//----------------favroite table-------------------

    table = await openDatabase(
      '${TableName.fav.name}/$dbPath',
      version: 1,
      onCreate: (db, version) {
        String query = """CREATE TABLE IF NOT EXISTS 
            ${TableName.fav.name}(
        ${FavProducts.id.name} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${FavProducts.title.name} TEXT NOT NULL,
        ${FavProducts.description.name} TEXT NOT NULL,
        ${FavProducts.category.name} TEXT NOT NULL,
        ${FavProducts.price.name} DOUBLE NOT NULL,
        ${FavProducts.discountPercentage.name} DOUBLE NOT NULL,
        ${FavProducts.brand.name} TEXT NOT NULL,
        ${FavProducts.warrantyInformation.name} TEXT NOT NULL,
        ${FavProducts.availabilityStatus.name} TEXT NOT NULL,
        ${FavProducts.returnPolicy.name} TEXT NOT NULL,
        ${FavProducts.thumbnail.name} TEXT NOT NULL
        );""";
        db
            .execute(query)
            .then((value) => logger.i('table created'))
            .onError((error, stackTrace) => logger.e('ERROR:$error'));
      },
      onUpgrade: (db, v1, v2) {},
      onDowngrade: (db, v1, v2) {},
    );

    //--------------------------cart table------------------------

    cart = await openDatabase('${TableName.cart.name}/$dbPath', version: 1,
        onCreate: (db, version) {
      String query = """CREATE TABLE IF NOT EXISTS ${TableName.cart.name}(
    ${CartProducts.id.name} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${CartProducts.title.name} TEXT NOT NULL,
    ${CartProducts.description.name} TEXT NOT NULL,
    ${CartProducts.category.name} TEXT NOT NULL,
    ${CartProducts.price.name} DOUBLE NOT NULL,
    ${CartProducts.discountPercentage.name} DOUBLE NOT NULL,
    ${CartProducts.brand.name} TEXT NOT NULL,
    ${CartProducts.warrantyInformation.name} TEXT NOT NULL,
    ${CartProducts.availabilityStatus.name} TEXT NOT NULL,
    ${CartProducts.returnPolicy.name} TEXT NOT NULL,
    ${CartProducts.thumbnail.name} TEXT NOT NULL
    );""";
      db
          .execute(query)
          .then((value) => logger.i('cart table created'))
          .onError((error, stackTrace) => logger.e('ERROR:$error'));
    });
  }

  Future<void> insertData({required LoginModals loginmodals}) async {
    Map<String, dynamic> map = loginmodals.toJson();
    await database.insert(TableName.login.name, map);
  }

  Future<void> favInsertData({required Products productModal}) async {
    Map<String, dynamic> map = productModal.toJson();
    await table.insert(TableName.fav.name, map);
  }

  Future<void> cartInsertData({required CartProductModal cartModal}) async {
    Map<String, dynamic> map = cartModal.toJson();
    await cart.insert(TableName.cart.name, map);
  }

  Future<List<LoginModals>> getallData() async {
    String sql = 'SELECT * FROM ${TableName.login.name};';
    List<Map<String, dynamic>> data = await database.rawQuery(sql);
    return data.map((e) => LoginModals.fromJson(e)).toList();
  }

  Future<List<Products>> getFavData() async {
    String sql = 'SELECT * FROM ${TableName.fav.name};';
    List<Map<String, dynamic>> data = await table.rawQuery(sql);
    return data.map((e) => Products.fromJson(e)).toList();
  }

  Future<List<CartProductModal>> getCartData() async {
    String sql = 'SELECT * FROM ${TableName.cart.name};';
    List<Map<String, dynamic>> data = await cart.rawQuery(sql);
    return data.map((e) => CartProductModal.fromJson(e)).toList();
  }
}
