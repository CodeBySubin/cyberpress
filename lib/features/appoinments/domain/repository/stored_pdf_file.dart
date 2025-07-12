import 'package:healthsync/features/appoinments/domain/entities/stored_pdf_file.dart';

abstract class PdfRepository {
  Future<List<StoredPdfFile>> getStoredPdfs();
}