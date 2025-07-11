
import 'package:healthsync/features/doctors/data/datasources/doctor_data_source.dart';
import 'package:healthsync/features/doctors/domain/entities/doctors.dart';
import 'package:healthsync/features/doctors/domain/repository/doctor_repository.dart';

class DoctorRepositoryImpl implements DoctorRepository {
  final DoctorRemoteDataSource remoteDataSource;

  DoctorRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Doctor>> getDoctors() async {
    return await remoteDataSource.getDoctors();
  }

  @override
  Future<Doctor> getDoctorById(String id) async {
    return await remoteDataSource.getDoctorById(id);
  }
}
