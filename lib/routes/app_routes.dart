import 'package:get/get.dart';
import 'package:healthsync/features/doctors/bindings/doctors_bindings.dart';
import 'package:healthsync/features/doctors/features/pages/doctor_details_page.dart';
import 'package:healthsync/features/doctors/features/pages/doctor_list_page.dart';
import 'package:healthsync/routes/app_route_names.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRouteNames.doctors,
      page: () => const DoctorListPage(),
      binding: DoctorBinding(),
    ),

   GetPage(
      name: AppRouteNames.doctorDetails,
      page: () {
        final id = Get.parameters['id'] ?? '';
        return DoctorDetailsPage(id: id);
      },
   ),
  ];
}
