import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:healthsync/core/network/network.dart';
import 'package:healthsync/features/doctors/domain/entities/doctors.dart';
import 'package:healthsync/features/doctors/domain/usecase/get_doctors.dart';

class DoctorController extends GetxController {
  final GetDoctors _getDoctors;

  DoctorController(this._getDoctors);

  List<Doctor> _allDoctors = [];
  List<Doctor> filteredDoctors = [];
  bool isLoading = false;

  int selectedGenderIndex = -1;
  int selectedTimeSlotIndex = -1;

  final List<String> timeSlots = ["10:00am - 04:00pm", "09:00am - 01:00pm"];

  @override
  void onInit() {
    super.onInit();
    _loadDoctors();
  }

  Future<void> _loadDoctors() async {
    isLoading = true;
    update();
    try {
      final doctors = await _getDoctors();
      _allDoctors = doctors;
      filteredDoctors = doctors;
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

  void selectGender(int index) {
    selectedGenderIndex = index;
    update();
  }

  void selectTimeSlot(int index) {
    selectedTimeSlotIndex = index;
    update();
  }

  void applyFilters() {
    filteredDoctors =
        _allDoctors.where((doctor) {
          final genderMatch = _isGenderMatch(doctor.gender);
          final timeMatch = _isTimeSlotMatch(doctor.time);
          return genderMatch && timeMatch;
        }).toList();
    update();
  }

  bool _isGenderMatch(String gender) {
    final genderLower = gender.toLowerCase();
    switch (selectedGenderIndex) {
      case 0:
        return genderLower == 'male';
      case 1:
        return genderLower == 'female';
      case 2:
        return genderLower == 'non-binary';
      default:
        return true;
    }
  }

  bool _isTimeSlotMatch(String doctorTime) {
    if (selectedTimeSlotIndex < 0 ||
        selectedTimeSlotIndex >= timeSlots.length) {
      return true;
    }
    return doctorTime == timeSlots[selectedTimeSlotIndex];
  }
}
