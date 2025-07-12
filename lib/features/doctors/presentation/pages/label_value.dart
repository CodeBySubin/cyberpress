import 'package:flutter/material.dart';
import 'package:healthsync/core/theme/app_text_styles.dart';

class LabelValueRow extends StatelessWidget {
  final String label;
  final String value;

  const LabelValueRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTextStyles.smallBlacktext),
        Text(value, style: AppTextStyles.smallBlacktext),
      ],
    );
  }
}
