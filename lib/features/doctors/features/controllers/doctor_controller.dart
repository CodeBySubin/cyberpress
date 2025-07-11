import 'package:get/get.dart';
import 'package:healthsync/features/doctors/domain/entities/doctors.dart';
import 'package:healthsync/features/doctors/domain/usecase/get_doctors.dart';

class DoctorController extends GetxController {
  final GetDoctors getDoctors;

  DoctorController(this.getDoctors);

  final RxList<Doctor> doctors = <Doctor>[].obs;
  final RxBool isLoading = false.obs;
  int selectedGender = 0;
  int selectedDateIndex = 0;

  @override
  void onInit() {
    super.onInit();
    fetchDoctors();
  }

  void selectGender(int value) {
    selectedGender = value;
    update();
  }

  void selectDate(int index) {
    selectedDateIndex = index;
    update();
  }

  void fetchDoctors() async {
    try {
      isLoading.value = true;
      final result = await getDoctors();
      doctors.assignAll(result);
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch doctors");
    } finally {
      isLoading.value = false;
    }
  }
}
