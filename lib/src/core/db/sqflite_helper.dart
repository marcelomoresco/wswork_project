import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const VERSION = 1;
  static const DATABASE_NAME = 'wswork_table';

  Database? _db;
  static DatabaseHelper? _instance;

  DatabaseHelper._();

  static DatabaseHelper get instance {
    _instance ??= DatabaseHelper._();
    return _instance!;
  }

  Future<Database> get db => _openDatabaseConnection();

  Future<Database> _openDatabaseConnection() async {
    var databasePath = await getDatabasesPath();
    var path = join(databasePath, DATABASE_NAME);
    _db ??= await openDatabase(
      path,
      version: VERSION,
    );
    return _db!;
  }

  Future<void> closeConnection() async {
    await _db!.close();
    _db = null;
  }
}
