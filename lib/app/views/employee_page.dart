import 'package:betalent/app/stores/employee_stores.dart';
import 'package:betalent/app/widgets/appbar_widget.dart';
import 'package:betalent/app/widgets/card_expanded_widget.dart';
import 'package:betalent/app/widgets/circle_avatar_expanded_widget.dart';
import 'package:betalent/app/widgets/header_list_widget.dart';
import 'package:betalent/app/widgets/search_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({super.key});

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EmployeeStores>().loadEmployees();
    });
  }

  @override
  Widget build(BuildContext context) {
    final employees = context.watch<EmployeeStores>().filteredEmployees;

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: AppBarWidget(),
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
            const SearchInputWidget(),
            const SizedBox(height: 20),
            const HeaderListWidget(),
            Consumer<EmployeeStores>(
              builder: (context, store, child) {
                return Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: employees.length,
                    itemBuilder: (context, index) {
                      final employee = employees[index];
                      bool isOpen = store.expandedEmployees.contains(index);

                      if (isOpen) {
                        return Card(
                          child: ListTile(
                            trailing: IconButton(
                              onPressed: () => store.toggleEmployee(index),
                              icon: Image.asset('assets/charm_chevron-up.png'),
                            ),
                            leading:
                                CirclerAvatarExpandedWidget(employee: employee),
                            title: CardExpandedWidget(
                                employees: employees, employee: employee),
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
                            onPressed: () => store.toggleEmployee(index),
                            icon: isOpen
                                ? Image.asset('assets/charm_chevron-up.png')
                                : Image.asset('assets/charm_chevron-down.png'),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
