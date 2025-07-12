import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:healthsync/features/appoinments/data/datasource/pdf_genrator_impl.dart';
import 'package:healthsync/features/appoinments/data/repository/pdf_repository_imppl.dart';
import 'package:healthsync/features/appoinments/domain/usecases/genrate_appointment_pdf.dart';
import 'package:healthsync/features/appoinments/domain/usecases/get_stored_pdf.dart';
import 'package:healthsync/features/appoinments/presentation/controllers/appoinment_controller.dart';
import 'package:healthsync/features/appoinments/presentation/controllers/pdf_controller.dart';


class AppointmentBinding extends Bindings {
  @override
  void dependencies() {
    Dio dio = Dio();

    // Register use cases
    Get.lazyPut<GenerateAppointmentPdf>(() => GenerateAppointmentPdfImpl(dio));
    Get.lazyPut(() => GetStoredPdfs(PdfRepositoryImpl()));

    // Register controllers
    Get.put(AppoinmentController(Get.find<GenerateAppointmentPdf>()));
    Get.put(StoredPdfController(Get.find()));
  }
}
