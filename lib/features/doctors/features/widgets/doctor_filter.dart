import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthsync/core/constants/constants.dart';
import 'package:healthsync/core/theme/app_text_styles.dart';
import 'package:healthsync/core/widgets/button_widget.dart';
import 'package:healthsync/features/doctors/features/controllers/doctor_controller.dart';

class DoctorFilterDialog extends StatelessWidget {
  const DoctorFilterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GetBuilder<DoctorController>(
      builder: (controller) {
        return AlertDialog(
          title: Center(
            child: Text(AppStrings.filterBy, style: AppTextStyles.blackBoldText),
          ),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          contentPadding: const EdgeInsets.all(16),
          content: SizedBox(
            width: screenWidth,
            height: screenHeight * 0.35,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.gender, style: AppTextStyles.smallBlacktext),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _genderRadio(AppStrings.male, 0, controller),
                    _genderRadio(AppStrings.female, 1, controller),
                    _genderRadio(AppStrings.others, 2, controller),
                  ],
                ),
                const Divider(color: AppColors.blackColor),
                Text(AppStrings.time, style: AppTextStyles.smallBlacktext),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(
                    controller.timeSlots.length,
                    (index) => FilterChip(
                      labelPadding: EdgeInsets.zero,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                      label: Text(
                        controller.timeSlots[index],
                        style: AppTextStyles.smallGreyText.copyWith(
                          color: controller.selectedTimeSlotIndex == index
                              ? Colors.white
                              : AppColors.blackColor,
                        ),
                      ),
                      selected: controller.selectedTimeSlotIndex == index,
                      showCheckmark: false,
                      onSelected: (_) => controller.selectTimeSlot(index),
                      labelStyle: AppTextStyles.smallBlacktext,
                      selectedColor: AppColors.blackColor,
                      backgroundColor: const Color.fromARGB(255, 229, 224, 224),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButtonWidget(
              size: Size(screenWidth * 0.3, 35),
              borderRadius: 0,
              text: AppStrings.submit,
              textStyle: AppTextStyles.buttonWhiteText,
              onPressed: () {
                controller.applyFilters();
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _genderRadio(String label, int index, DoctorController controller) {
    return Row(
      children: [
        Text(label, style: AppTextStyles.smallGreyText),
        Radio<int>(
          value: index,
          groupValue: controller.selectedGenderIndex,
          onChanged: (val) => controller.selectGender(val ?? -1),
          fillColor: WidgetStateProperty.all(AppColors.blackColor),
          visualDensity: VisualDensity.compact,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ],
    );
  }
}
