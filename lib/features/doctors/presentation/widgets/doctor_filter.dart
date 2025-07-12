import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthsync/core/constants/constants.dart';
import 'package:healthsync/features/doctors/presentation/controllers/doctor_controller.dart';

class DoctorFilterDialog extends StatelessWidget {
  const DoctorFilterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenWidth > 600;

    return GetBuilder<DoctorController>(
      builder: (controller) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.symmetric(
            horizontal: isTablet ? screenWidth * 0.15 : 20,
            vertical: screenHeight * 0.08,
          ),
          child: Container(
            width: isTablet ? screenWidth * 0.7 : screenWidth * 0.9,
            constraints: BoxConstraints(
              maxHeight: screenHeight * 0.8,
              minHeight: screenHeight * 0.5,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black..withValues(alpha: 0.15),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(isTablet ? 24 : 20),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade700,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.tune_rounded,
                              color: Colors.white,
                              size: isTablet ? 24 : 20,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            AppStrings.filterBy,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isTablet ? 22 : 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(Icons.close_rounded),
                        color: Colors.white,
                        iconSize: isTablet ? 24 : 20,
                      ),
                    ],
                  ),
                ),

                // Content
                Flexible(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(isTablet ? 28 : 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSection(
                          title: AppStrings.gender,
                          icon: Icons.people_outline_rounded,
                          isTablet: isTablet,
                          child: _buildGenderSection(controller, isTablet),
                        ),
                        const SizedBox(height: 32),
                        _buildSection(
                          title: AppStrings.time,
                          icon: Icons.schedule_rounded,
                          isTablet: isTablet,
                          child: _buildTimeSection(controller, isTablet),
                        ),
                      ],
                    ),
                  ),
                ),

                // Footer Buttons (no gradient)
                Container(
                  padding: EdgeInsets.all(isTablet ? 28 : 24),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade300,
                            foregroundColor: Colors.black87,
                            padding: EdgeInsets.symmetric(vertical: isTablet ? 16 : 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: () {
                            controller.clearFilters();
                            Get.back();
                          },
                          child: const Text('Clear'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade700,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: isTablet ? 16 : 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: () {
                            controller.applyFilters();
                            Get.back();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.check_rounded),
                              SizedBox(width: 8),
                              Text(AppStrings.submit),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required bool isTablet,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.blue.shade700),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: isTablet ? 18 : 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        child,
      ],
    );
  }

  Widget _buildGenderSection(DoctorController controller, bool isTablet) {
    final genderOptions = [
      {'label': AppStrings.male, 'value': 0, 'icon': Icons.man_rounded},
      {'label': AppStrings.female, 'value': 1, 'icon': Icons.woman_rounded},
      {'label': AppStrings.others, 'value': 2, 'icon': Icons.people_rounded},
    ];

    return Wrap(
      spacing: isTablet ? 16 : 12,
      runSpacing: isTablet ? 16 : 12,
      children: genderOptions.map((option) {
        final isSelected = controller.selectedGenderIndex == option['value'];
        return ChoiceChip(
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(option['icon'] as IconData, size: 18),
              const SizedBox(width: 6),
              Text(option['label'] as String),
            ],
          ),
          selected: isSelected,
          onSelected: (_) => controller.selectGender(option['value'] as int),
          selectedColor: Colors.blue.shade600,
          backgroundColor: Colors.grey.shade200,
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w500,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTimeSection(DoctorController controller, bool isTablet) {
    return Wrap(
      spacing: isTablet ? 14 : 10,
      runSpacing: isTablet ? 14 : 10,
      children: List.generate(controller.timeSlots.length, (index) {
        final isSelected = controller.selectedTimeSlotIndex == index;
        return ChoiceChip(
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.access_time, size: 16),
              const SizedBox(width: 6),
              Text(controller.timeSlots[index]),
            ],
          ),
          selected: isSelected,
          onSelected: (_) => controller.selectTimeSlot(index),
          selectedColor: Colors.orange.shade400,
          backgroundColor: Colors.grey.shade200,
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w500,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        );
      }),
    );
  }
}
