import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:healthsync/core/constants/app_strings.dart';
import 'package:healthsync/core/theme/app_text_styles.dart';
import 'package:healthsync/features/appoinments/presentation/controllers/appoinment_controller.dart';
import '../../../../core/utils/validator.dart';

class AppointmentFields extends StatelessWidget {
  final AppoinmentController controller;
  const AppointmentFields({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.person,
                color: Colors.blue.shade600,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              AppStrings.patientDetail,
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

        // Name Field
        _buildAnimatedField(
          delay: 200.ms,
          child: _buildEnhancedTextField(
            controller: controller.nameController,
            hintText: AppStrings.name,
            keyboardType: TextInputType.name,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
            ],
            validator: (value) => Validator.validateName(value!),
          ),
        ),

        const SizedBox(height: 16),

        // Age Field
        _buildAnimatedField(
          delay: 300.ms,
          child: _buildEnhancedTextField(
            controller: controller.ageController,
            hintText: AppStrings.age,
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(3),
              FilteringTextInputFormatter.digitsOnly,
            ],
            validator: (value) => Validator.validateAge(value!),
          ),
        ),

        const SizedBox(height: 16),

        // Email Field
        _buildAnimatedField(
          delay: 400.ms,
          child: _buildEnhancedTextField(
            controller: controller.emailController,
            hintText: AppStrings.email,
            keyboardType: TextInputType.emailAddress,
            validator: (value) => Validator.validateEmail(value!),
          ),
        ),

        const SizedBox(height: 16),

        // Phone Field
        _buildAnimatedField(
          delay: 500.ms,
          child: _buildEnhancedTextField(
            controller: controller.phoneController,
            hintText: AppStrings.phone,
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(10),
              FilteringTextInputFormatter.digitsOnly,
            ],
            validator: (value) => Validator.validatePhoneNumber(value!),
          ),
        ),

        const SizedBox(height: 16),

        // Notes Field
        _buildAnimatedField(
          delay: 600.ms,
          child: _buildEnhancedTextField(
            controller: controller.noteController,
            hintText: AppStrings.notes,
            maxLines: 4,
            keyboardType: TextInputType.text,
            validator: (value) => Validator.validateNotes(value!),
          ),
        ),
      ],
    );
  }

  Widget _buildAnimatedField({
    required Duration delay,
    required Widget child,
  }) {
    return child
        .animate()
        .fadeIn(delay: delay, duration: 500.ms)
        .slideX(
          begin: 0.3,
          end: 0,
          duration: 500.ms,
          curve: Curves.easeOutCubic,
        );
  }

  Widget _buildEnhancedTextField({
    required TextEditingController controller,
    required String hintText,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    String? Function(String?)? validator,
    int maxLines = 1,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLines: maxLines,
        style: AppTextStyles.smallBlacktext.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTextStyles.smallGreyText.copyWith(
            fontSize: 14,
          ),
          filled: true,
          fillColor: Colors.grey.shade50,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.grey.shade200,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.grey.shade200,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.blue.shade600,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.red.shade400,
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.red.shade400,
              width: 2,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
      ),
    );
  }
}
