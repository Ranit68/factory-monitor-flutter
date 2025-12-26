import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/machine_provider.dart';
import '../widgets/machine_card.dart';
import 'alert_screen.dart';
import 'report_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final machines = context.watch<MachineProvider>().machines;
    final auth = context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Machines"),
        actions: [
          // 🔔 Alerts (Supervisor only)
          if (auth.isSupervisor)
            IconButton(
              icon: const Icon(Icons.warning),
              tooltip: "Alerts",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AlertScreen()),
                );
              },
            ),

          // 📊 Reports (Supervisor only)
          if (auth.isSupervisor)
            IconButton(
              icon: const Icon(Icons.bar_chart),
              tooltip: "Reports",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ReportScreen()),
                );
              },
            ),
        ],
      ),
      body: ListView(
        children: machines.map((m) => MachineCard(machine: m)).toList(),
      ),
    );
  }
}
