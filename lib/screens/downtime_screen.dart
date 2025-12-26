import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/downtime_provider.dart';
import '../providers/alert_provider.dart';
import '../models/downtime.dart';

class DowntimeScreen extends StatelessWidget {
  final String machineId;

  const DowntimeScreen(this.machineId, {super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DowntimeProvider>();
    final active = provider.getActiveDowntime(machineId);

    return Scaffold(
      appBar: AppBar(title: const Text("Downtime")),
      body: Center(
        child: ElevatedButton(
          child: Text(active == null ? "Start Downtime" : "End Downtime"),
          onPressed: () async {
            if (active == null) {
              await provider.startDowntime(machineId, "Power > Grid");

              context.read<AlertProvider>().addAlert(
                machine: machineId,
                message: "Downtime started",
              );

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Downtime started (offline)")),
              );
            } else {
              await provider.endDowntime(active);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Downtime ended")),
              );
            }
          },
        ),
      ),
    );
  }
}
