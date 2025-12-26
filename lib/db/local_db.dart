import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDB {
  static Database? _db;

  static Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _init();
    return _db!;
  }

  static Future<Database> _init() async {
    final path = join(await getDatabasesPath(), "factory.db");
    return openDatabase(path, version: 1, onCreate: _create);
  }

  static Future<void> _create(Database db, int v) async {
    await db.execute("""
    CREATE TABLE downtime(
      id TEXT PRIMARY KEY,
      machineId TEXT,
      reason TEXT,
      startTime TEXT,
      endTime TEXT,
      synced INTEGER
    )
    """);
  }
}
