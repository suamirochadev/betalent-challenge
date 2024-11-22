import 'package:betalent/app/model/employees_model.dart';
import 'package:betalent/app/repository/employees_repository.dart';
import 'package:flutter/material.dart';

class EmployeeStores extends ChangeNotifier {
  final EmployeesRepository repository;
  EmployeeStores(this.repository);

  final List<int> _expandedEmployees = [];
  List<int> get expandedEmployees => _expandedEmployees;

  List<EmployeesModel> _employees = [];
  List<EmployeesModel> get employees => _employees;

  List<EmployeesModel> _filteredEmployees = [];
  List<EmployeesModel> get filteredEmployees => _filteredEmployees;

  bool isLoading = false;
  String? error;

  Future<void> loadEmployees() async {
    isLoading = true;
    notifyListeners();
    _employees = await repository.getAllEmployees();
    _filteredEmployees = _employees;
    isLoading = false;
    notifyListeners();
  }

  void filterEmployees(String value) {
    if (value.isEmpty) {
      _filteredEmployees = employees;
      notifyListeners();
      return;
    } else {
      _filteredEmployees = employees.where((employee) {
        return employee.name.contains(value);
      }).toList();
    }
    notifyListeners();
  }

  void toggleEmployee(int index) {
    if (_expandedEmployees.contains(index)) {
      _expandedEmployees.remove(index);
    
  } else {
    _expandedEmployees.add(index);
  }
    notifyListeners();
  }
}
