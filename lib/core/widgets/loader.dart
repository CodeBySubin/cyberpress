import 'package:flutter/material.dart';
import 'package:healthsync/core/constants/constants.dart';

class AppLoader extends StatelessWidget {
  final bool isLoading;

  const AppLoader({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    if (!isLoading) return const SizedBox.shrink();

    return Container(
      color: AppColors.primaryColor,
      alignment: Alignment.center,
      child: CircularProgressIndicator(color: AppColors.primaryColor),
    );
  }
}
