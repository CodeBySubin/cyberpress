import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:healthsync/routes/routes.dart';

class PdfViewerPage extends StatelessWidget {
  final String path;

  const PdfViewerPage({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(AppRouteNames.doctors);
        return false; 
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Appointment"),
          backgroundColor: Colors.blue.shade700,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.offAllNamed(AppRouteNames.doctors);
            },
          ),
        ),
        body: SfPdfViewer.file(File(path)),
      ),
    );
  }
}
