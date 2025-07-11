
import 'package:healthsync/features/doctors/domain/entities/doctors.dart';

class DoctorModel extends Doctor {
  const DoctorModel({
    required super.id,
    required super.name,
    required super.image,
    required super.gender,
    required super.time,
    required super.location,
    required super.department,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      gender: json['gender'],
      time: json['time'],
      location: json['location'],
      department: json['department'],
    );
  }
}