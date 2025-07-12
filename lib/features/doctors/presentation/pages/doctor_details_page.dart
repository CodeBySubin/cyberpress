import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:healthsync/core/constants/constants.dart';
import 'package:healthsync/core/theme/app_text_styles.dart';
import 'package:healthsync/core/widgets/button_widget.dart';
import 'package:healthsync/core/widgets/networkimage.dart';
import 'package:healthsync/features/appoinments/bindings/appointment_bindings.dart';
import 'package:healthsync/features/appoinments/presentation/pages/book_an_appoinments.dart';
import 'package:healthsync/features/doctors/presentation/controllers/doctor_detail_conroller.dart';
import 'package:healthsync/features/doctors/presentation/widgets/label_value.dart';

class DoctorDetailsPage extends StatelessWidget {
  final String id;

  const DoctorDetailsPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: GetBuilder<DoctorDetailController>(
        init: Get.find<DoctorDetailController>(),
        initState: (_) => Get.find<DoctorDetailController>().loadDoctorById(id),
        builder: (controller) {
          if (controller.isLoading || controller.doctor == null) {
            return const Center(child: CircularProgressIndicator());
          }

          final doctor = controller.doctor!;

          return Stack(
            children: [
              Container(
                height: 320,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black..withValues(alpha: 0.3),
                      Colors.black..withValues(alpha: 0.6),
                    ],
                  ),
                ),
                child: NetworkImageWidget(
                  url: doctor.image,
                  height: 320,
                  width: double.infinity,
                ),
              )
              .animate()
              .fadeIn(duration: 800.ms, curve: Curves.easeOut)
              .scale(
                begin: const Offset(1.1, 1.1),
                end: const Offset(1.0, 1.0),
                duration: 800.ms,
                curve: Curves.easeOut,
              ),

     Positioned(
  top: 40,
  left: 10,
  child: ElevatedButton(
    onPressed: () => Get.back(),
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      backgroundColor: Colors.white.withOpacity(0.2),
      elevation: 6,
      shadowColor: Colors.black.withOpacity(0.2),
    ),
    child: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
  ),
)

              .animate()
              .fadeIn(delay: 300.ms, duration: 600.ms)
              .slideX(
                begin: -0.3,
                end: 0,
                duration: 600.ms,
                curve: Curves.easeOutCubic,
              ),

              // Content card
              Align(
                alignment: Alignment.bottomCenter,
                child: Transform.translate(
                  offset: const Offset(0, -30),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.61,
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                      
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Doctor name and gender
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                doctor.name,
                                style: AppTextStyles.blackBoldText.copyWith(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                doctor.gender,
                                style: AppTextStyles.smallGreyText.copyWith(
                                  color: Colors.blue.shade600,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        )
                        .animate()
                        .fadeIn(delay: 500.ms, duration: 600.ms)
                        .slideX(
                          begin: 0.3,
                          end: 0,
                          duration: 600.ms,
                          curve: Curves.easeOutCubic,
                        ),
                        const SizedBox(height: 8),

                        // Department with icon
                        Row(
                          children: [
                            Icon(
                              Icons.local_hospital,
                              size: 16,
                              color: Colors.blue.shade600,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              doctor.department,
                              style: AppTextStyles.mediumGreyText.copyWith(
                                color: Colors.blue.shade600,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        )
                        .animate()
                        .fadeIn(delay: 600.ms, duration: 600.ms)
                        .slideX(
                          begin: 0.3,
                          end: 0,
                          duration: 600.ms,
                          curve: Curves.easeOutCubic,
                        ),
                        const SizedBox(height: 24),

                        // About section
                        Text(
                          AppStrings.about,
                          style: AppTextStyles.smallBlacktext.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                        .animate()
                        .fadeIn(delay: 700.ms, duration: 600.ms)
                        .slideY(
                          begin: 0.3,
                          end: 0,
                          duration: 600.ms,
                          curve: Curves.easeOutCubic,
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.grey.shade200,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            "The holder of an accredited academic degree • A medical practitioner with extensive experience in providing quality healthcare services.",
                            style: AppTextStyles.smallGreyText.copyWith(
                              height: 1.5,
                              fontSize: 14,
                            ),
                          ),
                        )
                        .animate()
                        .fadeIn(delay: 800.ms, duration: 600.ms)
                        .scale(
                          begin: const Offset(0.95, 0.95),
                          end: const Offset(1.0, 1.0),
                          duration: 600.ms,
                          curve: Curves.easeOutCubic,
                        ),
                        const SizedBox(height: 24),

                        // Doctor info cards
                        Row(
                          children: [
                            Expanded(
                              child: _buildInfoCard(
                                icon: Icons.access_time,
                                label: AppStrings.lowerTime,
                                value: doctor.time,
                              )
                              .animate()
                              .fadeIn(delay: 900.ms, duration: 600.ms)
                              .slideX(
                                begin: -0.3,
                                end: 0,
                                duration: 600.ms,
                                curve: Curves.easeOutCubic,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _buildInfoCard(
                                icon: Icons.location_on,
                                label: AppStrings.location,
                                value: doctor.location,
                              )
                              .animate()
                              .fadeIn(delay: 1000.ms, duration: 600.ms)
                              .slideX(
                                begin: 0.3,
                                end: 0,
                                duration: 600.ms,
                                curve: Curves.easeOutCubic,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),

                        Container(
                          width: double.infinity,
                          height: 54,
                          margin: const EdgeInsets.only(bottom: 16),
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(
                                () => BookAnAppoinment(doctor: doctor),
                                binding: AppointmentBinding(),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue.shade600,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              shadowColor: Colors.blue.shade600..withValues(alpha: 0.3),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.calendar_today,
                                  size: 18,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  AppStrings.bookAnAppoinment,
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
                        .fadeIn(delay: 1100.ms, duration: 600.ms)
                        .slideY(
                          begin: 0.5,
                          end: 0,
                          duration: 600.ms,
                          curve: Curves.easeOutCubic,
                        )
                        .shimmer(
                          delay: 1700.ms,
                          duration: 1200.ms,
                          color: Colors.white..withValues(alpha: 0.3),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .animate()
              .fadeIn(delay: 400.ms, duration: 800.ms)
              .slideY(
                begin: 0.3,
                end: 0,
                duration: 800.ms,
                curve: Curves.easeOutCubic,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black..withValues(alpha: 0.04),
            blurRadius:2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 16,
                color: Colors.grey.shade600,
              )
              .animate()
              .scale(
                delay: 100.ms,
                duration: 400.ms,
                curve: Curves.elasticOut,
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: AppTextStyles.smallGreyText.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: AppTextStyles.smallBlacktext.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}