import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthsync/core/constants/app_strings.dart';
import 'package:healthsync/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRouteNames.doctorDetails,
      getPages: AppPages.routes,
    );
  }
}
