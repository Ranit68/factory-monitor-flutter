import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/machine.dart';
import '../providers/auth_provider.dart';
import '../screens/downtime_screen.dart';

class MachineCard extends StatelessWidget {
  final Machine machine;
  MachineCard({required this.machine});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();

    return Card(
      child: ListTile(
        title: Text(machine.name),
        subtitle: Text("Status: ${machine.status}"),
        trailing: auth.isOperator
            ? Icon(Icons.play_arrow)
            : Icon(Icons.visibility),
        onTap: auth.isOperator
            ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DowntimeScreen(machine.id),
                  ),
                );
              }
            : null, // ❌ Supervisor cannot log downtime
      ),
    );
  }
}
