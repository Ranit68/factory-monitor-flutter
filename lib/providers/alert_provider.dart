import 'dart:async';
import 'package:flutter/material.dart';
import '../models/alert_event.dart';

class AlertProvider extends ChangeNotifier {
  final List<AlertEvent> _alerts = [];

  // ✅ PUBLIC GETTER
  List<AlertEvent> get alerts => _alerts;

  AlertProvider() {
    // ⏱️ Simulated alert stream (assignment-allowed)
    Timer.periodic(const Duration(seconds: 10), (_) {
      _alerts.add(
        AlertEvent(
          id: DateTime.now().toIso8601String(),
          machine: "Cutter 1",
          message: "Idle > 30 min",
        ),
      );
      notifyListeners();
    });
  }

  // 🔔 MANUAL ALERT (FROM DOWNTIME)
  void addAlert({
    required String machine,
    required String message,
  }) {
    _alerts.add(
      AlertEvent(
        id: DateTime.now().toIso8601String(),
        machine: machine,
        message: message,
      ),
    );
    notifyListeners();
  }

  void acknowledge(AlertEvent alert) {
    alert.acknowledged = true;
    notifyListeners();
  }
}
