import 'package:betalent/app/stores/employee_stores.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchInputWidget extends StatefulWidget {
  const SearchInputWidget({super.key});

  @override
  State<SearchInputWidget> createState() => _SearchInputWidgetState();
}

class _SearchInputWidgetState extends State<SearchInputWidget> {
  final TextEditingController _textController = TextEditingController();

 
  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      context.read<EmployeeStores>().filterEmployees(_textController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<EmployeeStores>().filterEmployees(_textController.text);

    return TextField(
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
          onPressed: () => controller,
          icon: const Icon(
            Icons.search,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
