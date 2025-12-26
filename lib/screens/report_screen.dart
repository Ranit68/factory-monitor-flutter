import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/downtime_provider.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final downtimes = context.watch<DowntimeProvider>().list;

    final totalIdleMinutes = downtimes
        .where((d) => d.endTime != null)
        .map((d) {
          final start = DateTime.parse(d.startTime);
          final end = DateTime.parse(d.endTime!);
          return end.difference(start).inMinutes;
        })
        .fold<int>(0, (a, b) => a + b);

    return Scaffold(
      appBar: AppBar(title: const Text("Reports")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: ListTile(
            title: const Text("Machine Summary"),
            subtitle: Text(
              "Idle Time: $totalIdleMinutes min\n"
              "Active Time: ${480 - totalIdleMinutes} min",
            ),
          ),
        ),
      ),
    );
  }
}
