class MaintenanceTask {
  final String id;
  final String machineId;
  final String title;
  String status; // DUE / OVERDUE / DONE
  bool synced;

  MaintenanceTask({
    required this.id,
    required this.machineId,
    required this.title,
    this.status = "DUE",
    this.synced = false,
  });
}
