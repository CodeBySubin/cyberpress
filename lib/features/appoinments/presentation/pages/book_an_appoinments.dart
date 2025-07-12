// Enhanced BookAnAppoinment Page
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:healthsync/core/constants/app_strings.dart';
import 'package:healthsync/core/theme/app_text_styles.dart';
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
      backgroundColor: Colors.grey.shade50,
      appBar: CommonAppBar(title: AppStrings.bookAnAppoinment),
      body: GetBuilder<AppoinmentController>(
        init: AppoinmentController(Get.find()),
        builder: (controller) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: AppointmentFields(controller: controller),
                      )
                      .animate()
                      .fadeIn(delay: 200.ms, duration: 600.ms)
                      .slideY(
                        begin: 0.3,
                        end: 0,
                        duration: 600.ms,
                        curve: Curves.easeOutCubic,
                      ),
                  const SizedBox(height: 24),
                  Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: AppointmentDoctorDetails(
                          doctor: doctor,
                          controller: controller,
                        ),
                      )
                      .animate()
                      .fadeIn(delay: 400.ms, duration: 600.ms)
                      .slideY(
                        begin: 0.3,
                        end: 0,
                        duration: 600.ms,
                        curve: Curves.easeOutCubic,
                      ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
