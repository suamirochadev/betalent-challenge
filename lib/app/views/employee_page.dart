import 'package:betalent/app/stores/employee_stores.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({super.key});

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  final Set<int> _expandedEmployees = {};
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<EmployeeStores>().loadEmployees();
    _textController.addListener(() {
      context.read<EmployeeStores>().filterEmployees(_textController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    final employees = context.watch<EmployeeStores>().employees;
    final filteredEmployees = context.watch<EmployeeStores>().filteredEmployees;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: AppBar(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: const Text('CG'),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/notification.png',
                ),
              ),
            ],
            title: const Text(''),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Funcionários',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _textController,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0XFFF5F5F5),
                hintText: 'Pesquisar...',
                hintStyle: const TextStyle(
                  color: Color(0XFF1C1C1C),
                  fontSize: 16,
                ),
                prefixIcon: IconButton(
                  onPressed: () {
                    context.read<EmployeeStores>().filterEmployees(_textController.text);
                  },
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(

                scrollDirection: Axis.vertical,
                itemCount: employees.length,
                itemBuilder: (context, index) {
                  bool isOpen = _expandedEmployees.contains(index);

                  if (isOpen) {
                    return Card(
                      child: ListTile(
                        trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              if (isOpen) {
                                _expandedEmployees.remove(index);
                              } else {
                                _expandedEmployees.add(index);
                              }
                            });
                          },
                          icon: const Icon(
                            Icons.keyboard_arrow_up,
                          ),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          child: Image.network(
                            (Uri.parse(employees[index].image)).toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Column(
                          children: [
                            Text(
                              employees[index].job,
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              DateTime.parse(employees[index].admissionDate)
                                  .toString()
                                  .substring(0, 10),
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              employees[index].phone,
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        child: Image.network(
                          (Uri.parse(employees[index].image)).toString(),
                        ),
                      ),
                      title: Text(
                        employees[index].name,
                        style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: 16,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            if (isOpen) {
                              _expandedEmployees.remove(index);
                            } else {
                              _expandedEmployees.add(index);
                            }
                          });
                        },
                        icon: Icon(
                          isOpen
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
