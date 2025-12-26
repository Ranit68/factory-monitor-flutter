class Downtime {
  final String id;
  final String machineId;
  final String reason;
  final String startTime;
  String? endTime;
  bool synced;

  Downtime({
    required this.id,
    required this.machineId,
    required this.reason,
    required this.startTime,
    this.endTime,
    this.synced = false,
  });
}
