import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/alert_provider.dart';

class AlertScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final alerts = context.watch<AlertProvider>().alerts;

    return Scaffold(
      appBar: AppBar(title: Text("Alerts")),
      body: alerts.isEmpty
          ? Center(child: Text("No active alerts",
          style: TextStyle(fontSize: 16, color: Colors.grey),
          ),)
          : ListView(
        children: alerts.map((a) => ListTile(
          title: Text(a.message),
          subtitle: Text(a.machine),
          trailing: a.acknowledged
              ? Icon(Icons.check, color: Colors.green)
              : IconButton(
                  icon: Icon(Icons.done),
                  onPressed: () =>
                      context.read<AlertProvider>().acknowledge(a),
                ),
        )).toList(),
      ),
    );
  }
}
