import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:healthsync/core/network/dio_exception_handler.dart';
import 'package:healthsync/features/doctors/domain/entities/doctors.dart';
import 'package:healthsync/features/doctors/domain/usecase/get_user_details.dart';

class DoctorDetailController extends GetxController {
  final GetDoctorById _getDoctorById;
  DoctorDetailController(this._getDoctorById);

  Doctor? doctor;
  bool isLoading = true;

  void loadDoctorById(String id) async {
    isLoading = true;
    update();
    try {
      final result = await _getDoctorById(id);
      doctor = result;
    } on DioException catch (e) {
      final appError = DioExceptionHandler.handleDioError(e);
      Get.snackbar('Error', appError.message);
    } catch (e) {
      Get.snackbar('Error', 'Unexpected error occurred.');
    } finally {
      isLoading = false;
      update();
    }
  }
}
