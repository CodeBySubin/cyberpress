import 'package:flutter/material.dart';
import '../constants/constants.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final void Function()? onPressed;
  final Size? size;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final double fontSize;
  final FontWeight fontWeight;
  final BoxBorder? border;
  final TextStyle? textStyle;

  const TextButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = AppColors.blackColor,
    this.size,
    this.borderRadius = 0.0,
    this.padding,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.bold,
    this.border,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonSize = size ?? Size(screenWidth * 0.8, 50);

    return Container(
      width: buttonSize.width,
      height: buttonSize.height,
      padding: padding ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
        border: border,
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: textStyle ??
                TextStyle(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
          ),
        ),
      ),
    );
  }
}
