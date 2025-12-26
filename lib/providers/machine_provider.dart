import 'package:flutter/material.dart';
import '../models/machine.dart';

class MachineProvider extends ChangeNotifier {
  final machines = [
    Machine(id: "M-101", name: "Cutter 1"),
    Machine(id: "M-102", name: "Roller A"),
    Machine(id: "M-103", name: "Packing West"),
  ];
}
