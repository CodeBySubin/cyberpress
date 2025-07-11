class DoctorModel {
  final String id;
  final String name;
  final String specialization;

  DoctorModel({
    required this.id,
    required this.name,
    required this.specialization,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'],
      name: json['name'],
      specialization: json['specialization'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'specialization': specialization,
    };
  }
}
