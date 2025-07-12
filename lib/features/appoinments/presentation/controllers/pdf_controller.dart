import 'package:get/get.dart';
import 'package:healthsync/features/appoinments/domain/usecases/get_stored_pdf.dart';
import '../../domain/entities/stored_pdf_file.dart';

class StoredPdfController extends GetxController {
  final GetStoredPdfs getStoredPdfs;

  StoredPdfController(this.getStoredPdfs);

  var pdfFiles = <StoredPdfFile>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPdfs();
  }

  void fetchPdfs() async {
    isLoading.value = true;
    pdfFiles.value = await getStoredPdfs();
    isLoading.value = false;
  }
}
