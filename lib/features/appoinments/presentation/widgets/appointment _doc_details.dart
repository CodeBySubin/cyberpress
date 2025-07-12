import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:healthsync/core/constants/app_strings.dart';
import 'package:healthsync/core/theme/app_text_styles.dart';
import 'package:healthsync/core/widgets/networkimage.dart';
import 'package:healthsync/features/appoinments/bindings/appointment_bindings.dart';
import 'package:healthsync/features/appoinments/domain/entities/appointment_details.dart';
import 'package:healthsync/features/appoinments/presentation/controllers/appoinment_controller.dart';
import 'package:healthsync/features/appoinments/presentation/widgets/pdf_view.dart';
import 'package:healthsync/features/doctors/domain/entities/doctors.dart';

class AppointmentDoctorDetails extends StatelessWidget {
  final Doctor doctor;
  final AppoinmentController controller;

  const AppointmentDoctorDetails({
    super.key,
    required this.doctor,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.local_hospital,
                      color: Colors.green.shade600,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    AppStrings.doctorDetails,
                    style: AppTextStyles.blackBoldText.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )
              .animate()
              .fadeIn(delay: 100.ms, duration: 500.ms)
              .slideX(
                begin: -0.3,
                end: 0,
                duration: 500.ms,
                curve: Curves.easeOutCubic,
              ),

          const SizedBox(height: 20),

          // Doctor Card
          Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.blue.shade200),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Doctor Image
                    Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: NetworkImageWidget(
                              width: 100,
                              height: 100,
                              url: doctor.image,
                            ),
                          ),
                        )
                        .animate()
                        .fadeIn(delay: 200.ms, duration: 600.ms)
                        .scale(
                          begin: const Offset(0.8, 0.8),
                          end: const Offset(1.0, 1.0),
                          duration: 600.ms,
                          curve: Curves.easeOutCubic,
                        ),

                    const SizedBox(width: 16),

                    // Doctor Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                                doctor.name,
                                style: AppTextStyles.blackBoldText.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                              .animate()
                              .fadeIn(delay: 300.ms, duration: 500.ms)
                              .slideX(
                                begin: 0.3,
                                end: 0,
                                duration: 500.ms,
                                curve: Curves.easeOutCubic,
                              ),

                          const SizedBox(height: 4),

                          Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade600,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  doctor.department,
                                  style: AppTextStyles.smallGreyText.copyWith(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                              .animate()
                              .fadeIn(delay: 400.ms, duration: 500.ms)
                              .scale(
                                begin: const Offset(0.8, 0.8),
                                end: const Offset(1.0, 1.0),
                                duration: 500.ms,
                                curve: Curves.easeOutCubic,
                              ),

                          const SizedBox(height: 12),

                          ..._buildInfoRows(),
                        ],
                      ),
                    ),
                  ],
                ),
              )
              .animate()
              .fadeIn(delay: 200.ms, duration: 600.ms)
              .slideY(
                begin: 0.3,
                end: 0,
                duration: 600.ms,
                curve: Curves.easeOutCubic,
              ),

          const SizedBox(height: 32),

          // Generate PDF Button
          Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.blue.shade600, Colors.blue.shade800],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.shade600.withOpacity(0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () => _handleGeneratePdf(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.picture_as_pdf,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        AppStrings.genaratePdfAndSend,
                        style: AppTextStyles.buttonWhiteText.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .animate()
              .fadeIn(delay: 600.ms, duration: 600.ms)
              .slideY(
                begin: 0.5,
                end: 0,
                duration: 600.ms,
                curve: Curves.easeOutCubic,
              )
              .shimmer(
                delay: 1200.ms,
                duration: 1500.ms,
                color: Colors.white.withOpacity(0.3),
              ),
        ],
      ),
    );
  }

  List<Widget> _buildInfoRows() {
    final infoItems = [
      {'icon': Icons.wc, 'text': '${AppStrings.gender} ${doctor.gender}'},
      {
        'icon': Icons.access_time,
        'text': '${AppStrings.lowerTime} ${doctor.time}',
      },
      {
        'icon': Icons.location_on,
        'text': '${AppStrings.location} ${doctor.location}',
      },
    ];

    return infoItems.asMap().entries.map((entry) {
      final index = entry.key;
      final item = entry.value;

      return Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              children: [
                Icon(
                  item['icon'] as IconData,
                  size: 14,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    item['text'] as String,
                    style: AppTextStyles.smallGreyText.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          )
          .animate()
          .fadeIn(
            delay: Duration(milliseconds: 500 + (index * 100)),
            duration: 500.ms,
          )
          .slideX(
            begin: 0.3,
            end: 0,
            duration: 500.ms,
            curve: Curves.easeOutCubic,
          );
    }).toList();
  }

  Future<void> _handleGeneratePdf() async {
    if (controller.formKey.currentState!.validate()) {
      Get.dialog(
        WillPopScope(
          onWillPop: () async => false,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(
                    color: Colors.blue,
                    strokeWidth: 3,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Generating PDF...',
                    style: AppTextStyles.blackBoldText.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        barrierDismissible: false,
      );

      final details = AppointmentDetails(
        name: controller.nameController.text,
        age: controller.ageController.text,
        email: controller.emailController.text,
        phone: controller.phoneController.text,
        notes: controller.noteController.text,
        doctorName: doctor.name,
        department: doctor.department,
        gender: doctor.gender,
        time: doctor.time,
        location: doctor.location,
        imageUrl: doctor.image,
      );

      await controller.generateAndSavePdf(details);

      Get.back();

      if (controller.pdfFilePath != null) {
        Get.to(
          () => PdfViewerPage(path: controller.pdfFilePath!),
          binding: AppointmentBinding(),
          transition: Transition.cupertino,
        );
      } else {
        Get.snackbar(
          "Error",
          "Failed to generate PDF.",
          backgroundColor: Colors.red.shade100,
          colorText: Colors.red.shade800,
          icon: const Icon(Icons.error, color: Colors.red),
        );
      }
    }
  }
}
