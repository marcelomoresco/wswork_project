import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wswork_project/src/core/db/const/sqflite_const.dart';

class DatabaseHelper {
  Database? _db;
  static DatabaseHelper? _instance;

  DatabaseHelper._();

  static DatabaseHelper get instance {
    _instance ??= DatabaseHelper._();
    _instance!._openDatabaseConnection();
    return _instance!;
  }

  Future<Database> get db => _openDatabaseConnection();

  Future<Database> _openDatabaseConnection() async {
    var databasePath = await getDatabasesPath();
    var path = join(databasePath, SqfliteConstants.DATABASE_NAME);
    if (_db == null || !(_db?.isOpen ?? false)) {
      _db ??= await openDatabase(path, version: SqfliteConstants.VERSION,
          onCreate: (db, version) {
        db.execute(
          'CREATE TABLE ${SqfliteConstants.leadTable} (id INTEGER PRIMARY KEY, deviceId TEXT, deviceVersion TEXT, deviceModel TEXT, brand TEXT, created_at INTEGER, car_id INTEGER)',
        );
      });
    }
    return _db!;
  }

  Future<void> closeConnection() async {
    await _db!.close();
    _db = null;
  }
}
