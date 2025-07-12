import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthsync/core/theme/app_text_styles.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final Color fillcolor;
  final bool filled;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final int maxlines;
  const TextFieldWidget({
    super.key,
    required this.hintText,
    this.controller,
    this.fillcolor = const Color.fromARGB(255, 235, 235, 235),
    this.filled = true,
    this.hintStyle = AppTextStyles.formFieldText,
    this.suffixIcon,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.maxlines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxlines,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      validator: validator,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 22),
        filled: filled,
        fillColor: fillcolor,
        hintText: hintText,
        hintStyle: hintStyle,
      ),
    );
  }
}
