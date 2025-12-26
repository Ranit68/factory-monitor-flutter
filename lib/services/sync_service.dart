import '../db/local_db.dart';

class SyncService {
  Future<int> syncDowntime() async {
    final db = await LocalDB.db;

    final unsynced = await db.query(
      "downtime",
      where: "synced = 0 AND endTime IS NOT NULL",
    );

    for (var row in unsynced) {
      // simulate API call
      await Future.delayed(const Duration(milliseconds: 300));

      await db.update(
        "downtime",
        {"synced": 1},
        where: "id = ?",
        whereArgs: [row["id"]],
      );
    }

    return unsynced.length;
  }
}
