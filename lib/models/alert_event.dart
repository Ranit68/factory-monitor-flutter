class AlertEvent {
  final String id;
  final String machine;
  final String message;
  final DateTime timestamp;
  final String severity;

  bool acknowledged;

  AlertEvent({
    required this.id,
    required this.machine,
    required this.message,
    DateTime? timestamp,
    this.severity = "HIGH",
    this.acknowledged = false,
  }) : timestamp = timestamp ?? DateTime.now();
}
