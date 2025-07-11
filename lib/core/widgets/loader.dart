import 'package:flutter/material.dart';
import 'package:healthsync/core/constants/constants.dart';

class AppLoader extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const AppLoader({super.key, required this.isLoading, required this.child});

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(color: AppColors.primaryColor),
      );
    }

    return child;
  }
}
