import 'package:betalent/app/model/employees_model.dart';
import 'package:dio/dio.dart';

class EmployeesRepository {
  EmployeesRepository (this.dio);

  final Dio dio;

  Future<List<EmployeesModel>> getAllEmployees() async {
    final response = await dio.get('http://10.0.2.2:3000/employees');

    final List<dynamic> list = response.data;

    return list.map((e) => EmployeesModel.fromMap(e),).toList();
  }
}
