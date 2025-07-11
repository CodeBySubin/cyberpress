import 'package:healthsync/features/doctors/domain/entities/doctors.dart';

import '../repository/doctor_repository.dart';

class GetDoctorById {
  final DoctorRepository repository;

  GetDoctorById(this.repository);

  Future<Doctor> call(String id) async {
    return await repository.getDoctorById(id);
  }
}
