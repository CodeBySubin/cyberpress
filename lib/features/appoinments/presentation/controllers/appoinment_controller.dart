import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import '../../domain/entities/appointment_details.dart';
import '../../domain/usecases/genrate_appointment_pdf.dart';

class AppoinmentController extends GetxController {
  final GenerateAppointmentPdf generatePdfUseCase;
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final ageController = TextEditingController();
  final phoneController = TextEditingController();
  final noteController = TextEditingController();

  Uint8List? pdfData;
  String? pdfFilePath;

  AppoinmentController(this.generatePdfUseCase);

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    ageController.dispose();
    phoneController.dispose();
    noteController.dispose();
    super.dispose();
  }

 Future<void> generateAndSavePdf(AppointmentDetails details) async {
  pdfData = await generatePdfUseCase(details);
  final dir = await getApplicationDocumentsDirectory();
  final fileName = 'appointment_${DateTime.now().millisecondsSinceEpoch}.pdf';
  final file = File('${dir.path}/$fileName');
  await file.writeAsBytes(pdfData!);
  pdfFilePath = file.path;
  update();
}

}
