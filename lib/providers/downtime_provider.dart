import 'package:flutter/material.dart';
import '../db/local_db.dart';
import '../models/downtime.dart';
import 'dart:math';

class DowntimeProvider extends ChangeNotifier {
  List<Downtime> list = [];

  Downtime? getActiveDowntime(String machineId) {
    try {
      return list.firstWhere(
        (d) => d.machineId == machineId && d.endTime == null,
      );
    } catch (_) {
      return null;
    }
  }

  Future<void> startDowntime(String machineId, String reason) async {
    final db = await LocalDB.db;

    final d = Downtime(
      id: Random().nextInt(999999).toString(),
      machineId: machineId,
      reason: reason,
      startTime: DateTime.now().toIso8601String(),
      synced: false,
    );

    await db.insert("downtime", {
      "id": d.id,
      "machineId": d.machineId,
      "reason": d.reason,
      "startTime": d.startTime,
      "endTime": null,
      "synced": 0,
    });

    list.add(d);
    notifyListeners();
  }

  Future<void> endDowntime(Downtime d) async {
    final db = await LocalDB.db;
    d.endTime = DateTime.now().toIso8601String();
    d.synced = false;

    await db.update(
      "downtime",
      {
        "endTime": d.endTime,
        "synced": 0,
      },
      where: "id = ?",
      whereArgs: [d.id],
    );

    notifyListeners();
  }
}
