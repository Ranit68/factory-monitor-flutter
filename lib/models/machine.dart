class Machine {
  final String id;
  final String name;
  String status;

  Machine({required this.id, required this.name, this.status = "RUN"});
}
