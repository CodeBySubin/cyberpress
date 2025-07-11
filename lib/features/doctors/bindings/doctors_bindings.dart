import 'package:get/get.dart';
import 'package:healthsync/core/network/api_client.dart';
import 'package:healthsync/core/network/api_service.dart';
import 'package:healthsync/features/doctors/data/datasources/doctor_data_source.dart';
import 'package:healthsync/features/doctors/data/repository/doctor_repository_impl.dart';
import 'package:healthsync/features/doctors/domain/repository/dotor_repository.dart';
import 'package:healthsync/features/doctors/domain/usecase/get_doctors.dart';
import 'package:healthsync/features/doctors/features/controllers/doctor_controller.dart';

class DoctorBinding extends Bindings {
  @override
  void dependencies() {
    final apiClient = ApiClient();
    Get.lazyPut<ApiClient>(() => apiClient);
    Get.lazyPut<DoctorRemoteDataSource>(()=>DoctorRemoteDataSourceImpl(apiClient),);
    Get.lazyPut<DoctorRepository>(()=>DoctorRepositoryImpl(Get.find<DoctorRemoteDataSource>()));
    Get.lazyPut(()=>GetDoctors(Get.find<DoctorRepository>()));
    Get.lazyPut(()=>DoctorController(Get.find<GetDoctors>()));
  }
}
