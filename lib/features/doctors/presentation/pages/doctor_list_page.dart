import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthsync/core/constants/constants.dart';
import 'package:healthsync/core/widgets/widgets.dart';
import 'package:healthsync/features/appoinments/bindings/appointment_bindings.dart';
import 'package:healthsync/features/appoinments/presentation/pages/pdf_listing.dart';
import 'package:healthsync/features/doctors/presentation/controllers/doctor_controller.dart';
import 'package:healthsync/features/doctors/presentation/widgets/doctor_filter.dart';
import 'package:healthsync/features/doctors/presentation/widgets/doctor_list_item.dart';

class DoctorListPage extends StatelessWidget {
  const DoctorListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: AppStrings.doctors,
        showBack: false,
        actions: [
          IconButton(
            icon: Image.asset(
              AppImages.pdfImage,
              color: Colors.white,
              width: 25,
            ),
            onPressed:
                () => Get.to(
                  const StoredPdfsPage(),
                  binding: AppointmentBinding(),
                ),
          ),
          IconButton(
            icon: Image.asset(
              AppImages.menuImage,
              color: Colors.white,
              width: 25,
            ),
            onPressed: () => Get.dialog(const DoctorFilterDialog()),
          ),
        ],
      ),
      body: GetBuilder<DoctorController>(
        builder: (controller) {
          return AppLoader(
            isLoading: controller.isLoading,
            child:
                controller.filteredDoctors.isEmpty
                    ? const Center(child: Text("No doctors found"))
                    : ListView.builder(
                      itemCount: controller.filteredDoctors.length,
                      itemBuilder: (context, index) {
                        final doctor = controller.filteredDoctors[index];
                        return DoctorListItem(doctor: doctor);
                      },
                    ),
          );
        },
      ),
    );
  }
}
