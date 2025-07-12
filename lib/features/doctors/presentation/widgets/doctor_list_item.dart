import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:healthsync/core/theme/app_text_styles.dart';
import 'package:healthsync/core/widgets/networkimage.dart';
import 'package:healthsync/features/doctors/domain/entities/doctors.dart';
import 'package:healthsync/routes/app_route_names.dart';

class DoctorListItem extends StatelessWidget {
  final Doctor doctor;
  final int index;

  const DoctorListItem({super.key, required this.doctor, this.index = 0});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap:
              () => Get.toNamed(
                AppRouteNames.doctorDetails,
                parameters: {'id': doctor.id},
              ),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap:
                    () => Get.toNamed(
                      AppRouteNames.doctorDetails,
                      parameters: {'id': doctor.id},
                    ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Hero(
                        tag: 'doctor_image_${doctor.id}',
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: NetworkImageWidget(
                              width: 80,
                              height: 80,
                              url: doctor.image,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    doctor.name,
                                    style: AppTextStyles.blackBoldText.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(
                                  Icons.local_hospital,
                                  size: 14,
                                  color: Colors.blue.shade600,
                                ),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    doctor.department,
                                    style: AppTextStyles.smallGreyText.copyWith(
                                      color: Colors.blue.shade600,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 8),

                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        size: 12,
                                        color: Colors.grey.shade600,
                                      ),
                                      const SizedBox(width: 4),
                                      Expanded(
                                        child: Text(
                                          doctor.time,
                                          style: AppTextStyles.smallGreyText
                                              .copyWith(fontSize: 12),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Expanded(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        size: 12,
                                        color: Colors.grey.shade600,
                                      ),
                                      const SizedBox(width: 4),
                                      Expanded(
                                        child: Text(
                                          doctor.location,
                                          style: AppTextStyles.smallGreyText
                                              .copyWith(fontSize: 12),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () {},
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                        color: Colors.blue.shade300,
                                        width: 1,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.call,
                                          size: 14,
                                          color: Colors.blue.shade600,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          'Call',
                                          style: TextStyle(
                                            color: Colors.blue.shade600,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed:
                                        () => Get.toNamed(
                                          AppRouteNames.doctorDetails,
                                          parameters: {'id': doctor.id},
                                        ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue.shade600,
                                      foregroundColor: Colors.white,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.calendar_today,
                                          size: 14,
                                        ),
                                        const SizedBox(width: 4),
                                        const Text(
                                          'Book',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
        .animate(delay: Duration(milliseconds: index * 100))
        .fadeIn(duration: 600.ms, curve: Curves.easeOutCubic)
        .slideX(
          begin: 0.2,
          end: 0,
          duration: 600.ms,
          curve: Curves.easeOutCubic,
        )
        .animate(target: 0)
        .scale(
          begin: const Offset(0.95, 0.95),
          end: const Offset(1.0, 1.0),
          duration: 200.ms,
          curve: Curves.easeInOut,
        );
  }
}
