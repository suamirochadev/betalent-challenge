import 'package:betalent/app/repository/employees_repository.dart';
import 'package:betalent/app/stores/employee_stores.dart';
import 'package:betalent/app/views/employee_page.dart';
import 'package:betalent/app/views/splash_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  final Dio dio = Dio();
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => EmployeesRepository(dio)),
        ChangeNotifierProvider(
            create: (context) =>
                EmployeeStores(context.read<EmployeesRepository>())
                  ..loadEmployees()),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => const EmployeePage(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
