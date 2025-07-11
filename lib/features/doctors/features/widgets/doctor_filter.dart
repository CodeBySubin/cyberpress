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
            child: Text(
              AppStrings.filterBy,
              style: AppTextStyles.blackBoldText,
            ),
          ),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          contentPadding: const EdgeInsets.all(16),
          content: SizedBox(
            width: screenWidth,
            height: screenHeight * 0.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.gender, style: AppTextStyles.smallBlacktext),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _radio(AppStrings.male, 0, controller),
                    _radio(AppStrings.female, 1, controller),
                    _radio(AppStrings.others, 2, controller),
                  ],
                ),
                const Divider(color: AppColors.blackColor),
                Text(AppStrings.time, style: AppTextStyles.smallBlacktext),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    datefilterButton(
                      index: 0,
                      time: "6:00 AM - 12:00 PM",
                      controller: controller,
                    ),
                    datefilterButton(
                      index: 1,
                      time: "12:00 PM - 6:00 PM",
                      controller: controller,
                    ),
                  ],
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
              onPressed: () {},
            ),
          ],
        );
      },
    );
  }

  Widget _radio(String title, int value, DoctorController controller) {
    return Row(
      children: [
        Text(title, style: AppTextStyles.smallGreyText),
        Radio<int>(
          value: value,
          groupValue: controller.selectedGender,
          onChanged: (val) => controller.selectGender(val ?? 0),
          fillColor: WidgetStateProperty.all(AppColors.blackColor),
          visualDensity: VisualDensity.compact,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ],
    );
  }

  Widget datefilterButton({
    required int index,
    required String time,
    required DoctorController controller,
  }) {
    return FilterChip(
      labelPadding: EdgeInsets.zero,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
      label: Text(
        time,
        style: AppTextStyles.smallGreyText.copyWith(
          color:
              controller.selectedDateIndex == index
                  ? AppColors.textgrey
                  : AppColors.blackColor,
        ),
      ),
      selected: controller.selectedDateIndex == index,
      showCheckmark: false,
      onSelected: (_) => controller.selectDate(index),
      labelStyle: AppTextStyles.smallBlacktext,
      selectedColor: AppColors.blackColor,
      backgroundColor: const Color.fromARGB(255, 229, 224, 224),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
    );
  }
}
