import 'package:healthsync/features/doctors/domain/entities/doctors.dart';

import '../repository/doctor_repository.dart';

class GetDoctors {
  final DoctorRepository repository;

  GetDoctors(this.repository);

  Future<List<Doctor>> call() async {
    return await repository.getDoctors();
  }
}
