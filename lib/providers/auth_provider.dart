import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  String? role;

  // 🔹 Role helpers (USED BY UI)
  bool get isOperator => role == "operator";
  bool get isSupervisor => role == "supervisor";

  Future<void> login(String email, String selectedRole) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("email", email);
    await prefs.setString("role", selectedRole);

    role = selectedRole;
    notifyListeners();
  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    role = prefs.getString("role");
    notifyListeners();
  }
}
