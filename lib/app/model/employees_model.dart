class EmployeesModel {
  final String id;
  final String name;
  final String job;
  final String admissionDate;
  final String phone;
  final String image;

  const EmployeesModel({
    required this.id,
    required this.name,
    required this.job,
    required this.admissionDate,
    required this.phone,
    required this.image,
  });

  factory EmployeesModel.fromMap(Map<String, dynamic> map) {
    return EmployeesModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      job: map['job'] ?? '',
      admissionDate: map['admission_date'] ?? '',
      phone: map['phone'] ?? '',
      image: map['image'] ?? '',
    );
  }
}
