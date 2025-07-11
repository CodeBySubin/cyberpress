import 'package:healthsync/core/network/api_client.dart';
import 'package:healthsync/features/doctors/data/models/doctors_model.dart';
import '../../../../core/network/api_endpoints.dart';

abstract class DoctorRemoteDataSource {
  Future<List<DoctorModel>> getDoctors();
}

class DoctorRemoteDataSourceImpl implements DoctorRemoteDataSource {
final ApiClient _apiClient;
  DoctorRemoteDataSourceImpl(this._apiClient);

  @override
  Future<List<DoctorModel>> getDoctors() async {
    final response = await _apiClient.get(ApiEndpoint.doctors);
    return (response.data as List)
        .map((e) => DoctorModel.fromJson(e))
        .toList();
  }
}
