import 'package:flutter/material.dart';
import 'package:healthsync/core/constants/app_strings.dart';
import 'package:healthsync/core/theme/app_text_styles.dart';
import 'package:healthsync/core/widgets/button_widget.dart';
import 'package:healthsync/core/widgets/networkimage.dart';
import 'package:healthsync/features/appoinments/presentation/controllers/appoinment_controller.dart';
import 'package:healthsync/features/doctors/domain/entities/doctors.dart';

class AppointmentDoctorDetails extends StatelessWidget {
  final Doctor doctor;
final AppoinmentController controller;
  const AppointmentDoctorDetails({super.key, required this.doctor, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Divider(),
        ),
        Text(AppStrings.doctorDetails, style: AppTextStyles.blackBoldText),
        SizedBox(height: 10,),
        Row(
          spacing: 10,
          children: [
            NetworkImageWidget(width: 120, height: 120, url: doctor.image),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(doctor.name,style: AppTextStyles.blackBoldText,),
                Text(doctor.department, style: AppTextStyles.smallGreyText,),
                Text("${AppStrings.gender} ${doctor.gender}",style: AppTextStyles.smallGreyText,),
                SizedBox(height: 20,),
                Text("${AppStrings.lowerTime} ${doctor.time}",style: AppTextStyles.smallGreyText,),
                Text("${AppStrings.location} ${doctor.location}",style: AppTextStyles.smallGreyText,),
              ],
            ),
          ],
        ),
        SizedBox(height: 40),
        TextButtonWidget(
          size: Size(double.infinity, 50),
          textStyle: AppTextStyles.buttonWhiteText,
          text: AppStrings.genaratePdfAndSend,
          onPressed: () {},
        ),
      ],
    );
  }
}
