import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';

import '../modals/login_modals.dart';

enum TableName { login, fav, cart }

enum DbColumns { id, email, password }

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

class LoginHelper {
  LoginHelper._();
  static LoginHelper loginHelper = LoginHelper._();
  String dbName = 'my_database.db';
  late Database database;
  late Database table;
  Logger logger = Logger();
  Future<void> initdb() async {
    String dbPath = await getDatabasesPath();
    database = await openDatabase(
      '${TableName.login.name}/$dbPath',
      version: 1,
      onCreate: (db, version) async {
        String sql = """CREATE TABLE IF NOT EXISTS ${TableName.login.name} 
            (${DbColumns.id.name} INTEGER PRIMARY KEY AUTOINCREMENT,
             ${DbColumns.email.name} TEXT UNIQUE NOT NULL,
             ${DbColumns.password.name} TEXT NOT NULL);""";
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
        );;""";
        db
            .execute(query)
            .then((value) => logger.i('table created'))
            .onError((error, stackTrace) => logger.e('ERROR:$error'));
      },
      onUpgrade: (db, v1, v2) {},
      onDowngrade: (db, v1, v2) {},
    );
  }

  Future<void> insertData({required LoginModals loginmodals}) async {
    // String sql =
    //     "INSERT INTO $tableName(${DbColumns.id.name},${DbColumns.email.name},${DbColumns.password.name}) VALUES(?,?,?);";

    Map<String, dynamic> map = loginmodals.users;
    await database.insert(TableName.login.name, map);
  }

  Future<List<LoginModals>> getallData() async {
    String sql = 'SELECT * FROM ${TableName.login.name};';
    List<Map<String, dynamic>> data = await database.rawQuery(sql);
    return data.map((e) => LoginModals.fromMap(data: e)).toList();
  }
}
