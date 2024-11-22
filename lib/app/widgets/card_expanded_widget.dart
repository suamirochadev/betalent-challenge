import 'package:betalent/app/model/employees_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardExpandedWidget extends StatelessWidget {
  const CardExpandedWidget({
    super.key,
    required this.employees,
    required this.employee,
  });

  final List<EmployeesModel> employees;
  final EmployeesModel employee;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Cargo',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              employee.job,
              style: TextStyle(
                color: Colors.grey[900],
                fontSize: 14,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Data de admissão',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              DateFormat('dd/MM/yyyy')
                  .format(DateTime.parse(employee.admissionDate)),
              style: TextStyle(
                color: Colors.grey[900],
                fontSize: 12,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Telefone',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              employee.phone.replaceAllMapped(
                  RegExp(r'(\d{2})(\d{2})(\d{1})(\d{4})(\d{4})'),
                  (match) =>
                      '+${match[1]} (${match[2]}) ${match[3]} ${match[4]}-${match[5]}'),
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
