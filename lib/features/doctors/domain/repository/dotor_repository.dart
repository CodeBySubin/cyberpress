import 'package:healthsync/features/doctors/domain/entities/doctors.dart';


abstract class DoctorRepository {
  Future<List<Doctor>> getDoctors();
}
