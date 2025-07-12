import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:healthsync/core/constants/app_strings.dart';
import 'package:healthsync/core/widgets/appbar.dart';
import 'package:healthsync/features/appoinments/presentation/controllers/appoinment_controller.dart';
import 'package:healthsync/features/appoinments/presentation/widgets/appointment%20_doc_details.dart';
import 'package:healthsync/features/appoinments/presentation/widgets/appointment_fields.dart';
import 'package:healthsync/features/doctors/domain/entities/doctors.dart';

class BookAnAppoinment extends StatelessWidget {
  final Doctor doctor;
  const BookAnAppoinment({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: AppStrings.bookAnAppoinment),
      body: GetBuilder<AppoinmentController>(
             init: AppoinmentController(),
        initState: (_) {},
        builder: (controller) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  AppointmentFields(controller: controller),
                  AppointmentDoctorDetails(
                    doctor: doctor,
                    controller: controller,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
