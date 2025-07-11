import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthsync/core/theme/app_text_styles.dart';
import 'package:healthsync/core/widgets/networkimage.dart';
import 'package:healthsync/features/doctors/domain/entities/doctors.dart';
import 'package:healthsync/routes/app_route_names.dart';

class DoctorListItem extends StatelessWidget {
  final Doctor doctor;
  const DoctorListItem({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => Get.toNamed(
            AppRouteNames.doctorDetails,
            parameters: {'id': doctor.id},
          ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          height: 100,
          child: Row(
            spacing: 20,
            children: [
              networkImageWidget(width: 95, height: 95, doctor.image),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(doctor.name, style: AppTextStyles.blackBoldText),
                  Text(doctor.department, style: AppTextStyles.smallGreyText),
                  Text(doctor.gender, style: AppTextStyles.smallGreyText),
                  Spacer(),
                  Text(doctor.time, style: AppTextStyles.smallGreyText),
                  Text(doctor.location, style: AppTextStyles.smallGreyText),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
