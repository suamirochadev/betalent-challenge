import 'package:betalent/app/model/employees_model.dart';
import 'package:betalent/app/repository/employees_repository.dart';
import 'package:flutter/material.dart';

class EmployeeStores extends ChangeNotifier {
  final EmployeesRepository repository;
  EmployeeStores(this.repository);

  List<EmployeesModel> employees = [];
  List<EmployeesModel> filteredEmployees = [];
  bool isLoading = false;
  String? error;


  Future<void> loadEmployees() async {
    isLoading = true;
    employees = await repository.getAllEmployees();
    isLoading = false;
    notifyListeners();
  }

  void filterEmployees(String value) {
    if (value.isEmpty) {
      filteredEmployees = List.from(employees);
    } else {
      filteredEmployees =
          employees.where((e) => e.name.contains(value)).toList();
    }
    notifyListeners();
  }
}
