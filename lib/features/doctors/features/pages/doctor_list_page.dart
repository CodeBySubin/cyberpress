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
    final controller = Get.find<DoctorController>();

    return Scaffold(
      appBar: CommonAppBar(
        title: AppStrings.doctors,
        showBack: false,
        actions: [
          IconButton(icon: const Icon(Icons.filter_list), onPressed: () {}),
          GestureDetector(
            child: IconButton(
              icon: const Icon(Icons.picture_as_pdf),
              onPressed: () => Get.dialog(DoctorFilterDialog()),
            ),
          ),
        ],
      ),

      body: Obx(() {
        return AppLoader(
          isLoading: controller.isLoading.value,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              itemCount: 10,
              itemBuilder:
                  (context, index) =>
                      DoctorListItem(doctor: controller.doctors[index]),
            ),
          ),
        );
      }),
    );
  }
}
