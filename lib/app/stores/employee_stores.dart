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
    notifyListeners();

    try {
      employees = await repository.getAllEmployees();
      filteredEmployees = employees;
      error = null;
    } catch (e) {
      error = 'Erro ao carregar os funcionários';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void filterEmployees(String value) {
    if (value.isEmpty) {
      filteredEmployees = employees;
    } else {
      filteredEmployees = employees.where((e) {
        final name = e.name.toLowerCase();
        final position = e.job.toLowerCase();
        final phone = e.phone.toLowerCase();
        
        return name.contains(value) || position.contains(value) || phone.contains(value);
      }).toList();
    }
  }
}
