import 'package:healthsync/core/network/api_client.dart';
import 'package:healthsync/core/network/api_endpoints.dart';
import 'package:healthsync/features/doctors/data/models/doctors_model.dart';

abstract class DoctorRemoteDataSource {
  Future<List<DoctorModel>> getDoctors();
  Future<DoctorModel> getDoctorById(String id);
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

  @override
  Future<DoctorModel> getDoctorById(String id) async {
    final response = await _apiClient.get('${ApiEndpoint.doctors}/$id');
    return DoctorModel.fromJson(response.data);
  }
}
