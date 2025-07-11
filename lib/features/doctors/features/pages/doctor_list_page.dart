import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthsync/core/constants/constants.dart';
import 'package:healthsync/core/widgets/widgets.dart';
import 'package:healthsync/features/doctors/features/controllers/doctor_controller.dart';
import 'package:healthsync/features/doctors/features/widgets/doctor_filter.dart';
import 'package:healthsync/features/doctors/features/widgets/doctor_list_item.dart';

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
            icon: const Icon(Icons.filter_list),
            onPressed: () => Get.dialog(const DoctorFilterDialog()),
          ),
        ],
      ),
      body: GetBuilder<DoctorController>(
        builder: (controller) {
          return AppLoader(
            isLoading: controller.isLoading,
            child: controller.filteredDoctors.isEmpty
                ? const Center(child: Text("No doctors found"))
                : ListView.separated(
                    padding: const EdgeInsets.all(8),
                    separatorBuilder: (_, __) => const Divider(),
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
