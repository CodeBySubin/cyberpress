import 'package:get/get.dart';
import 'package:healthsync/features/doctors/domain/entities/doctors.dart';
import 'package:healthsync/features/doctors/domain/usecase/get_doctors.dart';

class DoctorController extends GetxController {
  final GetDoctors _getDoctors;

  DoctorController(this._getDoctors);

  final RxList<Doctor> _allDoctors = <Doctor>[].obs;
  final RxList<Doctor> filteredDoctors = <Doctor>[].obs;
  final RxBool isLoading = false.obs;

  final RxInt selectedGenderIndex = (-1).obs;
  final RxInt selectedTimeSlotIndex = (-1).obs;

  final List<String> timeSlots = [
    "10:00am - 04:00pm",
    "09:00am - 01:00pm",
  ];

  @override
  void onInit() {
    super.onInit();
    _loadDoctors();
  }

  Future<void> _loadDoctors() async {
    isLoading.value = true;
    try {
      final doctors = await _getDoctors();
      _allDoctors.assignAll(doctors);
      filteredDoctors.assignAll(doctors);
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch doctors");
    } finally {
      isLoading.value = false;
    }
  }

  void selectGender(int index) {
    selectedGenderIndex.value = index;
  }

  void selectTimeSlot(int index) {
    selectedTimeSlotIndex.value = index;
  }

  void applyFilters() {
    filteredDoctors.value = _allDoctors.where((doctor) {
      final genderMatch = _isGenderMatch(doctor.gender);
      final timeMatch = _isTimeSlotMatch(doctor.time);
      return genderMatch && timeMatch;
    }).toList();
  }

  bool _isGenderMatch(String gender) {
    final genderLower = gender.toLowerCase();
    switch (selectedGenderIndex.value) {
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
    if (selectedTimeSlotIndex.value < 0 ||
        selectedTimeSlotIndex.value >= timeSlots.length) {
      return true;
    }
    return doctorTime == timeSlots[selectedTimeSlotIndex.value];
  }
}
