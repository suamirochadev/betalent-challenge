import 'package:betalent/app/model/employees_model.dart';
import 'package:flutter/material.dart';

class CirclerAvatarExpandedWidget extends StatelessWidget {
  const CirclerAvatarExpandedWidget({
    super.key,
    required this.employee,
  });

  final EmployeesModel employee;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey[300],
      child: Image.network(
        (Uri.parse(employee.image)).toString(),
        fit: BoxFit.cover,
      ),
    );
  }
}
