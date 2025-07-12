import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthsync/core/constants/app_strings.dart';
import 'package:healthsync/core/theme/app_text_styles.dart';
import 'package:healthsync/features/appoinments/presentation/controllers/appoinment_controller.dart';

import '../../../../core/utils/validator.dart';
import '../../../../core/widgets/widgets.dart';

class AppointmentFields extends StatelessWidget {
  final AppoinmentController controller;
  const AppointmentFields({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 15,
      children: [
        Text(AppStrings.patientDetail, style: AppTextStyles.blackBoldText),
        TextFieldWidget(
          controller: controller.nameController,
          hintText: AppStrings.name,
          keyboardType: TextInputType.name,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
          ],
          validator: (value) => Validator.validateName(value!),
        ),
        TextFieldWidget(
          controller: controller.ageController,
          hintText: AppStrings.age,
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(3),
            FilteringTextInputFormatter.digitsOnly,
          ],
          validator: (value) => Validator.validateAge(value!),
        ),
        TextFieldWidget(
          controller: controller.emailController,

          hintText: AppStrings.email,
          keyboardType: TextInputType.emailAddress,
          validator: (value) => Validator.validateEmail(value!),
        ),
        TextFieldWidget(
          controller: controller.phoneController,
          hintText: AppStrings.phone,
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(10),
            FilteringTextInputFormatter.digitsOnly,
          ],
          validator: (value) => Validator.validatePhoneNumber(value!),
        ),
        TextFieldWidget(
          controller: controller.noteController,
          maxlines: 4,
          hintText: AppStrings.notes,
          keyboardType: TextInputType.text,
          validator: (value) => Validator.validateNotes(value!),
        ),
      ],
    );
  }
}
